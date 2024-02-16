Alias: $anamnese = http://perfil.org/anamnese-exame-citopatologico
Alias: $BRTipoLogradouro-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRTipoLogradouro-1.0
Alias: $BRMunicipio-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRMunicipio-1.0
Alias: $BRUnidadeFederativa-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRUnidadeFederativa-1.0
Alias: $BRMeioContato = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRMeioContato-1.0
Alias: $laudo-tipo-item = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item
Alias: $loinc = http://loinc.org
Alias: $yesnodontknow = http://hl7.org/fhir/ValueSet/yesnodontknow
Alias: $niveis-educacionais = https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/niveis-educacionais
Alias: $cholesterol = http://hl7.org/fhir/StructureDefinition/cholesterol
Alias: $triglyceride = http://hl7.org/fhir/StructureDefinition/triglyceride
Alias: $hdlcholesterol = http://hl7.org/fhir/StructureDefinition/hdlcholesterol
Alias: $ldlcholesterol = http://hl7.org/fhir/StructureDefinition/ldlcholesterol
Alias: $resultado-inspecao-colo = https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/resultado-inspecao-colo


Extension: Etnia
Id:   etnia
Title:  "Etnia"
Description: """
Similar ao perfil BRRacaCorEtnia (atualmente, 11/02/2924, incompleto).
"""

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Extensão para registro do nível educacional</div>"

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/etnia"

* ^context[0].type = #element
* ^context[0].expression = "Patient"

* extension contains
    race 0..1 MS and
    indigenousEthnicity 0..1 MS

* extension[race].value[x] only Coding
* extension[race].valueCoding 1..1
* extension[race].valueCoding from http://www.saude.gov.br/fhir/r4/ValueSet/BRRacaCor-1.0 (required)

* extension[indigenousEthnicity].value[x] only Coding
* extension[indigenousEthnicity].valueCoding 1..1
* extension[indigenousEthnicity].valueCoding from http://www.saude.gov.br/fhir/r4/ValueSet/BREtniaIndigena-1.0 (required)

Extension: NivelEducacional
Id:   nivel-educacional
Title:  "Nível educacional"
Description: """
Identificação do maior nível educacional obtido pelo paciente.
"""

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Extensão para registro do nível educacional</div>"

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/nivel-educacional"

* ^context[0].type = #element
* ^context[0].expression = "Patient"

* value[x] only code
* valueCode from $niveis-educacionais (required)


// ------------------------------------------------------
// idade
// ------------------------------------------------------

Extension: Idade
Id: idade
Title: "Idade estimada do paciente"
Description: "Idade fornecida no momento da requisição de exame citopatológico. Mantida apenas por conformidade com formulário impresso. A expectativa natural é que esta data seja calculada, por comodidade do usuário que a consulta, a partir da data de nascimento, em vez de ser informada."
Context: Patient

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade"

* value[x] only Age

// ------------------------------------------------------
// requisicao-exame-citopatologico
// ------------------------------------------------------

Profile: RequisicaoExameCitopatologico
Parent: ServiceRequest
Id: requisicao-exame-citopatologico
Title: "Requisicao de exame citopatológico"
Description: "Definição das informações que devem constar em toda e qualquer requisição de exame citopatológico conforme orientações do INCA (MS)."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/requisicao-exame-citopatologico"
* ^status = #draft

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Evita warning</div>"

* code.coding 1..1
* code.coding = http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS#0203010086
//* display = "EXAME CITOPATOLÓGICO CERVICO VAGINAL/MICROFLORA-RASTREAMENTO"

* . ^short = "Requisição de exame citopatológico"
* reasonCode 1..1
* reasonCode ^short = "Contexto no qual a requisição é criada"
* reasonCode.coding 1..1
* reasonCode.coding ^short = "Código que identifica o motivo do exame"
* reasonCode from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-exame-citopatologico (required)

* authoredOn 1..1

* supportingInfo ^short = "O laudo de exame citopatológico depende de dois grupos principais de informações: dados da anamnese e de exame clínico."
* supportingInfo only Reference(inspecao-colo or presenca-dst or AnamneseQuestionario)
* supportingInfo 3..3


