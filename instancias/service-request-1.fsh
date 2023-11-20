Instance: requisicao-detalhes
InstanceOf: ServiceRequest
Usage: #example
Title: "Requisicao Um"
Description: "Requisição de exame citopatológico"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>empty</div>"

* status = #draft
* intent = #order
* subject = Reference(Rosa)