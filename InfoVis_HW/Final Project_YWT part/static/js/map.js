var mymap = L.map('mapid').setView([24.9880177, 121.5767856], 16)

// set icon
var myIcon = L.icon({
    iconUrl: './static/img/maps-and-flags.png',
    iconSize: [10, 15],
    popupAnchor: [-3, -76],
});

function mark_click(e) {
    console.log(e);
    console.log(`${e.target.options.sno}, ${e.target.options.sna} has been click`);
}

L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1Ijoiem92anNyYSIsImEiOiJja283MzYwdTgxNGV6Mm9zN2Nnd3U1NjRzIn0.c2pLwdmzD19cTv4nm9ocTw'
}).addTo(mymap);


// Read markers data from data.csv
$.get('./dataset/spot_info.csv', function (csvString) {

    // Use PapaParse to convert string to array of objects
    var data = Papa.parse(csvString, { header: true, dynamicTyping: true }).data;

    // For each row in data, create a marker and add it to the map
    for (var i in data) {
        var row = data[i];

        var pop_content = `站點編號：${row.sno} \
                           <br>
                           站點名稱：${row.sna}`;

        var marker = L.marker([row.lat, row.lng], {
            opacity: 1,
            icon: myIcon,
            sno: row.sno,
            sna: row.sna
        }).bindPopup(pop_content);

        marker.addTo(mymap).on('click', mark_click);

    }

});
