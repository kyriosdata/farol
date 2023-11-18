CodeSystem: InspecaoColo
Id: inspecao-colo
Title: "Resultados para inspeção do colo"
Description: """
Indicação do resultado da inspeção do colo
visando exame citopatológico
"""

* ^meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"

* ^version = "0.0.1"
* ^name = "InspecaoColo"
* ^status = #draft
* ^experimental = false
* ^publisher = "Ministério da Saúde (INCA)"
* ^caseSensitive = true

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos empregados para registro do resultado da inspeção do colo de útero.</div>"

* #1 "Normal" "Definir normal"
* #2 "Ausente" "Definir ausente"
* #3 "Alterado" "Definir alterado"
* #4 "Colo não visualizado" "Definir colo não visualizado"