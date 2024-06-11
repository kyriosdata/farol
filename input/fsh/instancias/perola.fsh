// ------------------------------------------------------
// Bundle de requisição de Exame Citopatológico
// (neste mesmo arquivo segue o Bundle do Laudo) 
// ------------------------------------------------------

Instance: bundle-perola
InstanceOf: Bundle
Usage: #example
Title: "Requisição (Pérola)"
Description: "Requisição de exame citopatológico (Pérola). Veja a [ficha](perola-faria.jpg) correspondente."

* type = #document

// Protocolo SISCAN
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* identifier.value = "000.000.004"

// Data e hora em que o bundle foi montado
* timestamp = "2023-12-14T08:00:00-03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb00"
  * resource = composition-perola

// perola (Patient)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = perola

// requisicao (ServiceRequest)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb02"
  * resource = requisicao-04

// respostas - anamnese (QuestionnaireResponse)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb03"
  * resource = respostas-anamnese-04

// unidade-saude (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb06"
  * resource = unidade-saude-04

// profissional (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb07"
  * resource = profissional-04

// encontro (Encounter)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb08"
  * resource = encontro-04

// supportingInfo (DST)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb14"
  * resource = ExameClinicoPerola

// ------------------------------------------------------
// Composition (requisição)
// ------------------------------------------------------

Instance: composition-perola
InstanceOf: DocumentoRequisicao
Usage: #inline
Title: "Requisição (Pérola)"
Description: "Requisição de Exame Citopatológico da paciente Pérola"

* status = #final

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#requisicao-citopatologico

* author = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb07)
  
* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Pérola"

// Data em que a composição foi montada
* date = "2023-12-14"

// Patient (Pérola)
* subject = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01)

// ServiceRequest
* section[+]
  * title = "Detalhes da requisição (Pérola)"
  * entry[0] = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb02)

// ------------------------------------------------------
// amostra-requisicao (Specimen)
// ------------------------------------------------------

Instance: amostra-requisicao-perola
InstanceOf: AmostraRequisicao
Usage: #inline
* collection.collectedDateTime = "2023-10-01"
* collection.collector.identifier
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
  * value = "1234567"


// ------------------------------------------------------
// requisicao (ServiceRequest)
// ------------------------------------------------------

Instance: requisicao-04
InstanceOf: RequisicaoExameCitopatologico
Title: "Requisição (Pérola)"
Description: "Requisição de exame citopatológico da Pérola"
Usage: #inline

* status = #unknown
* intent = #order

* contained[0] = amostra-requisicao-perola
* specimen = Reference(amostra-requisicao-perola)

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"

* subject = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01)
* reasonCode[0].coding[0] = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame-citopatologico#seguimento

// Permite identificar o local (unidade requisitante)
* encounter = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb08)

// respostas-anamnese
* supportingInfo[0] = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb03)

// DST
* supportingInfo[1] = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb14)

// CNS do responsável
//* requester = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb07)
* requester.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* requester.identifier.value = "123456"


Instance: encontro-04
InstanceOf: Encounter
Usage: #inline
Title: "Interação (Pérola)"
Description: "Neste encontro foi coletada a amostra e criada a requisição de exame citopatológico da paciente Pérola"

* status = #finished
* class.system = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB

// Data do encontro (poderia incluir o horário)
* period.start = "2023-12-14"

// paciente
* subject = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01)

// unidade de saúde na qual a requisição foi produzida
* serviceProvider = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb06)


// ------------------------------------------------------
// Renata (subject da composition)
// ------------------------------------------------------

Instance: perola
InstanceOf: Paciente
Usage: #inline
Title: "Paciente (Pérola)"
Description: "Paciente para a qual há requisição e laudo de exame citopatológico"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente"

// ------------
// OBRIGATÓRIOS 
// ------------

// Cartão SUS
* identifier[cns].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier[cns].value = "23638763212"

// Nome completo da mulher
* name[0].text = "Pérola Faria"
* name[0].use = #official

