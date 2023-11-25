Instance: estabelecimento-requisitante
InstanceOf: Organization
Usage: #example
Title: "UBS1"
Description: "Unidade na qual exame citopatológico é requisitado"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Unidade na qual é elaborada a requisição do exame.</div>"

* name = "Unidade Básica do SUS"

// CNES
* identifier.system = "http://saude.gov.br/CNES"
* identifier.value = "CNES da UBS"

// UF e município
* address.city = "Goiânia"
* address.state = "GO"