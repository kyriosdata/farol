Instance: ns-cns
InstanceOf: NamingSystem
Title: "Identificador do Cartão Nacional de Saúde (CNS)"
Description: "Declaração do identificador de números de Cartão Nacional de Saúde (CNS)"
Usage: #definition

* name = "CNS"
* status = #draft
* kind = #identifier
* date = "2023-11-13"
* publisher = "Ministério da Saúde (Brasil)"
* responsible = "Ministério da Saúde (Brasil)"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #HC // Health Card Number
* type.text = "Número do Cartão Nacional de Saúde (CNS)"

* description = "Identificador do número de Cartão Nacional de Saúde (CNS)"

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Definido pelo Ministério da Saúde (Brasil)"

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de NamingSystem nacional para o CNS"
* uniqueId[0].period.start = "2023-11-13"
