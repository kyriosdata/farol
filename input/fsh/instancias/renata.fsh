// ------------------------------------------------------
//
// Bundle de requisição de Exame Citopatológico
// (neste mesmo arquivo segue o Bundle do Laudo) 
// ------------------------------------------------------

Instance: bundle-renata
InstanceOf: Bundle
Usage: #example
Title: "Requisição (Renata)"
Description: "Requisição de exame citopatológico (Renata). Veja a [ficha](renata-lima.jpg) correspondente."

* type = #document

// Protocolo SISCAN
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* identifier.value = "000.000.003"

// Data e hora em que o bundle foi montado
* timestamp = "2023-12-12T08:00:00-03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb00"
  * resource = requisicao-renata

// renata (Patient)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = renata

// requisicao (ServiceRequest)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb02"
  * resource = requisicao-03

// respostas - anamnese (QuestionnaireResponse)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb03"
  * resource = respostas-anamnese-03

// unidade-saude (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb06"
  * resource = unidade-saude-03

// profissional (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb07"
  * resource = profissional-03

// encontro (Encounter)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb08"
  * resource = encontro-03

// inspeção colo (Observation)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb14"
  * resource = ExameClinicoRenata

// ------------------------------------------------------
// Composition (requisição)
// ------------------------------------------------------

Instance: requisicao-renata
InstanceOf: DocumentoRequisicao
Usage: #inline
Title: "Requisição (Renata)"
Description: "Requisição de Exame Citopatológico da paciente Renata"

* status = #final

* type = http://loinc.org#47528-5
* category = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-documento#requisicao-citopatologico

* author = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb07)
  
* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Renata"

// Data em que a composição foi montada
* date = "2023-12-12"

// Patient (Renata)
* subject = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01)

// ServiceRequest
* section[+]
  * title = "Detalhes da requisição (Renata)"
  * entry[0] = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb02)

// ------------------------------------------------------
// amostra-requisicao (Specimen)
// ------------------------------------------------------

Instance: amostra-requisicao-renata
InstanceOf: AmostraRequisicao
Usage: #inline
* collection.collectedDateTime = "2023-10-01"
* collection.collector.identifier
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
  * value = "1234567"

// ------------------------------------------------------
// requisicao (ServiceRequest)
// ------------------------------------------------------

Instance: requisicao-03
InstanceOf: RequisicaoExameCitopatologico
Title: "Requisição (Renata)"
Description: "Requisição de exame citopatológico da Renata"
Usage: #inline

* contained[0] = amostra-requisicao-renata
* specimen = Reference(amostra-requisicao-renata)

* status = #unknown
* intent = #order

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"

* subject = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01)
* reasonCode[0].coding[0] = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-exame-citopatologico#repeticao

// Permite identificar o local (unidade requisitante)
* encounter = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb08)

// respostas-anamnese
* supportingInfo[0] = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb03)

// inspeção colo
* supportingInfo[1] = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb14)

// CNS do responsável
//* requester = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb07)
* requester.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* requester.identifier.value = "123456"

Instance: encontro-03
InstanceOf: Encounter
Usage: #inline
Title: "Interação (Renata)"
Description: "Neste encontro foi coletada a amostra e criada a requisição de exame citopatológico da paciente Renata"

* status = #finished
* class.system = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB

// Data do encontro (poderia incluir o horário)
* period.start = "2023-12-12"

// paciente Renata
* subject = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01)

// unidade de saúde na qual a requisição foi produzida
* serviceProvider = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb06)


// ------------------------------------------------------
// Renata (subject da composition)
// ------------------------------------------------------

Instance: renata
InstanceOf: Paciente
Usage: #inline
Title: "Paciente (Renata)"
Description: "Paciente para a qual há requisição e laudo de exame citopatológico"

* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente"

// ------------
// OBRIGATÓRIOS 
// ------------

// Cartão SUS
* identifier[cns].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier[cns].value = "318376246"

// Nome completo da mulher
* name[0].text = "Renata Lima"
* name[0].use = #official

// Nome da mãe
* extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/filiacao"
* extension[0].valueString = "Sara Lima"

// Data de nascimento
* birthDate = "1999-11-23"

// Exigido por regra de negócio?
* gender = #female

// CPF
* identifier[cpf].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* identifier[cpf].value = "32872436"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade"
* extension[1].valueAge.value = 25
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/raca-etnia"
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCode = #03 

// Escolaridade
* extension[3].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/escolaridade"
* extension[3].valueCode = #6

// ------------------------------------------------------
// unidade-saude
// ------------------------------------------------------

Instance: unidade-saude-03
InstanceOf: UnidadeDeSaude
Usage: #inline
Title: "UBS 3"
Description: "A unidade de saúde na qual o exame citopatológico da paciente Renata é requisitado"

// CNES
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "123456"

// ------------------------------------------------------
// profissional
// ------------------------------------------------------

Instance: profissional-03
InstanceOf: Practitioner
Title: "Requisitante (Tereza)"
Description: "Profissional responsável pela requisição do exame citopatológico"
Usage: #inline

* identifier[0]
  * use = #official
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
  * value = "234.234.567"

* name[0].text = "Tereza Siqueira"

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: respostas-anamnese-03
InstanceOf: AnamneseQuestionario
Title: "Anamnese (Renata)"
Description: "Anamnese da paciente Renata"
Usage: #inline

* questionnaire = "https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico"

* status = #completed
* subject = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01)
* author = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb07)
* encounter = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb08)

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
  * answer[0].valueBoolean = true
  * text = "Sabe a data da última menstruação/regra?"

* item[+]
  * linkId = "8.1"
  * answer[0].valueDate = "2023-11-27"
