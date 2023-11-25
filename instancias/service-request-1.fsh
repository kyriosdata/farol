Instance: requisicao-detalhes
InstanceOf: ServiceRequest
Usage: #example
Title: "Requisicao Um"
Description: "Requisição de exame citopatológico"

* meta.profile[0] = "http://perfil.org/requisicao-exame-citopatologico"
* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Detalhes de requisição de exame citopatológico</div>"

* status = #draft
* intent = #order
* subject = Reference(Rosa)
* contained[0] = data
* supportingInfo[0] = Reference(data)


Instance: data
InstanceOf: Observation
Usage: #inline
Title: "Data do último exame citopatológico"
Description: "Data em que fez o último exame"

* meta.profile[0] = "http://perfil.org/data-ultimo-exame-citopatologico"
* code = http://loinc.org#60432-2
* status = #final
* valueDateTime = "2023-10-11"

