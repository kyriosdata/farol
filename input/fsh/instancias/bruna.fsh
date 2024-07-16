Alias: $motivos-exame = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-exame-citopatologico
Alias: $documentoRequisicao = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/documento-requisicao
Alias: $documentoLaudo = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/documento-laudo
Alias: $amostraRequisicao = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/amostra-requisicao
Alias: $amostra = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/amostra
Alias: $componentesLaudoCitopatologico = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/componentes-laudo-citopatologico
Alias: $requisicaoExameCitopatologico = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/requisicao-exame-citopatologico
Alias: $exameClinico = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/exame-clinico
Alias: $paciente = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente
Alias: $anamneseQuestionario = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/anamnese-questionario
Alias: $diagnosticoCitopatologico = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/diagnostico-citopatologico


Instance: bruna-requisicao
InstanceOf: Bundle
Usage: #example
Title: "Bundle requisição (Bruna)"
Description: "Requisição de exame citopatológico (Bruna). Veja a [ficha](bruna-faria.jpg) de requisição correspondente."

* type = #document

// Protocolo SISCAN
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* identifier.value = "000.000.001"

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
  * resource = anamnese-bruna

// exame (Observation)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb04"
  * resource = ExameClinicoBruna

// ------------------------------------------------------
// Composition (requisição)
// ------------------------------------------------------

Instance: requisicao-bruna
InstanceOf: Composition
Usage: #example
Title: "Documento de requisição (Bruna)"
Description: "Requisição de Exame Citopatológico da paciente Bruna"

* status = #final

* meta.profile = $documentoRequisicao

* type = http://loinc.org#47528-5
* category = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-documento#requisicao-citopatologico

* author.identifier
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
  * value = "234.234.567"  

* title = "Requisição de Exame Citopatológico"

// Data em que a composição foi montada
* date = "2023-12-13"

// Patient (Bruna)
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)

// ServiceRequest (a requisição)
* section[+]
  * title = "Detalhes da requisição (Bruna)"
  * entry[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb02)

// ------------------------------------------------------
// amostra-requisicao (Specimen)
// ------------------------------------------------------

Instance: amostra-requisicao-bruna
InstanceOf: Specimen
Title: "Amostra (requisição) (Bruna)"
Description: "Informação sobre a data da coleta e do responsável pela coleta da amostra."
Usage: #example

* meta.profile = $amostraRequisicao

* collection.collectedDateTime = "2023-10-01"
* collection.collector.identifier
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
  * value = "1234567"

// ------------------------------------------------------
// requisicao (ServiceRequest)
// ------------------------------------------------------

Instance: requisicao-02
InstanceOf: ServiceRequest
Title: "Requisição (Bruna)"
Description: "Requisição de exame citopatológico da Bruna"
Usage: #example

* meta.profile = $requisicaoExameCitopatologico

* status = #active
* intent = #order

* contained[0] = amostra-requisicao-bruna
* specimen = Reference(amostra-requisicao-bruna)

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"

// informações pessoais
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)

// motivo do exame
* reasonCode[0].coding[0] = $motivos-exame#rastreamento

// dados da anamnese
* supportingInfo[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb03)

// exame clínico
* supportingInfo[1] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb04)

// CNS da Unidade de Saúde
* requester.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* requester.identifier.value = "123456"


// ------------------------------------------------------
// informações pessoais
// ------------------------------------------------------

Instance: bruna
InstanceOf: Patient
Usage: #example
Title: "Paciente (Bruna)"
Description: "Dados demográficos da paciente Bruna"

* meta.profile = $paciente

// Cartão SUS
* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier[0].value = "72862374"

// Nome completo da mulher
* name[0].text = "Bruna Faria"
* name[0].use = #official

// Nome da mãe
* extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/filiacao"
* extension[0].valueString = "Cleusa Faria"

// Data de nascimento
* birthDate = "1997-07-17"

// Exigido por regra de negócio?
* gender = #female

// CPF
* identifier[1].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* identifier[1].value = "61366462189"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade"
* extension[1].valueAge.value = 26
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/raca-etnia"
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCode = #01 // BRANCA

* extension[3].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/extension-genero"
* extension[3].valueCodeableConcept.coding.system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/genero"
* extension[3].valueCodeableConcept.coding.code = #201

// ------------------------------------------------------
// dados da anamnese
// ------------------------------------------------------

Instance: anamnese-bruna
InstanceOf: QuestionnaireResponse
Title: "Anamnese (Bruna)"
Description: "Anamnese da paciente Bruna"
Usage: #example

