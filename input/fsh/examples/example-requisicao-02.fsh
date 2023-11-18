Instance: requisicao-incompleta
InstanceOf: RequisicaoExameCitopatologico
Title: "Requisição incompleta"
Description: "Uma requisição incompleta."
Usage: #example

* intent = #order

* identifier.system = "http://goias.gov.br/fhir/ns/siscan"
* identifier.value = "2345234234234"
* intent = #original-order
* category.coding.code = $SCT#108252007

* subject = Reference(Patient/Fulana)
* occurrenceDateTime = "2013-05-02T16:16:00-07:00"
* requester = Reference(enfermeira)
* performer = Reference(enfermeiro)
* reasonCode = $icd-9#V173 "Fam hx-ischem heart dis"

* note.text = "patient is afraid of needles"