// Nome da mãe
* extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/filiacao"
* extension[0].valueString = "Jade Faria"

// Data de nascimento
* birthDate = "1987-02-27"

// Exigido por regra de negócio?
* gender = #female

// CPF
* identifier[cpf].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* identifier[cpf].value = "61366389369"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade"
* extension[1].valueAge.value = 36
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/raca-etnia"
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCode = #01 

// ------------------------------------------------------
// unidade-saude
// ------------------------------------------------------

Instance: unidade-saude-04
InstanceOf: UnidadeDeSaude
Usage: #inline
Title: "UBS 4"
Description: "A unidade de saúde na qual o exame citopatológico da paciente Pérola é requisitado"

// CNES
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "123456"

// ------------------------------------------------------
// profissional
// ------------------------------------------------------

Instance: profissional-04
InstanceOf: Practitioner
Title: "Requisitante (Rita 3)"
Description: "Profissional responsável pela requisição do exame citopatológico"
Usage: #inline

* identifier[0]
  * use = #official
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
  * value = "234.234.567"

* name[0].text = "Rita Goreti"

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: respostas-anamnese-04
InstanceOf: AnamneseQuestionario
Title: "Anamnese (Pérola)"
Description: "Anamnese da paciente Pérola"
Usage: #inline

* questionnaire = "https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico"

* status = #completed
* subject = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01)
* author = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb07)
* encounter = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb08)

* item[+]
  * linkId = "1"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Fez exame preventivo anteriormente?"

* item[+]
  * linkId = "2"
  * text = "Quando fez o último exame?"
  * answer[0].valueDate = "2022"

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
  * text = "Uso de anticoncepcional hormonal?"

* item[+]
  * linkId = "6"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
  * text = "Uso de reposição hormonal?"

* item[+]
  * linkId = "7"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
  * text = "Já fez tratamento por radioterapia?"

* item[+]
  * linkId = "8"
  * answer[0].valueBoolean = false
  * text = "Sabe a data da última menstruação/regra?"

* item[+]
  * linkId = "9"
  * answer[0].valueBoolean = true
  * text = "Tem ou teve algum sangramento após relações sexuais? (não considerar a primeira relação sexual na vida)"

* item[+]
  * linkId = "10"
  * answer[0].valueBoolean = false
  * text = "Tem ou teve algum sangramento após a menopausa? (não considerar o(s) sangramento(s) na vigência de reposição hormonal)"

* item[+]
  * linkId = "11"
  * answer[0].valueBoolean = false
  * text = "Vacina contra HPV"


Instance: ExameClinicoPerola
InstanceOf: ExameClinico
Usage: #example
Title: "Exame Clinico Pérola"
Description: "Exame clínico da Pérola"
* status = #final
* code = http://loinc.org#32423-6 

* component[inspecao].code = http://loinc.org#12044-4
* component[inspecao].valueCodeableConcept = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo#normal
* component[ist].code = http://loinc.org#45687-1
* component[ist].valueBoolean = false

* subject = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01)
* performer = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb07)
* effectiveDateTime = "2023-12-07"


// ------------------------------------------------------
// LAUDO
// ------------------------------------------------------

Instance: bundle-perola-laudo
InstanceOf: Bundle
Usage: #example
Title: "Laudo (Pérola)"
Description: "Laudo de exame citopatológico (Pérola). Veja a [ficha](perola-faria-laudo.jpg) correspondente."

* type = #document

// Como identificar unicamente o laudo? O INCA gera um identificador?
// O valor abaixo é único por laboratório, portanto, relevante para 
// o laboratório, não para o INCA.

* identifier[0]
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
  * value = "132423"

// Data e hora em que o pacote (Bundle) do laudo foi criado
* timestamp = "2024-01-13T08:00:00-03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb09"
  * resource = composition-04-2

// Patient
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = perola

// DiagnosticReport (diagnostico)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb10"
  * resource = diagnostico-perola

