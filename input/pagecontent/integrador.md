Esta página oferece orientações para o desenvolvedor
de software responsável pela integração com o SISCAN, via FHIR, conforme
definido pelo presente Guia. 

Neste processo, instâncias precisam ser construídas ([Criação de instâncias](#criação-de-instâncias)) e validadas ([Validação de instâncias](#validação-de-instâncias-payload)). Naturalmente precisam ser enviadas ([Submissão de requisições](#submissão-de-requisições)) e, para tal, um servidor FHIR pode ser disponibilizado ([Disponibilizando um servidor FHIR](#disponibilizando-um-servidor-fhir)).

### Criação de instâncias
A informação em saúde correspondente a uma requisição ou laudo de exame citopatológico precisa ser "empacotada" em uma instância do recurso Bundle. Uma [requisição](Bundle-bruna-requisicao.json) e um [laudo](Bundle-bruna-laudo.json) ilustram o tipo de instância que precisa ser construída. Há muitos exemplos no formato de sua preferência, [XML](examples.xml.zip), [JSON](examples.json.zip) ou [TTL](examples.ttl.zip). Você pode empregá-los para se familiarizar com o _payload_ de requisições e laudos citopatológicos. 

A construção das instâncias de requisição e de laudo, citadas acima, é ilustrada por código. Consulte [clientes](https://github.com/kyriosdata/farol/tree/main/clientes) para exemplos.

### Validação de instâncias (payload)
Para verificar se a montagem de instância atende as exigências do Guia, veja as orientações abaixo.

- Os [artefatos](artifacts.html) definem como registrar requisições e laudos em instâncias de recursos FHIR. Ou seja, definem o "esquema" dos documentos JSON, tanto para requisição quanto para laudo. 
- Baixe o validador ([validator_cli](https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar)). O validador oferece ao desenvolvedor a oportunidade de validar se os documentos JSON que está montando, seja para uma requisição ou laudo, seguem as regras estabelecidas pelo presente guia. 
- Para usar o validador (item acima) é preciso baixar o NPM Package do presente Guia, [package.tgz](package.tgz). Os perfis e vários outros artefatos definidos no Guia estão contidos neste arquivo. Este arquivo é fornecido ao validador conforme abaixo.
- Baixe uma requisição de exame citopatológico, por exemplo, para a hipotética paciente de nome Bruna, disponível em [Bundle-bruna-requisicao.json](https://build.fhir.org/ig/kyriosdata/farol/Bundle-bruna-requisicao.json).
- Para validar a instância o comando é: `java -jar validator_cli.jar -version 4.0.1 -ig package.tgz Bundle-bruna-requisicao.json`. O resultado produzido pelo validador indica a conformidade ou não da instância de recurso FHIR fornecida. 

Os passos sugeridos acima podem ser executados conforme abaixo:
```
http --download https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar > validator_cli.jar
http --download https://build.fhir.org/ig/kyriosdata/farol/package.tgz > package.tgz
http --download https://build.fhir.org/ig/kyriosdata/farol/Bundle-bruna-requisicao.json > Bundle-bruna-requisicao.json
java -jar validator_cli.jar -version 4.0.1 -ig package.tgz Bundle-bruna-requisicao.json
```

O último comando requisita a validação, cuja parte final do resultado produzido é fornecido abaixo, em particular, a indicação de que nenhum erro, nem mesmo um aviso foi gerado pela validação da requisição que, desta forma, 
encontra-se em conformidade com o definido pelo Guia.

```
Validate Bundle against http://hl7.org/fhir/StructureDefinition/Bundle|4.0.1..........20..........40..........60..........80.........|
 00:14.263
Done. Times: Loading: 00:30.054, validation: 00:14.263. Memory = 1Gb

Success: 0 errors, 0 warnings, 1 notes
  Information: All OK
Done. Times: Loading: 00:30.054, validation: 00:14.263. Max Memory = 11Gb
fabio@s130:/tmp/teste$ 
```

### Submissão de requisições
O servidor HAPI FHIR pronto para testes pode ser exercitado de várias formas. 

#### Linha de comandos
Para submeter uma instância do recurso Bundle, contendo uma requisição ou um laudo, o comando é o mesmo, conforme abaixo.

```
http http://localhost:8080/Bundle < instancia.json
```

#### Postman
Há um conjunto de requisições disponíveis no Postman ([aqui](https://documenter.getpostman.com/view/36481009/2sA3e5f8uc)).


### Disponibilizando um servidor FHIR

#### Gerar o servidor HAPI FHIR
Para gerar um servidor FHIR para testes, a partir do código fonte, siga os passos abaixo. 

```
git clone https://github.com/hapifhir/hapi-fhir-jpaserver-starter.git
cd hapi-fhir-jpaserver-starter
mvn package spring-boot:repackage -Pboot -DskipTests
```

Os comandos acima produzem o arquivo **ROOT.war** (implementação do Servidor HAPI FHIR) no diretório `hapi-fhir-jpaserver-starter/target`. Copie este arquivo para o seu diretório de trabalho, digamos, `hapi`. 

#### Iniciar o servidor HAPI FHIR

A configuração do servidor HAPI FHIR contemplando o presente Guia está disponível no arquivo [application.properties](application.properties).

```
http --download https://build.fhir.org/ig/kyriosdata/farol/application.properties > application.properties
```

O conteúdo deste arquivo é fornecido abaixo. Observe que são definidas duas dependência, uma para o conteúdo do presente Guia e outra para o NPM Package **br.ufg.cgis.rnds-lite**. Este último contém perfis utilizados pela RNDS.

```
management.endpoint.endpoints.enabled-by-default=false
management.endpoints.web.exposure.include=*

hapi.fhir.fhirpath_interceptor_enabled=true

hapi.fhir.implementationguides.rnds.name=br.ufg.cgis.rnds-lite
hapi.fhir.implementationguides.rnds.version=0.2.1
hapi.fhir.implementationguides.rnds.installMode=STORE_AND_INSTALL

hapi.fhir.implementationguides.ccu.name=br.gov.saude.ccu
hapi.fhir.implementationguides.ccu.version=0.0.1
hapi.fhir.implementationguides.ccu.packageUrl=https://build.fhir.org/ig/kyriosdata/farol/package.tgz
hapi.fhir.implementationguides.ccu.installMode=STORE_AND_INSTALL
```

Copie o arquivo **ROOT.war** e **application.properties** para 
um mesmo diretório e, neste diretório, execute o comando abaixo.

```
java -jar ROOT.war
```

Após o início do servidor a configuração é concluída com os passos abaixo. 

```
http --download https://build.fhir.org/ig/kyriosdata/farol/Questionnaire-anamnese-exame-citopatologico.json > Questionnaire-anamnese-exame-citopatologico.json
http http://localhost:8080/fhir/Questionnaire < Questionnaire-anamnese-exame-citopatologico.json
```

### Ferramentas
- Java ou ([JDK](https://openjdk.org/)) e [Maven](https://maven.apache.org/).
- Submeter requisições para o servidor FHIR via linha de comandos usando [http](https://httpie.io/) ou por interface gráfica usando o [Postman](https://www.postman.com/).
- [git](https://git-scm.com/).
