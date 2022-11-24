Profile: ResultadoExameCitopatologico
Parent: DiagnosticReport
Id: BRResultadoExameCitopatologico
Title: "Resultado (laudo) de exame citopatológico"
Description: "Definição de resultado (laudo) de exame citopatológico em conformidade com padrão adotado pelo INCA."
* ^meta.lastUpdated = "2015-02-07T13:28:17.239+02:00"
* ^version = "1.0.0"
* ^status = #draft

* meta 1..
* meta ^short = "Metadados do laudo"
* meta.extension ..0
* meta.lastUpdated ^short = "Quando o recurso foi atualizado pela última vez"
* meta.profile ^short = "Perfil obrigatoriamente a ser atendido"
* contained ..0

* basedOn 1..1
* basedOn[BRRequisicaoExameCitopatologico]

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

* status ^label = "O status do laudo."
* status ^short = "Identifica status do laudo."
* status ^definition = "O status do laudo."
* status ^comment = "O status é fixo, final, e só é alterado para indicar que foi substituído, provavelmente por entrada fornecida de forma equivocada, contendo erros ou omissões, por exemplo."

* category ^label = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category ^short = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category ^definition = "Código que classifica a requisição com a finalidade de busca, ordenação e exibição."
* category ^comment = "Classificação da requisição com a finalidade de busca, ordenação e exibição."
* category.coding 1..1
* category.coding = $SCT#108252007
* category.coding.display ..0
* encounter ..0

