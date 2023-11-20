Instance: paciente-rosa
InstanceOf: Patient
Usage: #example
Title: "Rosa"
Description: "Paciente assistida"

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

* identifier[1].system = "http://saude.gov.br/CPF"
* identifier[1].value = "12334534553"

* extension[1].url = "http://saude.gov.br/idade"
* extension[1].valueAge.value = 61
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #y

