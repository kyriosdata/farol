Instance: ns-laboratorio
InstanceOf: NamingSystem
Title: "Identificador de exame gerado por laboratório"
Description: "Declaração do identificador de código único de exame gerado por laboratório"
Usage: #definition

* name = "LaboratorioProtocolo"
* status = #draft
* kind = #identifier
* date = "2023-07-31T14:24:34.711Z"
* publisher = "Ministério da Saúde (INCA)"
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

* responsible = "Instituto Nacional do Câncer (SISCAN)"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #FILL
* type.text = "O identificador único do exame realizado por laboratório"

* description = "Identificador para código único gerado pelo laboratório que realiza exame. Observe que este identificador não identifica um laboratório. Em vez disso, apenas estabelece que um dado código é único no contexto de um laboratório, identificado em outra parte do registro de um laudo, por exemplo."

* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #task
* useContext.valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* useContext.valueCodeableConcept.coding[0].code = #LABOE

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Código usado pelo laboratório para identificar unicamente um laudo, no domínio do laboratório. Ou seja, não se trata de um código único nacional."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/laboratorio"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"

