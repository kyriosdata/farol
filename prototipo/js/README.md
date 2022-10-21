# Modelo (Lambda para Nodejs)

## Configurações (segurança e outros)

Consulte arquivo **credentials** no diretorio **~/.aws** para
identificar se o profile a ser utilizado, e a credencial correspondente
está devidamente configurada.

Consulte o arquivo **serverless.yaml** acerca da **region** indicada e
também o **profile**.

Todas estas informações são necessárias para o correto funcionamento dos
comandos abaixo.

## Usage

### Deployment

In order to deploy the example, you need to run the following command:

```
$ sls deploy
```

### Invocation

```bash
sls invoke --function hello --aws-profile farol
```

### Local development

You can invoke your function locally by using the following command:

```bash
serverless invoke local --function hello
```

Which should result in response similar to the following:

```
{
    "statusCode": 200,
    "body": "{\n  \"message\": \"Go Serverless v2.0! Your function executed successfully!\",\n  \"input\": \"\"\n}"
}
```

### Update (apenas a função)

- `sls deploy function -f hello --aws-profile farol`

### Remove

- `sls remove -f hello`
