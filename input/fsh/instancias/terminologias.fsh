
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
* #bacilos-outros "Outros bacilos"
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

* #nao-neoplasicas "Possivelmente não neoplásicas"
* #lesao-nao-descartavel "Não se pode afastar lesão de alto grau"


// ------------------------------------------------------
// atipias
// ------------------------------------------------------

CodeSystem: Atipias
Id: atipias
Title: "Atipias"
Description: "Atipias"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/atipias"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #baixo "Lesão baixo grau" "Lesão intra-epitelial de baixo grau (compreendendo efeito citopático pelo HPV e neoplasia intra-epitelial cervical grau I)"
* #alto "Lesão alto grau" "Lesão intra-epitelial de alto grau (compreendendo neoplasias intraepiteliais cervicais graus II e III)"
* #possivel-microinvasao "Lesão intra-epitelial de alto grau , não podendo excluir micro-invasão"
* #carcinome "Carcinoma" "Carcinoma epidermóide invasor"


// ------------------------------------------------------
// questoes-anamnese
// ------------------------------------------------------

CodeSystem: AnamneseCitopatologia
Id: anamnese-citopatologia
Title: "Identificação do item de informação da anamnese de exame citopatológico"
Description: "Identificação dos itens de informação coletados na anamnese de exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/anamnese-citopatologia"

* ^status = #draft
* ^caseSensitive = true
* ^experimental = false

* #ja-fez "Você já realizou o exame citopatológico?"
* #diu "Usa DIU?"
* #pilula "Usa pílula anticoncepcional?"
* #radioterapia "Já fez tratamento por radioterapia?"
* #sangramento-relacao "Tem ou teve sangramento após relação?"
* #sangramento-menopausa "Tem ou teve sangramento após menopausa?"

// ------------------------------------------------------
// vs-inspecao-colo
// ------------------------------------------------------

ValueSet: QuestoesAnamnese
Id: questoes-anamnese
Title: "Informação coletada na anamnese de exame citopatógico"
Description: "Identificação de item de informação coletado pela anamnese de exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Motivo pelo qual é feita a requisição de exame citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/questoes-anamnese"

* ^status = #draft
* ^experimental = false

* include codes from system AnamneseCitopatologia
* $loinc#60432-2 "Data do último exame"
* $loinc#66174-4 "Está grávida?"
* $loinc#63873-4 "Usa hormônio na menopausa?"
* $loinc#8665-2 "Data da última menstruação"

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