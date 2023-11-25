Alias: $tipodocumento = http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoDocumento
Alias: $niveis-escolaridade = http://perfil.org/vs/niveis-escolaridade


Instance: requisicao-1
InstanceOf: Bundle
Usage: #example
Title: "Requisição de exame citopatológico"
Description: "Representa uma ficha preenchida de requisiçõa de exame citopatológico, possivelmente assinada"

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

* title = "Dados da requisição de Exame Citopatológico"

Alias: $racacorext = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $racacor = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade
Alias: $pontoreferencia = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator


// ------------------------------------------------------
// PACIENTE
// ------------------------------------------------------

Instance: f142d5cf-6316-4ddd-b398-168af8aaeb41
InstanceOf: Patient
Usage: #example
Title: "Rosa"
Description: "Paciente assistida"

* meta.profile[0] = "http://saude.gov.br/paciente"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>A paciente para a qual o exame é solicitado.</div>"

// ------------
// OBRIGATÓRIOS 
// ------------

// Cartão SUS
* identifier[0].system = "http://saude.gov.br/CNS"
* identifier[0].value = "cns da dona Rosa"

// Nome completo da mulher
* name[0].text = "Rosa Silva"

// Nome da mãe
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName"
* extension[0].valueString = "Rosa Monteiro Silva"

// Data de nascimento
* birthDate = "1990-10-23"

// ------------
// opcionais
// ------------

// Apelido da mulher
* name[1].use = #nickname
* name[1].text = "Rosinha"

// CPF
* identifier[1].system = "http://saude.gov.br/CPF"
* identifier[1].value = "12334534553"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = "http://saude.gov.br/idade"
* extension[1].valueAge.value = 61
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = $racacorext
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCodeableConcept = $racacor#02
* extension[2].extension[1].url = "indigenousEthnicity"
* extension[2].extension[1].valueCodeableConcept = $etniaindigena#0001

// Nacionalidade (B - brasileiro, E - estrangeiro ou N - naturalizado)
* extension[3].url = $nacionalidade
* extension[3].valueCodeableConcept.coding[0]
  * system = $cs-nacionalidade
  * code = #B

// Nível de escolaridade
* extension[4].url = "http://perfil.org/nivel-educational"
* extension[4].valueCode = #LA12462-0

* address[0]
  * use = #home
  * type = #physical
  * city = #315780
  * state = #31
  * postalCode = "74000-000"  // Nao valida a máscara xxxxx-xxx
  * line[0] = "Rua"
  * line[0].id = "street"
  * line[1] = "Rua"
  * line[1].id = "neighborhood"
  * line[2] = "23"
  * line[2].id = "number"
  * line[3] = "bloco B"
  * line[3].id = "complement"
  * line.extension[0].url = $pontoreferencia
  * line.extension[0].valueString = "próximo ao supermercado"
  
* telecom[0]
  * system = #phone
  * value = "99999-9999"



