let dgram = require('dgram');

let server = dgram.createSocket({type: 'udp4', reuseAddr: true});
server.bind(2391, () => {
    server.addMembership('239.255.255.250');
    setInterval(() => {
        server.send('This is a test for networking lab', 2390, "239.255.255.250");
    }, 5000);
});