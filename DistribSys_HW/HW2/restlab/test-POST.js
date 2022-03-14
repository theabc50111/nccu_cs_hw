const client = require('node-fetch');

(async () => {
    const resp = await client('http://localhost:3000/hogRider', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            name: "mary",
            age : 17,
            attack : 99,
            defense : 99
        })
    });

    const data = await resp.json();
    console.log(data);
})();