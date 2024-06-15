Alias: $BRTipoLogradouro-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRTipoLogradouro-1.0
Alias: $BRMunicipio-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRMunicipio-1.0
Alias: $BRUnidadeFederativa-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRUnidadeFederativa-1.0
Alias: $BRMeioContato = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRMeioContato-1.0
Alias: $laudo-tipo-item = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item
Alias: $yesnodontknow = http://hl7.org/fhir/ValueSet/yesnodontknow
Alias: $resultado-inspecao-colo = https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/resultado-inspecao-colo


Alias: $BRRacaCor-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRRacaCor-1.0
Alias: $BREtniaIndigena-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BREtniaIndigena-1.0

// -------------------------
// Filiação
// -------------------------

Extension: Filiacao
Id: filiacao
Title: "Filiação"
Description: "Filiação da paciente"
Context: Patient
* ^status = #draft
* ^language = #pt-BR
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/filiacao"
* . ^short = "Filiação da paciente"

* value[x] only string
* valueString 1..1


Extension: IdentificadorProntuario
Id: identificador-prontuario
Title: "Identificador de prontuário"
Description: "Identificador do prontuário pelo requisitante. Este valor deve ser único para requisições emitidas pelo CNES em questão."
Context: ServiceRequest
* ^status = #draft
* ^language = #pt-BR
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/identificador-prontuario"
* . ..1
* . ^short = "Prontuário"
* . ^definition = "Código que unicamente identifica o prontuário pelo requisitante para a requisição."

* value[x] only string
* valueString 1..1


// --- AVISO
// --- AJUSTE NA EXTENSÃO PRODUZIDA PELA RNDS  
// http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRacaCorEtnia-1.0
// ---
// Motivo: raça é obrigatória na extensão da RNDS, 
// o que não é o caso da requisição de exame citopatológico.
// Adicionalmente foram estabelecidas regras para fornecimento
// de valor para etnia apenas conforme valor para raça/cor.

Invariant: EtniaApenasSeRacaCorForIndigena
Description: "Se etnia indígena é fornecida, então obrigatoriamente a indicação da raça/cor deve ser indígena."
Expression: "iif('indigenousEthinicity' in extension.url, '05' in extension.where(url = 'race').value, true)"
Severity: #error


Extension: RacaEtnia
Id: raca-etnia
Title: "Raça/Cor e Etnia"
Description: "Extensão para para representar dados relacionados à raça/cor e etnia de um indivíduo."
Context: Patient
* ^status = #draft
* ^language = #pt-BR
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/raca-etnia"
* . ..1
* . ^short = "Identificação da raça/Cor e da etnia indígena."
* . ^definition = "Dados relacionados à raça/cor e etnia de um indivíduo."

// Regra acrescentada
* extension obeys EtniaApenasSeRacaCorForIndigena

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed

* extension contains
    race 0..1 and
    indigenousEthnicity 0..1

* extension[race] ^short = "Raça/Cor"
* extension[race] ^definition = "Raça ou cor autorreferenciada por um indivíduo."
* extension[race].url = "race" (exactly)
* extension[race].value[x] only code
* extension[race].valueCode from $BRRacaCor-1.0 (required)

* extension[indigenousEthnicity] ^short = "Etnia Indígena"
* extension[indigenousEthnicity] ^definition = "Etnia indígena atribuída a um indivíduo"
* extension[indigenousEthnicity].url = "indigenousEthnicity" (exactly)
* extension[indigenousEthnicity].value[x] only code
* extension[indigenousEthnicity].valueCode from $BREtniaIndigena-1.0 (required)


Extension: Escolaridade
Id:   escolaridade
Title:  "Escolaridade"
Description: """
Identificação do maior nível educacional obtido pelo indivíduo.
"""

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/escolaridade"

* ^context[0].type = #element
* ^context[0].expression = "Patient"

* value[x] only code
* valueCode 1..1
* valueCode ^short = "O nível educacional"
* valueCode from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/escolaridade (required)

Extension: Papel
Id:   papel
Title:  "Papel"
Description: """
Papel desempenhado pelo profissional no laudo.
"""
Context: Reference

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/papel"

* value[x] only code
* valueCode 1..1
* valueCode ^short = "O nível educacional"
* valueCode from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/papel (required)

// ------------------------------------------------------
// item-endereco
// ------------------------------------------------------

Extension: ItemEndereco
Id: item-endereco
Title: "Item de endereço"
Description: "Definição dos tipos de itens que podem compor um endereço"
Context: Address.line
* ^status = #draft
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/item-endereco"

* value[x] only code
* valueCode 1..1
* valueCode from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/itens-endereco

// ------------------------------------------------------
// gênero // #14 (gênero)
// ------------------------------------------------------

Extension: Genero
Id: genero
Title: "Gênero"
Description: "Gênero da paciente"
Context: Patient

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/genero"

* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept ^short = "Gênero"
* valueCodeableConcept.coding 1..1 
* valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/genero (required)
* valueCodeableConcept.coding.code 1..1

// ------------------------------------------------------
// idade // #14 (idade)
// ------------------------------------------------------

Extension: Idade
Id: idade
Title: "Idade informada pela paciente (em anos)"
Description: "Idade fornecida no momento da requisição de exame citopatológico. Mantida apenas por conformidade com formulário impresso. A expectativa natural é que esta data seja calculada, por comodidade do usuário que a consulta, a partir da data de nascimento, em vez de ser informada."
Context: Patient

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade"

* value[x] only Age
* valueAge 1..1
* valueAge ^short = "A idade da paciente em anos"
* valueAge.system = "http://unitsofmeasure.org" (exactly)
* valueAge.code = #a (exactly)


