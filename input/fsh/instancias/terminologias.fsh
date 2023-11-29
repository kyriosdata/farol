// ------------------------------------------------------
// cs-inspecao-colo
// ------------------------------------------------------

CodeSystem: ResultadoInspecaoColo
Id: cs-inspecao-colo
Title: "Resultado da inspeção do colo"
Description: "Os resultados para a inspeção de colo visando exame citopatológico."

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

//* ^url = "http://perfil.org/cs-inspecao-colo"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #normal "Normal"
* #ausente "Ausente" "Anomalias congênitas ou retirado cirurgicamente"
* #alterado "Alterado" 
* #nao-visualizado "Colo não visualizado"


// ------------------------------------------------------
// cs-motivo-exame
// ------------------------------------------------------

CodeSystem: MotivoExame
Id: cs-motivo-exame
Title: "Motivo do Exame Citopatológico"
Description: "Define os motivos pelos quais uma requisição de exame citopatológico é realizada"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

// * ^url = "http://perfil.org/cs-motivo-exame"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #rastreamento "Rastreamento" "Com a finalidade de rastreamento"
* #repeticao "Repetição" "Exame alterado ASCUS/Baixo grau"
* #seguimento "Seguimento" "Pós diagnóstico colposcópico/tratamento"

// ------------------------------------------------------
// vs-inspecao-colo
// ------------------------------------------------------

ValueSet: ResultadoInspecaoColoValores
Id: vs-inspecao-colo
Title: "Valores de inspeção do colo"
Description: "Possíveis resultados para inspeção de colo visando exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

// * ^url = "http://perfil.org/vs-inspecao-colo"
* ^status = #draft

* include codes from system ResultadoInspecaoColo


// ------------------------------------------------------
// vs-motivo-exame
// ------------------------------------------------------

ValueSet: MotivoExame
Id: vs-motivo-exame
Title: "Motivo Exame"
Description: "Possíveis motivos para requisição de exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

// * ^url = "http://perfil.org/vs-motivo-exame"
* ^status = #draft

* include codes from system MotivoExame


// ------------------------------------------------------
// vs-motivo-exame
// ------------------------------------------------------

Alias: $loinc = http://loinc.org

ValueSet: NivelEducacional
Id: nivel-educacional
Title: "Nível educacional"
Description: """
Identifica o nível educacional do paciente (maior obtido).

**IMPORTANTE**: é preciso verificar a conformidade com a orientação formal
do Ministério da Educação.
"""

// * ^url = "http://perfil.org/vs-niveis-escolaridade"

* ^status = #draft
* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Extensão para idade estimada de paciente</div>"
* ^version = "1.0.0"

// Conforme https://www.hl7.org/fhir/loinc.html#4.3.3.2
* ^copyright = "This content LOINC® is copyright © 1995 Regenstrief Institute, Inc. and the LOINC Committee, and available at no cost under the license at http://loinc.org/terms-of-use"

* $loinc#LA36-9 "Ensino infantil ou menos"
* $loinc#LA12456-2 "Ensino fundamental"
* $loinc#LA12457-0 "Ensino médio"
* $loinc#LA12458-8 "Curso técnico"
* $loinc#LA12460-4 "Graduação"
* $loinc#LA12461-2 "Mestrado"
* $loinc#LA12462-0 "Doutorado"
* $loinc#LA4489-6 "Desconhecido"