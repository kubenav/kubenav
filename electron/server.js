const https = require('https');
const express = require('express');
const cors = require('cors');

const server = express();

server.use(cors());
server.use(express.json());
server.use(express.static(__dirname + '/app'));

server.get('*', function (req, res) {
  res.sendFile(__dirname + '/app/index.html');
});

server.post('/request', function (req, res) {
  const postData = req.body;

  const options = {
    method: postData.method,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }
  };

  if (postData.certificateAuthorityData !== '') {
    options['ca'] = postData.certificateAuthorityData;
  }

  if (postData.clientCertificateData !== '' && postData.clientKeyData !== '') {
    options['cert'] = postData.clientCertificateData;
    options['key'] = postData.clientKeyData;
  }

  if (postData.method === 'PATCH') {
    options.headers['Content-Type'] = 'application/json-patch+json';
  } else {
    options.headers['Content-Type'] = 'application/json';
  }

  if (postData.token !== '') {
    options.headers['Authorization'] = 'Bearer ' + postData.token;
  }

  const request = https.request(postData.url, options, function(response) {
    let body = '';

    response.on('data', function(chunk) {
      body = body + chunk;
    });

    response.on('end', function() {
      if (!(response.statusCode >= 200 && response.statusCode < 300)) {
        res.status(400);
        res.json({error: JSON.parse(body).message});
      } else {
        res.json({data: body});
      }
    });
  });

  request.on('error', function(error) {
    res.json(error);
  });

  request.write(postData.body);
  request.end();
});

module.exports = server;
