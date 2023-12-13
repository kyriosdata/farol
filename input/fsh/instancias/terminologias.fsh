
Alias: $loinc = http://loinc.org

// ------------------------------------------------------
// inspecao-colo
// ------------------------------------------------------

CodeSystem: ResultadoInspecaoColo
Id: inspecao-colo
Title: "Resultado da inspeção do colo"
Description: "Os resultados para a inspeção de colo visando exame citopatológico."

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/inspecao-colo"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #normal "Normal"
* #ausente "Ausente" "Anomalias congênitas ou retirado cirurgicamente"
* #alterado "Alterado" 
* #nao-visualizado "Colo não visualizado"


// ------------------------------------------------------
// motivo-exame
// ------------------------------------------------------

CodeSystem: MotivosExame
Id: motivos-exame
Title: "Motivo do Exame Citopatológico"
Description: "Define os motivos pelos quais uma requisição de exame citopatológico é realizada"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #rastreamento "Rastreamento" "Com a finalidade de rastreamento"
* #repeticao "Repetição" "Exame alterado ASCUS/Baixo grau"
* #seguimento "Seguimento" "Pós diagnóstico colposcópico/tratamento"

// ------------------------------------------------------
// motivo-amostra-rejeitada
// ------------------------------------------------------

CodeSystem: MotivoAmostraRejeitada
Id: motivo-amostra-rejeitada
Title: "Motivo de rejeição da amostra"
Description: "Motivo pelo qual a amostra é rejeitada e o laudo inviável."

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-amostra-rejeitada"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #identificacao "falha na identificação" "Ausência ou erro na identificação da lâmina, frasco ou requisição"
* #dano "lâmina" "Lâmina danificada ou ausente"
* #alheia "Causa alheia" "Causa alheia ao laboratório"
* #outra "Outras causas" "Outras causas"

// ------------------------------------------------------
// tipos-epitelios
// ------------------------------------------------------

CodeSystem: TiposDeEpitelios
Id: tipos-epitelios
Title: "Tipos de epitélios"
Description: "Tipos de epitélios em amostra de exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-amostra-rejeitada"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #escamoso "Escamoso" "Escamoso"
* #grandular "Grandular" "Grandular"
* #metaplasico "Metaplásico" "Metaplásico"


// ------------------------------------------------------
// vs-inspecao-colo
// ------------------------------------------------------

ValueSet: ResultadoInspecaoColoValores
Id: vs-inspecao-colo
Title: "Valores de inspeção do colo"
Description: "Possíveis resultados para inspeção de colo visando exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/vs-inspecao-colo"

* ^status = #draft
* ^experimental = false

* include codes from system ResultadoInspecaoColo


// ------------------------------------------------------
// vs-motivo-exame
// ------------------------------------------------------

ValueSet: MotivoExame
Id: motivo-exame
Title: "Motivo Exame"
Description: "Possíveis motivos para requisição de exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-exame"

* ^status = #draft
* ^experimental = false

* include codes from system MotivosExame


// ------------------------------------------------------
// niveis-educacionais
// ------------------------------------------------------

ValueSet: NivelEducacional
Id: niveis-educacionais
Title: "Níveis educacionais"
Description: """
Identifica o nível educacional do paciente (maior obtido).

**IMPORTANTE**: é preciso verificar a conformidade com a orientação formal
do Ministério da Educação.
"""

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/niveis-educacionais"

* ^status = #draft
* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Extensão para idade estimada de paciente</div>"
* ^version = "1.0.0"
* ^experimental = false

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

// ------------------------------------------------------
// tipo-epitelio
// ------------------------------------------------------

ValueSet: TipoEpitelio
Id: tipo-epitelio
Title: "Tipo epitélio"
Description: "Possíveis motivos para requisição de exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/tipo-epitelio"

* ^status = #draft
* ^experimental = false

* include codes from system TiposDeEpitelios

// ------------------------------------------------------
// motivo-rejeicao
// ------------------------------------------------------

ValueSet: MotivoRejeicao
Id: motivo-rejeicao
Title: "Motivo de rejeição de amostra"
Description: "Possíveis motivos pelos quais uma amostra é rejeitada"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-rejeicao"

* ^status = #draft
* ^experimental = false

* include codes from system MotivoAmostraRejeitada