* meta.profile = $anamneseQuestionario

* questionnaire = "https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico"

* status = #completed
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* author.identifier
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
  * value = "234.234.567"

* item[+]
  * linkId = "1"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Fez exame preventivo anteriormente?"

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

// ------------------------------------------------------
// exame clínico
// ------------------------------------------------------

Instance: ExameClinicoBruna
InstanceOf: Observation
Usage: #example
Title: "Exame Clínico (Bruna)"
Description: "Exame clínico da Bruna"

* meta.profile = $exameClinico

* status = #final
* code = http://loinc.org#32423-6 

* component[0].code = http://loinc.org#12044-4
* component[0].valueCodeableConcept = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-inspecao-colo#normal
* component[1].code = http://loinc.org#45687-1
* component[1].valueBoolean = true

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* performer.identifier
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
  * value = "234.234.567"
* effectiveDateTime = "2023-12-07"


// ------------------------------------------------------
// LAUDO
// ------------------------------------------------------

Instance: bruna-laudo
InstanceOf: Bundle
Usage: #example
Title: "Bundle laudo (Bruna)"
Description: "Laudo de exame citopatológico (Bruna). Veja a [ficha](bruna-faria-laudo.jpg) correspondente."

* type = #document

// Como identificar unicamente o laudo? O INCA gera um identificador?
// O valor abaixo é único por laboratório, portanto, relevante para 
// o laboratório, não para o INCA.

* identifier[0]
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
  * value = "243623"

// Data e hora em que o pacote (Bundle) do laudo foi criado
* timestamp = "2023-12-14T08:00:00-03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb09"
  * resource = composition-bruna

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

// espécime (Specimen)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb15"
  * resource = especime-bruna


Instance: composition-bruna
InstanceOf: Composition
Usage: #example
Title: "Documento de laudo (Bruna)"
Description: "Laudo de exame citopatológico da paciente Bruna"

* meta.profile = $documentoLaudo

* status = #final

// Laboratory report
* type = http://loinc.org#11502-2
* category = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-documento#laudo-citopatologico

* author.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* author.identifier.value = "123456"

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
// diagnostico
// ------------------------------------------------------

Instance: diagnostico-02
InstanceOf: DiagnosticReport
Title: "Laudo (Bruna)"
Usage: #inline
Description: "Laudo da requisição de exame da paciente Bruna. Veja a [ficha](bruna-faria-laudo.jpg) correspondente ao laudo"

* meta.profile = $diagnosticoCitopatologico
* status = #final
* code = http://loinc.org#47528-5

// Número do Exame
* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
* identifier[0].value = "243623"

* basedOn.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* basedOn.identifier.value = "000.000.001"

* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)

// Data em que foi recebido o pedido
* effectiveDateTime = "2023-12-14"

// Data em que o laudo foi produzido (UTC)
// No Brasil, UTC-3, seria 8h da manhã
* issued = "2024-02-01T11:00:00Z"

// Observation (componentes do laudo)
* result[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb11)

// CNES do laboratório
* performer[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* performer[0].identifier.value = "123456"

// Interpretação / resultado
* resultsInterpreter[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* resultsInterpreter[0].identifier.value = "123456"
* resultsInterpreter[0].extension.url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/responsabilidade"
* resultsInterpreter[0].extension.valueCode = #screening

// Informações sobre a amostra
* specimen[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb15)

* conclusionCode.coding
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/categorizacao"
  * code = #anormalidade

// ------------------------------------------------------
// componentes do laudo
// ------------------------------------------------------

Instance: laudo-componentes-02
InstanceOf: Observation
Usage: #example
Title: "Observações do laudo (Bruna)"
Description: "Observações que definem o laudo da paciente Bruna"

* meta.profile = $componentesLaudoCitopatologico

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* performer[0]
  * identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
  * identifier.value = "654321"
* effectiveDateTime = "2023-12-14"

* status = #final
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-siscan#citopatologico

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#componente
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/componente-endocervical#presente

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#glandulares
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/glandular#endometriais

* note[0].text = "Amostra parcialmente dessecada."

//------------

Instance: especime-bruna
InstanceOf: Specimen
Usage: #example
Title: "Amostra (laudo) (Bruna)"
Description: "Informações sobre a amostra identificadas pelo laboratório"

*  meta.profile = $amostra

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-amostra#convencional
* status = #available
* receivedTime = "2024-01-01"

* status.extension[0]
  * url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/detalhar"
  * valueString = "causa para rejeição aqui"

* condition[0]
  * coding[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/condicao-especime"
  * coding[0].code = #material