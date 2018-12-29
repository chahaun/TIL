const http = require('http');
const fs = require('fs');

const server = http.createServer((req, res) => {
    fs.readFile('./server0.html', (err, data) => {
        if (err) throw err;
        res.end(data);
    });
});
server.listen(8080);
server.on('listening', () => {
    console.log('서버 대기중');
});
server.on('error', (err) => {
    console.error(err);
});