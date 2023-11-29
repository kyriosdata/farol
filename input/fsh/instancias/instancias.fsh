Alias: $tipodocumento = http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoDocumento

// ------------------------------------------------------
// 
// bundle-1
// 
// ------------------------------------------------------

Instance: bundle-1
InstanceOf: Bundle
Usage: #example
Title: "Requisição de exame citopatológico"
Description: "Representa uma ficha preenchida de requisiçõa de exame citopatológico, possivelmente assinada"

* type = #document

// Protocolo SISCAN
// Associado ao Bundle porque o SISCAN (INCA) atribui
// este valor a todo o conjunto de informações, inclusive
// com a assinatura, que é fornecida no Bundle
* identifier.system = "http://saude.gov.br/SISCAN"
* identifier.value = "código protocolo SISCAN"

// Data e hora em que a requisição foi submetida
* timestamp = "2023-11-24T09:08:23+03:00"

// Composition (primeira entrada do bundle)
* entry[0]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb00"
  * resource = composition-1

// Paciente
* entry[1]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = paciente

// Requisição de exame (ServiceRequest)
* entry[2]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb02"
  * resource = requisicao

// Dados da anamnese (respostas)
* entry[3]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03"
  * resource = respostas

* entry[4]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04"
  * resource = exame

* entry[5]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb05"
  * resource = unidade-saude

// ------------------------------------------------------
// composition-1
// ------------------------------------------------------

Instance: composition-1
InstanceOf: Composition
Usage: #example
Title: "Dados da ficha de Exame Citopatológico"
Description: "Reúne dados de uma ficha de requisição"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Um documento que inclui a requisição de exame citopatológico (informações pertinentes) e representa a coleta de material para o laudo requisitado.</div>"

// REQUISIÇÃO DE EXAME (REX) a ser acrescentado?
* status = #final
* type = http://loinc.org#11485-0

// Data da coleta da amostra e dados da requisição
* date = "2023-11-20"

// Responsável
* author.identifier.system = "http://perfil.org/cns"
* author.identifier.value = "cns do profissional"

* title = "Dados da requisição de Exame Citopatológico"

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)

* section[0]
  * title = "Requisição de exame citopatológico"
  * text.status = #empty
  * text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Requisição de Serviço</div>"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb02)

* section[1]
  * title = "Dados da anamnese"
  * text.status = #empty
  * text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Dados da anamnese (respostas)</div>"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03)

* section[2]
  * title = "Exame clínico"
  * text.status = #empty
  * text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Dados do exame clínico</div>"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04)

* section[3]
  * title = "Unidade de Saúde Requisitante"
  * text.status = #empty
  * text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Unidade de Saúde Requisitante</div>"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb05)

// ------------------------------------------------------
// requisição
// ------------------------------------------------------

Instance: requisicao
InstanceOf: ServiceRequest
Usage: #example
Title: "Requisicao Um"
Description: "Requisição de exame citopatológico"

* meta.profile[0] = "http://perfil.org/requisicao-exame-citopatologico"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Detalhes de requisição de exame citopatológico</div>"

* status = #draft
* intent = #order

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"
  * display = "EXAME CITOPATOLÓGICO CERVICO VAGINAL/MICROFLORA-RASTREAMENTO"

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* reasonCode[0].coding[0] = http://perfil.org/cs-motivo-exame#rastreamento
* supportingInfo[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03)
* supportingInfo[1] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04)

// ------------------------------------------------------
// respostas (anamnese)
// ------------------------------------------------------

Instance: respostas
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "Dados de anamnese"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Respostas para o questionário (anamnese)</div>"

* meta.profile[0] = "http://perfil.org/respostas-anamnese"

* status = #completed
* questionnaire = "http://perfil.org/anamnese-exame-citopatologico"
* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* authored = "2023-01-01"

* item[0]
  * linkId = "1"
  * answer[0].valueCoding.system = "http://terminology.hl7.org/CodeSystem/v2-0136"
  * answer[0].valueCoding.code = #Y

* item[1]
  * linkId = "2"
  * answer[0].valueDate = "2023-10-11"

* item[2]
  * linkId = "3"
  * answer[0].valueCoding.system = "http://terminology.hl7.org/CodeSystem/v2-0136"
  * answer[0].valueCoding.code = #N

* item[3]
  * linkId = "4"
  * answer[0].valueCoding.system = "http://terminology.hl7.org/CodeSystem/v2-0136"
  * answer[0].valueCoding.code = #N

* item[4]
  * linkId = "5"
  * answer[0].valueCoding.system = "http://terminology.hl7.org/CodeSystem/v2-0136"
  * answer[0].valueCoding.code = #Y

* item[5]
  * linkId = "6"
  * answer[0].valueCoding.system = "http://terminology.hl7.org/CodeSystem/v2-0136"
  * answer[0].valueCoding.code = #Y

* item[6]
  * linkId = "7"
  * answer[0].valueCoding.system = "http://terminology.hl7.org/CodeSystem/v2-0136"
  * answer[0].valueCoding.code = #Y

* item[7]
  * linkId = "8"
  * answer[0].valueDate = "2023-10-11"

