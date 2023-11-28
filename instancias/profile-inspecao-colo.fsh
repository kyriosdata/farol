Profile: InspecaoColo
Parent: Observation
Id: inspecao-colo
Title: "Inspeção do colo"
Description: "Inspecao Colo visando requisição de exame citopatológico"

* ^url = "http://perfil.org/inspecao-colo"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^status = #draft
* code.coding 1..1
* code = http://loinc.org#12044-4
* code.text = "inspeção do colo"

* value[x] only CodeableConcept
* valueCodeableConcept from http://perfil.org/vs-inspecao-colo (required)
* valueCodeableConcept.coding 1..1