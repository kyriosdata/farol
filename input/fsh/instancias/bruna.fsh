Alias: $racacoretnia = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade
Alias: $pontoreferencia = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator
Alias: $cpf = https://fhir.fabrica.inf.ufg.br/ns/cpf
Alias: $motivos-exame = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame-citopatologico
Alias: $anamnese-exame-citopatologico = https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico

// ------------------------------------------------------
// 
// Bundle de requisição de Exame Citopatológico
// Conforme https://www.hl7.org/fhir/r4/bundle.html#bundle-unique
// Where a resource is not assigned a persistent identity that can be used in the Bundle, 
// a UUID should be used (urn:uuid:...).
// ------------------------------------------------------

Instance: bundle-bruna
InstanceOf: Bundle
Usage: #example
Title: "Requisição (Bruna)"
Description: "Requisição de exame citopatológico (Bruna). Veja a [ficha](bruna-faria.jpg) de requisição correspondente."

* type = #document

// Protocolo SISCAN
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/siscan"
* identifier.value = "000.000.002"

// Data e hora em que o bundle foi montado
* timestamp = "2023-12-13T08:00:00-03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb00"
  * resource = requisicao-bruna

// bruna (Patient)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = bruna

// requisicao (ServiceRequest)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb02"
  * resource = requisicao-02

// respostas - anamnese (QuestionnaireResponse)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb03"
  * resource = respostas-anamnese-02

// exame (Observation)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb04"
  * resource = exame-inspecao-02

// exame (Observation)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb05"
  * resource = exame-dst-02

// unidade-saude (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb06"
  * resource = unidade-saude-02

// profissional (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07"
  * resource = profissional-02

// encontro (Encounter)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb08"
  * resource = encontro-02

// ------------------------------------------------------
// Composition (requisição)
// ------------------------------------------------------

Instance: requisicao-bruna
InstanceOf: Composition
Usage: #inline
Title: "Requisição (Bruna)"
Description: "Requisição de Exame Citopatológico da paciente Bruna"

* status = #final

* type = http://loinc.org#80568-9 // LOINC para FORM  (desencorajado por ser genérico)

* author = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)
  
* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Bruna"

// Data em que a composição foi montada
* date = "2023-12-13"

// Patient (Bruna)
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)

// ServiceRequest
* section[+]
  * title = "Detalhes da requisição (Bruna)"
  * entry[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb02)

// ------------------------------------------------------
// requisicao (ServiceRequest)
// ------------------------------------------------------

Instance: requisicao-02
InstanceOf: ServiceRequest
Title: "Requisição (Bruna)"
Description: "Requisição de exame citopatológico da Bruna"
Usage: #inline

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/requisicao-exame-citopatologico"

* status = #unknown
* intent = #order

// Data da coleta da amostra e dados da requisição
* authoredOn = "2023-12-13"

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* reasonCode[0].coding[0] = $motivos-exame#rastreamento

// Permite identificar o local (unidade requisitante)
* encounter = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb08)

// respostas-anamnese
* supportingInfo[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb03)

// exame-inspecao
* supportingInfo[1] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb04)

// exame-dst-01
* supportingInfo[2] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb05)

// CNS do responsável
* requester = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)

Instance: encontro-02
InstanceOf: Encounter
Usage: #inline
Title: "Interação (Bruna)"
Description: "Neste encontro foi coletada a amostra e criada a requisição de exame citopatológico da paciente Bruna"

* status = #finished
* class.system = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB

// Data do encontro (poderia incluir o horário)
* period.start = "2023-12-13"

// paciente Bruna
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)

// unidade de saúde na qual a requisição foi produzida
* serviceProvider = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb06)

// ------------------------------------------------------
// exame
// ------------------------------------------------------

Instance: exame-inspecao-02
InstanceOf: Observation
Usage: #inline
Title: "Inspeção colo (Bruna)"
Description: "Resultado da inspeção do colo uterino da paciente Bruna"

* status = #final

