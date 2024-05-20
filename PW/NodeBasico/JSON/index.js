const fs = require("fs");

let json = fs.readFileSync('./servicos.txt');
json = JSON.parse(json);

// json.forEach(object => {
//     console.log(object);
// });

console.log(json);