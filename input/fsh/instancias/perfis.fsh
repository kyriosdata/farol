Alias: $anamnese = http://perfil.org/anamnese-exame-citopatologico
Alias: $exame-clinico = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/exame-clinico
Alias: $loinc = http://loinc.org
Alias: $yesnodontknow = http://hl7.org/fhir/ValueSet/yesnodontknow

// ------------------------------------------------------
// questoes
// ------------------------------------------------------

Profile: QuestoesAnamnese
Parent: Questionnaire
Id: questoes
Title: "Questões para anmnese do exame citopatológico"
Description: "Descrição"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/questoes"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Extensão para idade estimada de paciente</div>"
* ^status = #draft

* version = "0.0.1"

* item ^slicing.discriminator.type = #pattern
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #open
* item ^slicing.ordered = false 
* item ^slicing.description = "item.linkId"

* item contains fezExame 1..1 MS 

* item[fezExame].linkId = "1" (exactly)
* item[fezExame].linkId ^short = "O número da questão"
* item[fezExame].text = "Fez exame preventivo (Papanicolau) alguma vez?" (exactly)
* item[fezExame].text ^short = "O texto da questão"
* item[fezExame] ^short = "Fez exame preventivo (Papanicolau) alguma vez?"
* item[fezExame].type = #boolean (exactly)
* item[fezExame].type ^short = "O tipo da resposta para a questão"


// ------------------------------------------------------
// exame-clinico
// ------------------------------------------------------

Alias: $vs-inspecao-colo = https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/vs-inspecao-colo

Profile: ExameClinicoParaLaudoCitopatologico
Parent: Observation
Id: exame-clinico
Title: "Exame clínico"
Description: "Exame clínico visando laudo de exame citopatológico"

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

* component[inspecao].code = http://loinc.org#12044-4 // Inspeção do colo
* component[inspecao].value[x] only CodeableConcept
* component[inspecao].valueCodeableConcept from $vs-inspecao-colo (required)
* component[inspecao].valueCodeableConcept.coding 1..1

* component[sinais].code = http://loinc.org#45687-1 // DST
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

* supportingInfo only Reference(exame-clinico or br-anamnese-exame-citopatologico)
* supportingInfo 2..2

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
* state 1.. MS
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
// br-anamnese-exame-citopatologico
// ------------------------------------------------------

Profile: AnamneseExameCitopatologico
Parent: Observation
Id: br-anamnese-exame-citopatologico
Title: "Anamnese para exame citopatológico"
Description: "Registra informações obtidas no momento da coleta de amostra para exame citopatológico. As informações aqui registradas são uma evolução da ficha de requisição (ficha de cor rosa)."
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/br-anamnese-exame-citopatologico"
* ^status = #draft

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Perfil que identifica informações utilizadas na requisição de exame citopatológico.</div>"

* ^publisher = "INCA/UFG"
* ^contact.name = "Fábio Nogueira de Lucena"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "kyriosdata@ufg.br"
* ^contact.telecom.use = #work
* ^contact.telecom.rank = 3
* ^useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#gender
* ^useContext[=].valueCodeableConcept = http://hl7.org/fhir/administrative-gender#female
* ^useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#age
* ^useContext[=].valueRange.low = 15 'a' "years"
* ^jurisdiction = urn:iso:std:iso:3166#BR
* ^purpose = "Reúne informações necessárias para que o laudo de exame citopatológico possa ser realizado adequadamente por citopatologista."
* ^copyright = "Ministério da Saúde (Brasil)"
* ^keyword = http://terminology.hl7.org/CodeSystem/definition-use#template
* obeys com-1
* . ^short = "Registro de anamnese para exame citopatológico"
* . ^definition = "Informações exigidas para a elaboração de exame citopatológico."
* status ^definition = "São dois os estados possíveis: \"final\" ou \"cancelled\". \nAo ser submetida o estado necessariamente é \"final\". \nSe, por algum motivo, há um erro ou algo que torne as\ninformações inválidas, então o estado deve ser \"cancelled\"."
* category 1..1
* category.coding.system = "http://terminology.hl7.org/CodeSystem/observation-category" (exactly)
* category.coding.code = #survey (exactly)
* category.coding.code ^short = "Informações coletadas por profissional de saúde durante a coleta"

* component 1..
* component ^short = "Informações coletadas com a paciente"

* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code.coding.code"
* component ^slicing.rules = #closed
* component ^definition = "Informações coletadas com a paciente e úteis para a elaboração do laudo do exame citopatológico."
* component ^comment = "Cada componente identifica um item de informação da requisição de exame citopatológico."
* component.referenceRange ..0
* component.referenceRange ^contentReference = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.referenceRange"
* component contains
    jaFezExamePreventivo 1..1 and
    dataUltimoExame 0..1 and
    usaDIU 1..1 and
    estaGravida 1..1 and
    usaPilulaAnticoncepcional 1..1 and
    usaHormonioMenopausa 1..1 and
    jaFezTratamentoPorRadioterapia 1..1 and
    dataUltimaMenstruacao 0..1 and
    sangramentoAposRelacao 1..1 and
    sangramentoAposMenopausa 1..1

