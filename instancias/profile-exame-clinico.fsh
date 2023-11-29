Profile: ExameClinicoParaLaudoCitopatologico
Parent: Observation
Id: exame-clinico
Title: "Exame clínico"
Description: "Exame clínico visando laudo de exame citopatológico"

* ^url = "http://perfil.org/exame-clinico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Exame clínico utilizado em exame citopatológico</div>"
* ^status = #draft

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false   // can be omitted, since false is the default
* component ^slicing.description = "Slice based on the component.code pattern"

* component contains inspecao 1..1 MS and sinais 1..1 MS

* component[inspecao].code = http://loinc.org#12044-4 // Inspeção do colo
* component[inspecao].value[x] only CodeableConcept
* component[inspecao].valueCodeableConcept from http://perfil.org/vs-inspecao-colo (required)
* component[inspecao].valueCodeableConcept.coding 1..1

* component[sinais].code = http://loinc.org#45687-1 // DST
* component[sinais].value[x] only boolean