Profile: AnamneseQuestionario
Parent: QuestionnaireResponse
Id: anamnese-questionario
Title: "Informações sobre a anamnese"
Description: "Estrutura exigida da anamnese pela requisição de exame citopatológico"

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/anamnese-questionario"

* questionnaire = "https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico"
* status = #completed
* subject 0..0
* author 0..0
* basedOn 0..0
* partOf 0..0
* encounter 0..0
* authored 0..0

// ------------------------------------------------------
// exame-clinico
// ------------------------------------------------------

Profile: InspecaoColo
Parent: Observation
Id: inspecao-colo
Title: "Inspeção do colo"
Description: "Resultado da inspeção do colo"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/inspecao-colo"

* ^status = #draft

* . ^short = "Registra resultado obtido da inspeção do colo"

* code.coding 1..1
* code = http://loinc.org#12044-4
* code ^short = "Código para inspeção do colo"

* value[x] 1..1
* value[x] only CodeableConcept
* value[x] ^short = "O código correspondente ao resultado da inspeção"
* valueCodeableConcept from $resultado-inspecao-colo (required)
* valueCodeableConcept.coding 1..1
* valueCodeableConcept.coding ^short = "Código que caracteriza o resultado da inspeção do colo"


Profile: PresencaDST
Parent: Observation
Id: presenca-dst
Title: "Presença de DST"
Description: "Exame clínico para identificar presença ou não de DST"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/presenca-dst"

* ^status = #draft

* . ^short = "Registra detecção de DST ao realizar inspeção de colo"
* code = http://loinc.org#45687-1
* code ^short = "Código para presença ou não de sinais de DST"
* code.coding ^short = "Código LOINC para DST"
* code.coding.code ^short = "Sexually transmitted diseases"
* value[x] 1..1
* value[x] ^short = "true se há sinal de DST ou false, caso contrário"
* value[x] only boolean

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
// paciente
// ------------------------------------------------------

Profile: Paciente
Parent: Patient
Id: paciente
Title: "Paciente"
Description: "Dados demográficos de paciente"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Perfil de paciente alinhado com a definição de BRIndividuo (perfil) definido pelo Ministério da Saúde (Brasil).</div>"

* extension contains 
    http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName named mae 1..1 MS and
    http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade named pais 0..1 MS and
    https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade named idade 0..1 MS and
    https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/nivel-educacional named educacao 0..1 MS and
    https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/etnia named etnia 0..1 MS
   
* ^status = #draft

* address only Endereco

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: anamnese-exame-citopatologico
InstanceOf: Questionnaire
Usage: #definition
Title: "Questões da anamnese"
Description: "Definição das questões que fazem parte da anamnese para requisição de exame citopatológico"

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
* purpose = "A execução do exame citopatológico depende das respostas para as várias questões definidas neste questionário, todas elas em conformidade com a tradicional ficha de requisição de exame citopatológico empregada em todo o território nacional."
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
  * required = false
  * repeats = false

* item[2]
  * linkId = "3"
  * type = #choice
  * text = "Usa DIU?"
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

Profile: DiagnosticoCitopatologico
Parent: DiagnosticReport
Id: diagnostico-citopatologico
Title: "Diagnóstico citopatológico"
Description: "Diagnóstico de exame citopatológico em conformidade com padrão adotado pelo INCA."
* ^meta.lastUpdated = "2015-02-07T13:28:17.239+02:00"
* ^version = "1.0.0"
* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/diagnostico-citopatologico"

* meta 1..
* meta ^short = "Metadados do laudo"
* meta.extension ..0
* meta.lastUpdated ^short = "Quando o recurso foi atualizado pela última vez"
* meta.profile 1..1
* meta.profile ^short = "Perfil obrigatoriamente a ser atendido"
* meta.profile = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/diagnostico-citopatologico"
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
* identifier.system 1..1
* identifier.system ^short = "O identificador do sistema de identificação"
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
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP
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
Title: "Composição do laudo citopatológico"
Description: "Observação cujos componentes definem o resultado de laudo citopatológico"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Componentes de laudo citopatológico</div>"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/componentes-laudo-citopatologico"
* ^status = #draft
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan#citopatologico

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed
* component ^slicing.description = "Identificação dos componentes do laudo"

