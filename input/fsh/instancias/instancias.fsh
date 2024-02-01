Alias: $tipodocumento = http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoDocumento
Alias: $idade = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade
Alias: $nivel-educacional = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/nivel-educacional
Alias: $respostas-anamnese = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/respostas-anamnese
Alias: $siscan = http://saude.gov.br/SISCAN
Alias: $racacorext = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $racacor = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade
Alias: $pontoreferencia = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator
Alias: $nome-mae = http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName
Alias: $cns = https://fhir.fabrica.inf.ufg.br/ns/cns
Alias: $cpf = https://fhir.fabrica.inf.ufg.br/ns/cpf
Alias: $paciente-siscan = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente-siscan
Alias: $motivos-exame = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame
Alias: $cs-inspecao-colo = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/inspecao-colo
Alias: $anamnese-citopatologia = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/anamnese-citopatologia


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
* identifier.value = "123.456.789"

// Data e hora em que a requisição foi submetida
* timestamp = "2023-11-24T09:08:23+03:00"

// Composition (primeira entrada do bundle)
* entry[0]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb00"
  * resource = composition-1

// rosa (Patient)
* entry[1]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = rosa

// unidade-saude (Organization)
* entry[2]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb06"
  * resource = rosa

// requisicao (ServiceRequest)
* entry[3]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb02"
  * resource = requisicao

// respostas - anamnese (QuestionnaireResponse)
* entry[4]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03"
  * resource = respostas-anamnese

// exame (Observation)
* entry[5]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04"
  * resource = exame-inspecao

// exame (Observation)
* entry[6]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb05"
  * resource = exame-dst

// ------------------------------------------------------
// composition-1 0
// ------------------------------------------------------

Instance: composition-1
InstanceOf: Composition
Usage: #example
Title: "(Composition) Requisição de Exame Citopatológico"
Description: "Reúne dados de uma ficha de requisição"

* status = #final

* type = http://loinc.org#80568-9 // LOINC para FORM  (desencorajado por ser genérico)

// Responsável (profissional de saúde)
* author.identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* author.identifier.value = "234.234.567"

* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a Rosa"

// Data em que a composição foi montada
* date = "2024-01-20"

// Patient
* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)

// ServiceRequest
* section[0]
  * title = "Requisição de exame citopatológico"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb02)

* section[1]
  * title = "Respostas do questionário da anamnese"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03)

* section[2]
  * title = "Inspeção do colo"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04)

* section[3]
  * title = "Sinais sugestivos de doenças sexualmente transmissíveis"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb05)

* section[4]
  * title = "Unidade de Saúde Requisitante"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb06)
//  * entry[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cnes"
//  * entry[0].identifier.value = "234.234.567"

// ------------------------------------------------------
// requisicao (ServiceRequest)
// ------------------------------------------------------

Instance: requisicao
InstanceOf: ServiceRequest
Title: "Pedido de exame citopatológico"
Description: "Pedido de exame citopatológico"
Usage: #example

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/requisicao-exame-citopatologico"

* status = #draft
* intent = #original-order

// Data da coleta da amostra e dados da requisição
* authoredOn = "2024-01-23"

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"
  * display = "EXAME CITOPATOLÓGICO CERVICO VAGINAL/MICROFLORA-RASTREAMENTO"

* code.coding[1]
  * code = #19766-5
  * system = "http://loinc.org"

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* reasonCode[0].coding[0] = $motivos-exame#rastreamento
* supportingInfo[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03)

// exame-inspecao
* supportingInfo[1] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04)

// exame-dst
* supportingInfo[2] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb05)

// CNS do responsável
* requester.identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* requester.identifier.value = "234.234.567"


// ------------------------------------------------------
// exame
// ------------------------------------------------------

Instance: exame-inspecao
InstanceOf: Observation
Usage: #example
Title: "Inspeção do colo uterino"
Description: "Exame clínico que identifica o resultado da inspeção do colo uterino."
* status = #final

// Cervix Study observation Inspection
* code = http://loinc.org#12044-4

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* performer.identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* performer.identifier.value = "234.234.567"
* effectiveDateTime = "2023-11-10"

* valueCodeableConcept.coding = $cs-inspecao-colo#normal

Instance: exame-dst
InstanceOf: Observation
Usage: #example
Title: "Sinais sugestivos de doença sexualmente transmissível"
Description: "Exame clínico que identifica se há presença ou não de sinais de doença sexualmente transmissível"

* status = #final

// Sexually transmitted diseases
* code = http://loinc.org#45687-1

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* performer.identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* performer.identifier.value = "234.234.567"
* effectiveDateTime = "2023-11-10"