* component ..10

* component[jaFezExamePreventivo] ^short = "Registra se a paciente já fez exame preventivo"
* component[jaFezExamePreventivo] ^definition = "É preciso localizar um código pertinente ou criar CodeSystem correspondente. Saber se já fez é útil, mesmo que não se saiba qual a data?"
* component[jaFezExamePreventivo].code ^short = "Identifica a pergunta 'já fez exame preventido?'"
* component[jaFezExamePreventivo].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[jaFezExamePreventivo].code ^binding.extension.valueString = "ObservationCode"
* component[jaFezExamePreventivo].code.coding 1..1
* component[jaFezExamePreventivo].code.coding.system 1..
* component[jaFezExamePreventivo].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[jaFezExamePreventivo].code.coding.system = $anamnese-citopatologia (exactly)
* component[jaFezExamePreventivo].code.coding.version ..0
* component[jaFezExamePreventivo].code.coding.code 1..
* component[jaFezExamePreventivo].code.coding.code = #ja-fez (exactly)
* component[jaFezExamePreventivo].code.coding.code ^short = "Identificador para a pergunta \"já fez exame preventivo?\""
* component[jaFezExamePreventivo].code.coding.display ..0
* component[jaFezExamePreventivo].code.coding.display = "A pergunta: já fez exame preventivo?" (exactly)
* component[jaFezExamePreventivo].code.coding.display ^short = "Já fez exame preventivo?"
* component[jaFezExamePreventivo].code.coding.display ^definition = "A pergunta \"já fez exame preventivo?\""
* component[jaFezExamePreventivo].code.coding.userSelected ..0
* component[jaFezExamePreventivo].code.text ..0
* component[jaFezExamePreventivo].value[x] 1..1
* component[jaFezExamePreventivo].value[x] ^short = "Informa se a paciente já fez exame preventivo (Y), se não fez (N) ou se ela não sabe (unknown)."
* component[jaFezExamePreventivo].value[x] only CodeableConcept
* component[jaFezExamePreventivo].value[x] from $yesnodontknow (required)
* component[jaFezExamePreventivo].dataAbsentReason ..0
* component[jaFezExamePreventivo].interpretation ..0
* component[jaFezExamePreventivo].referenceRange ..0

* component[dataUltimoExame] ^short = "Registra data do último exame, se for o caso"
* component[dataUltimoExame] ^definition = "A data em que foi realizado pela última vez o exame citopatológico."
* component[dataUltimoExame].code ^short = "Identifica a pergunta 'qual a data do último exame?'"
* component[dataUltimoExame].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[dataUltimoExame].code ^binding.extension.valueString = "ObservationCode"
* component[dataUltimoExame].code ^binding.description = "Códigos para informações fornecidas pela paciente"
* component[dataUltimoExame].code.coding.system 1..
* component[dataUltimoExame].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[dataUltimoExame].code.coding.system = $loinc (exactly)
* component[dataUltimoExame].code.coding.version ..0
* component[dataUltimoExame].code.coding.code 1..1
* component[dataUltimoExame].code.coding.code = #60432-2 (exactly)
* component[dataUltimoExame].code.coding.code ^short = "data of previous pap smear"
* component[dataUltimoExame].code.coding.code ^definition = "Data da realização do último exame."
* component[dataUltimoExame].code.coding.display ..0
* component[dataUltimoExame].code.coding.userSelected ..0
* component[dataUltimoExame].code.text ..0
* component[dataUltimoExame].value[x] 1..
* component[dataUltimoExame].value[x] ^short = "A data em que a paciente realizou o último exame citopatológico"
* component[dataUltimoExame].value[x] only dateTime
* component[dataUltimoExame].dataAbsentReason ..0
* component[dataUltimoExame].interpretation ..0
* component[dataUltimoExame].referenceRange ..0

* component[usaDIU] ^short = "Registra se a paciente faz uso de DIU"
* component[usaDIU] ^definition = "A resposta fornecida pela paciente se ela faz uso de DIU"
* component[usaDIU].code ^short = "Identifica a pergunta 'faz uso de DIU?'"
* component[usaDIU].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[usaDIU].code ^binding.extension.valueString = "ObservationCode"
* component[usaDIU].code.coding.id ..0
* component[usaDIU].code.coding.system 1..
* component[usaDIU].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[usaDIU].code.coding.system = $anamnese-citopatologia (exactly)
* component[usaDIU].code.coding.version ..0
* component[usaDIU].code.coding.code 1..
* component[usaDIU].code.coding.code = #diu (exactly)
* component[usaDIU].code.coding.code ^short = "Usa DIU?"
* component[usaDIU].code.coding.display ..0
* component[usaDIU].code.coding.userSelected ..0
* component[usaDIU].code.text ..0
* component[usaDIU].value[x] 1..
* component[usaDIU].value[x] ^short = "Indica se a paciente usa DIU (Y), não usa (N) ou não sabe (unknown)"
* component[usaDIU].value[x] only CodeableConcept
* component[usaDIU].value[x] from $yesnodontknow (required)
* component[usaDIU].value[x] ^short = "Informa se a paciente usa, não usa ou não sabe se usa DIU."
* component[usaDIU].dataAbsentReason ..0
* component[usaDIU].interpretation ..0
* component[usaDIU].referenceRange ..0