// ------------------------------------------------------
// profissional (requisita ou emite laudo)
// ------------------------------------------------------

Profile: Profissional
Parent: Practitioner
Id: profissional
Title: "Profissional"
Description: "Responsável pela requisição ou emissão de laudo de exame citopatológico"

* ^status = #draft
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/profissional"

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier 1..2

* identifier contains 
    cns 0..1 and
    cpf 0..1

* identifier[cns].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier[cns].value 1..1

* identifier[cpf].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* identifier[cpf].value 1..1


// ------------------------------------------------------
// estabelecimento (unidade de saúde)
// ------------------------------------------------------

Profile: UnidadeDeSaude
Parent: Organization
Id: unidade-requisitante
Title: "Unidade requisitante"
Description: "Unidade de Saúde para Requisição de Exame Citopatológico"

* . ^short = "A unidade de saúde que requisita exame citopatológico."
* ^description = "Unidade de Saúde que requisita exame citopatológico"
* ^status = #draft
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/unidade-requisitante"

* identifier 1..1 
* identifier.extension 0..0
* identifier.use 0..0
* identifier.type 0..0
* identifier.period 0..0
* identifier.assigner 0..0
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes" (exactly)
* identifier.value 1..1 
* identifier.value ^short = "O código CNES da unidade de saúde requisitante"

* active 0..0
* type 0..0
* alias 0..0
* telecom 0..0

* name 0..0

* address 0..1
* address.use 0..0
* address.type 0..0
* address.text 0..0
* address.line 0..0
* address.city 0..0
* address.district 0..0
* address.state 0..0
* address.postalCode 0..0
* address.country 0..0
* address.period 0..0
* address.extension 0..0
* address.id 0..0

* partOf 0..0
* contact 0..0
* endpoint 0..0
* contained 0..0
* extension 0..0
* implicitRules 0..0
* language 0..0
* modifierExtension 0..0

Profile: Laboratorio
Parent: Organization
Id: unidade-executante
Title: "Laboratório"
Description: "Unidade de Saúde que produz laudo de Exame Citopatológico"

* . ^short = "A unidade de saúde executante, aquela que produz o laudo de exame citopatológico, identificada pelo CNES."
* ^description = "Laboratório que produz laudo de exame citopatológico."
* ^status = #draft
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/unidade-executante"

// #44 (CNES)
* identifier 1..1 
* identifier.id 0..0
* identifier.extension 0..0
* identifier.use 0..0
* identifier.type 0..0
* identifier.period 0..0
* identifier.assigner 0..0
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes" (exactly)
* identifier.value 1..1
* identifier.value ^short = "O código CNES da unidade de saúde requisitante"

// #46 (Nome do Laboratório)
* name 1..1

* active 0..0
* type 0..0
* alias 0..0
* telecom 0..0
* address 0..0
* partOf 0..0
* contact 0..0
* endpoint 0..0
* contained 0..0
* extension 0..0
* implicitRules 0..0
* language 0..0
* modifierExtension 0..0

// ------------------------------------------------------
// requisicao-exame-citopatologico
// ------------------------------------------------------

Profile: RequisicaoExameCitopatologico
Parent: ServiceRequest
Id: requisicao-exame-citopatologico
Title: "Requisicao de exame citopatológico"
Description: "Definição das informações que devem constar em toda e qualquer requisição de exame citopatológico conforme orientações do INCA (MS)."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/requisicao-exame-citopatologico"
* ^status = #draft

* code ^short = "A identificação precisa do serviço requisitado."
* code.coding 1..1
* code.coding = http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS#0203010086
* code.coding.display = "EXAME CITOPATOLÓGICO CERVICO VAGINAL/MICROFLORA-RASTREAMENTO"
* code.coding.userSelected 0..0

* identifier 0..1
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/siscan" (exactly)
* identifier.value 1..1
* identifier.value ^short = "O código único nacional para a requisição gerado pelo SISCAN"

* . ^short = "Requisição de exame citopatológico - Colo do Útero"

// #6
* extension 0..1
* extension only IdentificadorProntuario

// Trata-se de uma ordem de serviço
* intent = #order (exactly)
* intent ^short = "Ordem de serviço"

// #28
* reasonCode 1..1
* reasonCode ^short = "Motivo do exame"
* reasonCode.coding 1..1
* reasonCode.coding ^short = "Código que identifica o motivo do exame"
* reasonCode from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-exame-citopatologico (required)

* authoredOn 0..0

* supportingInfo ^short = "Informações que são empregadas para realização do laudo de exame citopatológico."
* supportingInfo only Reference(AnamneseQuestionario or ExameClinico)
* supportingInfo 2..2

* requester 1..1
* requester only Reference(Organization)
* requester only ReferenciaUnidadeDeSaude
* requester ^short = "A unidade de saúde na qual a requisição é criada."

* specimen 1..1
* specimen only Reference(AmostraRequisicao)

Profile: AnamneseQuestionario
Parent: QuestionnaireResponse
Id: anamnese-questionario
Title: "Respostas da anamnese"
Description: "Estrutura exigida da anamnese pela requisição de exame citopatológico"

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/anamnese-questionario"

* questionnaire = "https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico"
* status = #completed
* basedOn 0..0
* partOf 0..0
* encounter 1..1
* authored 0..0

// ------------------------------------------------------
// exame-clinico (formado por duas observações)
// ------------------------------------------------------

Profile: ExameClinico
Parent: Observation
Id: exame-clinico
Title: "Exame Clinico"
Description: "Exame clínico realizado durante coleta de material para exame citopatológico"

