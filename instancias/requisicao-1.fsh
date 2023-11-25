Alias: $tipodocumento = http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoDocumento
Alias: $niveis-escolaridade = http://perfil.org/vs/niveis-escolaridade


Instance: requisicao-1
InstanceOf: Bundle
Usage: #example
Title: "Ficha de requisição de exame citopatológico"
Description: "Uma ficha preenchida de requisiçõa de exame citopatológico"

* type = #document

// Protocolo SISCAN
// Associado ao Bundle porque o SISCAN (INCA) atribui
// este valor a todo o conjunto de informações, inclusive
// com a assinatura, que é fornecida no Bundle
* identifier.system = "http://saude.gov.br/SISCAN"
* identifier.value = "código protocolo SISCAN"

// Data e hora em que a requisição foi submetida
* timestamp = "2023-11-24T09:08:23+03:00"

* entry[0]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb39"
  * resource = f142d5cf-6316-4ddd-b398-168af8aaeb39


Instance: f142d5cf-6316-4ddd-b398-168af8aaeb39
InstanceOf: Composition
Usage: #example
Title: "Dados da ficha de Exame Citopatológico"
Description: "Reúne dados de uma ficha de requisição"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Um documento que inclui a requisição de exame citopatológico (informações pertinentes) e representa a coleta de material para o laudo requisitado.</div>"

// REQUISIÇÃO DE EXAME (REX) a ser acrescentado?
* status = #final
* type = http://loinc.org#11485-0

// Data da coleta
* date = "2023-11-20"

// Responsável
* author.identifier.system = "http://perfil.org/cns"
* author.identifier.value = "cns do profissional"

* title = "Requisição de Exame Citopatológico"



