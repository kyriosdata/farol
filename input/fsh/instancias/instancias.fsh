Alias: $tipodocumento = http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoDocumento
Alias: $idade = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade
Alias: $nivel-educacional = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/nivel-educacional
Alias: $siscan = http://saude.gov.br/SISCAN
Alias: $racacor = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor
Alias: $racacoretnia = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade
Alias: $pontoreferencia = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator
Alias: $cns = https://fhir.fabrica.inf.ufg.br/ns/cns
Alias: $cpf = https://fhir.fabrica.inf.ufg.br/ns/cpf
Alias: $paciente-siscan = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente
Alias: $motivos-exame = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame-citopatologico
Alias: $anamnese-exame-citopatologico = https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico

// ------------------------------------------------------
// 
// Requisição de Exame Citopatológico
// 
// ------------------------------------------------------

Instance: bundle-rosa
InstanceOf: Bundle
Usage: #example
Title: "(Bundle) Requisição de exame citopatológico (Rosa)"
Description: "Pacote que reúne todos os dados pertinentes à requisição de exame citopatológico da paciente Rosa"

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
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb00"
  * resource = requisicao-rosa

// rosa (Patient)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = rosa

// requisicao (ServiceRequest)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb02"
  * resource = requisicao

// respostas - anamnese (QuestionnaireResponse)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03"
  * resource = respostas-anamnese

// exame (Observation)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04"
  * resource = exame-inspecao

// exame (Observation)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb05"
  * resource = exame-dst

// unidade-saude (Organization)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb06"
  * resource = unidade-saude

// profissional (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb07"
  * resource = profissional

// ------------------------------------------------------
// requisicao-rosa (requisição)
// ------------------------------------------------------

Instance: requisicao-rosa
InstanceOf: Composition
Usage: #example
Title: "Requisição de Exame Citopatológico da paciente Rosa"
Description: "Requisição de Exame Citopatológico da paciente Rosa"

* status = #final

* type = http://loinc.org#80568-9 // LOINC para FORM  (desencorajado por ser genérico)

* author = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb07)
  
* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Rosa"

// Data em que a composição foi montada
* date = "2024-01-20"

// Patient
* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)

// ServiceRequest
* section[+]
  * title = "Requisição de exame citopatológico"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb02)

* section[+]
  * title = "Respostas do questionário da anamnese"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03)

* section[+]
  * title = "Inspeção do colo"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04)

* section[+]
  * title = "Sinais sugestivos de doenças sexualmente transmissíveis"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb05)

* section[+]
  * title = "Unidade de Saúde Requisitante"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb06)

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
//  * display = "EXAME CITOPATOLÓGICO CERVICO VAGINAL/MICROFLORA-RASTREAMENTO"

// Microscopic observation [Identifier] in Cervical or vaginal smear or scraping by Cyto stain Narrative
//* code.coding[1]
//  * code = #19766-5
//  * system = "http://loinc.org"

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* reasonCode[0].coding[0] = $motivos-exame#rastreamento

// respostas-anamnese
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
Title: "Rosa (inspeção do colo uterino)"
Description: "Resultado da inspeção do colo uterino da paciente Rosa"

* meta.profile = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/inspecao-colo"

* status = #final

// Cervix Study observation Inspection
* code = http://loinc.org#12044-4

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* performer.identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* performer.identifier.value = "234.234.567"
* effectiveDateTime = "2023-11-10"

* valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo#normal

Instance: exame-dst
InstanceOf: Observation
Usage: #example
Title: "Rosa possui sinais sugestivos de DST?"
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
Title: "Rosa (paciente)"
Description: "Paciente para a qual há requisição e laudo de exame citopatológico"

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
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName"
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
* extension[2].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/etnia"
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCoding = $racacor#02
* extension[2].extension[1].url = "indigenousEthnicity"
* extension[2].extension[1].valueCoding = $etniaindigena#0001

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
  * value = "+55 21 99999-9999"


// ------------------------------------------------------
// unidade-saude
// ------------------------------------------------------

Instance: unidade-saude
InstanceOf: Organization
Usage: #inline
Title: "UBS"
Description: "A unidade de saúde na qual o exame citopatológico da paciente Rosa é requisitado"

* name = "Unidade Básica Santa Tatiana"

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
// profissional
// ------------------------------------------------------

