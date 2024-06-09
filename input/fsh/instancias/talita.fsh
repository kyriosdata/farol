// ------------------------------------------------------
// Talita (paciente)
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb01
InstanceOf: Patient
Usage: #inline
Title: "Paciente (Talita)"
Description: "Paciente fictícia para requisição e laudo de exame citopatológico"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente"

// Cartão SUS
* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier[0].value = "288274000123"

// Nome completo da mulher
* name[0].text = "Talita Moreira"
* name[0].use = #official

// Nome da mãe
* extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/filiacao"
* extension[0].valueString = "Ana Paula Moreira"

// Data de nascimento
* birthDate = "2000-03-11"

// Exigido por regra de negócio?
* gender = #female

// CPF
* identifier[1].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* identifier[1].value = "73282472"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade"
* extension[1].valueAge.value = 24
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/raca-etnia"
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCode = #03 

// ------------------------------------------------------
// unidade requisitante
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb06
InstanceOf: UnidadeDeSaude
Usage: #inline
Title: "UBS 5"
Description: "A unidade de saúde na qual o exame citopatológico da paciente Talita é requisitado"

// CNES
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "123456"

// ------------------------------------------------------
// profissional
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb07
InstanceOf: Practitioner
Title: "Requisitante (Leonarda)"
Description: "Profissional responsável pela requisição do exame citopatológico"
Usage: #inline

* identifier[0]
  * use = #official
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
  * value = "234.234.567"

* name[0].text = "Leonarda Morais"

// // ------------------------------------------------------
// // exame
// // ------------------------------------------------------

// Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb04
// InstanceOf: Observation
// Usage: #inline
// Title: "Inspeção colo (Talita)"
// Description: "Resultado da inspeção do colo uterino da paciente Talita"

// * status = #final

// // Cervix Study observation Inspection
// * code = http://loinc.org#12044-4

// * subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)
// * performer = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb07)
// * effectiveDateTime = "2023-12-07"

// * valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo#normal


// Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb05
// InstanceOf: Observation
// Usage: #inline
// Title: "DST (Talita)"
// Description: "Exame clínico que identifica se há presença ou não de sinais de doença sexualmente transmissível"

// * status = #final

// // Sexually transmitted diseases
// * code = http://loinc.org#45687-1

// * subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)
// * performer = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb07)
// * effectiveDateTime = "2023-12-07"

// * valueBoolean = true


// ------------------------------------------------------
// exame clínico
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb04
InstanceOf: ExameClinico
Usage: #example
Title: "Exame Clinico Talita"
Description: "Exame clínico da Talita"
* status = #final
* code = http://loinc.org#32423-6 

* component[inspecao].code = http://loinc.org#12044-4
* component[inspecao].valueCodeableConcept = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo#normal
* component[ist].code = http://loinc.org#45687-1
* component[ist].valueBoolean = false

* subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)
* performer = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb07)
* effectiveDateTime = "2023-12-07"

// ------------------------------------------------------
// anamnese
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb03
InstanceOf: AnamneseQuestionario
Title: "Anamnese (Talita)"
Description: "Anamnese da paciente Talita"
Usage: #inline

* questionnaire = "https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico"

* status = #completed
* subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)
* author = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb07)
* encounter = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb08)

* item[+]
  * linkId = "1"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
  * text = "Fez exame preventivo anteriormente?"

* item[+]
  * linkId = "3"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Usa DIU?"

* item[+]
  * linkId = "4"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/data-absent-reason#asked-unknown
  * text = "Está grávida?"

* item[+]
  * linkId = "5"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
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
  * answer[0].valueBoolean = true
  * text = "Sabe a data da última menstruação/regra?"  

* item[+]
  * linkId = "8.1"
  * answer[0].valueDate = "2023-10-03"
  * text = "Data da última menstruação/regra"

* item[+]
  * linkId = "9"
  * answer[0].valueBoolean = false
  * text = "Tem ou teve algum sangramento após relações sexuais? (não considerar a primeira relação sexual na vida)"

* item[+]
  * linkId = "10"
  * answer[0].valueBoolean = false
  * text = "Tem ou teve algum sangramento após a menopausa? (não considerar o(s) sangramento(s) na vigência de reposição hormonal)"

