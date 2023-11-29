Profile: RequisicaoExame
Parent: ServiceRequest
Id: requisicao-exame
Title: "Requisicao Exame"

* ^url = "http://perfil.org/requisicao-exame-citopatologico"
* ^status = #draft
* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Detalhes de requisição de exame citopatológico</div>"

* supportingInfo obeys ConteudoSuporte

Invariant: ConteudoSuporte
Description: "Possui apenas instâncias predefinidas"
Expression: "select($this.code.coding[0].code in ('60432-2')).allTrue()"
Severity: #error
