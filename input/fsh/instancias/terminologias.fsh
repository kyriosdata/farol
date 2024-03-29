
// ------------------------------------------------------
// NamingSystem
// ------------------------------------------------------

Instance: ns-laboratorio
InstanceOf: NamingSystem
Title: "Identificador de exame gerado por laboratório"
Description: "Declaração do identificador de código único de exame gerado por laboratório. Observe que este identificador não discrimina qual o laboratório em questão, ou seja, apenas sabe-se que se trata de um identificador gerado por um laboratório. O contexto em questão deve incluir a informação de qual laboratório o código faz parte."
Usage: #definition

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Identificador para código de exame gerado por laboratório. Não identifica o laboratório.</div>"

* name = "LaboratorioProtocolo"
* status = #draft
* kind = #identifier
* date = "2023-07-31T14:24:34.711Z"
* publisher = "Ministério da Saúde (INCA)"
* contact[0].name = "Renata INCA"
* contact[0]
  * telecom[0]
    * system = #phone
    * value = "+55 62 98765-4321"
    * use = #work
    * rank = 1
  * telecom[1]
    * system = #email
    * value = "renata@inca.gov.br"
    * rank = 2

* responsible = "Instituto Nacional do Câncer (SISCAN)"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #FILL
* type.text = "O identificador único do exame realizado por laboratório"

* description = "Identificador para código único gerado pelo laboratório que realiza exame. Observe que este identificador não identifica um laboratório. Em vez disso, apenas estabelece que um dado código é único no contexto de um laboratório, identificado em outra parte do registro de um laudo, por exemplo."

* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #task
* useContext.valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* useContext.valueCodeableConcept.coding[0].code = #LABOE

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Código usado pelo laboratório para identificar unicamente um laudo, no domínio do laboratório. Ou seja, não se trata de um código único nacional."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/laboratorio"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"


Instance: ns-cnes
InstanceOf: NamingSystem
Title: "Identificador do Cadastro Nacional de Estabelecimentos de Saúde (CNES)"
Description: "Declaração do identificador do Cadastro Nacional de Estabelecimentos de Saúde (CNES)"
Usage: #definition

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Identificador do código CNES.</div>"

* name = "CNES"
* status = #draft
* kind = #identifier
* date = "2024-02-09"
* publisher = "Ministério da Saúde do Brasil"
* contact[0].name = "Renata INCA"
* contact[0]
  * telecom[0]
    * system = #phone
    * value = "+55 62 98765-4321"
    * use = #work
    * rank = 1
  * telecom[1]
    * system = #email
    * value = "renata@inca.gov.br"
    * rank = 2

* responsible = "Ministério da Saúde do Brasil"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #PRN // Provider number
* type.text = "Cadastro Nacional de Estabelecimentos de Saúde (CNES)"

* description = "Declara o identificador empregado para se referir ao códigos do Cadastro Nacional de Estabelecimentos de Saúde (CNES) atribuídos aos estabelecimentos de saúde. Ou seja, o nome pelo qual é identificado um código CNES. Os códigos atribuídos a estabelecimentos de saúde podem ser consultados em [https://cnes.datasus.gov.br/](https://cnes.datasus.gov.br/)"

* useContext[0]
  * code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
  * code.code = #workflow
  * valueCodeableConcept.coding = urn:iso:std:iso:3166#BRA
  * valueCodeableConcept.text = "Identificação de estabelecimentos no território brasileiro"

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Usado quando se deseja indicar que um dado código é único e atribuído a um estabelecimento de saúde pelo Ministério da Saúde do Brasil."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/cnes"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"

Instance: ns-cns
InstanceOf: NamingSystem
Title: "Identificador do Cartão Nacional de Saúde (CNS)"
Description: "Declaração do identificador de números de Cartão Nacional de Saúde (CNS)"
Usage: #definition

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Identificador do código CNES.</div>"

* name = "CNS"
* status = #draft
* kind = #identifier
* date = "2024-02-09"
* publisher = "Ministério da Saúde do Brasil"
* contact[0].name = "Renata INCA"
* contact[0]
  * telecom[0]
    * system = #phone
    * value = "+55 62 98765-4321"
    * use = #work
    * rank = 1
  * telecom[1]
    * system = #email
    * value = "renata@inca.gov.br"
    * rank = 2

* responsible = "Ministério da Saúde (Brasil)"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #SB // Social Beneficiary Identifier
* type.text = "Número do Cartão Nacional de Saúde (CNS)"

