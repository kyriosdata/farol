Alias: $idade = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade
Alias: $racacor = http://www.saude.gov.br/fhir/r4/CodeSystem/BRRacaCor
Alias: $racacoretnia = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
Alias: $etniaindigena = http://www.saude.gov.br/fhir/r4/CodeSystem/BREtniaIndigena
Alias: $nacionalidade = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade
Alias: $cs-nacionalidade = http://www.saude.gov.br/fhir/r4/CodeSystem/BRNacionalidade
Alias: $cns = https://fhir.fabrica.inf.ufg.br/ccu/sid/cns
Alias: $cpf = https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf
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
Title: "Requisição (Rosa)"
Description: "Requisição de exame citopatológico (Rosa)."

* type = #document

// Protocolo SISCAN
// Associado ao Bundle porque o SISCAN (INCA) atribui
// este valor a todo o conjunto de informações, inclusive
// com a assinatura, que é fornecida no Bundle
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan"
* identifier.value = "123.456.789"

// Data e hora em que a requisição foi submetida
* timestamp = "2023-11-24T09:08:23+03:00"

// Composition (primeira entrada do bundle)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb00"
  * resource = RequisicaoRosa

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
  * resource = ExameClinicoRosa

// unidade-saude (Organization)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb06"
  * resource = unidade-saude

// profissional (Practitioner)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb07"
  * resource = profissional

// encontro (Encounter)
* entry[+]
  * fullUrl = "urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb08"
  * resource = encontro

// ------------------------------------------------------
// RequisicaoRosa (requisição)
// ------------------------------------------------------

Instance: RequisicaoRosa
InstanceOf: DocumentoRequisicao
Usage: #inline
Title: "Requisição (Rosa)"
Description: "Requisição de Exame Citopatológico da paciente Rosa"

* status = #final

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#requisicao-citopatologico

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

// ------------------------------------------------------
// requisicao (ServiceRequest)
// ------------------------------------------------------

Instance: requisicao
InstanceOf: RequisicaoExameCitopatologico
Title: "Requisição (Rosa)"
Description: "Requisição de exame citopatológico da Rosa"
Usage: #inline

* status = #draft
* intent = #order

* extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/identificador-prontuario"
* extension[0].valueString = "123.4444-34G456"

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

* encounter = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb08)

// respostas-anamnese
* supportingInfo[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb03)

// exame-clinico
* supportingInfo[1] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04)

// CNS do responsável
//* requester = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb07)
* requester.identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* requester.identifier.value = "123456"


Instance: encontro
InstanceOf: Encounter
Usage: #inline
Title: "Interação (Rosa)"
Description: "Neste encontro foi coletada a amostra e criada a requisição de exame citopatológico"

* status = #finished
* class.system = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* serviceProvider = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb06)

// ------------------------------------------------------
// exame
// ------------------------------------------------------

// Instance: exame-inspecao
// InstanceOf: Observation
// Usage: #inline
// Title: "Inspeção colo (Rosa)"
// Description: "Resultado da inspeção do colo uterino da paciente Rosa"

// * meta.profile = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/inspecao-colo"

// * status = #final

// // Cervix Study observation Inspection
// * code = http://loinc.org#12044-4

// * subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
// * performer = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb07)
// * effectiveDateTime = "2023-11-10"

// * valueCodeableConcept.coding = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo#normal


// Instance: exame-dst
// InstanceOf: Observation
// Usage: #inline
// Title: "DST (Rosa)"
// Description: "Exame clínico que identifica se há presença ou não de sinais de doença sexualmente transmissível"

// * meta.profile = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/presenca-dst"

// * status = #final

// // Sexually transmitted diseases
// * code = http://loinc.org#45687-1

// * subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
// * performer = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb07)

// * effectiveDateTime = "2023-11-10"

// * valueBoolean = false

Instance: ExameClinicoRosa
InstanceOf: ExameClinico
Usage: #example
Title: "Exame Clinico Rosa"
Description: "Exame clínico da Rosa"
* status = #final
* code = http://loinc.org#32423-6 

* component[inspecao].code = http://loinc.org#12044-4
* component[inspecao].valueCodeableConcept = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultados-inspecao-colo#normal
* component[ist].code = http://loinc.org#45687-1
* component[ist].valueBoolean = false

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* performer = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb07)
* effectiveDateTime = "2023-12-07"

