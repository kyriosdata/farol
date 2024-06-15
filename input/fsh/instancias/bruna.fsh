Alias: $racacoretnia = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade
Alias: $motivos-exame = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame-citopatologico


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
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
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
  * resource = ExameClinicoBruna

// unidade-saude (Organization)
//* entry[+]
//  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb06"
//  * resource = unidade-saude-02

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
InstanceOf: DocumentoRequisicao
Usage: #inline
Title: "Requisição (Bruna)"
Description: "Requisição de Exame Citopatológico da paciente Bruna"

* status = #final

* type = http://loinc.org#47528-5
* category = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#requisicao-citopatologico

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
// amostra-requisicao (Specimen)
// ------------------------------------------------------

Instance: amostra-requisicao-bruna
InstanceOf: AmostraRequisicao
Usage: #inline
* collection.collectedDateTime = "2023-10-01"
* collection.collector.identifier
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
  * value = "1234567"

// ------------------------------------------------------
// requisicao (ServiceRequest)
// ------------------------------------------------------

Instance: requisicao-02
InstanceOf: RequisicaoExameCitopatologico
Title: "Requisição (Bruna)"
Description: "Requisição de exame citopatológico da Bruna"
Usage: #inline

* status = #unknown
* intent = #order

* contained[0] = amostra-requisicao-bruna
* specimen = Reference(amostra-requisicao-bruna)

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"

// bruna
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)

* reasonCode[0].coding[0] = $motivos-exame#rastreamento

// Permite identificar o local (unidade requisitante)
* encounter = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb08)

// respostas-anamnese
* supportingInfo[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb03)

// ExameClinicoBruna
* supportingInfo[1] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb04)

// CNS do responsável
//* requester = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)
* requester.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* requester.identifier.value = "123456"

Instance: encontro-02
InstanceOf: Encounter
Usage: #inline
Title: "Interação (Bruna)"
Description: "Neste encontro foi coletada a amostra e criada a requisição de exame citopatológico da paciente Bruna"

* contained[0] = unidade-saude-02

* status = #finished
* class.system = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB

// Data do encontro (poderia incluir o horário)
* period.start = "2023-12-13"

// paciente Bruna
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)

// unidade de saúde na qual a requisição foi produzida
* serviceProvider = Reference(unidade-saude-02)

// ------------------------------------------------------
// exame
// ------------------------------------------------------

// Instance: exame-inspecao-02
// InstanceOf: Observation
// Usage: #inline
// Title: "Inspeção colo (Bruna)"
// Description: "Resultado da inspeção do colo uterino da paciente Bruna"

// * status = #final

// // Cervix Study observation Inspection
// * code = http://loinc.org#12044-4

// * subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
// * performer = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)
// * effectiveDateTime = "2023-12-13"

// * valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-inspecao-colo#normal


// Instance: exame-dst-02
// InstanceOf: Observation
// Usage: #inline
// Title: "DST (Bruna)"
// Description: "Exame clínico que identifica se há presença ou não de sinais de doença sexualmente transmissível"

// * status = #final

// // Sexually transmitted diseases
// * code = http://loinc.org#45687-1

// * subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
// * performer = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)
// * effectiveDateTime = "2023-12-13"

// * valueBoolean = true


Instance: ExameClinicoBruna
InstanceOf: ExameClinico
Usage: #inline
Title: "Exame Clinico Bruna"
Description: "Exame clínico da Bruna"
* status = #final
* code = http://loinc.org#32423-6 

* component[inspecao].code = http://loinc.org#12044-4
* component[inspecao].valueCodeableConcept = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-inspecao-colo#normal
* component[ist].code = http://loinc.org#45687-1
* component[ist].valueBoolean = true

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* performer = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)
* effectiveDateTime = "2023-12-07"


// ------------------------------------------------------
// Bruna (subject da composition)
// ------------------------------------------------------

Instance: bruna
InstanceOf: Paciente
Usage: #inline
Title: "Paciente (Bruna)"
Description: "Paciente para a qual há requisição e laudo de exame citopatológico"

