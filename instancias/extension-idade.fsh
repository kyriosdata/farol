Extension: Idade
Id: idade
Title: "Idade estimada do paciente"
Description: "Idade fornecida no momento da requisição"
Context: Patient

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>empty</div>"

* ^status = #draft

* ^url = "http://saude.gov.br/idade"
* value[x] only Age