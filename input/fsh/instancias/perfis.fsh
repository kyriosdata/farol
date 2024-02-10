Alias: $anamnese = http://perfil.org/anamnese-exame-citopatologico
Alias: $BRTipoLogradouro-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRTipoLogradouro-1.0
Alias: $BRMunicipio-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRMunicipio-1.0
Alias: $BRUnidadeFederativa-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRUnidadeFederativa-1.0
Alias: $BRMeioContato = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRMeioContato-1.0
Alias: $laudo-tipo-item = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item
Alias: $loinc = http://loinc.org
Alias: $vs-inspecao-colo = https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/vs-inspecao-colo
Alias: $yesnodontknow = http://hl7.org/fhir/ValueSet/yesnodontknow

// ------------------------------------------------------
// requisicao-exame-citopatologico
// ------------------------------------------------------

Profile: RequisicaoExame
Parent: ServiceRequest
Id: requisicao-exame-citopatologico
Title: "Requisicao Exame"
Description: "Requisição de exame citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/requisicao-exame-citopatologico"
* ^status = #draft
* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Detalha referência para anamnese e exame clínico.</div>"

* reasonCode 1..1
* reasonCode.coding 1..1
* reasonCode from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-exame-citopatologico (required)
* supportingInfo ^short = "O laudo de exame citopatológico depende de dois grupos principais de informações: dados da anamnese e de exame clínico."
* supportingInfo only Reference(Observation or QuestionnaireResponse)
* supportingInfo 3..3

// ------------------------------------------------------
// endereco
// ------------------------------------------------------

Invariant: ConteudoSuporte
Description: "Possui apenas instâncias predefinidas"
Expression: "select($this.code.coding[0].code in ('60432-2')).allTrue()"
Severity: #error

Invariant: LinhasEndereco
Description: "Endereço não pode ser vazio"
Expression: "line.select($this.length() > 0).allTrue()"
Severity: #error


Profile: Endereco
Parent: Address
Id: endereco
Title: "Endereço"
Description: "Padronização de endereços no Brasil (adaptação de BREndereco)."
* ^status = #active
* ^meta.lastUpdated = "2020-03-11T04:06:40.866+00:00"
* ^text.status = #empty
* ^text.div = "<div xml:lang='pt-BR' lang='pt-BR' xmlns='http://www.w3.org/1999/xhtml'>Adaptação de BREndereco (que provoca erros em validação)</div>"
* ^language = #pt-BR
// * ^url = "http://perfil.org/endereco"
* ^version = "1.0"
* ^publisher = "Ministério da Saúde do Brasil"
* . MS
* . ^short = "Dados de Endereçamento"
* . ^definition = "Dados do(s) endereço(s) onde o sujeito do endereço pode ser localizado."
* use MS
* use ^short = "Uso do Endereço"
* use ^definition = "home: endereço residencial atual.\r\nwork: endereço comercial ou de trabalho atual.\r\ntemp: endereço temporário, como um hotel, a casa de amigos ou familiares, uma instalação/edificação provisória, etc.\r\nold: endereço anterior."
* type MS
* type ^short = "Tipo de Endereço"
* type ^definition = "physical: um endereço físico de um edificação ou espaço geográfico real, como de uma casa, prédio, loja, galpão, lote, etc.\r\npostal: um endereço virtual, como de uma Caixa Postal ou serviço de logística de mercadorias, p.ex."
* text ..0

* line 1.. MS
* obeys LinhasEndereco

* city 1..
* city from $BRMunicipio-1.0 (required)
* city ^short = "Município"
* city ^definition = "Município do endereço."
* city ^binding.description = "Municípios brasileiros"
* district ..0
* state 0.. MS
* state from $BRUnidadeFederativa-1.0 (required)
* state ^short = "UF"
* state ^definition = "Unidade Federativa (estados ou Distrito Federal) do endereço."
* state ^binding.description = "Estados brasileiros"
* postalCode 1.. MS
* postalCode ^short = "CEP"
* postalCode ^definition = "Código de Endereçamento Postal. Utilizar a máscara XXXXX-XXXX."
* country ..0
* period MS
* period ^short = "Período do Endereço"
* period ^definition = "Período em que o endereço foi utilizado."
* period.start MS
* period.start ^short = "Data de Inicio do Endereço"
* period.start ^definition = "Data em que o endereço foi cadastrado ou começou a ser utilizado."
* period.end MS
* period.end ^short = "Data de Término do Endereço"
* period.end ^definition = "Data em que o endereço foi desativado ou parou de ser utilizado."

// ------------------------------------------------------
// paciente-siscan
// ------------------------------------------------------