// laudo (Observation - componentes do laudo)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb11"
  * resource = laudo-componentes-04

// laboratorio (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb12"
  * resource = laboratorio-perola

// citopatologista (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb13"
  * resource = citopatologista-04

// espécime (Specimen)
* entry[+]
  * fullUrl = "urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb15"
  * resource = especime-perola


Instance: composition-04-2
InstanceOf: DocumentoLaudo
Usage: #inline
Title: "Laudo (Renata)"
Description: "Laudo de exame citopatológico da paciente Renata"

* status = #final

// Laboratory report
* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#laudo-citopatologico

* author = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb13)

* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Renata"

// Data em que a composição foi montada
* date = "2024-01-13"

// Patient
* subject = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01)

// DiagnosticReport
* section[+]
  * title = "Diagnóstico (Pérola)"
  * entry[0] = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb10)

// ------------------------------------------------------
// laboratorio
// ------------------------------------------------------

Instance: laboratorio-perola
InstanceOf: Laboratorio
Usage: #inline
Title: "Laboratório Qualidade"
Description: "Laboratório que emite o laudo de exame citopatológico"

* name = "Prevenção"
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "654321"

// ------------------------------------------------------
// citopatologista
// ------------------------------------------------------

Instance: citopatologista-04
InstanceOf: Practitioner
Title: "Citopatologista Tânia"
Description: "Profissional responsável pelo laudo do exame citopatológico da paciente Pérola"
Usage: #inline

* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier.value = "2345234234234"
* name.text = "Tânia Carreiro"

// ------------------------------------------------------
// diagnostico
// ------------------------------------------------------

Instance: diagnostico-perola
InstanceOf: DiagnosticoCitopatologico
Title: "Relatório (Pérola)"
Usage: #inline
Description: "Laudo da requisição de exame da paciente Pérola. Veja a [ficha](perola-faria-laudo.jpg) correspondente ao laudo"

* status = #final
* code = http://loinc.org#47528-5

* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
* identifier[0].value = "243623"

* basedOn.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* basedOn.identifier.value = "codigo-siscan-requisicao-004"

* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP

* subject = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01)

// Data em que foi recebido o pedido
* effectiveDateTime = "2023-12-16"

// Data em que o laudo foi produzido (UTC)
// No Brasil, UTC-3, seria 8h da manhã
* issued = "2024-01-13T11:00:00Z"

// Observation (componentes do laudo)
* result[0] = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb11)

//* performer[0] = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb12)
//* resultsInterpreter[0] = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb13)

//* performer[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb12)
* performer[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* performer[0].identifier.value = "123456"

//* resultsInterpreter[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb13)
* resultsInterpreter[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* resultsInterpreter[0].identifier.value = "123456"

* specimen[0] = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb15)

* conclusionCode.coding
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/categorizacao"
  * code = #negativo

// ------------------------------------------------------
// componentes do laudo
// ------------------------------------------------------

Instance: laudo-componentes-04
InstanceOf: ComponentesLaudoCitopatologico
Usage: #inline
Title: "Itens do laudo (Pérola)"
Description: "Itens que definem o laudo da paciente Pérola"

* subject = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb01)
* performer[0] = Reference(urn:uuid:0442d5cf-6316-4ddd-b398-168af8aaeb12)
* effectiveDateTime = "2024-01-13"

* status = #final
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan#citopatologico

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#componente
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/componente-endocervical#presente

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#epitelio-metaplasico-na-amostra
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#normalidade
* component[=].valueBoolean = false

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#microbiologia-lactobacillus
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#indeterminado-escamosas
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/celulas-atipicas-escamosas#asc-h

* note[0].text = "Amostra parcialmente obscurecida por sangue."

// ------------
// especime
// ------------

Instance: especime-perola
InstanceOf: Amostra
Description: "Informações sobre a amostra identificadas pelo laboratório"

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-amostra#convencional
* status = #available
* receivedTime = "2024-01-01"