* component contains 
    motivo 0..1 MS and 
    epitelios 0..1 MS and
    adequabilidade 1..1 MS and
    normalidade 1..1 MS and
    benigno 0..1 MS and
    microbiologia 0..1 MS and
    atipicas 0..1 MS and
    escamosas 0..1 MS and 
    glandulares 0..1 MS and
    outrasMalignas 0..1 MS and
    endometriais 0..1 MS

* component[motivo] ^short = "Registra o motivo da rejeição da amostra"
* component[motivo].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#motivo-rejeicao
* component[motivo].code ^short = "Identifica a informação fornecida: motivo da rejeição da amostra"
* component[motivo].code.coding ^short = "Código definido por uma terminologia"
* component[motivo].value[x] 1..1
* component[motivo].value[x] only CodeableConcept
* component[motivo].value[x] ^short = "O código que identifica o motivo da rejeição da amostra"
* component[motivo].valueCodeableConcept.coding 1..1
* component[motivo].valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"
* component[motivo].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-rejeicao (required)
* component[motivo].valueCodeableConcept.coding.code 1..1
* component[motivo].valueCodeableConcept.coding.code ^short = "Código correspondente ao motivo da rejeição da amostra"

* component[epitelios] ^short = "Registra epitélios representados na amostra"
* component[epitelios].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#epitelios-na-amostra 
* component[epitelios].code ^short = "Identifica a informação fornecida: tipos epitélios na amostra"
* component[epitelios].code.coding ^short = "Código definido por uma terminologia"
* component[epitelios].value[x] 1..1
* component[epitelios].value[x] only CodeableConcept
* component[epitelios].valueCodeableConcept.coding 1..1
* component[epitelios].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[epitelios].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/tipo-epitelio (required)
* component[epitelios].valueCodeableConcept.coding.code 1..1
* component[epitelios].valueCodeableConcept.coding.code ^short = "Código correspondente ao tipo de epitélio representado na amostra"

* component[adequabilidade] ^short = "Adequabilidade do material"
* component[adequabilidade].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#adequabilidade 
* component[adequabilidade].code ^short = "Identifica a informação fornecida: adequabilidade do material"
* component[adequabilidade].code.coding ^short = "Código definido por uma terminologia"
* component[adequabilidade].value[x] 1..1
* component[adequabilidade].value[x] only CodeableConcept
* component[adequabilidade].valueCodeableConcept.coding 1..1
* component[adequabilidade].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[adequabilidade].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/tipo-adequabilidade (required)
* component[adequabilidade].valueCodeableConcept.coding.code 1..1
* component[adequabilidade].valueCodeableConcept.coding.code ^short = "Código correspondente à adequabilidade da amostra"

* component[normalidade] ^short = "Dentro dos limites da normalidade no material"
* component[normalidade].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#normalidade 
* component[normalidade].code ^short = "Identifica a informação fornecida: normalidade do material"
* component[normalidade].code.coding ^short = "Código definido por uma terminologia"
* component[normalidade].value[x] 1..1
* component[normalidade].value[x] only boolean

* component[benigno] ^short = "Alterações celulares benignas reativas ou reparativas"
* component[benigno].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#alteracoes-benignas 
* component[benigno].code ^short = "Identifica a informação fornecida: alterações benignas do material"
* component[benigno].code.coding ^short = "Código definido por uma terminologia"
* component[benigno].value[x] 1..1
* component[benigno].value[x] only CodeableConcept
* component[benigno].valueCodeableConcept.coding 1..1
* component[benigno].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[benigno].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/alteracao-celular-benigna (required)
* component[benigno].valueCodeableConcept.coding.code 1..1
* component[benigno].valueCodeableConcept.coding.code ^short = "Código correspondente ao tipo de alteração celular benigna"