* component[estaGravida] ^short = "Registra se a paciente está grávida"
* component[estaGravida] ^definition = "A resposta da paciente quando perguntada se está grávida."
* component[estaGravida].code ^short = "Identifica a pergunta 'paciente está grávida?'"
* component[estaGravida].code.coding.system 1..
* component[estaGravida].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[estaGravida].code.coding.system = $loinc (exactly)
* component[estaGravida].code.coding.version ..0
* component[estaGravida].code.coding.code 1..
* component[estaGravida].code.coding.code = #66174-4 (exactly)
* component[estaGravida].code.coding.display ..0
* component[estaGravida].code.coding.userSelected ..0
* component[estaGravida].code.text ..0
* component[estaGravida].value[x] 1..
* component[estaGravida].value[x] ^short = "Indica se a paciente está grávida (Y), não está grávida (N) ou não sabe (unknwon)"
* component[estaGravida].value[x] only CodeableConcept
* component[estaGravida].value[x] from $yesnodontknow (required)
* component[estaGravida].value[x] ^binding.description = "Informa se a paciente afirma estar grávida, afirma não estar grávida ou afirma que não sabe se está grávida."
* component[estaGravida].dataAbsentReason ..0
* component[estaGravida].interpretation ..0
* component[estaGravida].referenceRange ..0

* component[usaPilulaAnticoncepcional] ^short = "Registra se a paciente faz uso de pílula anticoncepcional"
* component[usaPilulaAnticoncepcional] ^definition = "A resposta da paciente quando perguntada se faz uso de pílula anticoncepcional."
* component[usaPilulaAnticoncepcional].code ^short = "Identifica a pergunta 'faz uso de pílula anticoncepcional?'"
* component[usaPilulaAnticoncepcional].code.coding.system 1..
* component[usaPilulaAnticoncepcional].code.coding.system ^short = "O identificador da definição das perguntas"
* component[usaPilulaAnticoncepcional].code.coding.system = $anamnese-citopatologia (exactly)
* component[usaPilulaAnticoncepcional].code.coding.version ..0
* component[usaPilulaAnticoncepcional].code.coding.code 1..
* component[usaPilulaAnticoncepcional].code.coding.code = #pilula (exactly)
* component[usaPilulaAnticoncepcional].code.coding.code ^short = "Resposta para a pergunta: usa pílula anticoncepcional?"
* component[usaPilulaAnticoncepcional].code.text ..0
* component[usaPilulaAnticoncepcional].value[x] 1..
* component[usaPilulaAnticoncepcional].value[x] ^short = "Indica se a paciente usa pílula anticoncepcional (Y), não usa (N) ou não sabe (unknwon)"
* component[usaPilulaAnticoncepcional].value[x] only CodeableConcept
* component[usaPilulaAnticoncepcional].value[x] from $yesnodontknow (required)
* component[usaPilulaAnticoncepcional].interpretation ..0
* component[usaPilulaAnticoncepcional].dataAbsentReason ..0
* component[usaPilulaAnticoncepcional].referenceRange ..0

* component[usaHormonioMenopausa] ^short = "Registra se a paciente faz uso de hormônio para tratar a menopausa"
* component[usaHormonioMenopausa] ^definition = "A resposta da paciente quando perguntada se faz uso de hormônio para tratar a menopausa."
* component[usaHormonioMenopausa].code ^short = "Identifica a pergunta 'usa hormônio para tratar a menopausa?'"
* component[usaHormonioMenopausa].code.coding.system 1..
* component[usaHormonioMenopausa].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[usaHormonioMenopausa].code.coding.system = $loinc (exactly)
* component[usaHormonioMenopausa].code.coding.code 1..
* component[usaHormonioMenopausa].code.coding.code = #63873-4 (exactly)
* component[usaHormonioMenopausa].code.text ..0
* component[usaHormonioMenopausa].value[x] 1..
* component[usaHormonioMenopausa].value[x] ^short = "O valor Y se a paciente faz uso de hormônio para tratar a menopausa, N para não faz ou unknwon caso a paciente não saiba."
* component[usaHormonioMenopausa].value[x] only CodeableConcept
* component[usaHormonioMenopausa].value[x] from $yesnodontknow (required)
* component[usaHormonioMenopausa].dataAbsentReason ..0
* component[usaHormonioMenopausa].interpretation ..0
* component[usaHormonioMenopausa].referenceRange ..0

