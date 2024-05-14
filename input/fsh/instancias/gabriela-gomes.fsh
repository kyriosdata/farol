Alias: $tipodocumento = http://www.saude.gov.br/fhir/r4/CodeSystem/BRTipoDocumento
Alias: $idade = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade
Alias: $escolaridade = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/escolaridade
Alias: $racacor = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor
Alias: $racacoretnia = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade
Alias: $pontoreferencia = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator
Alias: $paciente-siscan = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente
Alias: $motivos-exame = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivos-exame-citopatologico
Alias: $cs-inspecao-colo = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo
Alias: $anamnese-exame-citopatologico = https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico

// ------------------------------------------------------
// 
// Bundle de requisição de Exame Citopatológico
// Conforme https://www.hl7.org/fhir/r4/bundle.html#bundle-unique
// Where a resource is not assigned a persistent identity that can be used in the Bundle, 
// a UUID should be used (urn:uuid:...).
// ------------------------------------------------------

Instance: bundle-gabriela-gomes
InstanceOf: Bundle
Usage: #example
Title: "Requisição (Gabriela)"
Description: "Requisição de exame citopatológico (Gabriela). Veja a [ficha](gabriela-gomes.jpg) correspondente."

* type = #document

// Protocolo SISCAN
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* identifier.value = "000.000.001"

// Data e hora em que a requisição foi submetida
* timestamp = "2023-12-23T09:08:23+03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb00"
  * resource = requisicao-gabriela

// gabriela (Patient)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = gabriela

// requisicao (ServiceRequest)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb02"
  * resource = requisicao-01

// respostas - anamnese (QuestionnaireResponse)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb03"
  * resource = respostas-anamnese-01

// exame (Observation)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb04"
  * resource = ExameClinicoGabriela

// unidade-saude (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb06"
  * resource = unidade-saude-01

// profissional (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb07"
  * resource = profissional-01

// encontro (Encounter)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb08"
  * resource = encontro-01

// ------------------------------------------------------
// requisicao-gabriela
// ------------------------------------------------------

Instance: requisicao-gabriela
InstanceOf: DocumentoRequisicao
Usage: #inline
Title: "Requisição (Gabriela)"
Description: "Requisição de Exame Citopatológico da paciente Gabriela"

* status = #final

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#requisicao-citopatologico

* author = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb07)
  
* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Gabriela Gomes"

// Data em que a composição foi montada
* date = "2023-12-23"

// Patient
* subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)

// ServiceRequest
* section[+]
  * title = "Detalhes da requisição (Gabriela Gomes)"
  * entry[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb02)

* section[+]
  * title = "Anamnese (Gabriela Gomes - composition)"
  * entry[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb03)

* section[+]
  * title = "Exame clínico"
  * entry[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb04)

* section[+]
  * title = "UBS (Gabriela Gomes)"
  * entry[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb06)

// ------------------------------------------------------
// requisicao (ServiceRequest)
// ------------------------------------------------------

Instance: requisicao-01
InstanceOf: RequisicaoExameCitopatologico
Title: "Requisição (Gabriela Gomes)"
Description: "Requisição de exame citopatológico da Gabriela Gomes"
Usage: #inline

* status = #draft
* intent = #order

// Data da coleta da amostra e dados da requisição
* authoredOn = "2023-12-23"

* code.coding[0]
  * code = #0203010086
  * system = "http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS"

* subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)
* reasonCode[0].coding[0] = $motivos-exame#seguimento

* encounter = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb08)

// respostas-anamnese
* supportingInfo[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb03)

// exame-clinico
* supportingInfo[1] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb04)

// CNS do responsável
* requester = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb07)

Instance: encontro-01
InstanceOf: Encounter
Usage: #inline
Title: "Interação (Gabriela Gomes)"
Description: "Neste encontro foi coletada a amostra e criada a requisição de exame citopatológico"

* status = #finished
* class.system = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)
* serviceProvider = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb06)

