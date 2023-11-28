CodeSystem: ResultadoInspecaoColo
Id: resultado-inspecao-colo
Title: "Resultado da inspeção do colo"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "http://perfil.org/cs-inspecao-colo"

* ^status = #draft
* ^caseSensitive = true

* #normal "Normal"
* #ausente "Ausente" "Anomalias congênitas ou retirado cirurgicamente"
* #alterado "Alterado" 
* #nao-visualizado "Colo não visualizado"