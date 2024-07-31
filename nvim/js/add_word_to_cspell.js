const fs = require("fs");

const file = process.argv[2];
const word = process.argv[3];

const json = JSON.parse(fs.readFileSync(file, "utf8"));

json.words.push(word);

fs.writeFileSync(file, JSON.stringify(json, null, 2));