Profile: Paciente
Parent: Patient
Id: paciente-siscan
Title: "Paciente"
Description: "Dados demográficos de paciente para Exame Citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente-siscan"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Perfil de paciente alinhado com a definição de BRIndividuo (perfil) definido pelo Ministério da Saúde (Brasil).</div>"

* ^status = #draft

* address only Endereco

// Conversor de FSH para JSON nao aceita referencia abaixo.
// * telecom only $BRMeioContato

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: anamnese-exame-citopatologico
InstanceOf: Questionnaire
Usage: #example
Title: "Anamnese (exame citopatológico)"
Description: "Questões pertinentes à anamnese do exame citopatológico"

* url = "https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico"

* version = "0.0.1"
* name = "AnamneseExameCitopatologico"
* title = "Questionário (dados de Anamnese) da ficha de requisição do exame citopatológico"
* status = #draft
* experimental = false
* subjectType = #Patient
* date = "2024-01-20"
* publisher = "Ministério da Saúde (INCA)"
* contact[0].name = "Renata (INCA)"
* contact[0].telecom[0].system = #email
* contact[0].telecom[0].value = "renata.email@inca.saude.br"
* contact[0].telecom[0].use = #work
* contact[0].telecom[0].period.start = "2024"
* description = "Questões contidas na ficha de requisição de exame citopatológico."
* useContext.code[0].system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code[0].code = #gender
* useContext.valueCodeableConcept.text = "Estabelecimento de saúde. Unidade básica de saúde."
* jurisdiction = urn:iso:std:iso:3166#BR
* purpose = "Estas questões orientam a coleta de dados relevantes para a elaboração do laudo citopatológico. Convém ressaltar que os dados pertinentes a este questionário não são suficientes. Também há informações necessárias coletadas por meio de exame clínico."
* copyright = "Ministério da Saúde do Brasil"
* approvalDate = "2023-12-15"
* lastReviewDate = "2023-11-30"
* effectivePeriod.start = "2024-01-01"

// Como caracterizar o formulário? Código local (nacional)?
* code[0]
  * code = #74468-0
  * system = "http://loinc.org"
  * display = "Questionnaire form definition Document"