* implicitRules 0..0
* modifierExtension 0..0
// * identifier 0..0
// * basedOn 0..0
// * partOf 0..0
// * category 0..0
// * subject 0..0
// * focus 0..0
// * encounter 0..0
// * effective[x] 0..0
// * issued 0..0
// * performer 0..0
// * value[x] 0..0
// * dataAbsentReason 0..0
// * interpretation 0..0
// * note 0..0
// * bodySite 0..0
// * method 0..0
// * specimen 0..0
// * device 0..0
// * referenceRange 0..0
// * hasMember 0..0
// * derivedFrom 0..0

* . ^short = "Exame clínico realizado durante coleta de material para exame citopatológico"
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/exame-clinico"
* ^status = #draft

* status = #final (exactly)

* code.coding 1..1
* code.coding = http://loinc.org#32423-6
* code.coding.display = "Pysical findings of Cervix"

* component 1..2
* component.modifierExtension 0..0

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed

* component contains 
    inspecao 1..1 and    // #16
    ist 0..1

* component[inspecao].code ^short = "Resultado da inspeção do colo"
* component[inspecao].code = http://loinc.org#12044-4
* component[inspecao].dataAbsentReason 0..0
* component[inspecao].interpretation 0..0
* component[inspecao].referenceRange 0..0
* component[inspecao].modifierExtension 0..0
* component[inspecao].value[x] only CodeableConcept
* component[inspecao].value[x] 1..1
* component[inspecao].value[x] ^short = "O código correspondente ao resultado da inspeção"
* component[inspecao].valueCodeableConcept from $resultado-inspecao-colo (required)

* component[ist].code ^short = "Indicação da presença de sinais sugestivos de Infecções Sexualmente Transmissíveis (IST)"
* component[ist].code = http://loinc.org#45687-1
* component[ist].dataAbsentReason 0..0
* component[ist].interpretation 0..0
* component[ist].referenceRange 0..0
* component[ist].modifierExtension 0..0
* component[ist].value[x] only boolean
* component[ist].value[x] 1..1
* component[ist].value[x] ^short = "true se há sinais sugestivos de infecções sexualmente transmissíveis ou false, caso contrário"


// ------------------------------------------------------
// endereco
// ------------------------------------------------------

Invariant: ConteudoSuporte
Description: "Possui apenas instâncias predefinidas"
Expression: "select($this.code.coding[0].code in ('60432-2')).allTrue()"
Severity: #error

Invariant: LinhasEndereco
Description: "Endereço não pode ser vazio"
Expression: "line.select($this.length() > 0).allTrue()"
Severity: #error


Profile: Endereco
Parent: Address
Id: endereco
Title: "Endereço"
Description: "Endereço"
* ^status = #active
* ^meta.lastUpdated = "2020-03-11T04:06:40.866+00:00"
* ^language = #pt-BR
* ^description = "Endereço formado por logradouro, número, complemente, bairro, município, unidade da federação, CEP e ponto de referência."
* . MS
* . ^short = "Dados do endereço"
* . ^definition = "Dados do endereço da paciente."
* use 0..0
* type 0..0
* text 0..0

* line ^short = "Logradouro, número, complemento e outros."
* line ^definition = "Os vários elementos que compõem o endereço: logradouro, número, complemento, bairro, município, unidade da federação, CEP e ponto de referência. Nenhum destes elementos é obrigatório."
* line 1.. MS
* obeys LinhasEndereco

* line.extension.url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/item-endereco" 
* line ^slicing.discriminator.type = #value
* line ^slicing.discriminator.path = "extension.value"
* line ^slicing.rules = #closed

* line contains 
    logradouro 0..1 and    // #16
    numero 0..1 and        // #17
    complemento 0..1 and   // #18
    bairro 0..1 and        // #19
    referencia 0..1        // #26

* line[logradouro].extension.valueCode = #logradouro
* line[numero].extension.valueCode = #numero
* line[complemento].extension.valueCode = #complemento
* line[bairro].extension.valueCode = #bairro
* line[referencia].extension.valueCode = #referencia

// #22
* city 0..1
* city from $BRMunicipio-1.0 (required)
* city ^short = "Município"
* city ^definition = "Município do endereço."
* city ^binding.description = "Municípios brasileiros"
* city ^example.label = "para 'Goiânia'"
* city ^example.valueString = "520870"

* district 0..0

// #20
* state 0..1 MS
* state from $BRUnidadeFederativa-1.0 (required)
* state ^short = "UF"
* state ^definition = "Unidade Federativa (estados ou Distrito Federal) do endereço."
* state ^binding.description = "Estados brasileiros"
* state ^example.label = "para 'Goiás'"
* state ^example.valueString = "52"

// #23
* postalCode 1.. MS
* postalCode ^short = "CEP"
* postalCode ^definition = "Código de Endereçamento Postal. Utilizar a máscara XXXXX-XXXX."
* postalCode ^example.valueString = "742010-015"

* country 0..0
* period 0..0

// ------------------------------------------------------
// paciente
// ------------------------------------------------------

Invariant: NomeOficialApelidoOpcional
Description: "O nome pode ser oficial ou apelido"
Expression: "name.select(use='official' or use='nickname').allTrue() and name.use.isDistinct()"
Severity: #error


Profile: Paciente
Parent: Patient
Id: paciente
Title: "Paciente"
Description: "Dados demográficos da paciente"

* . ^short = "Informações sobre a paciente. Apenas o CNS é obrigatório. Demais campos são opcionais."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente"

* obeys NomeOficialApelidoOpcional

* identifier ^short = "A identificação da paciente. É obrigatório o Cartão Nacional de Saúde (CNS), o CPF é opcional."
* identifier 1..*

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains 
    cns 1..1 and
    cpf 0..1