// Cervix Study observation Inspection
* code = http://loinc.org#12044-4

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* performer = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)
* effectiveDateTime = "2023-12-13"

* valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo#normal


Instance: exame-dst-02
InstanceOf: Observation
Usage: #inline
Title: "DST (Bruna)"
Description: "Exame clínico que identifica se há presença ou não de sinais de doença sexualmente transmissível"

* status = #final

// Sexually transmitted diseases
* code = http://loinc.org#45687-1

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* performer = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)
* effectiveDateTime = "2023-12-13"

* valueBoolean = true

// ------------------------------------------------------
// Bruna (subject da composition)
// ------------------------------------------------------

Instance: bruna
InstanceOf: Patient
Usage: #inline
Title: "Paciente (Bruna)"
Description: "Paciente para a qual há requisição e laudo de exame citopatológico"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente"

// ------------
// OBRIGATÓRIOS 
// ------------

// Cartão SUS
* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* identifier[0].value = "72862374"

// Nome completo da mulher
* name[0].text = "Bruna Faria"
* name[0].use = #official

// Nome da mãe
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName"
* extension[0].valueString = "Cleusa Faria"

// Data de nascimento
* birthDate = "1997-07-17"

// Exigido por regra de negócio?
* gender = #female

// CPF
* identifier[1].system = $cpf
* identifier[1].value = "61366462189"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade"
* extension[1].valueAge.value = 26
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/etnia"
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCoding = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor#01 // BRANCA

// ------------------------------------------------------
// unidade-saude
// ------------------------------------------------------

Instance: unidade-saude-02
InstanceOf: Organization
Usage: #inline
Title: "UBS Bem-estar"
Description: "A unidade de saúde na qual o exame citopatológico da paciente Bruna é requisitado"

* name = "Unidade Básica Bem-estar"

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

Instance: profissional-02
InstanceOf: Practitioner
Title: "Requisitante (Renata)"
Description: "Profissional responsável pela requisição do exame citopatológico"
Usage: #inline

* identifier[0]
  * use = #official
  * system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
  * value = "234.234.567"

* name[0].text = "Renata Sampaio"

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: respostas-anamnese-02
InstanceOf: QuestionnaireResponse
Title: "Anamnese (Bruna)"
Description: "Anamnese da paciente Bruna"
Usage: #inline

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/anamnese-questionario"
* questionnaire = $anamnese-exame-citopatologico

* status = #completed
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* author = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)

* item[+]
  * linkId = "1"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Fez o exame preventivo (Papanicolaou) alguma vez?"

* item[+]
  * linkId = "2"
  * text = "Quando fez o último exame?"
  * answer[0].valueDate = "2021"

* item[+]
  * linkId = "3"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
  * text = "Usa DIU?"

* item[+]
  * linkId = "4"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
  * text = "Está grávida?"

* item[+]
  * linkId = "5"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Usa pílula anticoncepcional?"

* item[+]
  * linkId = "6"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
  * text = "Usa hormônio/remédio para tratar a menopausa?"

* item[+]
  * linkId = "7"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
  * text = "Já fez tratamento por radioterapia?"

* item[+]
  * linkId = "9"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Tem ou teve algum sangramento após relações sexuais? (não considerar a primeira relação sexual na vida)"

* item[+]
  * linkId = "10"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
  * text = "Tem ou teve algum sangramento após a menopausa? (não considerar o(s) sangramento(s) na vigência de reposição hormonal)"

* item[+]
  * linkId = "11"
  * answer[0].valueInteger = 26
  * text = "Qual a sua idade?"


// ------------------------------------------------------
// LAUDO
// ------------------------------------------------------

Instance: bundle-bruna-laudo
InstanceOf: Bundle
Usage: #example
Title: "Laudo (Bruna)"
Description: "Laudo de exame citopatológico (Bruna). Veja a [ficha](bruna-faria-laudo.jpg) correspondente."

* type = #document

