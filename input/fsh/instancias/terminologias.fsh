
// ------------------------------------------------------
// NamingSystem
// ------------------------------------------------------

Instance: ns-requisitante
InstanceOf: NamingSystem
Title: "Prontuário"
Description: "O identificador de prontuário fornecido pela unidade de saúde requisitante de exame citopatológico."
Usage: #definition

* name = "RequisitanteProntuario"
* status = #draft
* kind = #identifier
* date = "2024-04-15"
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
* type.text = "O número do prontuário fornecido pela unidade de saúde requisitante"

* description = "Identificador do código único de prontuário fornecido unidade de saúde requisitante de exame citopatológico. Observe que o código correspondente é único para o estabelecimento e para o exame citopatológico."

* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #task
* useContext.valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* useContext.valueCodeableConcept.coding[0].code = #LABOE

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Código fornecido unidade de saúde requisitante para identificar o prontuário da paciente. Este código é único para o estabelecimento que faz a requisição."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ccu/sid/requisitante"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"

// ------------------------------------------------------
// NamingSystem
// ------------------------------------------------------

Instance: ns-laboratorio
InstanceOf: NamingSystem
Title: "Número do exame"
Description: "O identificador de exame gerado por laboratório. Observe que este identificador não discrimina qual o laboratório em questão, ou seja, apenas sabe-se que se trata de um identificador gerado por um laboratório. O contexto em questão deve incluir a informação de qual laboratório o código faz parte."
Usage: #definition

* name = "NumeroExame"
* status = #draft
* kind = #identifier
* date = "2024-04-15"
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
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"


Instance: ns-cnes
InstanceOf: NamingSystem
Title: "Identificador do Cadastro Nacional de Estabelecimentos de Saúde (CNES)"
Description: "O identificador da unidade de saúde no Cadastro Nacional de Estabelecimentos de Saúde (CNES)"
Usage: #definition

* name = "CNES"
* status = #draft
* kind = #identifier
* date = "2024-04-15"
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
  * valueCodeableConcept.text = "Identificação de unidades de saúde no território brasileiro"

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Usado quando se deseja indicar que um dado código é único e atribuído a uma unidade de saúde pelo Ministério da Saúde do Brasil."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"

Instance: ns-cns
InstanceOf: NamingSystem
Title: "Identificador do Cartão Nacional de Saúde (CNS)"
Description: "O identificador único de indivíduo ou Cartão Nacional de Saúde (CNS)"
Usage: #definition

* name = "CNS"
* status = #draft
* kind = #identifier
* date = "2024-04-15"
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
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2024-02-09"


Instance: ns-cpf
InstanceOf: NamingSystem
Title: "Identificador de Cadastro de Pessoa Física (CPF)"
Description: "O identificador de números de inscrição no Cadastro de Pessoa Física (CPF)"
Usage: #definition

* name = "CPF"
* status = #draft
* kind = #identifier
* date = "2024-04-15"
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
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"

Instance: loinc
InstanceOf: NamingSystem
Title: "LOINC"
Description: "O identificador único da terminologia LOINC"
Usage: #definition

* name = "LOINC"
* status = #active
* kind = #codesystem
* date = "2024-04-15"
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

* usage = "Este identificador é empregado para definir que um dado código refere-se ao código único gerado pelo SISCAN para requisições de exame citopatológico no Brasil. Naturalmente, o LOINC é internacionalmente conhecido, a presença aqui permite que este identificador faça parte de um catálogo que inclua todas as terminologias e sistemas de identificação empregados."

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
Description: "O identificador único de número de protoloco gerado pelo SISCAN"
Usage: #definition

* name = "SiscanProtocolo"
* status = #draft
* kind = #identifier
* date = "2024-04-15"
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
* uniqueId[0].value = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de catálogo nacional de identificadores. Este valor provavelmente será substituído por sequência produzida pela autoridade competente."
* uniqueId[0].period.start = "2023-11-13"


// ------------------------------------------------------
// resultados-inspecao-colo
// ------------------------------------------------------

CodeSystem: ResultadosInspecaoColo
Id: resultados-inspecao-colo
Title: "Resultado da inspeção do colo"
Description: "As possibilidades da inspeção de colo visando o exame citopatológico."

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Código para resultado da inspeção do colo.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = "**Propósito**. Definido para caracterizar as possibilidades que resultam da inspeção do colo para preencher requisição de exame citopatológico."