* identifier[cns] ^short = "O Cartão Nacional de Saúde (CNS)"
* identifier[cns].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cns"
* identifier[cns].value 1..1
* identifier[cns].value ^short = "O CNS da paciente"

* identifier[cpf] ^short = "O Cadastro de Pessoa Física (CPF)"
* identifier[cpf].system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf"
* identifier[cpf].value 1..1
* identifier[cpf].value ^short = "O CPF da paciente"

// #8 e #10
* name ^short = "O nome completo da paciente e, possivelmente, o apelido. Nenhum deles é obrigatório."
* name 0..2
* name.text 1..1
* name.use 1..1
* name.use ^short = "Está restrito ao uso oficial (official) ou apelido (nickname)"

// #9 (Nome Completo da Mãe) extensão 'mae' abaixo
// #12 (nacionalidade) extensão 'nacionalidade' abaixo
// #14 (idade)
// #15 (Raça/cor)
// #27 (Nível educacional)

* extension ^short = "Itens de informação acrescentados"
* extension contains 
    https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/filiacao named filiacao 0..1 MS and
    http://www.saude.gov.br/fhir/r4/StructureDefinition/BRNacionalidade named nacionalidade 0..1 MS and
    https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade named idade 0..1 MS and
    https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/escolaridade named escolaridade 0..1 MS and
    https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/raca-etnia named etnia 0..1 MS and
    https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/genero named genero 0..1 MS

* extension[filiacao] ^short = "Filiação"

* ^status = #draft

* address 0..1
* address only Endereco

* birthDate ^short = "A data de nascimento (por exemplo, 2015-01-31)"
* birthDate 1..1 // #13

* active 0..0
* deceased[x] 0..0

// #24 (DDD)
// #25 (telefone)
* telecom 0..1
* telecom ^short = "Telefone para contato"
* telecom.extension 0..0
* telecom.id 0..0
* telecom.period 0..0
* telecom.system = #phone (exactly)
* telecom.system ^short = "Apenas telefone é admitido"
* telecom.value 1..1
* telecom.value ^short = "O número do telefone (pode incluir DDD)"
* telecom.use 0..0

// ------------------------------------------------------
// anamnese-exame-citopatologico
// ------------------------------------------------------

Instance: anamnese-exame-citopatologico
InstanceOf: Questionnaire
Usage: #definition
Title: "Anamnese"
Description: "Anamnese definida conforme
a seção 'Dados da anamnese' da ficha de Requisição de Exame Citopatológico - Colo do útero mantida 
pelo INCA, disponível [aqui](nova-requisicao-exame-citopatologico.pdf)."

* url = "https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico"

* version = "0.0.1"
* name = "Anamnese"
* title = "Anamnese para requisição de exame citopatológico"
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
* description = """As questões da anamnese são todas obrigatórias.
Duas delas, 
a data do último exame (Papanicolau) e a data da última menstruação são condicionais, 
dependem de respostas para questões correlatas. 

Adicionalmente, a primeira questão presente na seção 'Dados da anamense' da ficha 
de requisição não segue na anamnese aqui definida. Esta informação é registrada como parte das
informações pertinentes à requisição."""

* useContext.code[0].system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code[0].code = #program
* useContext.valueCodeableConcept.text = "Programa Nacional de Controle do Câncer de Colo do Útero"
* jurisdiction = urn:iso:std:iso:3166#BR
* purpose = "**Propósito**. Estas questões visam identificar as questões e as respostas, informações relevantes, visando a requisição do exame citopatológico."
* copyright = "Ministério da Saúde do Brasil"
* approvalDate = "2023-12-15"
* lastReviewDate = "2023-11-30"
* effectivePeriod.start = "2024-01-01"

// Qual o conceito representado no questionário?
* code[0]
  * code = #64285-0
  * system = "http://loinc.org"
  * display = "Medical history screening form"

