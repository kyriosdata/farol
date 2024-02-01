Alias: $anamnese = http://perfil.org/anamnese-exame-citopatologico
Alias: $exame-clinico = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/exame-clinico
Alias: $loinc = http://loinc.org
Alias: $yesnodontknow = http://hl7.org/fhir/ValueSet/yesnodontknow
Alias: $anamnese-citopatologia = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/anamnese-citopatologia


// ------------------------------------------------------
// exame-clinico
// ------------------------------------------------------

Alias: $vs-inspecao-colo = https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/vs-inspecao-colo

Profile: ExameClinicoParaLaudoCitopatologico
Parent: Observation
Id: exame-clinico
Title: "Exame clínico (parte de requisição)"
Description: "Exame clínico para coleta de informações necessárias para a requisição de exame citopatológico."

* ^url = $exame-clinico

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Exame clínico utilizado em exame citopatológico</div>"
* ^status = #draft

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false   // can be omitted, since false is the default
* component ^slicing.description = "Slice based on the component.code pattern"

* component contains inspecao 1..1 MS and sinais 1..1 MS

* component[inspecao] ^short = "Registra o resultado da inspeção do colo"
* component[inspecao].code = http://loinc.org#12044-4 // Inspeção do colo
* component[inspecao].code ^short = "Código para inspeção do colo"
* component[inspecao].code.coding ^short = "Código definido por uma terminologia"
* component[inspecao].value[x] only CodeableConcept
* component[inspecao].value[x] ^short = "O código correspondente ao resultado da inspeção"
* component[inspecao].valueCodeableConcept from $vs-inspecao-colo (required)
* component[inspecao].valueCodeableConcept.coding 1..1
* component[inspecao].valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"

* component[inspecao] ^short = "Registra presença ou não de sinais de DST"
* component[sinais].code = http://loinc.org#45687-1 // DST
* component[sinais].code ^short = "Código para presença ou não de sinais de DST"
* component[sinais].value[x] ^short = "true se há sinal de DST ou false, caso contrário"
* component[sinais].value[x] only boolean


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


Alias: $BRTipoLogradouro-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRTipoLogradouro-1.0
Alias: $BRMunicipio-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRMunicipio-1.0
Alias: $BRUnidadeFederativa-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRUnidadeFederativa-1.0
Alias: $BRMeioContato = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRMeioContato-1.0

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
* useContext.code[0].system = "http://terminology.hl7.org/ValueSet/v3-ActEncounterCode"
* useContext.code[0].code = #AMB
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

