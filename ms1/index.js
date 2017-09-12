var http = require('http');

http.createServer(function(req, res) {
  console.log('ms1', new Date());
  res.writeHead(200);

  res.end("<html><head><title>success</title></head><body><h1>hello this is the secret stuff</h1></body></html>");
}).listen(8080);
