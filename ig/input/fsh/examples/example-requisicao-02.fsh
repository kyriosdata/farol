Instance: requisicao-incompleta
InstanceOf: BRRequisicaoExameCitopatologico
Title: "Requisição incompleta"
Description: "Uma requisição incompleta."
Usage: #example

* intent = #order

* identifier.type = $v2-0203#PLAC
* identifier.type.text = "Placer"
* identifier.system = "urn:oid:1.3.4.5.6.7"
* identifier.value = "2345234234234"
* intent = #original-order
* category.coding.code = $SCT#108252007

* subject = Reference(Patient/paciente1)
* occurrenceDateTime = "2013-05-02T16:16:00-07:00"
* requester = Reference(enfermeira)
* performer = Reference(enfermeiro)
* reasonCode = $icd-9#V173 "Fam hx-ischem heart dis"

* note.text = "patient is afraid of needles"

