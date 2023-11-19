Alias: $organization-type = http://terminology.hl7.org/CodeSystem/organization-type

Instance: ubs
InstanceOf: Organization
Title: "Unidade Básica de Saúde"
Description: "Estabelecimento no qual a requisição foi produzida"
Usage: #example

* active = true
* type = $organization-type#prov
* name = "Unidade de Saúde do SUS Nome"
* alias = "UBS SUS"

* address.city = "Goiânia"
* address.state = "GO"

* identifier.system = "http://saude.gov.br/ns/CNES"
* identifier.value = "código CNES do estabelecimento"