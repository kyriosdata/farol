Esta página oferece orientações para o desenvolvedor
de software responsável pela integração com o SISCAN via FHIR. 

Há dois aspectos relevantes para a integração: (a) _payload_ a ser transferido/recebido e (b) o envio de uma requisição (REST API FHIR). As duas seções seguintes tratam destes aspectos.

#### Validação de instâncias (payload)
A informação em saúde correspondente a uma requisição ou laudo de exame citopatológico, em ambos os casos, precisa ser "empacotada" em uma instância do recurso Bundle. Para verificar se a montagem desta instância foi realizada de forma satisfatória seguem as seguintes orientações.

- Os [artefatos](artifacts.html) definem como registrar requisições e laudos em instâncias de recursos FHIR. Ou seja, definem o "esquema" dos documentos JSON, tanto para requisição quanto para laudo. Há exemplos no formato de sua preferência, [XML](examples.xml.zip), [JSON](examples.json.zip) ou [TTL](examples.ttl.zip). Você pode empregá-los para se familiarizar com o _payload_ de requisições e laudos citopatológicos. 
- Baixe o validador ([validator_cli](https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar)). O validador oferece ao desenvolvedor a oportunidade de validar se os documentos JSON que está montando, seja para uma requisição ou laudo, seguem as regras estabelecidas pelo presente guia. 
- Para usar o validador (item acima) é preciso baixar o NPM Package do presente Guia, [package.tgz](package.tgz). Os perfis e vários outros artefatos definidos no Guia estão contidos neste arquivo. Este arquivo é fornecido ao validador conforme abaixo.
- Baixe uma requisição de exame citopatológico, por exemplo, para a hipotética paciente de nome Bruna, disponível em [Bundle-bruna-requisicao.json](https://build.fhir.org/ig/kyriosdata/farol/Bundle-bruna-requisicao.json).
- Usar o validador, o NPM Package e uma instância de exemplo, baixados conforme itens anteriores, para a validação da requisição no arquivo [Bundle-bruna-requisicao.json](https://build.fhir.org/ig/kyriosdata/farol/Bundle-bruna-requisicao.json). O comando correspondente é: `java -jar validator_cli.jar -version 4.0.1 -ig package.tgz Bundle-bruna-requisicao.json`. O resultado produzido pelo validador indica a conformidade ou não da instância de recurso FHIR fornecida. Observe que o validador depende da disponibilidade de java (JDK) na máquina em que o comando acima é executado.

Os passos sugeridos acima podem ser executados conforme abaixo:
```
http --download https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar > validator_cli.jar
http --download https://build.fhir.org/ig/kyriosdata/farol/package.tgz > package.tgz
java -jar validator_cli.jar -version 4.0.1 -ig package.tgz Bundle-bruna-requisicao.json
```

Parte do resultado é exibida, em particular, a indicação de que nenhum erro, nem mesmo um aviso foi gerado pela validação da requisição que, desta forma, 
encontra-se em conformidade com o esperado pelo Guia.

```
Validate Bundle against http://hl7.org/fhir/StructureDefinition/Bundle|4.0.1..........20..........40..........60..........80.........|
 00:14.263
Done. Times: Loading: 00:30.054, validation: 00:14.263. Memory = 1Gb

Success: 0 errors, 0 warnings, 1 notes
  Information: All OK
Done. Times: Loading: 00:30.054, validation: 00:14.263. Max Memory = 11Gb
fabio@s130:/tmp/teste$ 
```

#### API FHIR (requisitar as transferências)
Dados a serem enviados/recebidos fazem uso de uma API, a RESTful FHIR API. 
As requisições correspondentes aos casos de uso contemplados pelo presente Guia 
estão ilustradas por vários mecanismos:

- Linha de comandos
- Postman
- Código fonte disponível em: Java, C# e JavaScript. 

