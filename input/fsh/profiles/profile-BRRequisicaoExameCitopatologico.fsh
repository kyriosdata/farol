Profile: RequisicaoExameCitopatologico
Parent: ServiceRequest
Id: BRRequisicaoExameCitopatologico
Title: "Requisição de exame citopatológico"
Description: "Definição de requisição de exame citopatológico em conformidade com padrão adotado pelo INCA."
* ^meta.lastUpdated = "2015-02-07T13:28:17.239+02:00"
* ^version = "1.0.0"
* ^status = #draft

* meta 1..
* meta ^short = "Metadados da requisição"
* meta.extension ..0
* meta.lastUpdated ^short = "Quando o recurso foi atualizado pela última vez"
* meta.profile ^short = "Perfil obrigatoriamente a ser atendido"
* contained ..0

* identifier ..1
* identifier ^label = "O rótulo (label)"
* identifier ^short = "O identificador único atribuído pelo solicitante ao requerimento de exame citopatológico."
* identifier ^definition = "O identificador único da requisição para o solicitante."
* identifier ^comment = "Não há nenhum formato esperado para este identificador senão uma sequência de caracteres."
* identifier ^requirements = "Este identificador é necessário para facilitar a identificação do requerimento no contexto em que é gerado."
* identifier ^alias[0] = "protocolo"
* identifier ^alias[+] = "número"
* identifier.id ..0
* identifier.extension ..0
* identifier.use ..0
* identifier.value 1..1
* identifier.value ^short = "O identificador único atribuído à requisição pelo solicitante usando o seu sistema de origem."
* identifier.period ..0
* identifier.assigner ..0

* status = #active
* status ^label = "O status da requisição."
* status ^short = "Identifica status da requisição."
* status ^definition = "O status da requisição."
* status ^comment = "O status é fixo, final, e só é alterado para indicar que foi substituído, provavelmente por entrada fornecida de forma equivocada, contendo erros ou omissões, por exemplo."
* intent ^label = "Se a requisição é uma proposta, pedido original ou pedido (definitivo)."
* intent ^short = "Define como a requisição deve ser tratada."
* intent ^definition = "Define como a requisição deve ser tratada."
* intent ^comment = "Estão disponíveis três opções: (a) proposta; (b) pedido original e (c) pedido (definitivo)."

// Provavelmente será criado um ValueSet e CodeSystem para categorias aqui no Brasil
* category ^label = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category ^short = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category ^definition = "Código que classifica a requisição com a finalidade de busca, ordenação e exibição."
* category ^comment = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category.coding 1..1
* category.coding = $SCT#108252007
* category.coding.display ..0

//Tipo da requisição
// https://simplifier.net/redenacionaldedadosemsaude/tabelasus-codesystem

* bodySite ..0
* patientInstruction ..0