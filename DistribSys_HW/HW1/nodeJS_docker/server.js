'use strict';

const dgram = require('dgram');

// Constants
const PORT = 20213;
const HOST = '0.0.0.0';

// App
const server = dgram.createSocket('udp4');
server.on("message", (msg, rinfo)=>{
    let recieve_msg = msg.toString("utf-8"); 
    let reply_msg = Buffer.from(rinfo.port+" : "+recieve_msg)
    console.log("metadata of recieved message:", rinfo.address, rinfo.family, rinfo.port, rinfo.size);
    console.log("recieved message:\n", recieve_msg);
    server.send(reply_msg, rinfo.port, rinfo.address, (err)=>{
        if (err){
            console.log("has error:\n",err);
        }
    });
});

server.on("error", (err)=>{
    console.log(err)
});

server.bind(PORT);

console.log(`Running a udp server on://${HOST}:${PORT}`);