* component[jaFezTratamentoPorRadioterapia] ^short = "Registra se a paciente já fez tratamento por radioterapia"
* component[jaFezTratamentoPorRadioterapia] ^definition = "A resposta da paciente quando perguntada se já fez tratamento por radioterapia."
* component[jaFezTratamentoPorRadioterapia].code ^short = "Identifica a pergunta 'já realizou tratamento por radioterapia?'"
* component[jaFezTratamentoPorRadioterapia].code.coding.system 1..
* component[jaFezTratamentoPorRadioterapia].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[jaFezTratamentoPorRadioterapia].code.coding.system = $anamnese-citopatologia (exactly)
* component[jaFezTratamentoPorRadioterapia].code.coding.code 1..
* component[jaFezTratamentoPorRadioterapia].code.coding.code = #radioterapia (exactly)
* component[jaFezTratamentoPorRadioterapia].code.text ..0
* component[jaFezTratamentoPorRadioterapia].value[x] 1..
* component[jaFezTratamentoPorRadioterapia].value[x] ^short = "O valor Y se tratamento por radioterapia já foi realizado pela paciente, N se nunca realizou, e unknown se ela não sabe."
* component[jaFezTratamentoPorRadioterapia].value[x] only CodeableConcept
* component[jaFezTratamentoPorRadioterapia].value[x] from $yesnodontknow (required)
* component[jaFezTratamentoPorRadioterapia].dataAbsentReason ..0
* component[jaFezTratamentoPorRadioterapia].interpretation ..0
* component[jaFezTratamentoPorRadioterapia].referenceRange ..0

* component[dataUltimaMenstruacao] ^short = "Registra data da última menstruação"
* component[dataUltimaMenstruacao] ^definition = "A resposta da paciente quando perguntada sobre a data da última menstruação/regra."
* component[dataUltimaMenstruacao].code ^short = "Identifica a pergunta 'qual a data da última menstruação/regra?'"
* component[dataUltimaMenstruacao].code.coding.system 1..
* component[dataUltimaMenstruacao].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[dataUltimaMenstruacao].code.coding.system = $loinc (exactly)
* component[dataUltimaMenstruacao].code.coding.code 1..
* component[dataUltimaMenstruacao].code.coding.code = #8665-2 (exactly)
* component[dataUltimaMenstruacao].code.coding.code ^short = "Data da última menstruação"
* component[dataUltimaMenstruacao].code.text ..0
* component[dataUltimaMenstruacao].value[x] ^short = "A data da última menstruação da paciente."
* component[dataUltimaMenstruacao].value[x] only dateTime
* component[dataUltimaMenstruacao].dataAbsentReason ..0
* component[dataUltimaMenstruacao].interpretation ..0
* component[dataUltimaMenstruacao].referenceRange ..0

* component[sangramentoAposRelacao] ^short = "Registra se a paciente tem ou já teve sangramento após relação sexual"
* component[sangramentoAposRelacao] ^definition = "A resposta da paciente quando perguntada se tem ou já teve sangramento após relação sexual."
* component[sangramentoAposRelacao].code ^short = "Identifica a pergunta 'tem ou teve sangramento após relações sexuais?'"
* component[sangramentoAposRelacao].code.coding.system 1..
* component[sangramentoAposRelacao].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[sangramentoAposRelacao].code.coding.system = $anamnese-citopatologia (exactly)
* component[sangramentoAposRelacao].code.coding.code 1..
* component[sangramentoAposRelacao].code.coding.code = #sangramento-relacao (exactly)
* component[sangramentoAposRelacao].code.text ..0
* component[sangramentoAposRelacao].value[x] 1..
* component[sangramentoAposRelacao].value[x] ^short = "O valor Y se tem ou já teve sangramento após relação sexual, N caso contrário e unknown caso não saiba."
* component[sangramentoAposRelacao].value[x] only CodeableConcept
* component[sangramentoAposRelacao].value[x] from $yesnodontknow (required)
* component[sangramentoAposRelacao].dataAbsentReason ..0
* component[sangramentoAposRelacao].interpretation ..0
* component[sangramentoAposRelacao].referenceRange ..0

* component[sangramentoAposMenopausa] ^short = "Registra a paciente tem ou teve sangramento após a menopausa"
* component[sangramentoAposMenopausa] ^definition = "A resposta da paciente quando perguntada se tem ou teve sangramaneot após a menopausa"
* component[sangramentoAposMenopausa].code ^short = "Registra se tem ou teve sangramento após menopausa"
* component[sangramentoAposMenopausa].code.coding.system 1..
* component[sangramentoAposMenopausa].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[sangramentoAposMenopausa].code.coding.system = $anamnese-citopatologia (exactly)
* component[sangramentoAposMenopausa].code.coding.code 1..
* component[sangramentoAposMenopausa].code.coding.code = #sangramento-menopausa (exactly)
* component[sangramentoAposMenopausa].code.text ..0
* component[sangramentoAposMenopausa].value[x] 1..
* component[sangramentoAposMenopausa].value[x] ^short = "O valor Y se a paciente tem ou teve sangramento, N caso contrário e unknown caso não saiba."
* component[sangramentoAposMenopausa].value[x] only CodeableConcept
* component[sangramentoAposMenopausa].value[x] from $yesnodontknow (required)
* component[sangramentoAposMenopausa].dataAbsentReason ..0
* component[sangramentoAposMenopausa].interpretation ..0
* component[sangramentoAposMenopausa].referenceRange ..0