// ------------------------------------------------------
// exame
// ------------------------------------------------------

// Instance: exame-inspecao-01
// InstanceOf: Observation
// Usage: #inline
// Title: "Inspeção colo (Gabriela Gomes)"
// Description: "Resultado da inspeção do colo uterino da paciente Gabriela"
// * status = #final

// // Cervix Study observation Inspection
// * code = http://loinc.org#12044-4

// * subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)
// * performer = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb07)
// * effectiveDateTime = "2023-12-23"

// * valueCodeableConcept.coding = $cs-inspecao-colo#alterado


// Instance: exame-dst-01
// InstanceOf: Observation
// Usage: #inline
// Title: "DST (Gabriela Gomes)"
// Description: "Exame clínico que identifica se há presença ou não de sinais de doença sexualmente transmissível"

// * status = #final

// // Sexually transmitted diseases
// * code = http://loinc.org#45687-1

// * subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)
// * performer = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb07)
// * effectiveDateTime = "2023-12-23"

// * valueBoolean = false

Instance: ExameClinicoGabriela
InstanceOf: ExameClinico
Usage: #example
Title: "Exame Clinico Gabriela"
Description: "Exame clínico da Gabriela"
* status = #final
* code = http://loinc.org#32423-6 

* component[inspecao].code = http://loinc.org#12044-4
* component[inspecao].valueCodeableConcept = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo#alterado
* component[dst].code = http://loinc.org#45687-1
* component[dst].valueBoolean = false

* subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)
* performer = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb07)
* effectiveDateTime = "2023-12-07"


// ------------------------------------------------------
// gabriela (subject da composition)
// ------------------------------------------------------

Instance: gabriela
InstanceOf: Paciente
Usage: #inline
Title: "Paciente (Gabriela Gomes)"
Description: "Paciente para a qual há requisição e laudo de exame citopatológico"

// ------------
// OBRIGATÓRIOS 
// ------------

// Cartão SUS
* identifier[cns].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier[cns].value = "7384287632"

// Nome completo da mulher
* name[0].text = "Gabriela Gomes"
* name[0].use = #official

// Nome da mãe
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName"
* extension[0].valueString = "Sara Gomes"

// Data de nascimento
* birthDate = "1986-01-10"

// Exigido por regra de negócio?
* gender = #female

// CPF
* identifier[cpf].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* identifier[cpf].value = "03287297344"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = $idade
* extension[1].valueAge.value = 38
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/raca-etnia"
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCode = #03 // PARDA

// ------------------------------------------------------
// unidade-saude
// ------------------------------------------------------

Instance: unidade-saude-01
InstanceOf: Estabelecimento
Usage: #inline
Title: "UBS Vida Saudável"
Description: "A unidade de saúde na qual o exame citopatológico da paciente Gabriela Gomes é requisitado"

// CNES
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "123456"

// ------------------------------------------------------
// profissional
// ------------------------------------------------------

Instance: profissional-01
InstanceOf: Practitioner
Title: "Requisitante (Rita)"
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

Instance: respostas-anamnese-01
InstanceOf: AnamneseQuestionario
Title: "Anamnese (Gabriela Gomes)"
Description: "Anamnese da paciente Gabriela"
Usage: #inline

* questionnaire = $anamnese-exame-citopatologico

* status = #completed
* subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)
* author = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb07)
* encounter = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb08)

* item[+]
  * linkId = "1"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/data-absent-reason#asked-unknown
  * text = "Fez o exame preventivo (Papanicolaou) alguma vez?"

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
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
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

Instance: bundle-gabriela-gomes-laudo
InstanceOf: Bundle
Usage: #example
Title: "Laudo (Gabriela)"
Description: "Laudo de exame citopatológico (Gabriela). Veja a [ficha](gabriela-gomes-laudo.jpg) correspondente."

* type = #document

