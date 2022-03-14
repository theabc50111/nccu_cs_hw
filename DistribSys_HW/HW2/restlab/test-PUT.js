const client = require('node-fetch');

(async () => {
    const resp = await client('http://localhost:3000/hogRider/tom', {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            name : "tom",
            age : 99,
            attack : 0,
            defense : 0
        })
    });

    const data = await resp.json();
    console.log(data);
})();