Invariant: com-1
Description: "Se fornecida data do último exame, então deve ter sido confirmada a realização de exame anteriormente."
Severity: #error
Expression: "component.code.coding.where(code = '60432-2').empty().not() implies component.where($this.code.coding[0].code = 'ja-fez' and $this.value.coding[0].code = 'Y').exists()"

Mapping: ficha
Id: ficha
Title: "ficha de requisição de exame citopatológico"
Description: "Informações sobre a ficha de exame citopatológico"
Source: AnamneseExameCitopatologico
Target: "https://www.gov.br/inca/pt-br/assuntos/gestor-e-profissional-de-saude/envio-de-amostras-de-exames-citopatologico-e-histopatologico"





// ------------------------------------------------------
// br-diagnostico-exame-citopatologico
// ------------------------------------------------------

Alias: $diagnostico-citopatologia = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/diagnostico-citopatologia

Profile: DiagnosticoExameCitopatologico
Parent: Observation
Id: br-diagnostico-exame-citopatologico
Title: "Diagnóstico de exame citopatológico"
Description: "Registra diagnóstico de exame citopatológico conforme ficha de requisição do SISCAN."
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/br-diagnostico-exame-citopatologico"
* ^status = #draft

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Perfil que define contido de diagnóstico de exame citopatológico.</div>"

* ^publisher = "INCA/UFG"
* ^contact.name = "Fábio Nogueira de Lucena"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "kyriosdata@ufg.br"
* ^contact.telecom.use = #work
* ^contact.telecom.rank = 3
* ^useContext[0].code = http://terminology.hl7.org/CodeSystem/usage-context-type#gender
* ^useContext[0].valueCodeableConcept = http://hl7.org/fhir/administrative-gender#female
* ^useContext[1].code = http://terminology.hl7.org/CodeSystem/usage-context-type#age
* ^useContext[1].valueRange.low = 15 'a' "years"
* ^jurisdiction = urn:iso:std:iso:3166#BR
* ^purpose = "Reúne informações do laudo de exame citopatológico possa ser realizado adequadamente por citopatologista."
* ^copyright = "Ministério da Saúde (Brasil)"
* ^keyword = http://terminology.hl7.org/CodeSystem/definition-use#template
* obeys com-1
* . ^short = "Registro de anamnese para exame citopatológico"
* . ^definition = "Informações exigidas para a elaboração de exame citopatológico."
* status ^definition = "São dois os estados possíveis: \"final\" ou \"cancelled\". \nAo ser submetida o estado necessariamente é \"final\". \nSe, por algum motivo, há um erro ou algo que torne as\ninformações inválidas, então o estado deve ser \"cancelled\"."
* category 1..1
* category.coding.system = "http://terminology.hl7.org/CodeSystem/observation-category" (exactly)
* category.coding.code = #survey (exactly)
* category.coding.code ^short = "Informações coletadas por profissional de saúde durante a coleta"

* component 1..
* component ^short = "Informações coletadas com a paciente"
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code.coding.code"
* component ^slicing.rules = #closed
* component ^definition = "Informações coletadas com a paciente e úteis para a elaboração do laudo do exame citopatológico."
* component ^comment = "Cada componente identifica um item de informação da requisição de exame citopatológico."
* component.referenceRange ..0
* component.referenceRange ^contentReference = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.referenceRange"

* component contains
    jaFezExamePreventivo 1..1 and
    dataUltimoExame 0..1 and
    usaDIU 1..1 and
    estaGravida 1..1 and
    usaPilulaAnticoncepcional 1..1 and
    usaHormonioMenopausa 1..1 and
    jaFezTratamentoPorRadioterapia 1..1 and
    dataUltimaMenstruacao 0..1 and
    sangramentoAposRelacao 1..1 and
    sangramentoAposMenopausa 1..1

* component ..10

