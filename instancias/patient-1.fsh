Alias: $racacorext = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $racacor = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade

Instance: paciente-rosa
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
  * line[3] = "próximo ao supermercado silva"
  * line[3].id = "complement"

* telecom[0]
  * system = #phone

