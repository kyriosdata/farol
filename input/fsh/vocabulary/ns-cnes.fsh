Instance: ns-cnes
InstanceOf: NamingSystem
Title: "Identificador do Cadastro Nacional de Estabelecimentos de Saúde (CNES)"
Description: "Declaração do identificador do Cadastro Nacional de Estabelecimentos de Saúde (CNES)"
Usage: #definition

* name = "CNES"
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

* responsible = "Ministério da Saúde do Brasil"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #FI // Facility ID
* type.text = "Cadastro Nacional de Estabelecimentos de Saúde (CNES)"

* description = "Declara o identificador empregado para se referir ao códigos do Cadastro Nacional de Estabelecimentos de Saúde (CNES) atribuídos aos estabelecimentos de saúde. Ou seja, o nome pelo qual é identificado um código CNES. Os códigos atribuídos a estabelecimentos de saúde podem ser consultados em [https://cnes.datasus.gov.br/](https://cnes.datasus.gov.br/)"

* useContext[0]
  * code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
  * code.code = #workflow
  * valueCodeableConcept.coding = urn:iso:std:iso:3166#BRA
  * valueCodeableConcept.text = "Identificação de estabelecimentos no território brasileiro"

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Usado quando se deseja indicar que um dado código é único e atribuído a um estabelecimento de saúde pelo Ministério da Saúde do Brasil."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/cnes"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de declaração nacional para o CNES. Este valor deverá ser substituído por sequência produzida pelo órgão federal competente."
* uniqueId[0].period.start = "2023-11-13"

