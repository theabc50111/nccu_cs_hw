const server = require('fastify')();

let john = {
    name: "john",
    age: 18,
    attack: 100,
    defense: 100
};

let tom = {
    name: "tom",
    age: 19,
    attack: 105,
    defense: 90
};

let hogRiders = [john, tom];

server.get('/hogRider', function (req, res) {
    return hogRiders;
});

server.get('/hogRider/:name', function (req, res) {
    let result = hogRiders.find(element => element.name === req.params.name);
    if (result){
        return result;
    }
    else {
        return {"error":"not found"};
    }
});


server.post('/hogRider', function (req, res) {
    let newRider=req.body;
    hogRiders.push(newRider);
    return {count: hogRiders.length};
});

server.put('/hogRider/:name', function (req, res) {
    let index = hogRiders.findIndex(element => element.name === req.params.name);
    hogRiders[index]=req.body;
    return hogRiders[index];
});


server.listen(3000, "0.0.0.0");
