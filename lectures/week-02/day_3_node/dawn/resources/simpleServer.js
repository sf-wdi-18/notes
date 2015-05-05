var http = require('http');
http.createServer(function (req, res) {
    res.end('<h1>Hello World</h1>');
}).listen(8000, 'localhost');
console.log('Server running on port 8000');