//  * text = "Data da última menstruação/regra"

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

Instance: ExameClinicoRenata
InstanceOf: ExameClinico
Usage: #inline
Title: "Exame Clinico Renata"
Description: "Exame clínico da Renata"
* status = #final
* code = http://loinc.org#32423-6 

* component[inspecao].code = http://loinc.org#12044-4
* component[inspecao].valueCodeableConcept = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-inspecao-colo#normal
* component[ist].code = http://loinc.org#45687-1
* component[ist].valueBoolean = false

* subject = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01)
* performer = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb07)
* effectiveDateTime = "2023-12-07"


// ------------------------------------------------------
// LAUDO
// ------------------------------------------------------

Instance: bundle-renata-laudo
InstanceOf: Bundle
Usage: #example
Title: "Laudo (Renata)"
Description: "Laudo de exame citopatológico (Renata). Veja a [ficha](renata-lima-laudo.jpg) correspondente."

* type = #document

// Como identificar unicamente o laudo? O INCA gera um identificador?
// O valor abaixo é único por laboratório, portanto, relevante para 
// o laboratório, não para o INCA.

* identifier[0]
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
  * value = "243623"

// Data e hora em que o pacote (Bundle) do laudo foi criado
* timestamp = "2024-01-13T08:00:00-03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb09"
  * resource = composition-03-2

// Patient
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = renata

// DiagnosticReport (diagnostico)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb10"
  * resource = diagnostico-renata

// laudo (Observation - componentes do laudo)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb11"
  * resource = laudo-componentes-03

// laboratorio (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb12"
  * resource = laboratorio-renata

// citopatologista (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb13"
  * resource = citopatologista-03

// espécime (Specimen)
* entry[+]
  * fullUrl = "urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb15"
  * resource = especime-renata

Instance: composition-03-2
InstanceOf: DocumentoLaudo
Usage: #inline
Title: "Laudo (Renata)"
Description: "Laudo de exame citopatológico da paciente Renata"

* status = #final

// Laboratory report
* type = http://loinc.org#11502-2
* category = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-documento#laudo-citopatologico

* author = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb13)

* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Renata"

// Data em que a composição foi montada
* date = "2024-01-13"

// Patient
* subject = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01)

// DiagnosticReport
* section[+]
  * title = "Laudo (Renata)"
  * entry[0] = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb10)

// ------------------------------------------------------
// laboratorio
// ------------------------------------------------------

Instance: laboratorio-renata
InstanceOf: Laboratorio
Usage: #inline
Title: "Laboratório Qualidade"
Description: "Laboratório que emite o laudo de exame citopatológico"

* name = "Laboratório Qualidade"
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "654321"

// ------------------------------------------------------
// citopatologista
// ------------------------------------------------------

Instance: citopatologista-03
InstanceOf: Profissional
Title: "Citopatologista Pedro"
Description: "Profissional responsável pelo laudo do exame citopatológico da paciente Renata"
Usage: #inline

* identifier[cns].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier[cns].value = "2345234234234"
* name.text = "Pedro Cândido"

// ------------------------------------------------------
// diagnostico
// ------------------------------------------------------

Instance: diagnostico-renata
InstanceOf: DiagnosticoCitopatologico
Title: "Relatório (Renata)"
Usage: #inline
Description: "Laudo da requisição de exame da paciente Renata. Veja a [ficha](renata-lima-laudo.jpg) correspondente ao laudo"

* status = #final
* code = http://loinc.org#47528-5

* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
* identifier[0].value = "243623"

* basedOn.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* basedOn.identifier.value = "codigo-siscan-requisicao-003"

* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP

* subject = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01)

// Data em que foi recebido o pedido
* effectiveDateTime = "2023-12-16"

// Data em que o laudo foi produzido (UTC)
// No Brasil, UTC-3, seria 8h da manhã
* issued = "2024-01-13T11:00:00Z"

// Observation (componentes do laudo)
* result[0] = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb11)

//* performer[0] = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb12)
//* resultsInterpreter[0] = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb13)

//* performer[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb12)
* performer[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* performer[0].identifier.value = "123456"

//* resultsInterpreter[0] = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb13)
* resultsInterpreter[0].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* resultsInterpreter[0].identifier.value = "123456"
* resultsInterpreter[0].extension.url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/papel"
* resultsInterpreter[0].extension.valueCode = #resultado

* specimen = Reference(urn:uuid:0242d5cf-6316-4ddd-b398-168af8aaeb15)

* conclusionCode.coding
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/categorizacao"
  * code = #anormalidade

// ------------------------------------------------------
// componentes do laudo
// ------------------------------------------------------

Instance: laudo-componentes-03
InstanceOf: ComponentesLaudoCitopatologico
Usage: #inline
Title: "Itens do laudo (Renata)"
Description: "Itens que definem o laudo da paciente Renata"

* subject = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb01)
* performer[0] = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb12)

* effectiveDateTime = "2024-01-13"

* status = #final
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-siscan#citopatologico

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#componente
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/componente-endocervical#presente

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#outras-neoplasias-malignas
* component[=].valueString = "uma neoplasia"

// ------------
// especime
// ------------

Instance: especime-renata
InstanceOf: Amostra
Usage: #inline
Description: "Informações sobre a amostra identificadas pelo laboratório"

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-amostra#convencional
* status = #unavailable
* receivedTime = "2024-01-01"

* status.extension[0]
  * url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/motivo-rejeicao"
  * valueCodeableConcept.coding[0]
    * system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-especime-rejeitado"
    * code = #outras
    * extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/detalhar"
    * extension[0].valueString = "A amostra se perdeu"
