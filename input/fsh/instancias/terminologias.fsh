
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
// motivos-exame
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

* #identificacao-invalida "falha na identificação" "Ausência ou erro na identificação da lâmina, frasco ou requisição"
* #lamina-invalida "lâmina" "Lâmina danificada ou ausente"
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

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-epitelios"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #escamoso "Escamoso" "Escamoso"
* #grandular "Grandular" "Grandular"
* #metaplasico "Metaplásico" "Metaplásico"

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
* #outros "Outros"

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
* #grandulares-1 "Possivelmente não neoplásicas"
* #grandulares-2 "Não se pode afastar lesão de alto grau"
* #indefinida-1 "Possivelmente não neoplásicas"
* #indefinida-2 "Não se pode afastar lesão de alto grau"


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
// atipias-glandulares
// ------------------------------------------------------

CodeSystem: AtipiasGrandulares
Id: atipias-grandulares
Title: "Atipias em células grandulares"
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
// laudo-exame-citopatologico
// ------------------------------------------------------

CodeSystem: LaudoExameCitopatologico
Id: laudo-exame-citopatologico
Title: "Itens avaliados no laudo de exame citopatológico"
Description: "Tipos de avaliação de exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Itens avaliados no laudo de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-exame-citopatologico"

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

// ------------------------------------------------------
// adequabilidade-material
// ------------------------------------------------------

ValueSet: AdequabilidadeMaterial
Id: adequabilidade-material
Title: "Adequabilidade do material (amostra)"
Description: "Caracterização da adequabilidade do material"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/adequabilidade-material"

* ^status = #draft
* ^experimental = false

* include codes from system TiposAdequabilidade

// ------------------------------------------------------
// alteracao-celular-benigna
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
// celula-atipica
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
// atipia
// ------------------------------------------------------

ValueSet: Atipia
Id: atipia
Title: "Atipia"
Description: "Atipia"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para identificar o motivo do exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/atipia"

* ^status = #draft
* ^experimental = false

* include codes from system Atipias