* item[+]
  * linkId = "1"
  * type = #choice
  * text = "Fez exame preventivo anteriormente?"
  * answerValueSet = Canonical(http://hl7.org/fhir/ValueSet/yesnodontknow)
  * required = true
  * repeats = false

* item[+]
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

* item[+]
  * linkId = "3"
  * type = #choice
  * text = "Usa DIU?"
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[+]
  * linkId = "4"
  * type = #choice
  * code[0] = http://loinc.org#66174-4
  * text = "Está grávida?"
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[+]
  * linkId = "5"
  * type = #choice
  * text = "Uso de anticoncepcional hormonal?"
  * code[0] = http://loinc.org#65931-8
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[+]
  * linkId = "6"
  * type = #choice
  * text = "Uso de reposição hormonal?"
  * code[0] = http://loinc.org#63873-4
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[+]
  * linkId = "7"
  * type = #choice
  * text = "Já fez tratamento por radioterapia?"
  * answerValueSet = "http://hl7.org/fhir/ValueSet/yesnodontknow"
  * required = true
  * repeats = false
  * readOnly = true

* item[+]
  * linkId = "8"
  * type = #boolean
  * text = "Sabe a data da última menstruação/regra?"
  * required = true
  * repeats = false
  * readOnly = true

* item[+]
  * linkId = "8.1"
  * type = #date
  * text = "Data da última menstruação/regra"
  * code[0] = http://loinc.org#8665-2
  * enableWhen[0]
    * question = "8"
    * operator = #=
    * answerBoolean = true
  * required = true
  * repeats = false
  * readOnly = true

* item[+]
  * linkId = "9"
  * type = #boolean
  * text = "Tem ou teve algum sangramento após relações sexuais? (não considerar a primeira relação sexual na vida)"
  * required = true
  * repeats = false
  * readOnly = true

* item[+]
  * linkId = "10"
  * type = #boolean
  * text = "Tem ou teve algum sangramento após a menopausa? (não considerar o(s) sangramento(s) na vigência de reposição hormonal)"
  * required = true
  * repeats = false
  * readOnly = true

* item[+]
  * linkId = "11"
  * type = #boolean
  * text = "Vacina contra HPV"
  * required = true
  * repeats = false
  * readOnly = true


Profile: DocumentoRequisicao
Parent: Composition
Id: documento-requisicao
Title: "Documento Requisicao"
Description: "Documento clínico de uma requisição de exame citopatológico"

* ^status = #draft
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/documento-requisicao"

* type.coding ^slicing.discriminator.type = #pattern
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.rules = #open

* type.coding contains tipo 1..1

* type.coding[tipo].system = "https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipos-documentos"
* type.coding[tipo].code 1..1

// ------------------------------------------------------
// documento-laudo
// ------------------------------------------------------

Profile: DocumentoLaudo
Parent: Composition
Id: documento-laudo
Title: "Documento Resultado de Exame Citopatológico"
Description: "Documento clínico de resultado de exame citopatológico"

* ^status = #draft
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/documento-laudo"

* section 1..1
* section.section 0..0
* section.entry 1..1

// ------------------------------------------------------
// laudo-exame
// ------------------------------------------------------

Invariant: DataRecebimentoInvalida
Description: "Data de recebimento do pedido não pode ser após data do laudo"
Expression: "(address.where(use='home').period.start > @1974-12-25).not()"
Severity: #error

Invariant: NaoHaLaudoSeAmostraRejeitada
Description: "Relação entre duas entradas distintas de uma mesma section"
Expression: "specimen.resolve().status.exists() and result.resolve().exists()"
Severity: #error

Invariant: PapelObrigatorio
Description: "O papel de cada profissional deve ser indicado"
Expression: "extension.count() = 1 and extension.select(url = 'https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/papel').allTrue()"
Severity: #error

Invariant: rn-1
Description: "Nenhum item de anormalidade pode ser registrado se categorização geral é negativa para lesão ou malignidade."
Expression: "'negativo' in conclusionCode.coding.code implies result.resolve().component.select(code in ('escamosas' | 'glandulares' | 'outras-neoplasias-malignas')).allFalse()"
Severity: #error

Invariant: rn-2
Description: "Nenhum achado não neoplásico deve ser fornecido se categorização geral indica anormalidade em células epiteiais."
Expression: "'anormalidade' in conclusionCode.coding.code implies result.resolve().component.select(code in ('variacoes-nao-neoplasicas' | 'alteracoes-reativas' | 'celulas-glandulares')).allFalse()"
Severity: #error

Invariant: rn-3
Description: "Se a categorização geral aponta anormalidade, então esta deve ser detalhada."
Expression: "'anormalidade' in conclusionCode.coding.code implies result.resolve().component.select(code in ('escamosas' | 'glandulares' | 'outras-neoplasias-malignas')).anyTrue()"
Severity: #error

Profile: DiagnosticoCitopatologico
Parent: DiagnosticReport
Id: diagnostico-citopatologico
Title: "Diagnóstico citopatológico"
Description: "Diagnóstico de exame citopatológico em conformidade com padrão adotado pelo INCA."

* obeys NaoHaLaudoSeAmostraRejeitada and rn-1 and rn-2

* ^meta.lastUpdated = "2015-02-07T13:28:17.239+02:00"
* ^version = "1.0.0"
* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/diagnostico-citopatologico"

* code = http://loinc.org#47528-5

* extension 0..0

* meta 1..
* meta ^short = "Metadados do laudo"
* meta.extension ..0
* meta.lastUpdated ^short = "Quando o recurso foi atualizado pela última vez"
* meta.profile 1..1
* meta.profile ^short = "Perfil obrigatoriamente a ser atendido"
* meta.profile = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/diagnostico-citopatologico"
* contained ..0

* issued 1..1 // #22
* issued ^short = "Data do resultado"

* basedOn 1..1
* basedOn only Reference(ServiceRequest)
* basedOn ^short = "Número do protocolo da requisição (emitido pelo SISCAN)"

// #45 (Número do exame)
* identifier 1..1
* identifier ^label = "O rótulo (label)"
* identifier ^short = "O identificador único atribuído pelo laboratório ao laudo citopatológico que emitiu."
* identifier ^definition = "O identificador único do laudo citopatológico no laboratório"
* identifier ^comment = "Este identificador deve estar no formato https://fhir.fabrica.inf.ufg.br/ccu/sid/laudo-cito-{{identificador-solicitante}}"
* identifier ^requirements = "Este identificador unicamente identifica o laudo produzido pelo laboratório que o gerou"
* identifier.id ..0
* identifier.extension ..0
* identifier.use ..0
* identifier.system 1..1
* identifier.system ^short = "O identificador do sistema de identificação do laboratório que atribui códigos únicos aos laudos citopatológicos que emite. Este identificador deve estar no formato https://fhir.fabrica.inf.ufg.br/ccu/sid/laudocito-{{identificador-solicitante}}"
* identifier.value 1..1
* identifier.value ^short = "O identificador único atribuído à requisição pelo solicitante usando o seu sistema de origem."
* identifier.period ..0
* identifier.assigner ..0

* status ^label = "O status do laudo."
* status ^short = "Identifica status do laudo."
* status ^definition = "O status do laudo."
* status ^comment = "O status é fixo, final, e só é alterado para indicar que foi substituído, provavelmente por entrada fornecida de forma equivocada, contendo erros ou omissões, por exemplo."

* category ^label = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category ^short = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category ^definition = "Código que classifica a requisição com a finalidade de busca, ordenação e exibição."
* category ^comment = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category.coding 1..1
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#CP
* category.coding.display ..0
* encounter ..0

* specimen 1..1
* specimen only Reference(Amostra)
* specimen ^short = "Espécime no qual o resultado está baseado"

* result 1..1
* result only Reference(ComponentesLaudoCitopatologico)
* result ^short = "Observação para a interpretação/resultado"

* performer 1..1
* performer ^short = "O laboratório responsável pelo serviço"
* performer only ReferenciaUnidadeDeSaude
* performer only Reference(Organization)

// Responsável pelo laudo é obrigatório, screening é opcional
// #20
// #21
* resultsInterpreter 1..2

* resultsInterpreter obeys PapelObrigatorio
* resultsInterpreter ^short = "Profissional responsável e, opcionalmente, citotécnico responsável pelo screening."
* resultsInterpreter ^short = "O responsável pela interpretação/resultado do exame"
* resultsInterpreter only ReferenciaProfissional
* resultsInterpreter only Reference(Practitioner)

// #10
* conclusionCode ^short = "Categorização geral"
* conclusionCode 1..1
* conclusionCode.coding 1..1
* conclusionCode.coding ^short = "Código que identifica a categorização geral"
* conclusionCode.coding.code 1..1
* conclusionCode from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/categorizacao (required)

// ------------------------------------------------------
// componentes-laudo-citopatologico
// ------------------------------------------------------
Invariant: Executantes
Description: "Apenas um profissional e um laboratório"
Expression: "performer.resolve().type().name.isDistinct()"
Severity: #error

Invariant: DuplicidadeNaoAdmitida
Description: "Não pode haver repetição"
Expression: "coding.code.isDistinct()"
Severity: #error

Invariant: ExtensaoApenasOutros
Description: "Apenas 'outras causas' exige detalhamento"
Expression: "coding.where(code != 'outras').extension.exists().not()"
Severity: #error

Invariant: SoUmaExtensaoPermitida
Description: "Uma única extensão (valor) é permida"
Expression: "extension.count() < 2"
Severity: #error

Invariant: AmostraRejeitadaNaoAdmiteLaudo
Description: "Se amostra é rejeitada, então este é o único componente permitido do laudo (além do tipo da amostra)"
Expression: "component.code.coding.where(code='motivo-rejeicao').exists().not() or component.count() = 2"
Severity: #error

Profile: ComponentesLaudoCitopatologico
Parent: Observation
Id: componentes-laudo-citopatologico
Title: "Componentes de resultado de exame citopatológico"
Description: "Identificação e definição dos itens de dados que definem um resultado de exeme citopatológico."

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/componentes-laudo-citopatologico"
* ^status = #draft
* code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/laudos-siscan#citopatologico

// #44
// #46
// #59
* obeys Executantes and AmostraRejeitadaNaoAdmiteLaudo

* performer only Reference(Laboratorio)
* performer 1..1
* performer ^short = "O laboratório responsável pelo resultado do exame"

* specimen 0..0

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed
* component ^slicing.description = "Identificação dos componentes do laudo"

* component contains 
    componente 1..1 MS and // #9
    variacoesNaoNeoplasicas 0..1 MS and // #11
    alteracoesReativas 0..1 MS and // #12
    celulasGlandulares 0..1 MS and // #13
    organismos 0..1 MS and // #14
    celulasEndometriais 0..1 MS and // #15
    escamosas 0..1 MS and // #16
    glandulares 0..1 MS and // #17
    outrasMalignas 0..1 MS // #18
    

// #9
* component[componente] ^short = "Componente endocervical / zona transformação"
* component[componente].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#componente
* component[componente].code ^short = "Componente endocervical"
* component[componente].code.coding ^short = "Código definido por uma terminologia"
* component[componente].value[x] 1..1
* component[componente].value[x] only CodeableConcept
* component[componente].value[x] ^short = "Código para presença ou ausência"
* component[componente].valueCodeableConcept.coding 1..1
* component[componente].valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"
* component[componente].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/componente-endocervical (required)
* component[componente].valueCodeableConcept.coding.code 1..1
* component[componente].valueCodeableConcept.coding.code ^short = "Presença ou ausência"

// #11
* component[variacoesNaoNeoplasicas] ^short = "Variações celulares não neoplásicas"
* component[variacoesNaoNeoplasicas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#variacoes-nao-neoplasicas
* component[variacoesNaoNeoplasicas].code ^short = "Variação celular não neoplásica"
* component[variacoesNaoNeoplasicas].code.coding ^short = "Código definido por uma terminologia"
* component[variacoesNaoNeoplasicas].value[x] 1..1
* component[variacoesNaoNeoplasicas].value[x] only CodeableConcept
* component[variacoesNaoNeoplasicas].value[x] ^short = "Código para variação celular não neoplásica"
* component[variacoesNaoNeoplasicas].valueCodeableConcept.coding 1..1
* component[variacoesNaoNeoplasicas].valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"
* component[variacoesNaoNeoplasicas].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/variacoes-nao-neoplasicas (required)
* component[variacoesNaoNeoplasicas].valueCodeableConcept.coding.code 1..1
* component[variacoesNaoNeoplasicas].valueCodeableConcept.coding.code ^short = "Código para a variação celular não neoplásica"

// #12
* component[alteracoesReativas] ^short = "Alterações celulares reativas"
* component[alteracoesReativas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#alteracoes-reativas
* component[alteracoesReativas].code ^short = "Alteração celular reativa"
* component[alteracoesReativas].code.coding ^short = "Código definido por uma terminologia"
* component[alteracoesReativas].value[x] 1..1
* component[alteracoesReativas].value[x] only CodeableConcept
* component[alteracoesReativas].value[x] ^short = "Código para a alteração celular reativa"
* component[alteracoesReativas].valueCodeableConcept.coding 1..1
* component[alteracoesReativas].valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"
* component[alteracoesReativas].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/alteracoes-reativas (required)
* component[alteracoesReativas].valueCodeableConcept.coding.code 1..1
* component[alteracoesReativas].valueCodeableConcept.coding.code ^short = "Código para a variação celular não neoplásica"

// #13
* component[celulasGlandulares] ^short = "Registra presença ou não de células glandulares pós-histerectomia."
* component[celulasGlandulares].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#celulas-glandulares 
* component[celulasGlandulares].code ^short = "Identifica se há ou não presença de células glandulares pós-histerectomia"
* component[celulasGlandulares].code.coding ^short = "Código definido por uma terminologia"
* component[celulasGlandulares].value[x] 1..1
* component[celulasGlandulares].value[x] only boolean
* component[celulasGlandulares].value[x] ^short = "true se há presença de células glandulares ou falso, caso contrário."

// #14
* component[organismos] ^short = "Organismos"
* component[organismos].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#organismos
* component[organismos].code ^short = "Alteração celular reativa"
* component[organismos].code.coding ^short = "Código definido por uma terminologia"
* component[organismos].value[x] 1..1
* component[organismos].value[x] only CodeableConcept
* component[organismos].value[x] ^short = "Código para a alteração celular reativa"
* component[organismos].valueCodeableConcept.coding 1..1
* component[organismos].valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"
* component[organismos].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/organismos (required)
* component[organismos].valueCodeableConcept.coding.code 1..1
* component[organismos].valueCodeableConcept.coding.code ^short = "Código para a variação celular não neoplásica"

// #15
* component[celulasEndometriais] ^short = "Presença de células endometriais"
* component[celulasEndometriais].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#celulas-endometriais 
* component[celulasEndometriais].code ^short = "Identifica presença ou não de células endometriais (em mulheres com idade igual ou superior a 45 anos)"
* component[celulasEndometriais].code.coding ^short = "Código definido por uma terminologia"
* component[celulasEndometriais].value[x] 1..1
* component[celulasEndometriais].value[x] only boolean
* component[celulasEndometriais].valueBoolean ^short = "Se true, indica presença de células endometriais e false, caso contrário"

// #16  
* component[escamosas] ^short = "Anormalidades em células epiteliais escamosas"
* component[escamosas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#escamosas
* component[escamosas].code ^short = "Alteração celular reativa"
* component[escamosas].code.coding ^short = "Código definido por uma terminologia"
* component[escamosas].value[x] 1..1
* component[escamosas].value[x] only CodeableConcept
* component[escamosas].value[x] ^short = "Código para a alteração celular reativa"
* component[escamosas].valueCodeableConcept.coding 1..1
* component[escamosas].valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"
* component[escamosas].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/escamosas (required)
* component[escamosas].valueCodeableConcept.coding.code 1..1
* component[escamosas].valueCodeableConcept.coding.code ^short = "Código para a variação celular não neoplásica"

// #17
* component[glandulares] ^short = "Anormalidades em células epiteliais glandulares"
* component[glandulares].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#glandulares
* component[glandulares].code ^short = "Alteração celular reativa"
* component[glandulares].code.coding ^short = "Código definido por uma terminologia"
* component[glandulares].value[x] 1..1
* component[glandulares].value[x] only CodeableConcept
* component[glandulares].value[x] ^short = "Código para a alteração celular reativa"
* component[glandulares].valueCodeableConcept.coding 1..1
* component[glandulares].valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"
* component[glandulares].valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/glandulares (required)
* component[glandulares].valueCodeableConcept.coding.code 1..1
* component[glandulares].valueCodeableConcept.coding.code ^short = "Código para a variação celular não neoplásica"

// #18
* component[outrasMalignas] ^short = "Outras neoplasias malignas"
* component[outrasMalignas].code = https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-item#outras-neoplasias-malignas 
* component[outrasMalignas].code ^short = "Identifica a informação fornecida: outras neoplasias malignas"
* component[outrasMalignas].code.coding ^short = "Código definido por uma terminologia"
* component[outrasMalignas].value[x] 1..1
* component[outrasMalignas].value[x] only string
* component[outrasMalignas].valueString ^short = "Especificar as neoplasias"

// #19
* note ^short = "Observaçõe gerais"
* note.author[x] 0..0
* note.time 0..0

// ------------------------------------------------------
// detalhar
// ------------------------------------------------------

Extension: Detalhar
Id: detalhar
Title: "Detalha item"
Description: "Fornece detalhe ou especificação adicional sobre item de informação do resultado de exame citopatológico."
Context: Coding

* ^status = #draft

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/detalhar"

* value[x] only string
* valueString 1..1
* valueString ^short = "Especificar (detalhar)"

// -----------------
// Amostra
// -----------------

Invariant: Satisfatorio
Description: "Se espécime é satisfatório, então não pode ser fornecido motivo, seja para insatisfação ou seja para esclarecer a rejeição."
Expression: "status = 'available' implies status.extension.exists().not()"
Severity: #error

Invariant: Rejeitado
Description: "Se espécime é rejeitado, então deve fornecer motivo para rejeição."
Expression: "status = 'unavailable' implies status.extension.where(url = 'https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/motivo-rejeicao').exists()"
Severity: #error

Invariant: Insatisfatorio
Description: "Se espécime é insatisfatório, então deve fornecer motivo para insatisfação."
Expression: "status = 'unsatisfactory' implies status.extension.where(url = 'https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/motivo-insatisfatorio').exists()"
Severity: #error

Invariant: OutraCausaDeveSerDetalhada
Description: "Se amostra rejeitada por 'outras causas', então deve ser detalhada qual ou quais as causas."
Expression: "code = 'outras' implies extension.where(url = 'https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/detalhar').exists()"
Severity: #error


Profile: Amostra
Parent: Specimen
Id: amostra
Title: "Amostra de exame citopatológico"
Description: "Informações sobre o espécime geradas pelo laboratório"

* obeys Satisfatorio and Rejeitado and Insatisfatorio

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/amostra"
* ^status = #draft

// #6 #7 #8 (extensões para status definem os detalhes do status)
* status 1..1
* status ^short = "Indica se a amostra é satisfatória para avaliação, se é insatisfatória ou se é rejeitada."

// #4
* receivedTime 1..1
* receivedTime ^short = "Quando a amostra foi recebida pelo laboratório."

// #5
* type 1..1
* type from TipoAmostra

// -------------------------
// motivo-especime-rejeitado
// -------------------------

Extension: MotivoRejeicao
Id: motivo-rejeicao
Title: "Motivo para rejeição de espécime"
Description: "Detalha o motivo pelo qual um espécime é rejeitado para exame citopatológico."
Context: Amostra.status

* ^status = #draft
* ^language = #pt-BR
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/motivo-rejeicao"
* . ^short = "Motivo pelo qual o espécime foi rejeitado"
* . ^definition = "O motivo pelo qual o espécimo foi rejeitado (não será avaliado)"

* value[x] 1..1
* value[x] only CodeableConcept
* value[x] ^short = "O código que identifica o motivo da rejeição do espécime"
* valueCodeableConcept.coding 1..2
* valueCodeableConcept obeys DuplicidadeNaoAdmitida and ExtensaoApenasOutros and SoUmaExtensaoPermitida
* valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"
* valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-especime-rejeitado (required)
* valueCodeableConcept.coding.code 1..1
* valueCodeableConcept.coding.code ^short = "Código correspondente ao motivo da rejeição da amostra"
* valueCodeableConcept.coding obeys OutraCausaDeveSerDetalhada

// -------------------------
// motivo-insatisfatorio
// -------------------------

Extension: MotivoInsatisfatorio
Id: motivo-insatisfatorio
Title: "Motivo espécime insatisfatório"
Description: "Detalha o motivo pelo qual um espécime é insatisfatório para avaliação."
Context: Amostra.status
* ^status = #draft
* ^language = #pt-BR
* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/motivo-insatisfatorio"
* . ^short = "Motivo pelo qual o espécime foi rejeitado"
* . ^definition = "O motivo pelo qual o espécimo foi rejeitado (não será avaliado)"

* value[x] ^short = "Registra motivo(s) pelo(s) qual(is) a amostra é insatisfatória para avaliação"
* value[x] 1..1
* value[x] only CodeableConcept
* value[x] ^short = "Código para amostra insatisfatória para avaliação"
* valueCodeableConcept.coding 1..6
* valueCodeableConcept obeys DuplicidadeNaoAdmitida
* valueCodeableConcept.coding ^short = "Um dos códigos definidos no conjunto"
* valueCodeableConcept.coding from https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/motivo-especime-insatisfatorio (required)
* valueCodeableConcept.coding.code 1..1
* valueCodeableConcept.coding.code ^short = "Código correspondente ao motivo da amostra ser insatisfatória"

// -----------------------------------
// referencia para unidade de saúde
// -----------------------------------

Profile: ReferenciaUnidadeDeSaude
Parent: Reference
Id: referencia-unidade-de-saude
Title: "Referência para unidade de saúde"
Description: "Indicação de unidade de saúde pelo CNES"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/referencia-unidade-de-saude"
* ^status = #draft

* reference 0..0
* type 0..0
* display 0..0
* identifier 1..1
* identifier.assigner 0..0
* identifier.extension 0..0
* identifier.id 0..0
* identifier.period 0..0
* identifier.type 0..0
* identifier.use 0..0
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes" (exactly)
* identifier.value 1..1
* identifier.value ^short = "O código CNES da unidade de saúde requisitante"

// -----------------------------------
// referencia para unidade de saúde
// -----------------------------------

Profile: ReferenciaProfissional
Parent: Reference
Id: referencia-profissional
Title: "Referência para profissional de saúde"
Description: "Indicação de profissional de saúde"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/referencia-profissional"
* ^status = #draft

* reference 0..0
* type 0..0
* display 0..0
* identifier 1..1
* identifier.assigner 0..0
* identifier.id 0..0
* identifier.period 0..0
* identifier.type 0..0
* identifier.use 0..0
* identifier.system = "https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf" (exactly)
* identifier.value 1..1
* identifier.value ^short = "O CPF do profissional de saúde"

// -----------------------------------
// amostra-requisicao
// -----------------------------------

Profile: AmostraRequisicao
Parent: Specimen
Id: amostra-requisicao
Title: "Amostra coletada para exame citopatológico"
Description: "Informações parciais sobre a amostra"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/amostra-requisicao"
* ^status = #draft

* identifier 0..0
* accessionIdentifier 0..0
* status 0..0
* type 0..0
* subject 0..0
* receivedTime 0..0
* parent 0..0
* request 0..0
* collection 1..1

// #43 responsável pela coleta
* collection.collector 1..1
* collection.collector ^short = "Responsável pela coleta"
* collection.collector only ReferenciaProfissional
* collection.collector only Reference(Practitioner)

// #42 (Data da coleta)
* collection.collected[x] 1..1
* collection.collected[x] only dateTime
* collection.collectedDateTime ^short = "Data da coleta"

* collection.duration 0..0
* collection.quantity 0..0
* collection.method 0..0
* collection.bodySite 0..0
* collection.fastingStatus[x] 0..0
* processing 0..0
* container 0..0
* condition 0..0
* note 0..0


