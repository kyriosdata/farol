Alias: $anamnese-citopatologia = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/anamnese-citopatologia

Profile: AnamneseExameCitopatologico
Parent: Observation
Id: br-anamnese-exame-citopatologico
Title: "Anamnese para exame citopatológico"
Description: "Registra informações obtidas no momento da coleta de amostra para exame citopatológico. As informações aqui registradas são uma evolução da ficha de requisição (ficha de cor rosa)."
* ^url = "https://rnds-fhir.saude.gov.br/StructureDefinition/br-anamnese-exame-citopatologico"
* ^status = #draft
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
* ^jurisdiction = urn:iso:std:iso:3166#BR "Brasil"
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
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code.coding.code"
* component ^slicing.rules = #closed
* component ^short = "Informações coletadas com a paciente"
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

* component[jaFezExamePreventivo] ^short = "Registra se a paciente já fez exame preventivo"
* component[jaFezExamePreventivo] ^definition = "É preciso localizar um código pertinente ou criar CodeSystem correspondente. Saber se já fez é útil, mesmo que não se saiba qual a data?"
* component[jaFezExamePreventivo].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[jaFezExamePreventivo].code ^binding.extension.valueString = "ObservationCode"
* component[jaFezExamePreventivo].code.coding.system 1..
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
* component[jaFezExamePreventivo].value[x] 1..
* component[jaFezExamePreventivo].value[x] only boolean
* component[jaFezExamePreventivo].value[x] ^short = "O valor true para sim, já fez o exame ou false (caso não tenha feito o exame)"
* component[jaFezExamePreventivo].dataAbsentReason ..0
* component[jaFezExamePreventivo].interpretation ..0
* component[jaFezExamePreventivo].referenceRange ..0

* component[dataUltimoExame] ^short = "Registra data do último exame, se for o caso"
* component[dataUltimoExame] ^definition = "A data em que foi realizado pela última vez o exame citopatológico."
* component[dataUltimoExame].code from $BRQuestoesExameCitopatologico (required)
* component[dataUltimoExame].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[dataUltimoExame].code ^binding.extension.valueString = "ObservationCode"
* component[dataUltimoExame].code ^binding.description = "Códigos para informações fornecidas pela paciente"
* component[dataUltimoExame].code.coding.system 1..
* component[dataUltimoExame].code.coding.system = $loinc (exactly)
* component[dataUltimoExame].code.coding.version ..0
* component[dataUltimoExame].code.coding.code 1..
* component[dataUltimoExame].code.coding.code = #60432-2 (exactly)
* component[dataUltimoExame].code.coding.code ^short = "data of previous pap smear"
* component[dataUltimoExame].code.coding.code ^definition = "Data da realização do último exame."
* component[dataUltimoExame].code.coding.display ..0
* component[dataUltimoExame].code.coding.userSelected ..0
* component[dataUltimoExame].code.text ..0
* component[dataUltimoExame].value[x] 1..
* component[dataUltimoExame].value[x] only dateTime
* component[dataUltimoExame].dataAbsentReason ..0
* component[dataUltimoExame].interpretation ..0
* component[dataUltimoExame].referenceRange ..0

* component[usaDIU].code ^short = "Registra se a paciente faz uso de DIU"
* component[usaDIU].code from $BRQuestoesExameCitopatologico (required)
* component[usaDIU].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[usaDIU].code ^binding.extension.valueString = "ObservationCode"
* component[usaDIU].code.coding.id ..0
* component[usaDIU].code.coding.system 1..
* component[usaDIU].code.coding.system = $anamnese-citopatologia (exactly)
* component[usaDIU].code.coding.version ..0
* component[usaDIU].code.coding.code 1..
* component[usaDIU].code.coding.code = #diu (exactly)
* component[usaDIU].code.coding.code ^short = "Usa DIU?"
* component[usaDIU].code.coding.display ..0
* component[usaDIU].code.coding.userSelected ..0
* component[usaDIU].code.text ..0
* component[usaDIU].value[x] 1..
* component[usaDIU].value[x] only CodeableConcept
* component[usaDIU].value[x] from $yesnodontknow (required)
* component[usaDIU].value[x] ^short = "Informa se a paciente usa, não usa ou não sabe se usa DIU."
* component[usaDIU].dataAbsentReason ..0
* component[usaDIU].interpretation ..0
* component[usaDIU].referenceRange ..0

