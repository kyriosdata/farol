Alias: $organization-type = http://terminology.hl7.org/CodeSystem/organization-type

Instance: ubs
InstanceOf: Organization
Title: "Unidade Básica de Saúde"
Description: "Local de encontro no qual requisição foi produzida"
Usage: #example

* active = true
* type = $organization-type#prov
* name = "Unidade de Saúde do SUS Nome"
* alias = "UBS SUS"

* address.city = "Goiânia"
* address.state = "GO"
* address.postalCode = "74000-000"
* address.line = "Rua Principal"

* partOf = Reference(INCA)