* component[jaFezExamePreventivo] ^short = "Registra se a paciente já fez exame preventivo"
* component[jaFezExamePreventivo] ^definition = "É preciso localizar um código pertinente ou criar CodeSystem correspondente. Saber se já fez é útil, mesmo que não se saiba qual a data?"
* component[jaFezExamePreventivo].code ^short = "Identifica a pergunta 'já fez exame preventido?'"
* component[jaFezExamePreventivo].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[jaFezExamePreventivo].code ^binding.extension.valueString = "ObservationCode"
* component[jaFezExamePreventivo].code.coding 1..1
* component[jaFezExamePreventivo].code.coding.system 1..
* component[jaFezExamePreventivo].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[jaFezExamePreventivo].code.coding.system = $diagnostico-citopatologia (exactly)
* component[jaFezExamePreventivo].code.coding.version ..0
* component[jaFezExamePreventivo].code.coding.code 1..
* component[jaFezExamePreventivo].code.coding.code = #ja-fez (exactly)
* component[jaFezExamePreventivo].code.coding.code ^short = "Identificador para a pergunta \"já fez exame preventivo?\""
* component[jaFezExamePreventivo].code.coding.display ..0
* component[jaFezExamePreventivo].code.coding.display = "A pergunta: já fez exame preventivo?" (exactly)
* component[jaFezExamePreventivo].code.coding.display ^short = "Já fez exame preventivo?"
* component[jaFezExamePreventivo].code.coding.display ^definition = "A pergunta \"já fez exame preventivo?\""
* component[jaFezExamePreventivo].code.coding.userSelected ..0
* component[jaFezExamePreventivo].code.text ..0
* component[jaFezExamePreventivo].value[x] 1..1
* component[jaFezExamePreventivo].value[x] ^short = "Informa se a paciente já fez exame preventivo (Y), se não fez (N) ou se ela não sabe (unknown)."
* component[jaFezExamePreventivo].value[x] only CodeableConcept
* component[jaFezExamePreventivo].value[x] from $yesnodontknow (required)
* component[jaFezExamePreventivo].dataAbsentReason ..0
* component[jaFezExamePreventivo].interpretation ..0
* component[jaFezExamePreventivo].referenceRange ..0

* component[dataUltimoExame] ^short = "Registra data do último exame, se for o caso"
* component[dataUltimoExame] ^definition = "A data em que foi realizado pela última vez o exame citopatológico."
* component[dataUltimoExame].code ^short = "Identifica a pergunta 'qual a data do último exame?'"
* component[dataUltimoExame].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[dataUltimoExame].code ^binding.extension.valueString = "ObservationCode"
* component[dataUltimoExame].code ^binding.description = "Códigos para informações fornecidas pela paciente"
* component[dataUltimoExame].code.coding.system 1..
* component[dataUltimoExame].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[dataUltimoExame].code.coding.system = $loinc (exactly)
* component[dataUltimoExame].code.coding.version ..0
* component[dataUltimoExame].code.coding.code 1..1
* component[dataUltimoExame].code.coding.code = #60432-2 (exactly)
* component[dataUltimoExame].code.coding.code ^short = "data of previous pap smear"
* component[dataUltimoExame].code.coding.code ^definition = "Data da realização do último exame."
* component[dataUltimoExame].code.coding.display ..0
* component[dataUltimoExame].code.coding.userSelected ..0
* component[dataUltimoExame].code.text ..0
* component[dataUltimoExame].value[x] 1..
* component[dataUltimoExame].value[x] ^short = "A data em que a paciente realizou o último exame citopatológico"
* component[dataUltimoExame].value[x] only dateTime
* component[dataUltimoExame].dataAbsentReason ..0
* component[dataUltimoExame].interpretation ..0
* component[dataUltimoExame].referenceRange ..0

* component[usaDIU] ^short = "Registra se a paciente faz uso de DIU"
* component[usaDIU] ^definition = "A resposta fornecida pela paciente se ela faz uso de DIU"
* component[usaDIU].code ^short = "Identifica a pergunta 'faz uso de DIU?'"
* component[usaDIU].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[usaDIU].code ^binding.extension.valueString = "ObservationCode"
* component[usaDIU].code.coding.id ..0
* component[usaDIU].code.coding.system 1..
* component[usaDIU].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[usaDIU].code.coding.system = $diagnostico-citopatologia (exactly)
* component[usaDIU].code.coding.version ..0
* component[usaDIU].code.coding.code 1..
* component[usaDIU].code.coding.code = #diu (exactly)
* component[usaDIU].code.coding.code ^short = "Usa DIU?"
* component[usaDIU].code.coding.display ..0
* component[usaDIU].code.coding.userSelected ..0
* component[usaDIU].code.text ..0
* component[usaDIU].value[x] 1..
* component[usaDIU].value[x] ^short = "Indica se a paciente usa DIU (Y), não usa (N) ou não sabe (unknown)"
* component[usaDIU].value[x] only CodeableConcept
* component[usaDIU].value[x] from $yesnodontknow (required)
* component[usaDIU].value[x] ^short = "Informa se a paciente usa, não usa ou não sabe se usa DIU."
* component[usaDIU].dataAbsentReason ..0
* component[usaDIU].interpretation ..0
* component[usaDIU].referenceRange ..0