* component[estaGravida].code ^short = "Registra se a paciente está grávida"
* component[estaGravida].code.coding.system 1..
* component[estaGravida].code.coding.system = $loinc (exactly)
* component[estaGravida].code.coding.version ..0
* component[estaGravida].code.coding.code 1..
* component[estaGravida].code.coding.code = #66174-4 (exactly)
* component[estaGravida].code.coding.display ..0
* component[estaGravida].code.coding.userSelected ..0
* component[estaGravida].code.text ..0
* component[estaGravida].value[x] 1..
* component[estaGravida].value[x] only CodeableConcept
* component[estaGravida].value[x] from $yesnodontknow (required)
* component[estaGravida].value[x] ^binding.description = "Informa se a paciente afirma estar grávida, afirma não estar grávida ou afirma que não sabe se está grávida."
* component[estaGravida].dataAbsentReason ..0
* component[estaGravida].interpretation ..0
* component[estaGravida].referenceRange ..0

* component[usaPilulaAnticoncepcional].code ^short = "Registra se a paciente faz uso de pílula anticoncepcional"
* component[usaPilulaAnticoncepcional].code.coding.system 1..
* component[usaPilulaAnticoncepcional].code.coding.system = $anamnese-citopatologia (exactly)
* component[usaPilulaAnticoncepcional].code.coding.version ..0
* component[usaPilulaAnticoncepcional].code.coding.code 1..
* component[usaPilulaAnticoncepcional].code.coding.code = #pilula (exactly)
* component[usaPilulaAnticoncepcional].code.coding.code ^short = "Resposta para a pergunta: usa pílula anticoncepcional?"
* component[usaPilulaAnticoncepcional].code.text ..0
* component[usaPilulaAnticoncepcional].value[x] 1..
* component[usaPilulaAnticoncepcional].value[x] only CodeableConcept
* component[usaPilulaAnticoncepcional].value[x] from $yesnodontknow (required)
* component[usaPilulaAnticoncepcional].interpretation ..0
* component[usaPilulaAnticoncepcional].dataAbsentReason ..0
* component[usaPilulaAnticoncepcional].referenceRange ..0

* component[usaHormonioMenopausa].code ^short = "Registra se a paciente usa hormônio para tratar a menopausa"
* component[usaHormonioMenopausa].code.coding.system 1..
* component[usaHormonioMenopausa].code.coding.system = $loinc (exactly)
* component[usaHormonioMenopausa].code.coding.code 1..
* component[usaHormonioMenopausa].code.coding.code = #63873-4 (exactly)
* component[usaHormonioMenopausa].code.text ..0
* component[usaHormonioMenopausa].value[x] 1..
* component[usaHormonioMenopausa].value[x] only CodeableConcept
* component[usaHormonioMenopausa].value[x] from $yesnodontknow (required)
* component[usaHormonioMenopausa].dataAbsentReason ..0
* component[usaHormonioMenopausa].interpretation ..0
* component[usaHormonioMenopausa].referenceRange ..0

