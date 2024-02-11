
Alias: $loinc = http://loinc.org

// ------------------------------------------------------
// inspecao-colo
// ------------------------------------------------------

CodeSystem: ResultadoInspecaoColo
Id: inspecao-colo
Title: "Resultado da inspeção do colo"
Description: "Os resultados para a inspeção de colo visando exame citopatológico."

//* ^text.status = #empty
//* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/inspecao-colo"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #normal "Normal"
* #ausente "Ausente" "Anomalias congênitas ou retirado cirurgicamente"
* #alterado "Alterado" 
* #nao-visualizado "Colo não visualizado"

// ------------------------------------------------------

ValueSet: ResultadoInspecaoColoValores
Id: vs-inspecao-colo
Title: "Situação do colo"
Description: "Situação do colo"

//* ^text.status = #empty
//* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/vs-inspecao-colo"

* ^status = #draft
* ^experimental = false

* include codes from system ResultadoInspecaoColo

// ------------------------------------------------------
// laudos-siscan
// ------------------------------------------------------

CodeSystem: LaudosSiscan
Id: laudos-siscan
Title: "Laudos gerenciados pelo SISCAN"
Description: "Tipos de laudos gerenciados pelo SISCAN"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #citopatologico "Exame citopatológico"

// ------------------------------------------------------
// motivos-exame
// ------------------------------------------------------

CodeSystem: MotivosExame
Id: motivos-exame-citopatologico
Title: "Motivo do exame citopatológico"
Description: "Define os motivos pelos quais uma requisição de exame citopatológico é realizada"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame-citopatologico"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #rastreamento "Rastreamento" "Com a finalidade de rastreamento"
* #repeticao "Repetição" "Repetição (exame alterado ASCUS/Baixo grau)"
* #seguimento "Seguimento" "Seguimento (pós diagnóstico colposcópico/tratamento)"

// --------------------------

ValueSet: MotivoExame
Id: motivo-exame-citopatologico
Title: "Motivo exame"
Description: "Possíveis motivos para requisição de exame citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-exame-citopatologico"

* ^status = #draft
* ^experimental = false

* include codes from system MotivosExame

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

* #identificacao-invalida "falha na identificação" "Ausência ou erro na identificação da lâmina, frasco ou requisição"
* #lamina-invalida "lâmina" "Lâmina danificada ou ausente"
* #alheias "Causas alheias" "Causas alheias ao laboratório"
* #outras "Outras causas" "Outras causas"

// ------------------------------------------------------
// tipos-epitelios
// ------------------------------------------------------

CodeSystem: TiposDeEpitelios
Id: tipos-epitelios
Title: "Tipos de epitélios"
Description: "Tipos de epitélios em amostra de exame citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-epitelios"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #escamoso "Escamoso" "Escamoso"
* #glandular "Glandular" "Glandular"
* #metaplasico "Metaplásico" "Metaplásico"

// ------------------------------------------------------

ValueSet: TipoEpitelio
Id: tipo-epitelio
Title: "Tipo epitélio"
Description: "Tipo de epitélio na amostra"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/tipo-epitelio"

* ^status = #draft
* ^experimental = false

* include codes from system TiposDeEpitelios

// ------------------------------------------------------
// tipos-adequabilidade
// ------------------------------------------------------

CodeSystem: TiposAdequabilidade
Id: tipos-adequabilidade
Title: "Classificação da adequabilidade do material"
Description: "Definição da classificação da adequabilidade do material (amostra)"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-adequabilidade"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #satisfatoria "Satisfatória" "Satisfatória"
* #material "Material acelular" "Material acelular em menos de 10% do esfregaço"
* #sangue "Sangue" "Sangue em mais de 75% do esfregaço"
* #piocitos "Piócitos" "Piócitos em mais de 75% do esfregaço"
* #dessecamento "Dessecamento" "Artefatos de dessecamento em mais de 75% do esfregaço"
* #contaminantes "Contaminantes" "Contaminantes externos em mais de 75% do esfregaço"
* #superposicao "Superposição" "Intensa superposição celular em mais de 75% do esfregaço"
* #outros "Outros" "Outros motivos"

// ------------------------------------------------------

ValueSet: AdequabilidadeMaterial
Id: tipo-adequabilidade
Title: "Adequabilidade do material"
Description: "Caracterização da adequabilidade do material"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/tipo-adequabilidade"

* ^status = #draft
* ^experimental = false

* include codes from system TiposAdequabilidade

// ------------------------------------------------------
// alteracoes-celulares-benignas
// ------------------------------------------------------

CodeSystem: AlteracoesCelularesBenignas
Id: alteracoes-celulares-benignas
Title: "Classificação da alterações celulares"
Description: "Definição das várias alterações celulares benignas relevantes para o exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/alteracoes-celulares-benignas"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #inflamacao "Inflamação" "Inflamação"
* #metaplasia "Metaplasia" "Metaplasia escamosa imatura"
* #reparacao "Reparação" "Reparação"
* #atrofia "Atrofia" "Atrofia com inflamação"
* #radiacao "Radiação" "Radiação"
* #outros "Outros" "Outros"

// ------------------------------------------------------

ValueSet: AlteracaoCelularBenigna
Id: alteracao-celular-benigna
Title: "Alteração celular benigna"
Description: "Identifica alteração celular benigna relevante para exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/alteracao-celular-benigna"

* ^status = #draft
* ^experimental = false

* include codes from system AlteracoesCelularesBenignas

// ------------------------------------------------------
// microbiologias
// ------------------------------------------------------