* #normal "Normal" "Normal"
* #ausente "Ausente" "Anomalias congênitas ou retirado cirurgicamente"
* #alterado "Alterado" "Alterado"
* #nao-visualizado "Colo não visualizado" "Colo não visualizado"

// ------------------------------------------------------

ValueSet: ResultadoInspecaoColo
Id: resultado-inspecao-colo
Title: "Situação do colo"
Description: "Resultados para a inspeção do colo"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Código admitidos para resultado da inspeção do colo.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/resultado-inspecao-colo"

* ^status = #draft
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = "**Propósito**. Definição do conjunto de valores para resultado da inspeção de colo admitido para o item em questão da requisição de exame citopatológico."

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
* ^date = "2024-04-15"
* ^purpose = "**Propósito**. Identificação única de todos os laudos geridos pelo SISCAN. Desta forma, por um código deste sistema de codificação, sabe-se exatamente o tipo de laudo em questão conforme classificado pelo INCA."

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
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. A identificação do motivo do exame é relevante 
para a implementação do rastreamento ágil."""

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
* ^date = "2024-04-15"
* ^purpose = "**Propósito**. Definição de valores possíveis para o motivo do exame do item pertinente da requisição de exame citopatológico."

* include codes from system MotivosExame

// ------------------------------------------------------
// motivo-especime-rejeitado // #6
// ------------------------------------------------------

CodeSystem: MotivoEspecimeRejeitado
Id: motivo-especime-rejeitado
Title: "Rejeição de espécime"
Description: "Identifica e define os motivos pelos quais um espécime é rejeitado (não processado)."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-especime-rejeitado"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Identificar os possíveis motivos pelos quais uma amostra pode ser rejeitada. Convém destacar que, se a rejeição é por ausência ou erro na identificação da lâmina, frasco ou formulário, então o tipo correspondente é 'entered-in-error'. Este tipo também torna o espécime 'rejeitado'."""

* #lamina "lâmina" "Lâmina danificada ou ausente"
* #outras "Outras causas" "Outras causas"

ValueSet: MotivoEspecimeRejeitado
Id: motivo-especime-rejeitado
Title: "Rejeição de espécime"
Description: "Conjunto de possíveis motivos pelos quais um espécime é rejeitado."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-especime-rejeitado"

* ^status = #draft
* ^experimental = false
* ^purpose = "**Propósito**. Definir as possibilidades para declarar um espécime rejeitado."

* include codes from system MotivoEspecimeRejeitado

// ------------------------------------------------------
// motivo-especime-insatisfatorio // #7
// ------------------------------------------------------

CodeSystem: MotivoEspecimeInsatisfatorio
Id: motivo-especime-insatisfatorio
Title: "Espécime insatisfatório para avaliação"
Description: "Motivos pelos quais o espécime pode ser declarado insatisfatório para avaliação após processado e examinado."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-especime-insatisfatorio"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Identificar e definir motivos pelos quais um espécime pode ser daclarado insatisfatório para avaliação."""

* #material "Material acelular" "Material acelular ou hipocelular: células compõem < 10% da amostra"
* #sangue "Sangue" "Sangue em mais de 75% da amostra"
* #piocitos "Piócitos" "Piócitos em mais de 75% da amostra"
* #dessecamento "Dessecamento" "Artefatos de dessecamento em mais de 75% da amostra"
* #contaminantes "Contaminantes" "Contaminantes externos em mais de 75% da amostra"
* #superposicao "Superposição" "Intensa superposição celular em mais de 75% da amostra"


ValueSet: MotivoEspecimeInsatisfatorio
Id: motivo-especime-insatisfatorio
Title: "Espécime insatisfatório para avaliação"
Description: "Possíveis motivos pelos quais o espécime pode ser declarado insatisfatório para avaliação após processado e examinado."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-especime-insatisfatorio"

* ^status = #draft
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definir o conjunto de códigos possíveis para declarar uma amostra insatisfatória para avaliação."""

* include codes from system MotivoEspecimeInsatisfatorio

// ------------------------------------------------------
// variacoes-nao-neoplasicas
// ------------------------------------------------------

CodeSystem: VariacoesNaoNeoplasicas
Id: variacoes-nao-neoplasicas
Title: "Classificação da alterações celulares"
Description: "Definição das várias alterações celulares benignas relevantes para o exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Códigos para classificação de alterações celulares benigcas</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/variacoes-nao-neoplasicas"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição das possíveis alterações celulares consideradas benignas presentes na amostra de exame citopatológico."""