* item[8]
  * linkId = "9"
  * answer[0].valueCoding.system = "http://terminology.hl7.org/CodeSystem/v2-0136"
  * answer[0].valueCoding.code = #Y

* item[9]
  * linkId = "10"
  * answer[0].valueCoding.system = "http://terminology.hl7.org/CodeSystem/v2-0136"
  * answer[0].valueCoding.code = #Y


// ------------------------------------------------------
// exame
// ------------------------------------------------------

Instance: exame
InstanceOf: Observation
Usage: #example
Title: "Exame clínico visando laudo citopatológico"

* meta.profile[0] = "http://perfil.org/exame-clinico"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Exame clínico que faz parte da requisição</div>"

* status = #final
* code = http://loinc.org#1-8 // Errado deve ser preenchido

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* performer.identifier.system = "http://perfil.org/cns"
* performer.identifier.value = "cns do profissional"
* effectiveDateTime = "2023-11-10"

* component[0]
  * code = http://loinc.org#12044-4
  * valueCodeableConcept.coding = http://perfil.org/cs-inspecao-colo#normal

* component[1]
  * code = http://loinc.org#45687-1
  * valueBoolean = false

// ------------------------------------------------------
// PACIENTE (subject da composition)
// ------------------------------------------------------

Alias: $racacorext = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $racacor = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade
Alias: $pontoreferencia = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator

Instance: paciente
InstanceOf: Patient
Usage: #example
Title: "Rosa"
Description: "Paciente assistida"

* meta.profile[0] = "http://saude.gov.br/paciente"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>A paciente para a qual o exame é solicitado.</div>"

// ------------
// OBRIGATÓRIOS 
// ------------

// Cartão SUS
* identifier[0].system = "http://saude.gov.br/CNS"
* identifier[0].value = "cns da dona Rosa"

// Nome completo da mulher
* name[0].text = "Rosa Silva"

// Nome da mãe
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName"
* extension[0].valueString = "Rosa Monteiro Silva"

// Data de nascimento
* birthDate = "1990-10-23"

// ------------
// opcionais
// ------------

// Apelido da mulher
* name[1].use = #nickname
* name[1].text = "Rosinha"

// CPF
* identifier[1].system = "http://saude.gov.br/CPF"
* identifier[1].value = "12334534553"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = "http://perfil.org/idade"
* extension[1].valueAge.value = 61
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = $racacorext
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCodeableConcept = $racacor#02
* extension[2].extension[1].url = "indigenousEthnicity"
* extension[2].extension[1].valueCodeableConcept = $etniaindigena#0001

// Nacionalidade (B - brasileiro, E - estrangeiro ou N - naturalizado)
* extension[3].url = $nacionalidade
* extension[3].valueCodeableConcept.coding[0]
  * system = $cs-nacionalidade
  * code = #B

// Nível de escolaridade
* extension[4].url = "http://perfil.org/nivel-educational"
* extension[4].valueCode = #LA12462-0

* address[0]
  * use = #home
  * type = #physical
  * city = #315780
  * state = #31
  * postalCode = "74000-000"  // Nao valida a máscara xxxxx-xxx
  * line[0] = "Rua"
  * line[0].id = "street"
  * line[1] = "Rua"
  * line[1].id = "neighborhood"
  * line[2] = "23"
  * line[2].id = "number"
  * line[3] = "bloco B"
  * line[3].id = "complement"
  * line.extension[0].url = $pontoreferencia
  * line.extension[0].valueString = "próximo ao supermercado"
  
* telecom[0]
  * system = #phone
  * value = "99999-9999"

// ------------------------------------------------------
// Organization (unidade de saúde requisitante)
// ------------------------------------------------------

Instance: unidade-saude
InstanceOf: Organization
Usage: #example
Title: "UBS1"
Description: "Unidade na qual exame citopatológico é requisitado"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Unidade na qual é elaborada a requisição do exame.</div>"

* name = "Unidade Básica do SUS"

// CNES
* identifier.system = "http://saude.gov.br/CNES"
* identifier.value = "CNES da UBS"

// UF e município
* address.city = "Goiânia"
* address.state = "GO"


// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: anamnese-exame-citopatologico
InstanceOf: Questionnaire
Usage: #example
Title: "Anamnese (exame citopatológico)"
Description: "Questões pertinentes à anamnese do exame citopatológico"

* text.status = #empty
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Questões da anamnese da requisição de exame citopatológico</div>"

* url = "http://perfil.org/anamnese-exame-citopatologico"

* version = "0.0.1"
* name = "AnamneseExameCitopatologico"
* title = "Dados de Anamnese da requisição do exame citopatológico"
* status = #draft
* experimental = false
* subjectType = #Patient
* date = "2023-11-27"
* publisher = "Ministério da Saúde (INCA)"
* description = "Identifica todas as perguntas definidas na ficha de requisição de exame citopatológico."
* jurisdiction = urn:iso:std:iso:3166#BR
* purpose = "Registro das questões da anamnese para coleta de dados empregados para produção do laudo correspondente"
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
  * code[0] = http://loinc.org#60432-2
  * text = "Quando fez o último exame?"
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