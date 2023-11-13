Instance: SiscanProtocolo
InstanceOf: NamingSystem
Title: "Números de protocolo gerados pelo SISCAN"
Description: "Número único de identificação de exame citopatológico gerado pelo SISCAN"
Usage: #definition

* name = "SiscanProtocolo"
* status = #draft
* kind = #identifier
* date = "2023-07-31T14:24:34.711Z"
* publisher = "Ministério da Saúde (Brasil)"
* responsible = "SISCAN - Instituto Nacional do Câncer (INCA)"

// identificador de preenchimento ou de espaço reservado (fornecido pelo SISCAN)
* type.text = "O identificador nacional da requisição de exame citopatológico fornecido pelo SISCAN"
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #FILL

* description = """
Número único gerado pelo **SISCAN** para cada requisição de exame citopatológico. 
Este número é gerado automaticamente e atribuído como identificador da requisição
em todo o território nacional. A requisição pode vir acompanhada de outro 
identificador de requisição fornecido pelo sistema (estabelecimento) que 
encaminha a requisição para o SISCAN.
"""

* jurisdiction[0].coding[0] = urn:iso:std:iso:3166#BR
* usage = "Este código é empregado para identificar uma requisição de exame citopatológico emitida no Brasil."

* uniqueId[0].type = #uri
* uniqueId[0].value = "http://goias.gov.br/fhir/ns/siscan"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de NamingSystem nacional para o código gerado pelo SISCAN"
* uniqueId[0].period.start = "2023-11-13"