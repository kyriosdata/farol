Instance: ns-protocolo
InstanceOf: NamingSystem
Title: "Identificador de números de protocolo gerados pelo SISCAN"
Description: "Declaração do identificador de números únicos de identificação de requisição de exame citopatológico gerado pelo SISCAN"
Usage: #definition

* name = "SiscanProtocolo"
* status = #draft
* kind = #identifier
* date = "2023-07-31T14:24:34.711Z"
* publisher = "Ministério da Saúde (INCA)"
* responsible = "Instituto Nacional do Câncer (SISCAN)"

// identificador de preenchimento ou de espaço reservado (fornecido pelo SISCAN)
* type.text = "O identificador nacional da requisição de exame citopatológico fornecido pelo SISCAN"
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #FILL

* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #task
* useContext.valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* useContext.valueCodeableConcept.coding[0].code = #LABOE

* description = """
Identificador de número único gerado automaticamente pelo **SISCAN** para cada requisição 
de exame citopatológico. 
"""

* jurisdiction[0].coding[0] = urn:iso:std:iso:3166#BR
* usage = "Este código é empregado para identificar unicamente uma requisição de exame citopatológico emitida no Brasil."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/siscan"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de NamingSystem nacional para o código gerado pelo SISCAN"
* uniqueId[0].period.start = "2023-11-13"