// ------------------------------------------------------
// rosa (subject da composition)
// ------------------------------------------------------

Instance: rosa
InstanceOf: Paciente
Usage: #inline
Title: "Paciente (Rosa)"
Description: "Paciente para a qual há requisição e laudo de exame citopatológico"

* meta.profile[0] = $paciente-siscan

// ------------
// OBRIGATÓRIOS 
// ------------

// Cartão SUS
* identifier[cns].system = $cns
* identifier[cns].value = "8934543431218990"

// Nome completo da mulher
* name[0].text = "Rosa Silva"
* name[0].use = #official

// Nome da mãe
* extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/filiacao"
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
* identifier[cpf].system = $cpf
* identifier[cpf].value = "12334534553"

// Idade (binding para http://hl7.org/fhir/ValueSet/age-units)
* extension[1].url = $idade
* extension[1].valueAge.value = 61
* extension[1].valueAge.system = "http://unitsofmeasure.org"
* extension[1].valueAge.code = #a

// ERRO NA EXTENSAO (não deveria permitir raca e etnia indígena)
// EXTENSÃO PODE SER ESPECIALIZADA PARA CORRIGIR
* extension[2].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/raca-etnia"
* extension[2].extension[0].url = "race"
* extension[2].extension[0].valueCode = #05
* extension[2].extension[1].url = "indigenousEthnicity"
* extension[2].extension[1].valueCode = #0001

// Nacionalidade (B - brasileiro, E - estrangeiro ou N - naturalizado)
* extension[3].url = $nacionalidade
* extension[3].valueCodeableConcept.coding[0]
  * system = $cs-nacionalidade
  * code = #B

// Escolaridade
* extension[4].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/escolaridade"
* extension[4].valueCode = #13

* address
  * city = #315780
  //* state = http://www.saude.gov.br/fhir/r4/CodeSystem/BRDivisaoGeograficaBrasil|2023-12-14#31
  * postalCode = "74000-000"  // Nao valida a máscara xxxxx-xxx
  * line[logradouro] = "Rua 3"
  * line[logradouro].extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/item-endereco"
  * line[logradouro].extension[0].valueCode = #logradouro

  * line[numero] = "1441"
  * line[numero].extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/item-endereco"
  * line[numero].extension[0].valueCode = #numero

  * line[bairro] = "São Leopoldo"
  * line[bairro].extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/item-endereco"
  * line[bairro].extension[0].valueCode = #bairro

  * line[complemento] = "bloco B, apto. 2345"
  * line[complemento].extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/item-endereco"
  * line[complemento].extension[0].valueCode = #complemento

  * line[referencia] = "Ao lado da Caixa"
  * line[referencia].extension[0].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/item-endereco"
  * line[referencia].extension[0].valueCode = #referencia

  
* telecom[0]
  * system = #phone
  * value = "+55 21 99999-9999"


// ------------------------------------------------------
// unidade-saude
// ------------------------------------------------------

Instance: unidade-saude
InstanceOf: UnidadeDeSaude
Usage: #inline
Title: "UBS"
Description: "A unidade de saúde na qual o exame citopatológico da paciente Rosa é requisitado"

// CNES
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "123456"


// ------------------------------------------------------
// profissional
// ------------------------------------------------------

Instance: profissional
InstanceOf: Practitioner
Title: "Requisitante (João da Silva)"
Description: "Profissional responsável pela requisição do exame citopatológico para a paciente Rosa"
Usage: #inline

* identifier[0]
  * use = #official
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
  * value = "234.234.567"

* name[0].text = "João da Silva"

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: respostas-anamnese
InstanceOf: AnamneseQuestionario
Title: "Anamnese (Rosa)"
Description: "Anamnese da paciente Rosa"
Usage: #inline

* questionnaire = $anamnese-exame-citopatologico

* status = #completed
* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* author = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb07)
* encounter = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb08)

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
  * text = "Uso de anticoncepcional hormonal?"

* item[5]
  * linkId = "6"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Uso de reposição hormonal?"

* item[6]
  * linkId = "7"
  * answer[0].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * text = "Já fez tratamento por radioterapia?"