* #escamosa "Escamosa" "Metaplasia escamosa"
* #ceratotica "Ceratótica" "Alterações ceratóticas"
* #tubaria "Tubária" "Metaplasia tubária"
* #atrofia "Atrofia" "Atrofia"
* #gravidez "Gravidez" "Alterações relacionadas à gravidez"

ValueSet: VariacoesNaoNeoplasicas
Id: variacoes-nao-neoplasicas
Title: "Alteração celular benigna"
Description: "Identifica alteração celular benigna relevante para exame citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Conjunto de valores admitidos para alterações celulares benignas.</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/variacoes-nao-neoplasicas"

* ^status = #draft
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição do conjunto de alterações celulares benignas admitidas para o item correspondente de laudo de exame citopatológico."""

* include codes from system VariacoesNaoNeoplasicas

// ------------------------------------------------------
// alteracoes-reativas // #12
// ------------------------------------------------------

CodeSystem: AlteracoesReativas
Id: alteracoes-reativas
Title: "Alterações celulares reativas"
Description: "Identificação e definição das alterações celulares reativas para o resultado de exame citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/alteracoes-reativas"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição das possíveis alterações celulares reativas."""

* #inflamacao "Inflamação" "Inflamação (inclui reparo típico)"
* #cirvicite "Cervicite" "Cervicite linfocítica/folicular"
* #radiacao "Radiação" "Radiação"
* #diu "DIU" "Dispositivo intrauterino (DIU)"

ValueSet: AlteracoesReativas
Id: alteracoes-reativas
Title: "Alterações celulares reativas"
Description: "Conjunto das possíveis alterações celulares reativas relevantes para o resultado de exame citopatológico."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/alteracoes-reativas"

* ^status = #draft
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição do conjunto de alterações celulares reativas relevantes para o resultado de exame citopatológico."""

* include codes from system AlteracoesReativas

// ------------------------------------------------------
// organismos
// ------------------------------------------------------

CodeSystem: Organismos
Id: organismos
Title: "Organismos"
Description: "Organismos"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/organismos"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição dos microorganismos encontrados na amostra de exame citopatológico."""

* #trichomonas "Trichomonas vaginalis"
* #candida "Candida spp" "Organismos fúngicos morfologicamente consistentes com Candida spp"
* #vaginose "Desvio da flora" "Desvio da flora sugestivo de vaginose bacteriana"
* #actinomyces "Bactérias" "Bactérias morfologicamente consistentes com Actionmyces spp"
* #herpes "Herpes" "Alterações celulares consistentes com vírus herpes simples"
* #citomegalovirus "Citomegalovírus" "Alterações celulares consistentes com citomegalovírus"

ValueSet: Organismos
Id: organismos
Title: "Organismos"
Description: "Organismos"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/organismos"

* ^status = #draft
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição do conjunto de microorganismos encontrados e que podem ser registrados no item do laudo de exame citopatológico."""

* include codes from system Organismos

// ------------------------------------------------------
// escamosas
// ------------------------------------------------------

CodeSystem: Escamosas
Id: escamosas
Title: "Escamosas"
Description: "Escamosas"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/escamosas"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição dos microorganismos encontrados na amostra de exame citopatológico."""

* #asc-us "ASC-US" "Células escamosas atípicas de significado indeterminado (ASC-US)"
* #asc-h "ASC-H" "Células escamosas atípicas, não sendo possível excluir Lesão intraepitelial de alto grau (ASC-H)"
* #lsil "LSIL" "Lesão intraepitelial escamosa de baixo grau (LSIL)"
* #hsil "HSIL" "Lesão intraepitelial escamosa de algo grau (HSIL)"
* #invasao "Invasão" "Lesão intraepitelial escamosa de algo grau (HSIL) com características suspeitas de invasão"
* #carcinoma "Carcinoma" "Carcinoma de células escamosas"

ValueSet: Escamosas
Id: escamosas
Title: "Organismos"
Description: "Organismos"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/escamosas"

* ^status = #draft
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição do conjunto de microorganismos encontrados e que podem ser registrados no item do laudo de exame citopatológico."""

* include codes from system Escamosas

// ------------------------------------------------------
// Glandulares
// ------------------------------------------------------

CodeSystem: Glandulares
Id: glandulares
Title: "Glandulares"
Description: "Glandulares"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/glandulares"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição dos microorganismos encontrados na amostra de exame citopatológico."""