* item[0]
  * linkId = "1"
  * type = #choice
  * text = "Fez o exame preventivo (Papanicolaou) alguma vez?"
  * answerValueSet = Canonical(http://hl7.org/fhir/ValueSet/yesnodontknow)
  * required = true
  * repeats = false

* item[1]
  * linkId = "2"
  * type = #date
  * text = "Quando fez o último exame?"
  * code[0] = http://loinc.org#60432-2
  * enableWhen[0]
    * question = "1"
    * operator = #=
    * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * required = true
  * repeats = false

* item[2]
  * linkId = "3"
  * type = #choice
  * text = "Usa DIU?"
  * code[0] = http://www.saude.gov.br/fhir/r4/CodeSystem/BRCIAP2#W12 // Contracepção intra-uterina
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[3]
  * linkId = "4"
  * type = #choice
  * code[0] = http://loinc.org#66174-4
  * text = "Está grávida?"
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[4]
  * linkId = "5"
  * type = #choice
  * text = "Usa pílula anticoncepcional?"
  * code[0] = http://loinc.org#65931-8
  * code[1] = http://www.saude.gov.br/fhir/r4/CodeSystem/BRCIAP2#W11 // Contracepção oral (CIAP-2)
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[5]
  * linkId = "6"
  * type = #choice
  * text = "Usa hormônio/remédio para tratar a menopausa?"
  * code[0] = http://loinc.org#63873-4
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[6]
  * linkId = "7"
  * type = #choice
  * text = "Já fez tratamento por radioterapia?"
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[7]
  * linkId = "8"
  * type = #date
  * text = "Data da última menstruação/regra"
  * code[0] = http://loinc.org#8665-2
  * required = true
  * repeats = false
  * readOnly = true

* item[8]
  * linkId = "9"
  * type = #choice
  * text = "Tem ou teve algum sangramento após relações sexuais? (não considerar a primeira relação sexual na vida)"
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[9]
  * linkId = "10"
  * type = #choice
  * text = "Tem ou teve algum sangramento após a menopausa? (não considerar o(s) sangramento(s) na vigência de reposição hormonal)"
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[10]
  * linkId = "11"
  * type = #integer
  * text = "Qual a sua idade?"
  * required = true
  * repeats = false
  * readOnly = true
  * maxLength = 3

// ------------------------------------------------------
// laudo-exame
// ------------------------------------------------------

Alias: $loinc = http://loinc.org
Alias: $cholesterol = http://hl7.org/fhir/StructureDefinition/cholesterol
Alias: $triglyceride = http://hl7.org/fhir/StructureDefinition/triglyceride
Alias: $hdlcholesterol = http://hl7.org/fhir/StructureDefinition/hdlcholesterol
Alias: $ldlcholesterol = http://hl7.org/fhir/StructureDefinition/ldlcholesterol

Profile: LaudoCitopatologico
Parent: DiagnosticReport
Id: laudo-citopatologico
Title: "Resultado (laudo) de exame citopatológico"
Description: "Definição de resultado (laudo) de exame citopatológico em conformidade com padrão adotado pelo INCA."
* ^meta.lastUpdated = "2015-02-07T13:28:17.239+02:00"
* ^version = "1.0.0"
* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/laudo-citopatologico"

* meta 1..
* meta ^short = "Metadados do laudo"
* meta.extension ..0
* meta.lastUpdated ^short = "Quando o recurso foi atualizado pela última vez"
* meta.profile ^short = "Perfil obrigatoriamente a ser atendido"
* contained ..0

* basedOn 1..1

* identifier ..1
* identifier ^label = "O rótulo (label)"
* identifier ^short = "O identificador único atribuído pelo solicitante ao requerimento de exame citopatológico."
* identifier ^definition = "O identificador único da requisição para o solicitante."
* identifier ^comment = "Não há nenhum formato esperado para este identificador senão uma sequência de caracteres."
* identifier ^requirements = "Este identificador é necessário para facilitar a identificação do requerimento no contexto em que é gerado."
* identifier ^alias[0] = "protocolo"
* identifier ^alias[+] = "número"
* identifier.id ..0
* identifier.extension ..0
* identifier.use ..0
* identifier.value 1..1
* identifier.value ^short = "O identificador único atribuído à requisição pelo solicitante usando o seu sistema de origem."
* identifier.period ..0
* identifier.assigner ..0

* status ^label = "O status do laudo."
* status ^short = "Identifica status do laudo."
* status ^definition = "O status do laudo."
* status ^comment = "O status é fixo, final, e só é alterado para indicar que foi substituído, provavelmente por entrada fornecida de forma equivocada, contendo erros ou omissões, por exemplo."

* category ^label = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category ^short = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category ^definition = "Código que classifica a requisição com a finalidade de busca, ordenação e exibição."
* category ^comment = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category.coding 1..1
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP (exactly)
* category.coding.display ..0
* encounter ..0

* result 1..1
* result only Reference(componentes-laudo-citopatologico)


// ------------------------------------------------------
// componentes-laudo-citopatologico
// ------------------------------------------------------

Profile: ComponentesLaudoCitopatologico
Parent: Observation
Id: componentes-laudo-citopatologico
Title: "Itens de resultado do laudo citopatológico"
Description: "Componentes do resultado do laudo citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/componentes-laudo-citopatologico"
* ^status = #draft
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan#citopatologico (exactly)

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed
* component ^slicing.description = "Identificação dos componentes do laudo"

* component contains 
    motivo 0..1 MS and 
    epitelios 0..1 MS and
    adequabilidade 0..1 MS and
    normalidade 1..1 MS and
    benigno 1..1 MS and
    microbiologia 0..1 MS and
    atipicas 0..1 MS and
    escamosas 0..1 MS and 
    glandulares 0..1 MS and
    outrasMalignas 0..1 MS and
    endometriais 0..1 MS

* component[motivo] ^short = "Registra o motivo da rejeição da amostra"
* component[motivo].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#motivo-rejeicao (exactly)
* component[motivo].code ^short = "Código para motivo da rejeição da amostra"
* component[motivo].code.coding ^short = "Código definido por uma terminologia"
* component[motivo].value[x] only CodeableConcept
* component[motivo].value[x] ^short = "O código que identifica o motivo da rejeição da amostra"
* component[motivo].valueCodeableConcept from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-rejeicao (required)
* component[motivo].valueCodeableConcept.coding 1..1
* component[motivo].valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"

* component[epitelios] ^short = "Epitélios representados na amostra"
* component[epitelios].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#epitelios-na-amostra (exactly)
* component[epitelios].code ^short = "Código que identifica tipos epitélios na amostra"
* component[epitelios].code.coding ^short = "Código definido por uma terminologia"
* component[epitelios].value[x] 1..1
* component[epitelios].value[x] only CodeableConcept
* component[epitelios].valueCodeableConcept.coding 1..1
* component[epitelios].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[epitelios].valueCodeableConcept.coding.system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-epitelios"
* component[epitelios].valueCodeableConcept.coding.code 1..1

* component[adequabilidade] ^short = "Adequabilidade do material"
* component[adequabilidade].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#adequabilidade (exactly)
* component[adequabilidade].code ^short = "Informa sobre a adequabilidade do material"
* component[adequabilidade].code.coding ^short = "Código definido por uma terminologia"
* component[adequabilidade].value[x] 1..1
* component[adequabilidade].value[x] only CodeableConcept
* component[adequabilidade].valueCodeableConcept.coding 1..1
* component[adequabilidade].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[adequabilidade].valueCodeableConcept.coding.system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-adequabilidade"

* component[normalidade] ^short = "Dentro dos limites da normalidade no material"
* component[normalidade].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#normalidade (exactly)
* component[normalidade].code ^short = "Informa sobre a normalidade do material"
* component[normalidade].code.coding ^short = "Código definido por uma terminologia"
* component[normalidade].value[x] 1..1
* component[normalidade].value[x] only boolean

* component[benigno] ^short = "Alterações celulares benignas reativas ou reparativas"
* component[benigno].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#alteracoes-benignas (exactly)
* component[benigno].code ^short = "Informa sobre a benigno do material"
* component[benigno].code.coding ^short = "Código definido por uma terminologia"
* component[benigno].value[x] 1..1
* component[benigno].value[x] only CodeableConcept
* component[benigno].valueCodeableConcept.coding 1..1
* component[benigno].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[benigno].valueCodeableConcept.coding.system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/alteracoes-celulares-benignas"
* component[benigno].valueCodeableConcept.coding.code 1..1

* component[microbiologia] ^short = "Microbiologia"
* component[microbiologia].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#microbiologia (exactly)
* component[microbiologia].code ^short = "Microbiologia"
* component[microbiologia].code.coding ^short = "Código definido por uma terminologia"
* component[microbiologia].value[x] 1..1
* component[microbiologia].value[x] only CodeableConcept
* component[microbiologia].valueCodeableConcept.coding 1..1
* component[microbiologia].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[microbiologia].valueCodeableConcept.coding.system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/microbiologias"
* component[microbiologia].valueCodeableConcept.coding.code 1..1

* component[atipicas] ^short = "Células atípicas de significado indeterminado"
* component[atipicas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#significado-indeterminado (exactly)
* component[atipicas].code ^short = "Células atípicas"
* component[atipicas].code.coding ^short = "Código definido por uma terminologia"
* component[atipicas].value[x] 1..1
* component[atipicas].value[x] only CodeableConcept
* component[atipicas].valueCodeableConcept.coding 1..1
* component[atipicas].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[atipicas].valueCodeableConcept.coding.system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/celulas-atipicas"
* component[atipicas].valueCodeableConcept.coding.code 1..1
* component[atipicas].valueCodeableConcept.text 0..0

* component[escamosas] ^short = "Atipias em células escamosas"
* component[escamosas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#atipias-escamosas (exactly)
* component[escamosas].code ^short = "Atipias em células escamosas"
* component[escamosas].code.coding ^short = "Código definido por uma terminologia"
* component[escamosas].value[x] 1..1
* component[escamosas].value[x] only CodeableConcept
* component[escamosas].valueCodeableConcept.coding 1..1
* component[escamosas].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[escamosas].valueCodeableConcept.coding.system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/atipias-escamosas"
* component[escamosas].valueCodeableConcept.coding.code 1..1
* component[escamosas].valueCodeableConcept.text 0..0

* component[glandulares] ^short = "Atipias em células glandulares"
* component[glandulares].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#atipias-glandulares (exactly)
* component[glandulares].code ^short = "Atipias em células escamosas"
* component[glandulares].code.coding ^short = "Código definido por uma terminologia"
* component[glandulares].value[x] 1..1
* component[glandulares].value[x] only CodeableConcept
* component[glandulares].valueCodeableConcept.coding 1..1
* component[glandulares].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[glandulares].valueCodeableConcept.coding.system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/atipias-glandulares"
* component[glandulares].valueCodeableConcept.coding.code 1..1
* component[glandulares].valueCodeableConcept.text 0..0

* component[outrasMalignas] ^short = "Outras neoplasias malignas"
* component[outrasMalignas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#neoplasias-malignas (exactly)
* component[outrasMalignas].code ^short = "Informa sobre a normalidade do material"
* component[outrasMalignas].code.coding ^short = "Código definido por uma terminologia"
* component[outrasMalignas].value[x] 1..1
* component[outrasMalignas].value[x] only string

* component[endometriais] ^short = "Células endometriais"
* component[endometriais].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#celulas-endometriais (exactly)
* component[endometriais].code ^short = "Informa sobre a normalidade do material"
* component[endometriais].code.coding ^short = "Código definido por uma terminologia"
* component[endometriais].value[x] 1..1
* component[endometriais].value[x] only boolean
* component[endometriais].valueBoolean = true

* note ^short = "Observaçõe gerais"
* note.author[x] 0..0
* note.time 0..0

