Profile: DataUltimoExameCitopatologico
Parent: Observation
Id: data-ultimo-exame-citopatologico
Title: "Data Ultimo Exame Citopatologico"
Description: "Define estrutura para armazenar data do último exame citopatológico"

* ^url = "http://perfil.org/data-ultimo-exame-citopatologico"
* ^status = #draft
* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Detalhes de requisição de exame citopatológico</div>"

* performer 0..0
* subject 0..0
* text 0..0

* value[x] only dateTime
* valueDateTime 1..1