* description = "Declara o identificador empregado para se referir a um indivíduo (paciente ou profissional de saúde) em todo o território nacional (Brasil). Desta forma, este identificar quando acompanhado de um código, de forma não ambígua declara que tal código é o código único de um indivíduo (paciente), também conhecido por CNS."

* useContext[0]
  * code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
  * code.code = #workflow
  * valueCodeableConcept.coding = urn:iso:std:iso:3166#BRA
  * valueCodeableConcept.text = "Identificação de estabelecimentos no território brasileiro"

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Definido pelo Ministério da Saúde (Brasil)"

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2024-02-09"


Instance: ns-cpf
InstanceOf: NamingSystem
Title: "Identificador de Cadastro de Pessoa Física (CPF)"
Description: "Declaração do identificador de números de inscrição no Cadastro de Pessoa Física (CPF)"
Usage: #definition

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Identificador do número de CPF.</div>"

* name = "CPF"
* status = #draft
* kind = #identifier
* date = "2023-11-13"
* publisher = "Receita Federal do Brasil"
* contact[0].name = "Renata INCA"
* contact[0]
  * telecom[0]
    * system = #phone
    * value = "+55 62 98765-4321"
    * use = #work
    * rank = 1
  * telecom[1]
    * system = #email
    * value = "renata@inca.gov.br"
    * rank = 2

* responsible = "Receita Federal do Brasil"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #TAX
* type.text = "Número de inscrição no Cadastro de Pessoa Física (CPF)"

* description = "Identificador do número de inscrição no Cadastro de Pessoas Físicas (CPF)"

* useContext[0]
  * code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
  * code.code = #workflow
  * valueCodeableConcept.coding = urn:iso:std:iso:3166#BRA
  * valueCodeableConcept.text = "Identificação de estabelecimentos no território brasileiro"

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Usado quando se deseja declarar a origem do código que o acompanha. Desta forma, o interlocutor saberá que o código em questão identifica unicamente um cidadão."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/cpf"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"

Instance: loinc
InstanceOf: NamingSystem
Title: "LOINC"
Description: "Terminologia LOINC (https://loinc.org)"
Usage: #definition

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Declaração do identificador do código LOINC. Criado para montagem de catálogo de nomes utilizados pela solução.</div>"

* name = "LOINC"
* status = #active
* kind = #codesystem
* date = "2023-07-31T14:24:34.711Z"
* publisher = "Ministério da Saúde (INCA)"
* contact[0].name = "Renata INCA"
* contact[0]
  * telecom[0]
    * system = #phone
    * value = "+55 62 98765-4321"
    * use = #work
    * rank = 1
  * telecom[1]
    * system = #email
    * value = "renata@inca.gov.br"
    * rank = 2

* responsible = "LOINC and Health Data Standards, Regenstrief Institute, Inc."

* type.text = "O identificador de códigos LOINC conforme sugerido pela HL7 FHIR"
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #FILL

* description = """
O sistema de codificação conhecido por LOINC é bem-definido e inclui dezenas de milhares
de códigos e também um significativo conjunto de _ValueSets_.
"""

* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #task
* useContext.valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* useContext.valueCodeableConcept.coding[0].code = #LABOE

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Este identificador é empregado para definir que um dado código refere-se ao código único gerado pelo SISCAN para requisições de exame citopatológico no Brasil."

* uniqueId[0].type = #uri
* uniqueId[0].value = "http://loinc.org"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Identificador utilizado internacionalmente inclusive pelo FHIR 4.0.1."

* uniqueId[1].type = #oid
* uniqueId[1].value = "2.16.840.1.113883.6.1"
* uniqueId[1].preferred = true


Instance: siscan
InstanceOf: NamingSystem
Title: "Identificador de protocolo (código único) gerado pelo SISCAN"
Description: "Declaração do identificador de números únicos gerados pelo SISCAN"
Usage: #definition

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Declaração do identificador de requisição de exame citopatológico gerado pelo SISCAN.</div>"

* name = "SiscanProtocolo"
* status = #draft
* kind = #identifier
* date = "2023-07-31T14:24:34.711Z"
* publisher = "Ministério da Saúde (INCA)"
* contact[0].name = "Renata INCA"
* contact[0]
  * telecom[0]
    * system = #phone
    * value = "+55 62 98765-4321"
    * use = #work
    * rank = 1
  * telecom[1]
    * system = #email
    * value = "renata@inca.gov.br"
    * rank = 2

