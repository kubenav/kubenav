const { Storage } = require('@google-cloud/storage');

const storage = new Storage({
  credentials: JSON.parse(process.env.GOOGLE_KEY_FILE),
  projectId: process.env.GOOGLE_PROJECT_ID,
});

function getDate() {
  const date = new Date();
  const year = date.getFullYear();
  let day = '' + date.getDate();
  let month = '' + (date.getMonth() + 1);

  if (month.length < 2)
    month = '0' + month;
  if (day.length < 2)
    day = '0' + day;

  return [year, month, day].join();
}

function upload(bucketName, filename) {
  const date = getDate();

  async function uploadFile() {
    await storage.bucket(bucketName).upload(filename, {
      destination: `${date}-${filename}`,
      gzip: true,
    });

    console.log(`${filename} uploaded to ${bucketName}.`);
  }

  uploadFile().catch(console.error);
}

if (process.env.OS === 'ubuntu-latest') {
  upload('kubenav', `electron/dist/kubenav-${process.env.VERSION}-linux-amd64.AppImage`);
  upload('kubenav', `electron/dist/kubenav-${process.env.VERSION}-linux-amd64.tar.gz`);
} else if (process.env.OS === 'macos-latest') {
  upload('kubenav', `electron/dist/kubenav-${process.env.VERSION}-darwin-amd64.dmg`);
  upload('kubenav', `electron/dist/kubenav-${process.env.VERSION}-darwin-amd64.dmg.blockmap`);
  upload('kubenav', `electron/dist/kubenav-${process.env.VERSION}-darwin-amd64.tar.gz`);
} else if (process.env.OS === 'windows-latest') {
  upload('kubenav', `electron/dist/kubenav-${process.env.VERSION}-win32-amd64.exe`);
  upload('kubenav', `electron/dist/kubenav-${process.env.VERSION}-win32-amd64.exe.blockmap`);
  upload('kubenav', `electron/dist/kubenav-${process.env.VERSION}-win32-amd64.tar.gz`);
}
