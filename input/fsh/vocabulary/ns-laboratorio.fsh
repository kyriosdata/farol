Instance: ns-laboratorio
InstanceOf: NamingSystem
Title: "Identificador de exame gerado por laboratório"
Description: "Declaração do identificador único de exame gerado por laboratório"
Usage: #definition

* name = "LaboratorioProtocolo"
* status = #draft
* kind = #identifier
* date = "2023-07-31T14:24:34.711Z"
* publisher = "Ministério da Saúde (INCA)"
* responsible = "Instituto Nacional do Câncer (SISCAN)"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #FILL
* type.text = "O identificador único do exame realizado pelo laboratório"

* usage = "Este código é único e emitido pelo laboratório que realiza o exame."

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/laboratorio"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de NamingSystem nacional para o código gerado por laboratório"
* uniqueId[0].period.start = "2023-11-13"

* description = "Identificador de código único gerado pelo laboratório que realiza exame."

* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #task
* useContext.valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* useContext.valueCodeableConcept.coding[0].code = #LABOE

