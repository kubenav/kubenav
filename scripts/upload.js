const path = require('path');
const fs = require('fs');
const { Storage } = require('@google-cloud/storage');

const storage = new Storage({
  credentials: JSON.parse(process.env.GOOGLE_KEY_FILE),
  projectId: process.env.GOOGLE_PROJECT_ID,
});

function checkFilename(filename) {
  const validFilenames = ['linux-amd64.AppImage', 'linux-amd64.tar.gz', 'darwin-amd64.dmg', 'darwin-amd64.dmg.blockmap', 'darwin-amd64.tar.gz', 'win32-amd64.exe', 'win32-amd64.exe.blockmap', 'win32-amd64.tar.gz'];

  for (let validFilename in validFilenames) {
    if (filename.includes(validFilename)) {
      return true;
    }
  }

  return false;
}

function getDate() {
  const date = new Date();
  const year = date.getFullYear();
  let day = '' + date.getDate();
  let month = '' + (date.getMonth() + 1);

  if (month.length < 2)
    month = '0' + month;
  if (day.length < 2)
    day = '0' + day;

  return `${year}${month}${day}`;
}

function upload(bucketName, filename) {
  const date = getDate();

  async function uploadFile() {
    await storage.bucket(bucketName).upload(`electron/dist/${filename}`, {
      destination: `${date}/${filename}`,
      gzip: true,
    });

    console.log(`${filename} uploaded to ${bucketName}.`);
  }

  uploadFile().catch(console.error);
}

fs.readdir('electron/dist', function (err, files) {
  if (err) {
    return console.log('Unable to scan directory: ' + err);
  }

  files.forEach(function(filename) {
    if (checkFilename(filename)) {
      upload('kubenav', filename);
    }
  });
});
