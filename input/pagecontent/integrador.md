Esta página oferece orientações para o desenvolvedor
de software responsável pela integração com o SISCAN via FHIR. 

### Inicie por aqui

A seção Payload detalha ações pertinentes ao "empacotamento" de requisições e laudos conforme o presente guia para que possam ser transferiados. Para enviar tais requisições e laudos devidamente empacotados é preciso fazer uso da API FHIR, o que é comentado na seção API FHIR. 

#### Payload (dados transferidos)

- Os [artefatos](artifacts.html) definem como registrar requisições e laudos em instâncias de recursos FHIR.
- Há exemplos no formato de sua preferência, [XML](examples.xml.zip), [JSON](examples.json.zip) ou [TTL](examples.ttl.zip). Você pode empregá-los para se familiarizar com o _payload_ de requisições e laudos citopatológicos. 
- Baixe o validador ([validator_cli](https://github.com/hapifhir/org.hl7.fhir.validator-wrapper)). O validador oferece ao desenvolvedor a oportunidade de validar se os documentos JSON, por exemplo, que está montando, seguem as regras estabelecidas pelo presente guia. 
- Baixar o NPM Package do presente Guia, [package.tgz](package.tgz). Os perfis e terminologias definidos no presente Guia estão contidos neste arquivo. 
- Usar o validador e o NPM Package correspondente ao presente Guia: `java -jar validator_cli.jar -version 4.0.1 -ig package.tgz <instância a ser validada>`. O resultado é um relatório indicando a conformidade ou não da instância de recurso FHIR fornecida, está em conformidade com o definido pelo presente Guia.

#### API FHIR (requisitar as transferências)

Os casos de uso contemplados pelo presente Guia incluem interação via API FHIR. Tal API está documentada e pode ser exercitada de várias formas:

- Linha de comandos
- Postman
- Código fonte disponível em: Java, C# e JavaScript. 

### NPM Package

O arquivo [package.tgz](package.tgz) contém as definições em
formato reconhecido pelo ecossistema FHIR. Por exemplo, este arquivo
pode ser usado por um validador ao ser requisitada a verificação de
conformidade de uma instância com o presente Guia.

### Apenas as definições

Também é possível baixar as definições além do formato NPM Package (acima):

- [XML](definitions.xml.zip)
- [JSON](definitions.json.zip)
- [TTL](definitions.ttl.zip)

### Apenas os exemplos

- [XML](examples.xml.zip)
- [JSON](examples.json.zip)
- [TTL](examples.ttl.zip)

### Todo o Guia

Baixe o Guia de Implementação completo, todo ele, inclusive com os
arquivos citados anteriormente [aqui](full-ig.zip).

### Repositório github

Todo o conteúdo do presente Guia foi desenvolvido e está disponível no repositório
[https://github.com/kyriosdata/farol](https://github.com/kyriosdata/farol). 

### Versões
{% include cross-version-analysis.xhtml %}

### Tabela de dependências
{% include dependency-table.xhtml %}

### Globals Table
{% include globals-table.xhtml %}

### Propriedade intelectual
{% include ip-statements.xhtml %}