* component[jaFezTratamentoPorRadioterapia].code ^short = "Registra se a paciente já realizou tratamento por radioterapia"
* component[jaFezTratamentoPorRadioterapia].code.coding.system 1..
* component[jaFezTratamentoPorRadioterapia].code.coding.system = $anamnese-citopatologia (exactly)
* component[jaFezTratamentoPorRadioterapia].code.coding.code 1..
* component[jaFezTratamentoPorRadioterapia].code.coding.code = #radioterapia (exactly)
* component[jaFezTratamentoPorRadioterapia].code.text ..0
* component[jaFezTratamentoPorRadioterapia].value[x] 1..
* component[jaFezTratamentoPorRadioterapia].value[x] only CodeableConcept
* component[jaFezTratamentoPorRadioterapia].value[x] from $yesnodontknow (required)
* component[jaFezTratamentoPorRadioterapia].dataAbsentReason ..0
* component[jaFezTratamentoPorRadioterapia].interpretation ..0
* component[jaFezTratamentoPorRadioterapia].referenceRange ..0

* component[dataUltimaMenstruacao].code ^short = "Registra a data da última menstruação/regra"
* component[dataUltimaMenstruacao].code.coding.system 1..
* component[dataUltimaMenstruacao].code.coding.system = $loinc (exactly)
* component[dataUltimaMenstruacao].code.coding.code 1..
* component[dataUltimaMenstruacao].code.coding.code = #8665-2 (exactly)
* component[dataUltimaMenstruacao].code.coding.code ^short = "Data da última menstruação"
* component[dataUltimaMenstruacao].code.text ..0
* component[dataUltimaMenstruacao].value[x] only dateTime
* component[dataUltimaMenstruacao].dataAbsentReason ..0
* component[dataUltimaMenstruacao].interpretation ..0
* component[dataUltimaMenstruacao].referenceRange ..0

* component[sangramentoAposRelacao].code ^short = "Registra se tem ou teve sangramento após relações sexuais"
* component[sangramentoAposRelacao].code.coding.system 1..
* component[sangramentoAposRelacao].code.coding.system = $anamnese-citopatologia (exactly)
* component[sangramentoAposRelacao].code.coding.code 1..
* component[sangramentoAposRelacao].code.coding.code = #sangramento-relacao (exactly)
* component[sangramentoAposRelacao].code.text ..0
* component[sangramentoAposRelacao].value[x] 1..
* component[sangramentoAposRelacao].value[x] only CodeableConcept
* component[sangramentoAposRelacao].value[x] from $yesnodontknow (required)
* component[sangramentoAposRelacao].dataAbsentReason ..0
* component[sangramentoAposRelacao].interpretation ..0
* component[sangramentoAposRelacao].referenceRange ..0

* component[sangramentoAposMenopausa].code ^short = "Registra se tem ou teve sangramento após menopausa"
* component[sangramentoAposMenopausa].code.coding.system 1..
* component[sangramentoAposMenopausa].code.coding.system = $anamnese-citopatologia (exactly)
* component[sangramentoAposMenopausa].code.coding.code 1..
* component[sangramentoAposMenopausa].code.coding.code = #sangramento-menopausa (exactly)
* component[sangramentoAposMenopausa].code.text ..0
* component[sangramentoAposMenopausa].value[x] 1..
* component[sangramentoAposMenopausa].value[x] only CodeableConcept
* component[sangramentoAposMenopausa].value[x] from $yesnodontknow (required)
* component[sangramentoAposMenopausa].dataAbsentReason ..0
* component[sangramentoAposMenopausa].interpretation ..0
* component[sangramentoAposMenopausa].referenceRange ..0


Invariant: com-1
Description: "Se fornecida data do último exame, então o exame preventivo já foi realizado anteriormente."
Severity: #error
Expression: "component.code.coding.where(code = '60432-2').exists() implies component.where(code.coding.code = '1' and valueBoolean = true).exists()"

Mapping: ficha
Id: ficha
Title: "ficha de requisição de exame citopatológico"
Description: "Informações sobre a ficha de exame citopatológico"
Source: AnamneseExameCitopatologico
Target: "https://www.gov.br/inca/pt-br/assuntos/gestor-e-profissional-de-saude/envio-de-amostras-de-exames-citopatologico-e-histopatologico"