* component[estaGravida] ^short = "Registra se a paciente está grávida"
* component[estaGravida] ^definition = "A resposta da paciente quando perguntada se está grávida."
* component[estaGravida].code ^short = "Identifica a pergunta 'paciente está grávida?'"
* component[estaGravida].code.coding.system 1..
* component[estaGravida].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[estaGravida].code.coding.system = $loinc (exactly)
* component[estaGravida].code.coding.version ..0
* component[estaGravida].code.coding.code 1..
* component[estaGravida].code.coding.code = #66174-4 (exactly)
* component[estaGravida].code.coding.display ..0
* component[estaGravida].code.coding.userSelected ..0
* component[estaGravida].code.text ..0
* component[estaGravida].value[x] 1..
* component[estaGravida].value[x] ^short = "Indica se a paciente está grávida (Y), não está grávida (N) ou não sabe (unknwon)"
* component[estaGravida].value[x] only CodeableConcept
* component[estaGravida].value[x] from $yesnodontknow (required)
* component[estaGravida].value[x] ^binding.description = "Informa se a paciente afirma estar grávida, afirma não estar grávida ou afirma que não sabe se está grávida."
* component[estaGravida].dataAbsentReason ..0
* component[estaGravida].interpretation ..0
* component[estaGravida].referenceRange ..0

* component[usaPilulaAnticoncepcional] ^short = "Registra se a paciente faz uso de pílula anticoncepcional"
* component[usaPilulaAnticoncepcional] ^definition = "A resposta da paciente quando perguntada se faz uso de pílula anticoncepcional."
* component[usaPilulaAnticoncepcional].code ^short = "Identifica a pergunta 'faz uso de pílula anticoncepcional?'"
* component[usaPilulaAnticoncepcional].code.coding.system 1..
* component[usaPilulaAnticoncepcional].code.coding.system ^short = "O identificador da definição das perguntas"
* component[usaPilulaAnticoncepcional].code.coding.system = $diagnostico-citopatologia (exactly)
* component[usaPilulaAnticoncepcional].code.coding.version ..0
* component[usaPilulaAnticoncepcional].code.coding.code 1..
* component[usaPilulaAnticoncepcional].code.coding.code = #pilula (exactly)
* component[usaPilulaAnticoncepcional].code.coding.code ^short = "Resposta para a pergunta: usa pílula anticoncepcional?"
* component[usaPilulaAnticoncepcional].code.text ..0
* component[usaPilulaAnticoncepcional].value[x] 1..
* component[usaPilulaAnticoncepcional].value[x] ^short = "Indica se a paciente usa pílula anticoncepcional (Y), não usa (N) ou não sabe (unknwon)"
* component[usaPilulaAnticoncepcional].value[x] only CodeableConcept
* component[usaPilulaAnticoncepcional].value[x] from $yesnodontknow (required)
* component[usaPilulaAnticoncepcional].interpretation ..0
* component[usaPilulaAnticoncepcional].dataAbsentReason ..0
* component[usaPilulaAnticoncepcional].referenceRange ..0

* component[usaHormonioMenopausa] ^short = "Registra se a paciente faz uso de hormônio para tratar a menopausa"
* component[usaHormonioMenopausa] ^definition = "A resposta da paciente quando perguntada se faz uso de hormônio para tratar a menopausa."
* component[usaHormonioMenopausa].code ^short = "Identifica a pergunta 'usa hormônio para tratar a menopausa?'"
* component[usaHormonioMenopausa].code.coding.system 1..
* component[usaHormonioMenopausa].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[usaHormonioMenopausa].code.coding.system = $loinc (exactly)
* component[usaHormonioMenopausa].code.coding.code 1..
* component[usaHormonioMenopausa].code.coding.code = #63873-4 (exactly)
* component[usaHormonioMenopausa].code.text ..0
* component[usaHormonioMenopausa].value[x] 1..
* component[usaHormonioMenopausa].value[x] ^short = "O valor Y se a paciente faz uso de hormônio para tratar a menopausa, N para não faz ou unknwon caso a paciente não saiba."
* component[usaHormonioMenopausa].value[x] only CodeableConcept
* component[usaHormonioMenopausa].value[x] from $yesnodontknow (required)
* component[usaHormonioMenopausa].dataAbsentReason ..0
* component[usaHormonioMenopausa].interpretation ..0
* component[usaHormonioMenopausa].referenceRange ..0

