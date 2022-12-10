## IMPORTANTE

- Versão 1.2.23 (mais recente) gera exceção. Usando 1.2.22 do
  [IG Publisher](https://github.com/HL7/fhir-ig-publisher/releases).

## Guia de Implementação

Guia de Implementação é o mecanismo empregado para explicar como usar
a especificação FHIR para obter a interoperabilidade num domínio específico.
Neste caso, o monitoramento e rastreamento do câncer de colo de útero.

## Desenvolvimento

Várias ferramentas são necessárias. Para ambientes
linux é suficiente executar o arquivo **gitpod.sh** para
disponibilizar o ambiente de desenvolvimento.

- `_updatePublisher`
- `_genonce`
- Abriar o arquivo `output\index.html`
- Erros, warnings, ... `output\qa.html`

## Gitpod

- `npm install -g http-server`
- `http-server ./output`
- Permita que porta possa ser aberta
- Na aba ports clique no link para a porta aberta

## Publicar na AWS S3

- `aws s3 sync modelagem-fhir\ig\output s3://farol-ig --profile farol-ig --delete`
- [http://farol-ig.s3-website-sa-east-1.amazonaws.com/](http://farol-ig.s3-website-sa-east-1.amazonaws.com/) para visitar a implementação publicada.

# Ferramentas

- Sobre [canonical URL and versioning](https://fire.ly/blog/versioning-and-canonical-urls/)
- Camunda Modeler. Edição de arquivos bpmn (ilustração dos processos).
- [clinFHIR](http://gb2.clinfhir.com) é a recomendação para aprender a fazer uso de FHIR. Pode-se criar instâncias de recursos ao mesmo tempo em que são validadas conforme o padrão. Também é possível a conversão entre JSON, XML e FSH.
- JSON to FSH (FSH to JSON) : [online](https://fshschool.org/FSHOnline/#/)
- Apenas converte XML to JSON e vice-versa (JSON to XML) : [online](https://fhir-formats.github.io/)
- Validador online de instâncias de recursos
  - Documentação recomendada [aqui](https://fire.ly/blog/validate-fhir-resources-like-a-boss/#copy-paste-validation)
  - [FHIR](https://validator.fhir.org/)
  - [Simplifier](https://simplifier.net/validate)
  - [clinFHIR](http://clinfhir.com/validateResource.html)

# Terminologia (erros pré-analíticos)

- [Specimen status](https://www.hl7.org/fhir/valueset-specimen-status.html)
- https://www.bdtd.uerj.br:8443/bitstream/1/14996/1/Edmilson%20Garcia%20da%20Costa%20Dissertacao%20completa.pdf

# Links

- [FHIR produtos e outros](https://confluence.hl7.org/display/FHIR/FHIR+Product+Family)
- [FHIR Community](https://fhir.org/)
- IG (Guia de Implementação - início) http://build.fhir.org/ig/FHIR/ig-guidance/index.html
- Guia para uso de templates para o [IG](https://build.fhir.org/ig/FHIR/ig-guidance/using-templates.html)
- IG Builds: https://fhir.github.io/auto-ig-builder/builds.html
- IG Publisher (https://github.com/HL7/fhir-ig-publisher)
- FSH (FHIR ShortHand) (http://build.fhir.org/ig/HL7/fhir-shorthand/)
- Onde aprender FSH (https://fshschool.org)
- FSH Search (projetos que usam FSH) (https://fshschool.org/fsh-finder/)
- SUSHI (renderer for FSH) (https://github.com/FHIR/sushi)
- [NPM Package Specification](https://confluence.hl7.org/display/FHIR/NPM+Package+Specification)
- [FHIR Registry](https://registry.fhir.org)
- Um [EXEMPLO REAL](https://github.com/IHE/ITI.MHD)

## Recursos relevantes

- [ServiceRequest](https://www.hl7.org/fhir/servicerequest.html)
- [DiagnosticReport](https://www.hl7.org/fhir/diagnosticreport.html)
- [Provenance](https://www.hl7.org/fhir/provenance.html)