* responsible = "Instituto Nacional do Câncer (SISCAN)"

* type.text = "O identificador nacional da requisição de exame citopatológico fornecido pelo SISCAN"
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #FILL

* description = """
Identificador de número único gerado automaticamente pelo **SISCAN** para cada requisição 
de exame citopatológico. O identificador, portanto, apenas indica que o código que o acompanha
se refere a uma requisição unicamente identificada pelo SISCAN.
"""

* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #task
* useContext.valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* useContext.valueCodeableConcept.coding[0].code = #LABOE

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Este identificador é empregado para definir que um dado código refere-se ao código único gerado pelo SISCAN para requisições de exame citopatológico no Brasil."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ns/siscan"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"


// ------------------------------------------------------
// resultados-inspecao-colo
// ------------------------------------------------------

CodeSystem: ResultadosInspecaoColo
Id: resultados-inspecao-colo
Title: "Resultado da inspeção do colo"
Description: "Os resultados para a inspeção de colo visando exame citopatológico."

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Código para resultado da inspeção do colo.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false

* #normal "Normal"
* #ausente "Ausente" "Anomalias congênitas ou retirado cirurgicamente"
* #alterado "Alterado" 
* #nao-visualizado "Colo não visualizado"

// ------------------------------------------------------

ValueSet: ResultadoInspecaoColo
Id: resultado-inspecao-colo
Title: "Situação do colo"
Description: "Situação do colo"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Código admitidos para resultado da inspeção do colo.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/resultado-inspecao-colo"

* ^status = #draft
* ^experimental = false

* include codes from system ResultadosInspecaoColo

// ------------------------------------------------------
// laudos-siscan
// ------------------------------------------------------

CodeSystem: LaudosSiscan
Id: laudos-siscan
Title: "Laudos gerenciados pelo SISCAN"
Description: "Tipos de laudos gerenciados pelo SISCAN"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de tipos de laudos gerenciados pelo SISCAN</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan"

* ^status = #unknown
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

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos para motivo de exame citopatológico.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame-citopatologico"

* ^status = #unknown
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

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos admitidos para motivo de exame citopatológico.</div>"

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
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos para os motivos pelos quais uma amostra pode ser rejeitada.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-amostra-rejeitada"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false

* #identificacao-invalida "falha na identificação" "Ausência ou erro na identificação da lâmina, frasco ou requisição"
* #lamina-invalida "lâmina" "Lâmina danificada ou ausente"
* #alheias "Causas alheias" "Causas alheias ao laboratório"
* #outras "Outras causas" "Outras causas"

// ------------------------------------------------------
// tipos-adequabilidade
// ------------------------------------------------------

CodeSystem: TiposAdequabilidade
Id: tipos-adequabilidade
Title: "Classificação da adequabilidade do material"
Description: "Definição da classificação da adequabilidade do material (amostra)"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos para classificação da adequabilidade do material</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-adequabilidade"

* ^status = #unknown
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

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Domínio de valores admitido para adequabilidade de amostra de exame citopatológico.</div>"

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
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos para classificação de alterações celulares benigcas</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/alteracoes-celulares-benignas"

* ^status = #unknown
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
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para alterações celulares benignas.</div>"

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
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos para microbiologia</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/microbiologias"

* ^status = #unknown
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
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para microbiologia</div>"

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
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos para classificação de células atípicas.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/celulas-atipicas"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false

* #neoplasicas "Possivelmente não neoplásicas"
* #alto-grau "Não se pode afastar lesão de alto grau"

// ------------------------------------------------------

ValueSet: CelulaAtipica
Id: celula-atipica
Title: "Célula atípica"
Description: "Célula atípica"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para células atípicas.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/celula-atipica"

* ^status = #draft
* ^experimental = false

* include codes from system CelulasAtipicas


CodeSystem: CelulasAtipicasEscamosas
Id: celulas-atipicas-escamosas
Title: "Classificação de células atípicas escamosas"
Description: "Tipos de células atípicas escamosas"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos para classificação de células atípicas escamosas.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/celulas-atipicas-escamosas"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false

* #asc-us "Possivelmente não neoplásicas (ASC-US)"
* #asc-h "Não se pode afastar lesão de alto grau (ASC-H)"

// ------------------------------------------------------

ValueSet: CelulaAtipicaEscamosa
Id: celula-atipica-escamosa
Title: "Célula atípica escamosa"
Description: "Célula atípica escamosa"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para células atípicas escamosas.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/celula-atipica-escamosa"