CodeSystem: Microbiologias
Id: microbiologias
Title: "Microbiologias"
Description: "Microbiologias"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/microbiologias"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #lactobacillus "Lactobacillus sp"
* #cocos "Cocos"
* #chlamydia "Sugestivo de Chlamydia sp"
* #actinomyces "Actinomyces sp"
* #candida "Candida sp"
* #trichomonas "Trichomonas vaginalis"
* #herpes "Grupo Herpes" "Efeito citopático compatível com vírus do grupo Herpes"
* #bacilos-supracitoplasmaticos "Bacilos" "Bacilos supracitoplasmáticos (sugestivos de Gardnerella/Mobiluncus)"
* #outros-bacilos "Outros bacilos" "Outros bacilos"
* #outros "Outros"

// ------------------------------------------------------

ValueSet: Microbiologia
Id: microbiologia
Title: "Microbiologia"
Description: "Microbiologia"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/microbiologia"

* ^status = #draft
* ^experimental = false

* include codes from system Microbiologias

// ------------------------------------------------------
// celulas-atipicas
// ------------------------------------------------------

CodeSystem: CelulasAtipicas
Id: celulas-atipicas
Title: "Células atípicas"
Description: "Células atípicas"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/celulas-atipicas"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #escamosas-1 "Possivelmente não neoplásicas (ASC-US)"
* #escamosas-2 "Não se pode afastar lesão de alto grau (ASC-H)"
* #glandulares-1 "Possivelmente não neoplásicas"
* #glandulares-2 "Não se pode afastar lesão de alto grau"
* #indefinida-1 "Possivelmente não neoplásicas"
* #indefinida-2 "Não se pode afastar lesão de alto grau"

// ------------------------------------------------------

ValueSet: CelulaAtipica
Id: celula-atipica
Title: "Célula atípica"
Description: "Célula atípica"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/celula-atipica"

* ^status = #draft
* ^experimental = false

* include codes from system CelulasAtipicas

// ------------------------------------------------------
// atipias-escamosas
// ------------------------------------------------------

CodeSystem: AtipiasEscamosas
Id: atipias-escamosas
Title: "Atipias em células escamosas"
Description: "Classificação de atipias em células escamosas"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Classificação de atipias em células escamosas</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/atipias-escamosas"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #baixo "Lesão baixo grau" "Lesão intra-epitelial de baixo grau (compreendendo efeito citopático pelo HPV e neoplasia intra-epitelial cervical grau I)"
* #alto "Lesão alto grau" "Lesão intra-epitelial de alto grau (compreendendo neoplasias intraepiteliais cervicais graus II e III)"
* #possivel-microinvasao "Lesão intra-epitelial de alto grau , não podendo excluir micro-invasão"
* #carcinoma "Carcinoma" "Carcinoma epidermóide invasor"

// ------------------------------------------------------

ValueSet: AtipiaEscamosa
Id: atipia-escamosa
Title: "Atipia"
Description: "Atipia"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/atipia-escamosa"

* ^status = #draft
* ^experimental = false

* include codes from system AtipiasEscamosas

// ------------------------------------------------------
// atipias-glandulares
// ------------------------------------------------------

CodeSystem: AtipiasGlandulares
Id: atipias-glandulares
Title: "Atipias em células glandulares"
Description: "Classificação de atipias em células glandulares"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Classificação de atipias em células glandulares</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/atipias-glandulares"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #in-situ "Adenocarcinoma in situ"
* #cervical "Adenocarcinoma invasor cervical"
* #endometrial "Adenocarcinoma invasor endometrial"
* #sem-especificacao "Adenocarcinoma sem outras especificações"

// ------------------------------------------------------

ValueSet: AtipiaGlandular
Id: atipia-glandular
Title: "Atipia em célula glandular"
Description: "Atipia em célula glandular"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/atipia-glandular"

* ^status = #draft
* ^experimental = false

* include codes from system AtipiasGlandulares

// ------------------------------------------------------
// laudo-tipo-item
// ------------------------------------------------------

CodeSystem: LaudoTipoItem
Id: laudo-tipo-item
Title: "Informações do laudo citopatológico"
Description: "Tipos de avaliação de exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Itens avaliados no laudo de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #motivo-rejeicao "Motivo de rejeição de amostra"
* #epitelios-na-amostra "Epitélios representados na amostra"
* #adequabilidade "Adequabilidade do material"
* #normalidade "Dentro dos limites da normalidade no material examinado?"
* #alteracoes-benignas "Alterações celulares benignas reativas ou reparativas"
* #microbiologia "Microbiologia"
* #significado-indeterminado "Células atípicas de significado indeterminado"
* #atipias-escamosas "Atipias em células escamosas"
* #atipias-glandulares "Atipias em células glandulares"
* #neoplasias-malignas "Outras neoplasias malignas"
* #celulas-endometriais "Presença de células endometriais (na pós-menopausa ou acima de 40 anos, fora do período menstrual)"


// ------------------------------------------------------
// niveis-educacionais
// ------------------------------------------------------

ValueSet: NivelEducacional
Id: niveis-educacionais
Title: "Níveis educacionais"
Description: """
Identifica o nível educacional do paciente (maior obtido).
"""

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/niveis-educacionais"

* ^status = #draft
* ^version = "1.0.0"
* ^experimental = false
* ^purpose = """Permite identificar o nível educacional do paciente e, desta forma, análises e ações decorrentes.
Esta classificação foi realizada com base em códigos disponíveis LOINC. **IMPORTANTE**: ajuste para manter coerência com o Ministério da Educação pode ser necessário.
"""

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
