Alias: $anamnese = http://perfil.org/anamnese-exame-citopatologico
Alias: $exame-clinico = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/exame-clinico
Alias: $respostas-anamnese = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/respostas-anamnese

// ------------------------------------------------------
// questoes
// ------------------------------------------------------

Profile: QuestoesAnamnese
Parent: Questionnaire
Id: questoes
Title: "Questões para anmnese do exame citopatológico"
Description: "Descrição"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/questoes"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Extensão para idade estimada de paciente</div>"
* ^status = #draft

* version = "0.0.1"

* item ^slicing.discriminator.type = #pattern
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #open
* item ^slicing.ordered = false 
* item ^slicing.description = "item.linkId"

* item contains fezExame 1..1 MS 

* item[fezExame].linkId = "1" (exactly)
* item[fezExame].linkId ^short = "O número da questão"
* item[fezExame].text = "Fez exame preventivo (Papanicolau) alguma vez?" (exactly)
* item[fezExame].text ^short = "O texto da questão"
* item[fezExame] ^short = "Fez exame preventivo (Papanicolau) alguma vez?"
* item[fezExame].type = #boolean (exactly)
* item[fezExame].type ^short = "O tipo da resposta para a questão"


// ------------------------------------------------------
// exame-clinico
// ------------------------------------------------------

Alias: $vs-inspecao-colo = https://fhir.fabrica.inf.ufg.br/ccu/ValueSet/vs-inspecao-colo

Profile: ExameClinicoParaLaudoCitopatologico
Parent: Observation
Id: exame-clinico
Title: "Exame clínico"
Description: "Exame clínico visando laudo de exame citopatológico"

* ^url = $exame-clinico

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Exame clínico utilizado em exame citopatológico</div>"
* ^status = #draft

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false   // can be omitted, since false is the default
* component ^slicing.description = "Slice based on the component.code pattern"

* component contains inspecao 1..1 MS and sinais 1..1 MS

* component[inspecao].code = http://loinc.org#12044-4 // Inspeção do colo
* component[inspecao].value[x] only CodeableConcept
* component[inspecao].valueCodeableConcept from $vs-inspecao-colo (required)
* component[inspecao].valueCodeableConcept.coding 1..1

* component[sinais].code = http://loinc.org#45687-1 // DST
* component[sinais].value[x] only boolean


// ------------------------------------------------------
// respostas-anamnese
// ------------------------------------------------------

Profile: RespostasAnamnese
Parent: QuestionnaireResponse
Id: respostas-anamnese
Title: "Respostas da anamnese da requisição de exame citopatológico"
Description: "Estabelece estrutura mínima para respostas da anamnese realizada como insumo para exame citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/respostas-anamnese"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Anamnese para exame citopatológico</div>"

* questionnaire = "https://fhir.fabrica.inf.ufg.br/ccu/anamnese-exame-citopatologico" (exactly)
* subject 1..
* authored 1..

* ^status = #draft


// ------------------------------------------------------
// requisicao-exame
// ------------------------------------------------------

Profile: RequisicaoExame
Parent: ServiceRequest
Id: requisicao-exame
Title: "Requisicao Exame"
Description: "Requisição de exame citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/requisicao-exame-citopatologico"
* ^status = #draft
* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Detalha referência para anamnese e exame clínico.</div>"

* supportingInfo only Reference(exame-clinico or respostas-anamnese)
* supportingInfo 2..2

// ------------------------------------------------------
// endereco
// ------------------------------------------------------

Invariant: ConteudoSuporte
Description: "Possui apenas instâncias predefinidas"
Expression: "select($this.code.coding[0].code in ('60432-2')).allTrue()"
Severity: #error


Alias: $BRTipoLogradouro-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRTipoLogradouro-1.0
Alias: $BRMunicipio-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRMunicipio-1.0
Alias: $BRUnidadeFederativa-1.0 = http://www.saude.gov.br/fhir/r4/ValueSet/BRUnidadeFederativa-1.0
Alias: $BRMeioContato = http://www.saude.gov.br/fhir/r4/StructureDefinition/BRMeioContato-1.0

Invariant: LinhasEndereco
Description: "Endereço deve possuir street, number e neighborhood. Possivelmente inclui complement e streetType (vinculação de streetType não é verificada)"
Expression: "line.select(id in ('streetType' | 'street' | 'number' | 'complement' | 'neighborhood')).allTrue() and line.where(id='number').exists() and line.where(id='neighborhood').exists() and line.where(id='street').exists()"
Severity: #error


Profile: Endereco
Parent: Address
Id: endereco
Title: "Endereço"
Description: "Padronização de endereços no Brasil (adaptação de BREndereco)."
* ^status = #active
* ^meta.lastUpdated = "2020-03-11T04:06:40.866+00:00"
* ^text.status = #empty
* ^text.div = "<div xml:lang='pt-BR' lang='pt-BR' xmlns='http://www.w3.org/1999/xhtml'>Adaptação de BREndereco (que provoca erros em validação)</div>"
* ^language = #pt-BR
// * ^url = "http://perfil.org/endereco"
* ^version = "1.0"
* ^publisher = "Ministério da Saúde do Brasil"
* . MS
* . ^short = "Dados de Endereçamento"
* . ^definition = "Dados do(s) endereço(s) onde o sujeito do endereço pode ser localizado."
* use MS
* use ^short = "Uso do Endereço"
* use ^definition = "home: endereço residencial atual.\r\nwork: endereço comercial ou de trabalho atual.\r\ntemp: endereço temporário, como um hotel, a casa de amigos ou familiares, uma instalação/edificação provisória, etc.\r\nold: endereço anterior."
* type MS
* type ^short = "Tipo de Endereço"
* type ^definition = "physical: um endereço físico de um edificação ou espaço geográfico real, como de uma casa, prédio, loja, galpão, lote, etc.\r\npostal: um endereço virtual, como de uma Caixa Postal ou serviço de logística de mercadorias, p.ex."
* text ..0

* line 1.. MS
* obeys LinhasEndereco

* city 1..
* city from $BRMunicipio-1.0 (required)
* city ^short = "Município"
* city ^definition = "Município do endereço."
* city ^binding.description = "Municípios brasileiros"
* district ..0
* state 1.. MS
* state from $BRUnidadeFederativa-1.0 (required)
* state ^short = "UF"
* state ^definition = "Unidade Federativa (estados ou Distrito Federal) do endereço."
* state ^binding.description = "Estados brasileiros"
* postalCode 1.. MS
* postalCode ^short = "CEP"
* postalCode ^definition = "Código de Endereçamento Postal. Utilizar a máscara XXXXX-XXXX."
* country ..0
* period MS
* period ^short = "Período do Endereço"
* period ^definition = "Período em que o endereço foi utilizado."
* period.start MS
* period.start ^short = "Data de Inicio do Endereço"
* period.start ^definition = "Data em que o endereço foi cadastrado ou começou a ser utilizado."
* period.end MS
* period.end ^short = "Data de Término do Endereço"
* period.end ^definition = "Data em que o endereço foi desativado ou parou de ser utilizado."

// ------------------------------------------------------
// paciente-siscan
// ------------------------------------------------------

Profile: Paciente
Parent: Patient
Id: paciente-siscan
Title: "Paciente"
Description: "Dados demográficos de paciente para Exame Citopatológico"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/paciente-siscan"

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Perfil de paciente alinhado com a definição de BRIndividuo (perfil) definido pelo Ministério da Saúde (Brasil).</div>"

* ^status = #draft

* address only Endereco

// Conversor de FSH para JSON nao aceita referencia abaixo.
// * telecom only $BRMeioContato




