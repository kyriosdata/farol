Esta página oferece orientações para o desenvolvedor
de software responsável pela integração com o SISCAN via FHIR. 

Há dois aspectos relevantes para a integração: (a) _payload_ a ser transferido/recebido e (b) o envio de uma requisição (REST API FHIR). As duas seções seguintes tratam destes aspectos.

#### Validação de instâncias (payload)
A informação em saúde correspondente a uma requisição ou laudo de exame citopatológico, em ambos os casos, precisa ser "empacotada" em uma instância do recurso Bundle. Para verificar se a montagem desta instância foi realizada de forma satisfatória seguem as seguintes orientações.

- Os [artefatos](artifacts.html) definem como registrar requisições e laudos em instâncias de recursos FHIR. Ou seja, aqui está definido o "esquema" dos documentos JSON, tanto para requisição quanto para laudo.
- Há exemplos no formato de sua preferência, [XML](examples.xml.zip), [JSON](examples.json.zip) ou [TTL](examples.ttl.zip). Você pode empregá-los para se familiarizar com o _payload_ de requisições e laudos citopatológicos. 
- Baixe o validador ([validator_cli](https://github.com/hapifhir/org.hl7.fhir.validator-wrapper)). O validador oferece ao desenvolvedor a oportunidade de validar se os documentos JSON, por exemplo, que está montando, seguem as regras estabelecidas pelo presente guia. 
- Baixar o NPM Package do presente Guia, [package.tgz](package.tgz). Os perfis e terminologias definidos no presente Guia estão contidos neste arquivo. Este arquivo é necessário para uso do validador.
- Usar o validador e o NPM Package correspondente ao presente Guia: `java -jar validator_cli.jar -version 4.0.1 -ig package.tgz <instância a ser validada>`. O resultado é um relatório indicando a conformidade ou não da instância de recurso FHIR fornecida, está em conformidade com o definido pelo presente Guia. Observe que o validador depende da disponibilidade de java (JDK). 

#### API FHIR (requisitar as transferências)
Dados a serem enviados/recebidos fazem uso de uma API, a RESTful FHIR API. 
As requisições correspondentes aos casos de uso contemplados pelo presente Guia 
estão ilustradas por vários mecanismos:

- Linha de comandos
- Postman
- Código fonte disponível em: Java, C# e JavaScript. 