// Como identificar unicamente o laudo? O INCA gera um identificador?
// O valor abaixo é único por laboratório, portanto, relevante para 
// o laboratório, não para o INCA.

* identifier[0]
  * system = "https://fhir.fabrica.inf.ufg.br/ns/laboratorio"
  * value = "243623"

// Data e hora em que o pacote (Bundle) do laudo foi criado
* timestamp = "2023-12-14T08:00:00-03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb09"
  * resource = composition-02-2

// Patient
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = bruna

// DiagnosticReport (diagnostico)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb10"
  * resource = diagnostico-02

// laudo (Observation - componentes do laudo)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb11"
  * resource = laudo-componentes-02

// laboratorio (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb12"
  * resource = laboratorio-bruna

// citopatologista (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb13"
  * resource = citopatologista-02


Instance: composition-02-2
InstanceOf: Composition
Usage: #inline
Title: "Laudo (Bruna)"
Description: "Laudo de exame citopatológico da paciente Bruna"

* status = #final

// Laboratory report
* type = http://loinc.org#11502-2

* author = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb13)

* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Bruna"

// Data em que a composição foi montada
* date = "2024-01-16"

// Patient
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)

// DiagnosticReport
* section[+]
  * title = "Laudo (Bruna)"
  * entry[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb10)

// ------------------------------------------------------
// laboratorio
// ------------------------------------------------------

Instance: laboratorio-bruna
InstanceOf: Organization
Usage: #inline
Title: "Laboratório Qualidade"
Description: "Laboratório que emite o laudo de exame citopatológico"

* name = "Laboratório Cito Quality"
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cnes"
* identifier.value = "654321"

// ------------------------------------------------------
// citopatologista
// ------------------------------------------------------

Instance: citopatologista-02
InstanceOf: Practitioner
Title: "Citopatologista Joana"
Description: "Profissional responsável pelo laudo do exame citopatológico da paciente Rosa"
Usage: #inline

* identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
* identifier.value = "2345234234234"
* name.text = "Joana Silva"

// ------------------------------------------------------
// diagnostico
// ------------------------------------------------------

Instance: diagnostico-02
InstanceOf: DiagnosticReport
Title: "Relatório (Bruna)"
Usage: #inline
Description: "Laudo da requisição de exame da paciente Bruna. Veja a [ficha](bruna-faria-laudo.jpg) correspondente ao laudo"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/diagnostico-citopatologico"
* status = #final
* code.text = "Microscopic observation [Identifier] in Cervix by Cyto stain"
* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #10524-7

* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ns/laboratorio"
* identifier[0].value = "243623"

* basedOn.identifier.system = "https://fhir.fabrica.inf.ufg.br/ns/siscan"
* basedOn.identifier.value = "codigo-siscan-requisicao-002"

* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)

// Data em que foi recebido o pedido
* effectiveDateTime = "2023-12-14"

// Data em que o laudo foi produzido (UTC)
// No Brasil, UTC-3, seria 8h da manhã
* issued = "2024-02-01T11:00:00Z"

// Observation (componentes do laudo)
* result[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb11)

* performer[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb12)
* resultsInterpreter[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb13)


// ------------------------------------------------------
// componentes do laudo
// ------------------------------------------------------

Instance: laudo-componentes-02
InstanceOf: Observation
Usage: #inline
Title: "Itens do laudo (Bruna)"
Description: "Itens que definem o laudo da paciente Bruna"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/componentes-laudo-citopatologico"

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* performer = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb13)
* effectiveDateTime = "2023-12-14"

* status = #final
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan#citopatologico

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#epitelio-escamoso-na-amostra
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#epitelio-glandular-na-amostra
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#epitelio-metaplasico-na-amostra
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#adequabilidade
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-adequabilidade#satisfatoria

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#normalidade
* component[=].valueBoolean = false

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#benigna-inflamacao
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#benigna-reparacao
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#microbiologia-cocos
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#microbiologia-trichomonas
* component[=].valueBoolean = true

* note[0].text = "Amostra parcialmente dessecada."