* component[microbiologia] ^short = "Microbiologia"
* component[microbiologia].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#microbiologia 
* component[microbiologia].code ^short = "Identifica a informação fornecida: microbiologia"
* component[microbiologia].code.coding ^short = "Código definido por uma terminologia"
* component[microbiologia].value[x] 1..1
* component[microbiologia].value[x] only CodeableConcept
* component[microbiologia].valueCodeableConcept.coding 1..1
* component[microbiologia].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[microbiologia].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/microbiologia (required)
* component[microbiologia].valueCodeableConcept.coding.code 1..1
* component[microbiologia].valueCodeableConcept.coding.code ^short = "Código correspondente para a microbiologia"

* component[atipicas] ^short = "Células atípicas de significado indeterminado"
* component[atipicas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#significado-indeterminado 
* component[atipicas].code ^short = "Identifica a informação fornecida: células atípicas"
* component[atipicas].code.coding ^short = "Código definido por uma terminologia"
* component[atipicas].value[x] 1..1
* component[atipicas].value[x] only CodeableConcept
* component[atipicas].valueCodeableConcept.coding 1..1
* component[atipicas].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[atipicas].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/celula-atipica (required)
* component[atipicas].valueCodeableConcept.coding.code 1..1
* component[atipicas].valueCodeableConcept.coding.code ^short = "Código correspondente para tipo de célula atípica de significado indeterminado."
* component[atipicas].valueCodeableConcept.text 0..0

* component[escamosas] ^short = "Atipias em células escamosas"
* component[escamosas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#atipias-escamosas 
* component[escamosas].code ^short = "Identifica a informação fornecida: atipias em células escamosas"
* component[escamosas].code.coding ^short = "Código definido por uma terminologia"
* component[escamosas].value[x] 1..1
* component[escamosas].value[x] only CodeableConcept
* component[escamosas].valueCodeableConcept.coding 1..1
* component[escamosas].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[escamosas].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/atipia-escamosa (required)
* component[escamosas].valueCodeableConcept.coding.code 1..1
* component[escamosas].valueCodeableConcept.coding.code ^short = "Código correspondente para a atipia celular escamosa"
* component[escamosas].valueCodeableConcept.text 0..0

* component[glandulares] ^short = "Atipias em células glandulares"
* component[glandulares].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#atipias-glandulares 
* component[glandulares].code ^short = "Identifica a informação fornecida: atipias em células escamosas"
* component[glandulares].code.coding ^short = "Código definido por uma terminologia"
* component[glandulares].value[x] 1..1
* component[glandulares].value[x] only CodeableConcept
* component[glandulares].valueCodeableConcept.coding 1..1
* component[glandulares].valueCodeableConcept ^short = "O conjunto de códigos que identifica tipo de epitélio na amostra"
* component[glandulares].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/atipia-glandular (required)
* component[glandulares].valueCodeableConcept.coding.code 1..1
* component[glandulares].valueCodeableConcept.coding.code ^short = "Código correspondente ao tipo de atipia celular glandular"
* component[glandulares].valueCodeableConcept.text 0..0

* component[outrasMalignas] ^short = "Outras neoplasias malignas"
* component[outrasMalignas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#neoplasias-malignas 
* component[outrasMalignas].code ^short = "Identifica a informação fornecida: outras neoplasias malignas"
* component[outrasMalignas].code.coding ^short = "Código definido por uma terminologia"
* component[outrasMalignas].value[x] 1..1
* component[outrasMalignas].value[x] only string

* component[endometriais] ^short = "Células endometriais"
* component[endometriais].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#celulas-endometriais 
* component[endometriais].code ^short = "Identifica a informação fornecida: células endometriais"
* component[endometriais].code.coding ^short = "Código definido por uma terminologia"
* component[endometriais].value[x] 1..1
* component[endometriais].value[x] only boolean
* component[endometriais].valueBoolean ^short = "Se true, indica presença de células endometriais e false, caso contrário"

* note ^short = "Observaçõe gerais"
* note.author[x] 0..0
* note.time 0..0

