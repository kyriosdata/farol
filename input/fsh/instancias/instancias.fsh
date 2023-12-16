Alias: $tipodocumento = http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoDocumento
Alias: $idade = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade
Alias: $nivel-educacional = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/nivel-educacional
Alias: $respostas-anamnese = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/respostas-anamnese
Alias: $siscan = http://saude.gov.br/SISCAN

// ------------------------------------------------------
// 
// Requisição de Exame Citopatológico
// 
// ------------------------------------------------------

Instance: bundle-1
InstanceOf: Bundle
Usage: #example
Title: "Requisição de exame citopatológico"
Description: "Todos os dados pertinentes a uma ficha de requisição de exame citopatológico."

* type = #document

// Protocolo SISCAN
// Associado ao Bundle porque o SISCAN (INCA) atribui
// este valor a todo o conjunto de informações, inclusive
// com a assinatura, que é fornecida no Bundle
* identifier.system = $siscan
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
  * resource = rosa

// Requisição de exame (ServiceRequest)
* entry[2]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb02"
  * resource = requisicao

// Dados da anamnese (respostas)
* entry[3]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03"
  * resource = respostas

// Dados do exame clínico
* entry[4]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04"
  * resource = exame

// Dados da unidade de saúde
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
  //* entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb02)
  * entry[0] = Reference(requisicao-tipica)

* section[1]
  * title = "Dados da anamnese"
  * text.status = #empty
  * text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Dados da anamnese para requisição de exame citopatológico</div>"
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

Alias: $motivos-exame = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame

Instance: requisicao
InstanceOf: ServiceRequest
Title: "Pedido de exame citopatológico"
Description: "Pedido de exame citopatológico"
Usage: #example

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/requisicao-exame-citopatologico"

* status = #draft
* intent = #original-order

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"
  * display = "EXAME CITOPATOLÓGICO CERVICO VAGINAL/MICROFLORA-RASTREAMENTO"

* subject = Reference(paciente)
* reasonCode[0].coding[0] = $motivos-exame#rastreamento
* supportingInfo[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03)
* supportingInfo[1] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04)


// ------------------------------------------------------
// exame
// ------------------------------------------------------

Alias: $cs-inspecao-colo = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/inspecao-colo

Instance: exame
InstanceOf: Observation
Usage: #example
Title: "Exame clínico visando laudo citopatológico"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/exame-clinico"

* status = #final
* code = http://loinc.org#1-8 // Errado deve ser preenchido

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* performer.identifier.system = "http://perfil.org/cns"
* performer.identifier.value = "cns do profissional"
* effectiveDateTime = "2023-11-10"

* component[0]
  * code = http://loinc.org#12044-4
  * valueCodeableConcept.coding = $cs-inspecao-colo#normal

* component[1]
  * code = http://loinc.org#45687-1
  * valueBoolean = false

// ------------------------------------------------------
// paciente (subject da composition)
// ------------------------------------------------------

Alias: $racacorext = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $racacor = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade
Alias: $pontoreferencia = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator
Alias: $nome-mae = http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName
Alias: $cns = http://saude.gov.br/CNS
Alias: $cpf = http://saude.gov.br/CPF
Alias: $paciente-siscan = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente-siscan

Instance: rosa
InstanceOf: Patient
Usage: #example
Title: "Rosa"
Description: "Paciente assistida"

* meta.profile[0] = $paciente-siscan

// ------------
// OBRIGATÓRIOS 
// ------------

// Cartão SUS
* identifier[0].system = $cns
* identifier[0].value = "cns da dona Rosa"

// Nome completo da mulher
* name[0].text = "Rosa Silva"

// Nome da mãe
* extension[0].url = $nome-mae
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
* identifier[1].system = $cpf
* identifier[1].value = "12334534553"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = $idade
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
* extension[4].url = $nivel-educacional
* extension[4].valueCode = #LA12462-0

// ERRO: 
// Atributo id foi removido pois gerador de Narrativas gera erro

* address[0]
  * use = #home
  * type = #physical
  * city = #315780
  * state = #31
  * postalCode = "74000-000"  // Nao valida a máscara xxxxx-xxx
  * line[0] = "Rua"
//  * line[0].id = "street"
  * line[1] = "Rua"
//  * line[1].id = "neighborhood"
  * line[2] = "23"
//  * line[2].id = "number"
  * line[3] = "bloco B"
//  * line[3].id = "complement"
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
Usage: #definition
Title: "Anamnese (exame citopatológico)"
Description: "Questões pertinentes à anamnese do exame citopatológico"

* url = "https://fhir.fabrica.inf.ufg.br/ccu/anamnese-exame-citopatologico"

* version = "0.0.1"
* name = "AnamneseExameCitopatologico"
* title = "Questionário (dados de Anamnese) da requisição do exame citopatológico"
* status = #draft
* experimental = false
* subjectType = #Patient
* date = "2023-11-27"
* publisher = "Ministério da Saúde (INCA)"
* description = "Identifica todas as perguntas contidas na ficha de requisição de exame citopatológico e os possíveis valores para cada uma delas."
* jurisdiction = urn:iso:std:iso:3166#BR
* purpose = "Definir conjunto específico de questões da anamnese para visando montar requisição de exame citopatológico conforme ficha definida pelo INCA (Ministério da Saúde)."
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

* item[10]
  * linkId = "11"
  * type = #integer
  * text = "Qual a sua idade?"
  * required = true
  * repeats = false
  * readOnly = true
  * maxLength = 3

// ------------------------------------------------------
// respostas (anamnese)
// ------------------------------------------------------

Instance: respostas
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "Exemplo de anamnese preenchida para exame citopatológico."
Description: "Respostas para anamnese de exame citopatológico"

* meta.profile[0] = $respostas-anamnese

* status = #completed
* questionnaire = "https://fhir.fabrica.inf.ufg.br/ccu/anamnese-exame-citopatologico"
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

* item[10]
  * linkId = "11"
  * answer[0].valueInteger = -3


// ------------------------------------------------------
// requisicao-tipica
// ------------------------------------------------------

Instance: requisicao-tipica
InstanceOf: ServiceRequest
Title: "Requisição típica"
Description: "Requisição de example citopatológico"
Usage: #example

* meta.lastUpdated = "2022-08-09T23:18:22.558Z"

/*
  O identificador da requisição
*/
* identifier[0]
  * system = "http://goias.gov.br/fhir/ns/siscan"
  * value = "12345678"

* status = #active
* intent = #order

* instantiatesCanonical = "http://farol-ig.s3-website-sa-east-1.amazonaws.com/ActivityDefinition-coleta.html"
* instantiatesUri = "http://farol-ig.s3-website-sa-east-1.amazonaws.com/ActivityDefinition-coleta.html"

* code = http://loinc.org#19766-5

* subject = Reference(paciente)

/*
  Consulta na qual a requisição foi criada
*/

//* encounter = Reference(consulta)

* authoredOn = "2022-08-09T23:18:22.558Z"

/*
  Unidade que requisita
*/

* requester = Reference(enfermeira)


