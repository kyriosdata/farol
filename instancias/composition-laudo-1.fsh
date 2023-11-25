Instance: laudo-1
InstanceOf: Composition
Usage: #example
Title: "Requisicao Exame Citopatológico"
Description: "Ilustra uma requisição"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Um laudo de exame citopatológico (exemplo)</div>"

* status = #final
* type = http://loinc.org#11485-0
* date = "2023-11-20"
* author = Reference(Practitioner/practitioner-lab)
* title = "Laudo de Exame Citopatológico"