// Como identificar unicamente o laudo?
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* identifier.value = "laudo-gabriela-123"

// Data e hora em que o pacote (Bundle) do laudo foi criado
* timestamp = "2023-12-23T09:08:23+03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb09"
  * resource = laudo-gabriela

// Patient
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01"
  * resource = gabriela

// DiagnosticReport (diagnostico)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb10"
  * resource = diagnostico-01

// laudo (Observation - componentes do laudo)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb11"
  * resource = laudo-componentes-01

// laboratorio (Organization)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb12"
  * resource = laboratorio-gabriela

// citopatologista (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb13"
  * resource = citopatologista-01


Instance: laudo-gabriela
InstanceOf: Composition
Usage: #inline
Title: "Laudo (Gabriela Gomes)"
Description: "Laudo de exame citopatológico da paciente Gabriela Gomes"

* status = #final

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#laudo-citopatologico

* author = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb13)

* title = "Pacote contendo todos os dados da requisição de Exame Citopatológico para a paciente fictícia Rosa"

// Data em que a composição foi montada
* date = "2024-01-20"

// Patient
* subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)

// DiagnosticReport
* section[+]
  * title = "Laudo (Gabriela Gomes)"
  * entry[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb10)

// ------------------------------------------------------
// laboratorio
// ------------------------------------------------------

Instance: laboratorio-gabriela
InstanceOf: Laboratorio
Usage: #inline
Title: "Laboratório Premium"
Description: "Laboratório que emite o laudo de exame citopatológico"

* name = "Laboratório Cito"
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "654321"

// ------------------------------------------------------
// citopatologista
// ------------------------------------------------------

Instance: citopatologista-01
InstanceOf: Practitioner
Title: "Citopatologista Rita"
Description: "Profissional responsável pelo laudo do exame citopatológico da paciente Rosa"
Usage: #inline

* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier.value = "2345234234234"
* name.text = "Rita Goreti"

// ------------------------------------------------------
// diagnostico
// ------------------------------------------------------

Instance: diagnostico-01
InstanceOf: DiagnosticoCitopatologico
Title: "Relatório (Gabriela Gomes)"
Usage: #inline
Description: "Laudo da requisição de exame da paciente Gabriela Gomes. Veja a [ficha](gabriela-gomes-laudo.jpg) correspondente ao laudo"

* status = #final
* code = http://loinc.org#47528-5

* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
* identifier[0].value = "cito-gabriela-gomes-123"

* extension[numeroExame].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/numero-exame"
* extension[numeroExame].valueString = "c1"

* extension[dataRecebido].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/recebido-em"
* extension[dataRecebido].valueDate = "2024"

* basedOn.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* basedOn.identifier.value = "codigo-siscan-requisicao-123"

* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP

* subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)

// Data em que foi recebido o pedido
* effectiveDateTime = "2024-01-03"

// Data em que o laudo foi produzido (UTC)
// No Brasil, UTC-3, seria 8h da manhã
* issued = "2024-02-01T11:00:00Z"

// Observation (componentes do laudo)
* result[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb11)

* performer[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb12)
* resultsInterpreter[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb13)


// ------------------------------------------------------
// componentes do laudo
// ------------------------------------------------------

Instance: laudo-componentes-01
InstanceOf: ComponentesLaudoCitopatologico
Usage: #inline
Title: "Itens do laudo (Gabriela Gomes)"
Description: "Itens que definem o laudo da paciente Gabriela Gomes"

* subject = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb01)
* performer[0] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb13)
* performer[1] = Reference(urn:uuid:0142d5cf-6316-4ddd-b398-168af8aaeb12)
* effectiveDateTime = "2024-02-01T11:00:00Z"

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

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#indeterminado-escamosas
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/celulas-atipicas-escamosas#asc-h

* component[+].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudo-tipo-item#indeterminado-glandulares
* component[=].valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/celulas-atipicas#alto-grau

* note[0].text = "Amostra parcialmente dessecada."