const express = require("express");
const graphqlHTTP = require("express-graphql");
const { buildSchema } = require("graphql");
const fs = require("fs");
const { exit } = require("process");

let sdlSchema;

try {
  // Carrega GraphQL SDL (único argumento fornecido)
  sdlSchema = fs.readFileSync(process.argv[2], {
    encoding: "utf8",
    flag: "r",
  });
} catch (error) {
  console.log(`Erro ao carregar o arquivo ${process.argv[2]}`);
  return;
}

const schema = buildSchema(sdlSchema);

const app = express();
app.use(express.static(__dirname));
app.use(
  "/graphql",
  graphqlHTTP(() => ({ schema }))
);

app.listen(0, function () {
  const port = this.address().port;
  console.log(`Exibindo ${process.argv[2]}`);
  console.log(`Iniciado em http://localhost:${port}/`);
});
