const replace = require("replace");

const de = process.argv[2];
const para = process.argv[3];
const diretorio = process.argv[4];

replace({
  regex: de,
  replacement: para,
  paths: [diretorio],
  recursive: true,
  silent: false,
});
