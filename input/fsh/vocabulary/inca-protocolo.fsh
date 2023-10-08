Instance: SiscanProtocolo
InstanceOf: NamingSystem
Title: "Números de protocolo gerados pelo SISCAN"
Description: "Número único de identificação de exame citopatológico"
Usage: #definition

* name = "SiscanProtocolo"
* status = #draft
* kind = #identifier
* date = "2023-07-31T14:24:34.711Z"
* publisher = "Ministério da Saúde (Brasil)"
* responsible = "SISCAN - Instituto Nacional do Câncer (INCA)"
* type = #PRN
* description = "Número único gerado pelo **SISCAN** para cada requisição de exame citopatológico. Este número é gerado automaticamente."
* jurisdiction[0].coding[0] = urn:iso:std:iso:3166#BR
* usage = "Este código é empregado para identificar uma requisição de exame citopatológico emitida no Brasil."

* uniqueId[0].type = #uri
* uniqueId[0].value = "http://saude.gov.br/NamingSystem/siscan"
