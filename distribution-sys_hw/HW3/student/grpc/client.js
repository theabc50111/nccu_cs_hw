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

function main() {
    var client = new hello_proto.Greeter('localhost:50051',
        grpc.credentials.createInsecure());

    client.sayHello({name: 'Tom'}, function (err, response) {
        console.log('Greeting Response:', response.message);
    });

    // step 5-(2): client.add({x: 3, y: 2}, function (err, response) {...
	//                                      });
	// note that you should use response.result to get the outcome
    client.add({x: 3, y: 2}, function (err, response) {
        console.log('Result:', response.result);
    });
}

main();
