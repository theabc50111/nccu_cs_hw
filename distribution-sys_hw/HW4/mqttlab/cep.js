const mqtt = require('mqtt');
const client = mqtt.connect();
client.subscribe('NODE'); //請填入適當的值
let eventSeq = ['CO', 'CF', 'DO', 'DF'];

client.on('message', function (topic, message) {
    let item = eventSeq[0]; // 取得eventSeq的第一個元素
    let input = message.toString();

    //if (…) …; // 如果message和item匹配，將匹配元素從陣列移出 (使用shift)
                // message是Buffer型別，要用message.toString()才能取得字串值
    if (input==item){
        eventSeq.shift();
    }

    //if (…) { // 如果全部匹配
          // 送出LEAVE到EVENT topic並回復eventSeq的內容
    //    client.publish('      ', '      '); //請填入適當的值
    //    eventSeq = ['CO', 'CF', 'DO', 'DF'];// 重置
    //}
    if(eventSeq.length==0){
        client.publish("NODE", "LEAVE");
        eventSeq = ['CO', 'CF', 'DO', 'DF'];
    }

    // 除錯用
    // message是Buffer型別，要用message.toString()才能取得字串值
    console.log('input: ' + input);
    console.log('expected: ' + item);
});

