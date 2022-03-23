var PROTO_PATH = __dirname + '/helloworld.proto';

var grpc = require('@grpc/grpc-js');
var protoLoader = require('@grpc/proto-loader');
var packageDefinition = protoLoader.loadSync(
    PROTO_PATH,
    {
        keepCase: true,
        longs: String,
        enums: String,
        defaults: true,
        oneofs: true
    });
var hello_proto = grpc.loadPackageDefinition(packageDefinition).helloworld;

/**
 * Implements the SayHello RPC method.
 */
function sayHello(call, callback) {
    callback(null, {message: 'Hello ' + call.request.name});
    // first param: if no err send null
}

// add function here: sum x and y and return as {result: ...}
function add(call, callback) {
 // you can use call.request.x and call.request.y to obtain x and y
}


/**
 * Starts an RPC server that receives requests for the Greeter service at the
 * sample server port
 */
function main() {
    var server = new grpc.Server();
    // step 5-(6): change the following statment to :
	// server.addService(hello_proto.Greeter.service, {sayHello: sayHello, add:add});
	server.addService(hello_proto.Greeter.service, {sayHello: sayHello});
	
    server.bindAsync('0.0.0.0:50051', grpc.ServerCredentials.createInsecure(), () => {
        server.start();
    });
    //server.bind('0.0.0.0:50051', grpc.ServerCredentials.createInsecure());

}

main();