* item[+]
  * linkId = "11"
  * answer[0].valueBoolean = false
  * text = "Vacina contra HPV"


// ------------------------------------------------------
//
// consulta (encontro)
// 
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb08
InstanceOf: Encounter
Usage: #inline
Title: "Interação (Talita)"
Description: "Neste encontro foi coletada a amostra e criada a requisição de exame citopatológico da paciente Talita"

* status = #finished
* class.system = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB

// Data do encontro (poderia incluir o horário)
* period.start = "2023-12-07"

// paciente
* subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)

// unidade de saúde na qual a requisição foi produzida
* serviceProvider = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb06)

// ------------------------------------------------------
// requisicao (ServiceRequest)
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb02
InstanceOf: RequisicaoExameCitopatologico
Title: "Requisição (Talita)"
Description: "Requisição de exame citopatológico da Talita"
Usage: #inline

* status = #unknown
* intent = #order

// Data da coleta da amostra e dados da requisição
* authoredOn = "2023-12-07"

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"

* subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)
* reasonCode[0].coding[0] = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame-citopatologico#rastreamento

// Permite identificar o local (unidade requisitante)
* encounter = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb08)

// respostas-anamnese
* supportingInfo[0] = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb03)

// exame clínico
* supportingInfo[1] = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb04)

// profissional
// * requester = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb07)
* requester.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* requester.identifier.value = "123456"

// ------------------------------------------------------
// Composition (requisição)
// ------------------------------------------------------

Instance: composition-talita
InstanceOf: DocumentoRequisicao
Usage: #inline
Title: "Requisição (Talita)"
Description: "Requisição de Exame Citopatológico da paciente Talita"

* status = #final

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#requisicao-citopatologico

* author = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb07)
  
* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Talita"

// Data em que a composição foi montada
* date = "2023-12-07"

// Patient (Talita)
* subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)

// ServiceRequest
* section[+]
  * title = "Detalhes da requisição (Pérola)"
  * entry[0] = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb02)

// ------------------------------------------------------
//
// Bundle de requisição de Exame Citopatológico
// (neste mesmo arquivo segue o Bundle do Laudo) 
// ------------------------------------------------------

Instance: bundle-talita
InstanceOf: Bundle
Usage: #example
Title: "Requisição (Talita)"
Description: "Requisição de exame citopatológico (Talita). Veja a [ficha](talita-moreira.jpg) correspondente."

* type = #document

// Protocolo SISCAN
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* identifier.value = "000.000.005"

// Data e hora em que o bundle foi montado
* timestamp = "2023-12-07T08:00:00-03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb00"
  * resource = composition-talita

// talita (Patient)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb01

// requisicao (ServiceRequest)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb02"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb02

// respostas - anamnese (QuestionnaireResponse)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb03"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb03

// exame clínico
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb04"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb04

// unidade-saude (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb06"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb06

// profissional (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb07"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb07

// encontro (Encounter)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb08"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb08


// ------------------------------------------------------
// 
// LAUDO
// 
// ------------------------------------------------------

// ------------------------------------------------------
// laboratorio que emite o laudo
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb12
InstanceOf: Laboratorio
Usage: #inline
Title: "Laboratório Quali"
Description: "Laboratório que emite o laudo de exame citopatológico"

* name = "Prevenção"
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "654321"

// ------------------------------------------------------
// citopatologista que assina o laudo
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb13
InstanceOf: Practitioner
Title: "Citopatologista Rita"
Description: "Profissional responsável pelo laudo do exame citopatológico da paciente Talita"
Usage: #inline

* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier.value = "2345234234234"
* name.text = "Rita Goreti"

// ------------------------------------------------------
// observações do laudo (o conteúdo do laudo propriamente dito)
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb11
InstanceOf: ComponentesLaudoCitopatologico
Usage: #inline
Title: "Itens do laudo (Talita)"
Description: "Itens que definem o laudo da paciente Talita"

* subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)
* performer[0] = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb13)
* performer[1] = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb12)
* effectiveDateTime = "2024-01-12"