* item[7]
  * linkId = "8"
  * answer[0].valueBoolean = true
  * text = "Sabe a data da última menstruação/regra?"

* item[8]
  * linkId = "8.1"
  * answer[0].valueDate = "2024-01-01"
  * text = "Data da última menstruação/regra"

* item[9]
  * linkId = "9"
  * answer[0].valueBoolean = true
  * text = "Tem ou teve algum sangramento após relações sexuais? (não considerar a primeira relação sexual na vida)"

* item[10]
  * linkId = "10"
  * answer[0].valueBoolean = true
  * text = "Tem ou teve algum sangramento após a menopausa? (não considerar o(s) sangramento(s) na vigência de reposição hormonal)"

* item[+]
  * linkId = "11"
  * answer[0].valueBoolean = false
  * text = "Vacina contra HPV"

// ------------------------------------------------------
// LAUDO
// ------------------------------------------------------

Instance: laudo-rosa
InstanceOf: Composition
Usage: #inline
Title: "Laudo (Rosa)"
Description: "Laudo de exame citopatológico da paciente Rosa"

* status = #final

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos#laudo-citopatologico

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
  * title = "Exame clínico"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb04)

* section[+]
  * title = "Sinais sugestivos de doenças sexualmente transmissíveis"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb05)

* section[+]
  * title = "Unidade de Saúde Requisitante"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb06)

* section[+]
  * title = "Espécime"
  * entry[0] = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb15)

// ------------------------------------------------------
// lab
// ------------------------------------------------------

Instance: lab
InstanceOf: Laboratorio
Usage: #inline
Title: "Laboratório Cito"
Description: "Laboratório que emite o laudo de exame citopatológico"

* name = "Laboratório Cito"
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes"
* identifier.value = "654321"

// ------------------------------------------------------
// citopatologista
// ------------------------------------------------------

Instance: citopatologista
InstanceOf: Practitioner
Title: "Citopatologista Beltrano"
Description: "Profissional responsável pelo laudo do exame citopatológico da paciente Rosa"
Usage: #inline

* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier.value = "2345234234234"
* name.text = "Beltrano da Silva"

// ------------------------------------------------------
// diagnostico
// ------------------------------------------------------

Instance: diagnostico
InstanceOf: DiagnosticoCitopatologico
Title: "Detalhes do laudo (Rosa)"
Usage: #inline
Description: "Laudo da requisição de exame da paciente Rosa"

* status = #final
* code.text = "Laudo do exame citopatológico"
* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #47528-5
* code.coding[0].display = "Cytology report of Cervical or vaginal smear or scraping Cyto stain"

* extension[numeroExame].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/numero-exame"
* extension[numeroExame].valueString = "c1"

* extension[dataRecebido].url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/recebido-em"
* extension[dataRecebido].valueDate = "2024"

* identifier[0].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/laboratorio"
* identifier[0].value = "cito-exame-123"

* basedOn = Reference(requisicao)

* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP
* subject = Reference(rosa)
* effectiveDateTime = "2024-01-01"
* issued = "2017-01-01T00:00:00Z"

* result[0] = Reference(laudo-componentes)

* performer[0] = Reference(lab)
* resultsInterpreter[0] = Reference(citopatologista)

* specimen[0] = Reference(especime-rosa)

* conclusionCode.coding
  * system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/categorizacao"
  * code = #anormalidade



// ------------------------------------------------------
// rejeicao
// ------------------------------------------------------

Instance: laudo-componentes
InstanceOf: ComponentesLaudoCitopatologico
Usage: #inline
Title: "Itens do laudo (Rosa)"
Description: "Itens que definem o laudo da paciente Rosa"

* subject = Reference(urn:uuid:f142d5cf-6316-4ddd-b398-168af8aaeb01)
* performer[+].identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* performer[=].identifier.value = "234.234.567"
* performer[+] = Reference(urn:uuid:0342d5cf-6316-4ddd-b398-168af8aaeb12)
* effectiveDateTime = "2023-11-10"

* status = #final
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan#citopatologico

* note[0].text = "Aqui seguem as observações gerais"

// ------------
// especime
// ------------

Instance: especime-rosa
InstanceOf: Amostra
Description: "Informações sobre a amostra identificadas pelo laboratório"

* type = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-amostra#convencional
* status = #available
* receivedTime = "2024-01-01"

