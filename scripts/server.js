const server = require('../electron/server');

const listener = server.listen(14122, function() {
  console.log("Server listening on: http://localhost:%s", listener.address().port);
});
