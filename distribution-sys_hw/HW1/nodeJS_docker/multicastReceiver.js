let dgram = require('dgram');
let server = dgram.createSocket({type: 'udp4', reuseAddr: true});

server.bind(2390, () => {
    server.addMembership('239.255.255.250');
});

server.on('message', function (message, remote) {
    console.log(`From: ${remote.address}:${remote.port} - ${message}`);
});
