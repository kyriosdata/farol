Instance: ns-cns
InstanceOf: NamingSystem
Title: "Identificador do Cartão Nacional de Saúde (CNS)"
Description: "Declaração do identificador de números de Cartão Nacional de Saúde (CNS)"
Usage: #definition

* name = "CNS"
* status = #draft
* kind = #identifier
* date = "2024-02-09"
* publisher = "Ministério da Saúde do Brasil"
* contact[0].name = "Renata INCA"
* contact[0]
  * telecom[0]
    * system = #phone
    * value = "+55 62 98765-4321"
    * use = #work
    * rank = 1
  * telecom[1]
    * system = #email
    * value = "renata@inca.gov.br"
    * rank = 2

* responsible = "Ministério da Saúde (Brasil)"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #HC // Health Card Number
* type.text = "Número do Cartão Nacional de Saúde (CNS)"

* description = "Declara o identificador empregado para se referir a um indivíduo (paciente) em todo o território nacional (Brasil). Desta forma, este identificar quando acompanhado de um código, de forma não ambígua declara que tal código é o código único de um indivíduo (paciente), também conhecido por CNS."

* useContext[0]
  * code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
  * code.code = #workflow
  * valueCodeableConcept.coding = urn:iso:std:iso:3166#BRA
  * valueCodeableConcept.text = "Identificação de estabelecimentos no território brasileiro"

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Definido pelo Ministério da Saúde (Brasil)"

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de declaração nacional para o CNS. Este valor deverá ser substituído por sequência produzida pelo órgão federal competente."
* uniqueId[0].period.start = "2024-02-09"