// ------------
// OBRIGATÓRIOS 
// ------------

// Cartão SUS
* identifier[cns].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier[cns].value = "72862374"

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
* identifier[cpf].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* identifier[cpf].value = "61366462189"

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

* extension[3].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/genero"
* extension[3].valueCodeableConcept.coding.system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/genero"
* extension[3].valueCodeableConcept.coding.code = #201

// ------------------------------------------------------
// unidade-saude
// ------------------------------------------------------

Instance: unidade-saude-02
InstanceOf: UnidadeDeSaude
Usage: #inline
Title: "UBS Bem-estar"
Description: "A unidade de saúde na qual o exame citopatológico da paciente Bruna é requisitado"

// CNES
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "123456"

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
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
  * value = "234.234.567"

* name[0].text = "Renata Sampaio"

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: respostas-anamnese-02
InstanceOf: AnamneseQuestionario
Title: "Anamnese (Bruna)"
Description: "Anamnese da paciente Bruna"
Usage: #inline

* questionnaire = "https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico"

* status = #completed
* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* author = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb07)
* encounter = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb08)

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
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
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

// espécime (Specimen)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb15"
  * resource = especime-bruna


Instance: composition-02-2
InstanceOf: DocumentoLaudo
Usage: #inline
Title: "Laudo (Bruna)"
Description: "Laudo de exame citopatológico da paciente Bruna"

* status = #final

// Laboratory report
* type = http://loinc.org#11502-2
* category = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#laudo-citopatologico

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
InstanceOf: Laboratorio
Usage: #inline
Title: "Laboratório Qualidade"
Description: "Laboratório que emite o laudo de exame citopatológico"

* name = "Laboratório Cito Quality"
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "654321"

// ------------------------------------------------------
// citopatologista
// ------------------------------------------------------

Instance: citopatologista-02
InstanceOf: Practitioner
Title: "Citopatologista Joana"
Description: "Profissional responsável pelo laudo do exame citopatológico da paciente Rosa"
Usage: #inline

* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier.value = "2345234234234"
* name.text = "Joana Silva"

// ------------------------------------------------------
// diagnostico
// ------------------------------------------------------

Instance: diagnostico-02
InstanceOf: DiagnosticoCitopatologico
Title: "Relatório (Bruna)"
Usage: #inline
Description: "Laudo da requisição de exame da paciente Bruna. Veja a [ficha](bruna-faria-laudo.jpg) correspondente ao laudo"

* status = #final
* code = http://loinc.org#47528-5

* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
* identifier[0].value = "243623"

* basedOn.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
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

//* performer[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb12)
* performer[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* performer[0].identifier.value = "123456"

//* resultsInterpreter[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb13)
* resultsInterpreter[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* resultsInterpreter[0].identifier.value = "123456"
* resultsInterpreter[0].extension.url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/papel"
* resultsInterpreter[0].extension.valueCode = #screening

* specimen = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb15)
* conclusionCode.coding
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/categorizacao"
  * code = #negativo

// ------------------------------------------------------
// componentes do laudo
// ------------------------------------------------------

Instance: laudo-componentes-02
InstanceOf: ComponentesLaudoCitopatologico
Usage: #inline
Title: "Itens do laudo (Bruna)"
Description: "Itens que definem o laudo da paciente Bruna"

* subject = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb01)
* performer[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb12)
* effectiveDateTime = "2023-12-14"

* status = #final
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan#citopatologico

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#componente
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/componente-endocervical#presente


* note[0].text = "Amostra parcialmente dessecada."

//------------
// Motivo de rejeicao apenas se #unavailable (deve gerar erro)
Instance: especime-bruna
InstanceOf: Amostra
Usage: #inline
Description: "Informações sobre a amostra identificadas pelo laboratório"

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-amostra#convencional
* status = #unsatisfactory
* receivedTime = "2024-01-01"

* status.extension[0]
  * url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/motivo-insatisfatorio"
  * valueCodeableConcept.coding[0]
    * system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-especime-insatisfatorio"
    * code = #material