* valueBoolean = false

// ------------------------------------------------------
// rosa (subject da composition)
// ------------------------------------------------------

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
* identifier[0].value = "8934543431218990"

// Nome completo da mulher
* name[0].text = "Rosa Silva"
* name[0].use = #official

// Nome da mãe
* extension[0].url = $nome-mae
* extension[0].valueString = "Rosa Monteiro Silva"

// Data de nascimento
* birthDate = "1990-10-23"

// Exigido por regra de negócio?
* gender = #female

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
  * version = "01.00"

// Nível de escolaridade
* extension[4].url = $nivel-educacional
* extension[4].valueCode = #LA12462-0

* address[0]
  * use = #home
  * type = #physical
  * city = #315780
  //* state = http://www.saude.gov.br/fhir/r4/CodeSystem/BRDivisaoGeograficaBrasil|2023-12-14#31
  * postalCode = "74000-000"  // Nao valida a máscara xxxxx-xxx
  * line[0] = "Rua"
  * line[1] = "Rua"
  * line[2] = "23"
  * line[3] = "bloco B"
  * line.extension[0].url = $pontoreferencia
  * line.extension[0].valueString = "próximo ao supermercado"
  
* telecom[0]
  * system = #phone
  * value = "99999-9999"


// ------------------------------------------------------
// unidade-saude
// ------------------------------------------------------

Instance: unidade-saude
InstanceOf: Organization
Usage: #example
Title: "Unidade Básica de Saúde"
Description: "A unidade de saúde na qual o exame citopatológico da paciente Rosa é requisitado"

* name = "Unidade Básica do SUS"

// CNES
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cnes"
* identifier.value = "123456"

// UF e município
* address.city = "Goiânia"
* address.state = "GO"

* type.coding.system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoEstabelecimentoSaude"
* type.coding.code = #1
* type.text = "POSTO DE SAUDE"

// ------------------------------------------------------
// laboratorio
// ------------------------------------------------------

Instance: laboratorio
InstanceOf: Organization
Usage: #example
Title: "Laboratório que realiza exames citopatológicos"
Description: "Laboratório que emite o laudo do exame da paciente Rosa"

* name = "Laboratório Cito"
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cnes"
* identifier.value = "654321"

// As informações abaixo não são registradas no laudo
//* type.coding.system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoEstabelecimentoSaude"
//* type.coding.code = #80
//* type.text = "LABORATORIO DE SAUDE PUBLICA"

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

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: respostas-anamnese
InstanceOf: QuestionnaireResponse
Description: "Respostas para anamnese de exame citopatológico"

* questionnaire = Canonical(anamnese-exame-citopatologico)
* status = #completed
* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* author.identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* author.identifier.value = "234.234.567"

* item[0]
  * linkId = "1"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Fez o exame preventivo (Papanicolaou) alguma vez?"

* item[1]
  * linkId = "2"
  * answer[0].valueDate = "2024-01-01"
  * text = "Quando fez o último exame?"

* item[2]
  * linkId = "3"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Usa DIU?"

* item[3]
  * linkId = "4"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Está grávida?"

* item[4]
  * linkId = "5"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Usa pílula anticoncepcional?"

* item[5]
  * linkId = "6"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Usa hormônio/remédio para tratar a menopausa?"

* item[6]
  * linkId = "7"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Já fez tratamento por radioterapia?"

* item[7]
  * linkId = "8"
  * answer[0].valueDate = "2024-01-01"
  * text = "Data da última menstruação/regra"

* item[8]
  * linkId = "9"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Tem ou teve algum sangramento após relações sexuais? (não considerar a primeira relação sexual na vida)"

* item[9]
  * linkId = "10"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Tem ou teve algum sangramento após a menopausa? (não considerar o(s) sangramento(s) na vigência de reposição hormonal)"

* item[10]
  * linkId = "11"
  * answer[0].valueInteger = 60
  * text = "Qual a sua idade?"



// ------------------------------------------------------
// respostas
// ------------------------------------------------------

Instance: respostas
InstanceOf: Observation
Description: "Anamnese realizada para o exame citopatológico"

* meta.profile = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/br-anamnese-exame-citopatologico"

* status = #final
* code = http://loinc.org#1-8
* category = http://terminology.hl7.org/CodeSystem/observation-category#survey

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* effectiveDateTime = "2023-01-01"
* performer.identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* performer.identifier.value = "234.234.567"

* component[0].code = $anamnese-citopatologia#ja-fez
* component[0].valueCodeableConcept =	http://terminology.hl7.org/CodeSystem/v2-0136#Y