* component[jaFezTratamentoPorRadioterapia] ^short = "Registra se a paciente já fez tratamento por radioterapia"
* component[jaFezTratamentoPorRadioterapia] ^definition = "A resposta da paciente quando perguntada se já fez tratamento por radioterapia."
* component[jaFezTratamentoPorRadioterapia].code ^short = "Identifica a pergunta 'já realizou tratamento por radioterapia?'"
* component[jaFezTratamentoPorRadioterapia].code.coding.system 1..
* component[jaFezTratamentoPorRadioterapia].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[jaFezTratamentoPorRadioterapia].code.coding.system = $diagnostico-citopatologia (exactly)
* component[jaFezTratamentoPorRadioterapia].code.coding.code 1..
* component[jaFezTratamentoPorRadioterapia].code.coding.code = #radioterapia (exactly)
* component[jaFezTratamentoPorRadioterapia].code.text ..0
* component[jaFezTratamentoPorRadioterapia].value[x] 1..
* component[jaFezTratamentoPorRadioterapia].value[x] ^short = "O valor Y se tratamento por radioterapia já foi realizado pela paciente, N se nunca realizou, e unknown se ela não sabe."
* component[jaFezTratamentoPorRadioterapia].value[x] only CodeableConcept
* component[jaFezTratamentoPorRadioterapia].value[x] from $yesnodontknow (required)
* component[jaFezTratamentoPorRadioterapia].dataAbsentReason ..0
* component[jaFezTratamentoPorRadioterapia].interpretation ..0
* component[jaFezTratamentoPorRadioterapia].referenceRange ..0

* component[dataUltimaMenstruacao] ^short = "Registra data da última menstruação"
* component[dataUltimaMenstruacao] ^definition = "A resposta da paciente quando perguntada sobre a data da última menstruação/regra."
* component[dataUltimaMenstruacao].code ^short = "Identifica a pergunta 'qual a data da última menstruação/regra?'"
* component[dataUltimaMenstruacao].code.coding.system 1..
* component[dataUltimaMenstruacao].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[dataUltimaMenstruacao].code.coding.system = $loinc (exactly)
* component[dataUltimaMenstruacao].code.coding.code 1..
* component[dataUltimaMenstruacao].code.coding.code = #8665-2 (exactly)
* component[dataUltimaMenstruacao].code.coding.code ^short = "Data da última menstruação"
* component[dataUltimaMenstruacao].code.text ..0
* component[dataUltimaMenstruacao].value[x] ^short = "A data da última menstruação da paciente."
* component[dataUltimaMenstruacao].value[x] only dateTime
* component[dataUltimaMenstruacao].dataAbsentReason ..0
* component[dataUltimaMenstruacao].interpretation ..0
* component[dataUltimaMenstruacao].referenceRange ..0

* component[sangramentoAposRelacao] ^short = "Registra se a paciente tem ou já teve sangramento após relação sexual"
* component[sangramentoAposRelacao] ^definition = "A resposta da paciente quando perguntada se tem ou já teve sangramento após relação sexual."
* component[sangramentoAposRelacao].code ^short = "Identifica a pergunta 'tem ou teve sangramento após relações sexuais?'"
* component[sangramentoAposRelacao].code.coding.system 1..
* component[sangramentoAposRelacao].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[sangramentoAposRelacao].code.coding.system = $diagnostico-citopatologia (exactly)
* component[sangramentoAposRelacao].code.coding.code 1..
* component[sangramentoAposRelacao].code.coding.code = #sangramento-relacao (exactly)
* component[sangramentoAposRelacao].code.text ..0
* component[sangramentoAposRelacao].value[x] 1..
* component[sangramentoAposRelacao].value[x] ^short = "O valor Y se tem ou já teve sangramento após relação sexual, N caso contrário e unknown caso não saiba."
* component[sangramentoAposRelacao].value[x] only CodeableConcept
* component[sangramentoAposRelacao].value[x] from $yesnodontknow (required)
* component[sangramentoAposRelacao].dataAbsentReason ..0
* component[sangramentoAposRelacao].interpretation ..0
* component[sangramentoAposRelacao].referenceRange ..0

* component[sangramentoAposMenopausa] ^short = "Registra a paciente tem ou teve sangramento após a menopausa"
* component[sangramentoAposMenopausa] ^definition = "A resposta da paciente quando perguntada se tem ou teve sangramaneot após a menopausa"
* component[sangramentoAposMenopausa].code ^short = "Registra se tem ou teve sangramento após menopausa"
* component[sangramentoAposMenopausa].code.coding.system 1..
* component[sangramentoAposMenopausa].code.coding.system ^short = "O identificador do sistema de codificação onde a pergunta está definida."
* component[sangramentoAposMenopausa].code.coding.system = $diagnostico-citopatologia (exactly)
* component[sangramentoAposMenopausa].code.coding.code 1..
* component[sangramentoAposMenopausa].code.coding.code = #sangramento-menopausa (exactly)
* component[sangramentoAposMenopausa].code.text ..0
* component[sangramentoAposMenopausa].value[x] 1..
* component[sangramentoAposMenopausa].value[x] ^short = "O valor Y se a paciente tem ou teve sangramento, N caso contrário e unknown caso não saiba."
* component[sangramentoAposMenopausa].value[x] only CodeableConcept
* component[sangramentoAposMenopausa].value[x] from $yesnodontknow (required)
* component[sangramentoAposMenopausa].dataAbsentReason ..0
* component[sangramentoAposMenopausa].interpretation ..0
* component[sangramentoAposMenopausa].referenceRange ..0