* #endocervicais "Endocervicais" "Células endocervicais atípicas, sem outras especificações (SOE)"
* #endometriais "Endometriais" "Células endometriais atípicas, sem outras especificações (SOE)"
* #glandulares "Glandulares" "Células glandulares atípicas, sem outras especificações (SOE)"
* #endocervicais-neoplasia "Endocervicais" "Células endocervicais atípicas, favorecendo neoplasia"
* #glandulares-neoplasia "Glandulares" "Células glandulares atípicas, favorecendo neoplasia"
* #in-situ "Adenocarcinoma endocervical" "Adenocarcinoma endocervical 'in situ'" 
* #adenocarcinoma-endocervical "Adenocarcinoma endocervical" "Adenocarcinoma endocervical" 
* #adenocarcinoma-endometrial "Adenocarcinoma endometrial" "Adenocarcinoma endometrial" 
* #adenocarcinoma-extrauterino "Adenocarcinoma extrauterino" "Adenocarcinoma extrauterino"
* #adenocarcinoma "Adenocarcinoma" "Adnocarcinoma, sem outras especificações (SOE)" 


ValueSet: Glandulares
Id: glandulares
Title: "Glandulares"
Description: "Glandulares"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/glandulares"

* ^status = #draft
* ^experimental = false
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição do conjunto de microorganismos encontrados e que podem ser registrados no item do laudo de exame citopatológico."""

* include codes from system Glandulares

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
* ^date = "2024-04-15"
* ^purpose = """**Propósito**. Definição das possíveis células atípicas de significado indeterminado relevantes para o laudo de exame citopatológico."""

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
// resultado-item
// ------------------------------------------------------

CodeSystem: ResultadoItem
Id: resultado-item
Title: "Itens de resultado de exame citopatológico"
Description: "Itens que compõem o resultado de exame citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item"

* ^status = #unknown
* ^caseSensitive = true
* ^experimental = false

* #tipo-amostra "Tipo de amostra"
* #motivo-rejeicao "Motivo de rejeição de amostra"
* #insatisfatoria "Amostra processada e examinada, mas insatisfatória para avaliação"
* #satisfatorio "Espécime satisfatório para avaliação"
* #componente "Indica presença ou ausência de componente endocervical"
* #categorizacao "Categorização geral"
* #epitelios-na-amostra "Epitélios representados na amostra"
* #epitelio-escamoso-na-amostra "Epitélio escamoso representado na amostra?"
* #celulas-glandulares "Epitélio glandular representado na amostra?"
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
* #outras-neoplasias-malignas "Outras neoplasias malignas"
* #celulas-endometriais "Presença de células endometriais (na pós-menopausa ou acima de 40 anos, fora do período menstrual)"
* #variacoes-nao-neoplasicas "Variações celulares" "Variações celulares não neoplásicas"
* #alteracoes-reativas "Alterações celulares reativas" "Alterações celulares reativas"

ValueSet: ResultadoItem
Id: resultado-item
Title: "Itens de resultado de exame citopatológico"
Description: "Grupos de informação de resultado de exame citopatológico"
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/resultado-item"
* ^status = #draft
* ^experimental = false
* include codes from system ResultadoItem

// ------------------------------------------------------
// tipo-amostra // #5
// ------------------------------------------------------

CodeSystem: TipoAmostra
Id: tipo-amostra
Title: "Tipos de amostra"
Description: "Tipos de amostra para resultado de exame citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-amostra"
* ^status = #draft
* ^caseSensitive = true
* ^experimental = false
* ^purpose = "Identifica e define os tipos de amostra para exame citopatológico."
* #convencional "convencional" "Convencional"
* #liquido "líquido" "Em meio líquido"

ValueSet: TipoAmostra
Id: tipo-amostra
Title: "Tipos de amostra"
Description: "Tipos de amostra para laudo citopatológico"
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/tipo-amostra"
* ^status = #draft
* ^experimental = false
* ^purpose = "Valores possíveis para o tipo de amostra para exame citopatológico."
* include codes from system TipoAmostra

// ------------------------------------------------------
// componente-endocervical // #9
// ------------------------------------------------------

CodeSystem: ComponenteEndocervical
Id: componente-endocervical
Title: "Componente endocervical"
Description: "Identifica e define presença ou ausência de componente endocervical."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/componente-endocervical"
* ^status = #draft
* ^caseSensitive = true
* ^experimental = false
* ^purpose = "**Propósito**. Identificar se há ou não componente endocervical na amostra avaliada."
* #presente "Presente"
* #ausente "Ausente"


ValueSet: ComponenteEndocervical
Id: componente-endocervical
Title: "Tipos de amostra"
Description: "Tipos de amostra para laudo citopatológico"
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/componente-endocervical"
* ^status = #draft
* ^experimental = false
* ^purpose = "Conjunto de valores possíveis para registrar a presença ou não de componente endocervical na amostra."
* include codes from system ComponenteEndocervical

// ------------------------------------------------------
// categorizacao
// ------------------------------------------------------

CodeSystem: Categorizacao
Id: categorizacao
Title: "Categorização geral"
Description: "Categorização geral do laudo"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/categorizacao"
* ^status = #draft
* ^caseSensitive = true
* ^experimental = false
* #negativo "Negativo para lesão intraepitelial ou malignidade na amostra analisada"
* #anormalidade "Anormalidade em células epiteliais"


ValueSet: Categorizacao
Id: categorizacao
Title: "Categorização geral"
Description: "Categorização geral do laudo"
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/categorizacao"
* ^status = #draft
* ^experimental = false
* include codes from system Categorizacao

// ------------------------------------------------------
// papel
// ------------------------------------------------------

CodeSystem: Papel
Id: papel
Title: "Papel"
Description: "Papel desempenhado pelo profissional no laudo"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/papel"
* ^status = #draft
* ^caseSensitive = true
* ^experimental = false
* #screening "Citotécnico responsável pelo screening"
* #resultado "Profissional responsável pelo resultado do exame"


ValueSet: Papel
Id: papel
Title: "Papel"
Description: "Papel desempenhado pelo profissional no laudo"
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/papel"
* ^status = #draft
* ^experimental = false
* include codes from system Papel


// ------------------------------------------------------
// componentes-endereco
// ------------------------------------------------------

CodeSystem: ComponentesEndereco
Id: componentes-endereco
Title: "Componentes de endereço"
Description: "Componentes que fazem parte de um endereço"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/componentes-endereco"
* ^status = #draft
* ^caseSensitive = true
* ^experimental = false
* #logradouro "logradouro" "Logradouro, rua"
* #numero "número" "Número"
* #complemento "complemento" "Complemento do endereço"
* #bairro "bairro" "Bairro ou setor"
* #referencia "ponto de referência" "Ponto de referência"


ValueSet: ItensEndereco
Id: itens-endereco
Title: "Itens de endereço"
Description: "Tipos de itens de endereço que compõem um endereço"
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/itens-endereco"
* ^status = #draft
* ^experimental = false
* include codes from system ComponentesEndereco

// ------------------------------------------------------
// tipos de documentos do INCA
// ------------------------------------------------------

CodeSystem: TiposDocumentos
Id: tipos-documentos
Title: "Definição de tipos de documentos"
Description: "Identificação de documentos clínicos de interesse do INCA"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos"
* ^status = #draft
* ^caseSensitive = true
* ^experimental = false
* #requisicao-citopatologico "Requisição de exame citopatológico" "Requisição de exame citopatológico"
* #laudo-citopatologico "Laudo de exame citopatológico" "Laudo de exame citopatológico"

ValueSet: TiposDocumentos
Id: tipos-documentos
Title: "Conjunto de tipos de documentos"
Description: "Conjunto dos identificadores de tipos de documentos de interesse do INCA"
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/tipos-documentos"
* ^status = #draft
* ^experimental = false
* include codes from system TiposDocumentos

// ------------------------------------------------------
// Gênero
// ------------------------------------------------------

CodeSystem: Genero
Id: genero
Title: "Identidade de gênero"
Description: """Identidade de gênero se refere à profunda convicção pessoal de ser homem, 
mulher, uma mistura de ambos, ou nenhum dos dois. Essa identidade não necessariamente 
corresponde ao sexo atribuído no nascimento. """

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/genero"
* ^status = #draft
* ^caseSensitive = true
* ^experimental = false
* #149 "Homem transgênero"
* #150 "Mulher transgênero"
* #156 "Travesti"
* #200 "Homem cisgênero"
* #201 "Mulher cisgênero"
* #202 "Transgênero"
* #203 "Não-binário"
* #151 "Outro"


ValueSet: Genero
Id: genero
Title: "Conjunto de gêneros"
Description: "Gêneros admitidos em ficha de requisição"
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/genero"
* ^status = #draft
* ^experimental = false
* https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/genero#149 "Homem transgênero"
* https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/genero#201 "Mulher cisgênero"


// ------------------------------------------------------
// Escolaridade
// ------------------------------------------------------


CodeSystem: Escolaridade
Id: escolaridade
Title: "Escolaridade"
Description: """
Escolaridade se refere ao nível de educação formal alcançado por um indivíduo."""

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/escolaridade"

* ^status = #active
* ^experimental = false
* ^caseSensitive = true

* #1 "Creche" "Destina-se às crianças, geralmente com até três anos de idade, que frequentam estabelecimentos juridicamente regulamenta
dos ou não, destinado a dar assistência diurna às crianças."
* #2 "Pré-escola (exceto CA)" "Destina-se, geralmente, às crianças com quatro ou cinco anos de idade. Pode receber várias denominações 
de acordo com a região e o nível alcançado pelas crianças: maternal, jardim de infância, jardim I etc."
* #3 "Classe Alfabetizada - CA" "Curso destinado à alfabetização de crianças, para os estabelecimentos que ainda não implantaram o Ensi
no Fundamental com duração de nove anos. Equivalente ao 1° ano no sistema com duração de nove anos."
* #4 "Ensino Fundamental 1ª a 4ª séries" "Curso de Ensino Fundamental organizado em oito séries anuais, dividido em duas fases ou ciclo
s, sendo esta a primeira fase (Brasil, 2010). Equivalente ao 2°, 3°, 4° e 5° ano no sistema com duração de nove anos."
* #5 "Ensino Fundamental 5ª a 8ª séries" "Curso de Ensino Fundamental organizado em oito séries anuais, dividido em duas fases ou ciclo
s, sendo esta a segunda fase (Brasil, 2010). Equivalente ao 6°, 7°, 8° e 9° ano no sistema com duração de nove anos."
* #6 "Ensino Fundamental Completo" "Curso de Ensino Fundamental organizado em oito séries anuais, dividido em duas fases ou ciclos."
* #7 "Ensino Fundamental Especial" "Atendimento educacional especializado no Ensino Fundamental regular, voltado a pessoas com necessid
ades especiais originadas de deficiência ou altas habilidades/superdotação."
* #8 "Ensino Fundamental EJA - séries iniciais (Supletivo 1ª a 4ª)" "Nova denominação para o curso supletivo de Ensino Fundamental ou d
e 1º grau, seriado ou não."
* #9 "Ensino Fundamental EJA - séries finais (Supletivo 5ª a 9ª)" "Nova denominação para o curso supletivo de Ensino Fundamental ou de 
1º grau, seriado ou não"
* #10 "Ensino Médio, Médio 2º Ciclo (Científico, Técnico e etc)" "Curso de Ensino Médio organizado em três ou quatro séries anuais ou e
m regime de créditos, períodos letivos, semestres, fases, módulos, ciclos etc."
* #11 "Ensino Médio Especial" "Atendimento educacional especializado no Ensino Médio regular, voltado a pessoas com necessidades especi
ais originadas de deficiência ou altas habilidades/superdotação."
* #12 "Ensino Médio EJA (Supletivo)" "Nova denominação para o curso supletivo de Ensino Médio ou de 2º grau, seriado ou não."
* #13 "Superior, Aperfeiçoamento, Especialização, Mestrado, Doutorado" "Curso regular de graduação universitária, frequentado após o té
rmino do Ensino Médio, que habilita a pessoa a exercer uma profissão, e cursos frequentados após a conclusão do Ensino Superior."
* #14 "Alfabetização para Adultos (Mobral, etc)" "Curso destinado à alfabetização de jovens e adultos."
* #15 "Nenhum" "Quando a pessoa não se enquadrar em nenhuma das descrições anteriores."

ValueSet: Escolaridade
Id: escolaridade
Title: "Escolaridade"
Description: "Escolaridade obtida"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/escolaridade"

* ^status = #draft
* ^experimental = false
* https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/escolaridade#4 "Ensino fundamental incompleto"
* https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/escolaridade#6 "Ensino fundamental completo"
* https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/escolaridade#10 "Ensino médio completo"
* https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/escolaridade#13 "Ensino superior completo"
* https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/escolaridade#15 "Analfabeto" 
