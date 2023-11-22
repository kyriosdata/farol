Alias: $racacorext = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $racacor = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena

Instance: paciente-rosa
InstanceOf: Patient
Usage: #example
Title: "Rosa"
Description: "Paciente assistida"

* meta.profile[0] = "http://saude.gov.br/paciente"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>A paciente para a qual o exame é solicitado.</div>"

// Obrigatórios 

* identifier[0].system = "http://saude.gov.br/CNS"
* identifier[0].value = "cns da dona Rosa"

* name[0].text = "Rosa Silva"

* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName"
* extension[0].valueString = "Rosa Monteiro Silva"

* birthDate = "1990-10-23"

// Opcionais

* name[1].use = #nickname
* name[1].text = "Rosinha"

* identifier[1].system = "http://saude.gov.br/CPF"
* identifier[1].value = "12334534553"

* extension[1].url = "http://saude.gov.br/idade"
* extension[1].valueAge.value = 61

// Binding para http://hl7.org/fhir/ValueSet/age-units
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = $racacorext
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCodeableConcept = $racacor#02
* extension[2].extension[1].url = "indigenousEthnicity"
* extension[2].extension[1].valueCodeableConcept = $etniaindigena#0001

* address[0]
  * use = #home
  * type = #physical
  * city = #315780
  * state = #31
  * postalCode = "74000-000"
  * line[0].id = "Address.line:street"
  * line[0] = "Rua X"
