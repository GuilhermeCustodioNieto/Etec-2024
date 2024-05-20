const fs = require("fs");

let json = fs.readFileSync('./servicos.txt');
json = JSON.parse(json);
console.log(json);