* status = #final
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan#citopatologico

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#componente
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/componente-endocervical#presente

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#epitelio-metaplasico-na-amostra
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#normalidade
* component[=].valueBoolean = false

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#benigna-inflamacao
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#microbiologia-actinomyces
* component[=].valueBoolean = true

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#microbiologia-bacilos
* component[=].valueBoolean = true

// ------------------------------------------------------
// diagnostico (o contexto do laudo, o relatório diagnóstico)
// ------------------------------------------------------

Instance: 0542d5cf-6316-4ddd-b398-168af8aaeb10
InstanceOf: DiagnosticoCitopatologico
Title: "Relatório (Talita)"
Usage: #inline
Description: "Laudo da requisição de exame da paciente Talita. Veja a [ficha](talita-moreira-laudo.jpg) correspondente ao laudo"

* status = #final
* code = http://loinc.org#47528-5

* extension[numeroExame].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/numero-exame"
* extension[numeroExame].valueString = "c1"

* extension[dataRecebido].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/recebido-em"
* extension[dataRecebido].valueDate = "2024"

* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
* identifier[0].value = "243623"

* basedOn.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* basedOn.identifier.value = "codigo-siscan-requisicao-005"

* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP

* subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)

// Data em que foi recebido o pedido
* effectiveDateTime = "2023-12-13"

// Data em que o laudo foi produzido (UTC)
// No Brasil, UTC-3, seria 8h da manhã
* issued = "2024-01-12T11:00:00Z"

// Observation (componentes do laudo)
* result[0] = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb11)

// quem realizou o laudo
//* performer[0] = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb13)

// laboratório (organização) responsável pela conclusão do laudo
//* resultsInterpreter[0] = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb12)

//* performer[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb12)
* performer[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* performer[0].identifier.value = "123456"

//* resultsInterpreter[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb13)
* resultsInterpreter[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* resultsInterpreter[0].identifier.value = "123456"

* specimen[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb15)

* conclusionCode.coding
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/categorizacao"
  * code = #anormalidade

// ------------------------------------------------------
// Um documento FHIR é uma Composition que reúne os
// elementos do documento. É a composição que oferece
// uma orientação para os vários componentes do documento.
// ------------------------------------------------------

Instance: laudo-talita
InstanceOf: Composition
Usage: #inline
Title: "Laudo (Talita)"
Description: "Laudo de exame citopatológico da paciente Talita"

* status = #final

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#laudo-citopatologico

* author = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb13)

* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Talita"

// Data em que a composição foi montada
* date = "2024-01-13"

// Patient
* subject = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01)

// DiagnosticReport
* section[+]
  * title = "Diagnóstico (Talita)"
  * entry[0] = Reference(urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb10)

// ------------------------------------------------------
// Todos os componentes do documento FHIR devem estar
// explicitamente referenciados, possivelmente contidos,
// em um Bundle.
// ------------------------------------------------------

Instance: bundle-talita-laudo
InstanceOf: Bundle
Usage: #example
Title: "Laudo (Talita)"
Description: "Laudo de exame citopatológico (Talita). Veja a [ficha](talita-moreira-laudo.jpg) correspondente."

* type = #document

// Como identificar unicamente o laudo? O INCA gera um identificador?
// O valor abaixo é único por laboratório, portanto, relevante para 
// o laboratório, não para o INCA.

* identifier[0]
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
  * value = "132423"

// Data e hora em que o pacote (Bundle) do laudo foi criado
* timestamp = "2024-01-12T08:00:00-03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb09"
  * resource = laudo-talita

// Patient
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb01

// DiagnosticReport (diagnostico)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb10"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb10

// laudo (Observation - componentes do laudo)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb11"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb11

// laboratorio (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb12"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb12

// citopatologista (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0542d5cf-6316-4ddd-b398-168af8aaeb13"
  * resource = 0542d5cf-6316-4ddd-b398-168af8aaeb13

// espécime (Specimen)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb15"
  * resource = especime-talita

// ------------
// especime
// ------------

Instance: especime-talita
InstanceOf: Amostra
Description: "Informações sobre a amostra identificadas pelo laboratório"

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-amostra#convencional
* status = #unavailable
* receivedTime = "2024-01-01"

* status.extension[0]
  * url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/motivo-rejeicao"
  * valueCodeableConcept.coding[0]
    * system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-especime-rejeitado"
    * code = #identificacao