* ^status = #draft
* ^experimental = false

* include codes from system CelulasAtipicasEscamosas

// ------------------------------------------------------
// atipias-escamosas
// ------------------------------------------------------

CodeSystem: AtipiasEscamosas
Id: atipias-escamosas
Title: "Atipias em células escamosas"
Description: "Classificação de atipias em células escamosas"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Classificação de atipias em células escamosas.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/atipias-escamosas"

* ^status = #unknown
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
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para atipias em células escamosas.</div>"

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
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Classificação de atipias em células glandulares.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/atipias-glandulares"

* ^status = #unknown
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
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para atipias em células glandulares.</div>"

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

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false

* #motivo-rejeicao "Motivo de rejeição de amostra"
* #epitelios-na-amostra "Epitélios representados na amostra"
* #epitelio-escamoso-na-amostra "Epitélio escamoso representado na amostra?"
* #epitelio-glandular-na-amostra "Epitélio glandular representado na amostra?"
* #epitelio-metaplasico-na-amostra "Epitélio metaplásico representado na amostra?"
* #adequabilidade "Adequabilidade do material"
* #normalidade "Dentro dos limites da normalidade no material examinado?"
* #benigna-inflamacao "Alteração celular benigna reativa ou reparativa (inflamação)"
* #benigna-metaplasia "Alteração celular benigna reativa ou reparativa (metaplasia escamosa imatura)"
* #benigna-reparacao "Alteração celular benigna reativa ou reparativa (reparação)"
* #benigna-atrofia "Alteração celular benigna reativa ou reparativa (atrofia com inflamação)"
* #benigna-radiacao "Alteração celular benigna reativa ou reparativa (radiação)"
* #benigna-outra "Alteração celular benigna reativa ou reparativa (outras)"
* #microbiologia-lactobacillus "Lactobacillus sp"
* #microbiologia-cocos "Cocos"
* #microbiologia-chlamydia "Sugestivo de Chlamydia sp"
* #microbiologia-actinomyces "Actinomyces sp"
* #microbiologia-candida "Candida sp"
* #microbiologia-trichomonas "Trichomonas vaginalis"
* #microbiologia-herpes "Efeito citopático compatível com vírus do grupo Herpes"
* #microbiologia-bacilos "Bacilos supracitoplasmáticos (sugestivos de Gordnerella/Mobiluncus)"
* #microbiologia-outros-bacilos "Outros bacilos"
* #microbiologia-outros "Outros"
* #indeterminado-escamosas "Células atípicas escamosas de significado indeterminado"
* #indeterminado-glandulares "Células atípicas glandulares de significado indeterminado"
* #indeterminado-desconhecida "Células atípicas de significado indeterminado de origem indefinida"
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

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos para classificação de níveis educacionais.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/niveis-educacionais"

* ^status = #draft
* ^version = "1.0.0"
* ^experimental = false
* ^purpose = """Permite identificar o nível educacional do paciente e, desta forma, análises e ações decorrentes.
Esta classificação foi realizada com base em códigos disponíveis LOINC. **IMPORTANTE**: ajuste para manter coerência com o Ministério da Educação pode ser necessário.
"""

// Conforme https://www.hl7.org/fhir/loinc.html#4.3.3.2
* ^copyright = "This content LOINC® is copyright © 1995 Regenstrief Institute, Inc. and the LOINC Committee, and available at no cost under the license at http://loinc.org/terms-of-use"

* http://loinc.org#LA36-9 "Ensino infantil ou menos"
* http://loinc.org#LA12456-2 "Ensino fundamental"
* http://loinc.org#LA12457-0 "Ensino médio"
* http://loinc.org#LA12458-8 "Curso técnico"
* http://loinc.org#LA12460-4 "Graduação"
* http://loinc.org#LA12461-2 "Mestrado"
* http://loinc.org#LA12462-0 "Doutorado"
* http://loinc.org#LA4489-6 "Desconhecido"

// ------------------------------------------------------
// motivo-rejeicao
// ------------------------------------------------------

ValueSet: MotivoRejeicao
Id: motivo-rejeicao
Title: "Motivo de rejeição de amostra"
Description: "Possíveis motivos pelos quais uma amostra é rejeitada"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para níveis educacionais.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-rejeicao"

* ^status = #draft
* ^experimental = false

* include codes from system MotivoAmostraRejeitada
