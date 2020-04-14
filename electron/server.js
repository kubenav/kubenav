const https = require('https');
const express = require('express');
const cors = require('cors');
const request = require('request');
const k8s = require('@kubernetes/client-node');
const oidc = require('@kubernetes/client-node/dist/oidc_auth');

const auth = new oidc.OpenIDConnectAuth();
const kc = new k8s.KubeConfig();
kc.loadFromDefault();

const server = express();

server.use(cors());
server.use(express.json());
server.use(express.static(__dirname + '/app'));

server.get('/cluster', function (req, res) {
  res.json({ cluster: kc.getCurrentContext() });
});

server.get('/clusters', function (req, res) {
  const contexts = kc.getContexts();
  const clusters = {};

  for (let context of contexts) {
    clusters[context.name] = {
      id: context.name,
      name: context.name,
      url: kc.getCluster(context.cluster).server,
      certificateAuthorityData: '',
      clientCertificateData: '',
      clientKeyData: '',
      token: '',
      username: '',
      password: '',
      authProvider: '',
      namespace: context.namespace ? context.namespace : 'default',
    }
  }

  res.json({ clusters: clusters });
});

server.post('/request', async (req, res) => {
  const postData = req.body;
  kc.setCurrentContext(postData.cluster);

  const opts = {
    url: postData.url,
    method: postData.method,
  };

  if (postData.method === 'PATCH') {
    opts.headers = { 'Content-Type': 'application/json-patch+json' };
  } else {
    opts.headers = { 'Content-Type': 'application/json' };
  }

  if (postData.body !== '') {
    opts.json = JSON.parse(postData.body);
  }

  const user = kc.getCurrentUser();
  if (user.authProvider && user.authProvider.name && user.authProvider.name === 'oidc') {
    await auth.applyAuthentication(kc.getCurrentUser(), opts);
  }

  await kc.applyToRequest(opts);

  request(opts, (error, response, body) => {
    if (error) {
      res.status(400);
      res.json({ error: error.message });
    } else {
      if (!(response.statusCode >= 200 && response.statusCode < 300)) {
        let message;

        try {
          message = JSON.parse(body).message;
        } catch (err) {
          message = body;
        }

        res.status(400);
        res.json({ error: message });
      } else {
        res.json({ data: body });
      }
    }
  });
});

server.get('*', function (req, res) {
  res.sendFile(__dirname + '/app/index.html');
});

module.exports = server;