Instance: profissional
InstanceOf: Practitioner
Title: "Profissional de Saúde"
Description: "Profissional responsável pela requisição do exame citopatológico para a paciente Rosa"

* identifier[0]
  * use = #official
  * system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
  * value = "234.234.567"

* name[0].text = "João da Silva"

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: respostas-anamnese
InstanceOf: QuestionnaireResponse
Title: "Anamnese (exemplo)"
Description: "Exemplo de respostas para anamnese de exame citopatológico de uma requisição para a paciente Rosa"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/anamnese-questionario"
* questionnaire = $anamnese-exame-citopatologico

* status = #completed
//* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
//* author.identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
//* author.identifier.value = "234.234.567"

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
// LAUDO
// ------------------------------------------------------

Instance: composition-2
InstanceOf: Composition
Usage: #example
Title: "(Composition) Laudo de Exame Citopatológico"
Description: "Laudo de exame citopatológico da paciente Rosa"

* status = #final

// Laboratory report
* type = http://loinc.org#11502-2

* author = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb07)

* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Rosa"

// Data em que a composição foi montada
* date = "2024-01-20"

// Patient
* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)

// ServiceRequest
* section[+]
  * title = "Requisição de exame citopatológico"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb02)

* section[+]
  * title = "Respostas do questionário da anamnese"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03)

* section[+]
  * title = "Inspeção do colo"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04)

* section[+]
  * title = "Sinais sugestivos de doenças sexualmente transmissíveis"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb05)

* section[+]
  * title = "Unidade de Saúde Requisitante"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb06)

// ------------------------------------------------------
// lab
// ------------------------------------------------------

Instance: lab
InstanceOf: Organization
Usage: #example
Title: "Laboratório Citopatológico"
Description: "Laboratório que emite o laudo de exame citopatológico"

* name = "Laboratório Cito"
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cnes"
* identifier.value = "654321"

// As informações abaixo não são registradas no laudo
//* type.coding.system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoEstabelecimentoSaude"
//* type.coding.code = #80
//* type.text = "LABORATORIO DE SAUDE PUBLICA"

// ------------------------------------------------------
// citopatologista
// ------------------------------------------------------

Instance: citopatologista
InstanceOf: Practitioner
Title: "Citopatologista"
Description: "Profissional responsável pelo laudo do exame citopatológico da paciente Rosa"
Usage: #example

* identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* identifier.value = "2345234234234"
* name.text = "Beltrano da Silva"

// ------------------------------------------------------
// diagnostico
// ------------------------------------------------------

Instance: diagnostico
InstanceOf: DiagnosticReport
Title: "Laudo de Exame Citopatológico"
Usage: #inline
Description: "Laudo da requisição de exame da paciente Rosa"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/diagnostico-citopatologico"
* status = #final
* code.text = "Microscopic observation [Identifier] in Cervix by Cyto stain"
* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #10524-7

* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ns/laboratorio"
* identifier[0].value = "cito-exame-123"

* basedOn = Reference(requisicao)

* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP
* subject = Reference(rosa)
* effectiveDateTime = "2024-01-01"
* issued = "2017-01-01T00:00:00Z"

* result[0] = Reference(laudo-componentes)

* performer[0] = Reference(lab)
* resultsInterpreter[0] = Reference(citopatologista)

// ------------------------------------------------------
// rejeicao
// ------------------------------------------------------

Instance: laudo-componentes
InstanceOf: Observation
Usage: #example
Title: "Componentes do laudo da paciente Rosa"
Description: "Itens que definem o laudo da paciente Rosa"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/componentes-laudo-citopatologico"

* status = #final
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan#citopatologico

* component[0].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#epitelios-na-amostra
* component[0].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-epitelios#escamoso

* component[1].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#adequabilidade
* component[1].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-adequabilidade#outros
* component[1].valueCodeableConcept.text = "Aqui segue a especificação para o item 'Outros'"

* component[2].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#normalidade
* component[2].valueBoolean = true

* component[3].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#alteracoes-benignas
* component[3].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/alteracoes-celulares-benignas#radiacao
* component[3].valueCodeableConcept.text = "Raios Gama"

* component[4].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#microbiologia
* component[4].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/microbiologias#outros-bacilos
* component[4].valueCodeableConcept.text = "Aqui segue a especificação dos outros bacilos"


* note[0].text = "Aqui seguem as observações gerais"