* component[1].code = http://loinc.org#60432-2
* component[1].valueDateTime = "2023-01-01"

* component[2].code = $anamnese-citopatologia#diu
* component[2].valueCodeableConcept =	http://terminology.hl7.org/CodeSystem/v2-0136#Y

* component[3].code = http://loinc.org#66174-4
* component[3].valueCodeableConcept =	http://terminology.hl7.org/CodeSystem/v2-0136#Y

* component[4].code = $anamnese-citopatologia#pilula
* component[4].valueCodeableConcept =	http://terminology.hl7.org/CodeSystem/v2-0136#Y

* component[5].code = http://loinc.org#63873-4
* component[5].valueCodeableConcept =	http://terminology.hl7.org/CodeSystem/v2-0136#Y

* component[6].code = $anamnese-citopatologia#radioterapia
* component[6].valueCodeableConcept =	http://terminology.hl7.org/CodeSystem/v2-0136#Y

* component[7].code = http://loinc.org#8665-2
* component[7].valueDateTime =	"2023-10-10"

* component[8].code = $anamnese-citopatologia#sangramento-menopausa
* component[8].valueCodeableConcept =	http://terminology.hl7.org/CodeSystem/v2-0136#Y

* component[9].code = $anamnese-citopatologia#sangramento-relacao
* component[9].valueCodeableConcept =	http://terminology.hl7.org/CodeSystem/v2-0136#Y


// ------------------------------------------------------
// profissional
// ------------------------------------------------------

Instance: profissional
InstanceOf: Practitioner
Description: "Profissional responsável pela requisição"

* identifier[0]
  * use = #official
  * system = "https://fhir.fabrica.inf.ufg.br/ns/coren"
  * value = "12.34.56.78"

* name[0].text = "João da Silva"

// ------------------------------------------------------
// profissional
// ------------------------------------------------------

Instance: enfermeira
InstanceOf: Practitioner
Title: "Enfermeira"
Description: "Profissional lotada na UBS que oferece rastreamento"
Usage: #example

/*
Substitui a narrativa gerada automaticamente, que é mais completa.
Daí segue o exemplo, mas comentado.

* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative: Practitioner</b></p></div>"
* text.status = #additional

*/

// * meta.profile = "http://rnds-fhir.saude.gov.br/StructureDefinition/BRProfissional-1.0"
* meta.lastUpdated = "2022-08-09T23:18:22.558Z"

* identifier[0]
  * system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
  * use = #usual
  * value = "234.234.567"

* identifier[1]
  * system = "https://fhir.fabrica.inf.ufg.br/ns/cpf"
  * use = #usual
  * value = "234.523.423-42"

* active = true

* name[0]
  * text = "Maria José"
  * use = #official

* name[1]
  * text = "Dama da Lamparina"
  * use = #nickname

* telecom[0]
  * system = #fax
  * value = "2345-6789"
  * use = #work
  * rank = 3

* telecom[1]
  * system = #phone
  * value = "1111-2222"
  * use = #home
  * rank = 1

* telecom[2]
  * system = #email
  * value = "maria.jose.enfermeira@posto-saude.sus.br"
  * use = #work
  * rank = 2  

* address[0]
  * use = #home
  * type = #postal
  * line = #008
  * line = "Av. T2"
  * city = "Goiânia"
  * state = "Goiás"
  * postalCode = "74215-010"

* address[1]
  * use = #work
  * type = #postal
  * line = #008
  * line = "Rua do Hospital"
  * city = "Aparecida de Goiânia"
  * state = "Goiás"
  * postalCode = "74215-010"

* gender = #female
* birthDate = "1987-10-14"

* qualification.code.coding = http://www.saude.gov.br/fhir/r4/CodeSystem/BRCBO#223505

// ------------------------------------------------------
// citopatologista
// ------------------------------------------------------

Instance: citopatologista
InstanceOf: Practitioner
Title: "Citopatologista"
Description: "Profissional lotado em laboratório que elabora e assina digitalmente o exame citopatológico"
Usage: #example

* identifier.system = "http://rnds.saude.gov.br/fhir/r4/NamingSystem/cns"
* identifier.value = "2345234234234"
* name.text = "Beltrano da Silva"
* gender = #male
* birthDate = "1987-10-14"

* photo.url = "https://randomuser.me/api/portraits/med/men/75.jpg"
* photo.title = "foto pequena"

* qualification.code.coding = http://www.saude.gov.br/fhir/r4/CodeSystem/BRCBO#225305

