Profile: RequisicaoExame
Parent: ServiceRequest
Id: requisicao-exame
Title: "Requisicao Exame"

* ^url = "http://perfil.org/requisicao-exame-citopatologico"
* ^status = #draft
* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Detalhes de requisição de exame citopatológico</div>"

* contained obeys ConteudoSuporte

* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "reference"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.ordered = false   // can be omitted, since false is the default
* supportingInfo ^slicing.description = "Slice based on the component.code pattern"

* supportingInfo contains anamnese 1..1 MS and exame 1..1 MS

* supportingInfo[anamnese].type = "QuestionnaireResponse"
* supportingInfo[exame].type = "Observation"

Invariant: ConteudoSuporte
Description: "Possui apenas instâncias predefinidas"
Expression: "select($this.code.coding[0].code in ('60432-2')).allTrue()"
Severity: #error
