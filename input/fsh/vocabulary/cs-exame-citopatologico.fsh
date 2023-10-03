CodeSystem: BRQuestoesExameCitopatologico
Id: BRQuestoesExameCitopatologico
Title: "Questões para requisição de exame citopatológico"
Description: """
Identifica as questões empregadas para preenchimento
da ficha de exame citopatológico.
"""

* ^status = #draft
* ^version = "1.0.0"

// Conforme https://www.hl7.org/fhir/loinc.html#4.3.3.2
* ^copyright = "This content LOINC® is copyright © 1995 Regenstrief Institute, Inc. and the LOINC Committee, and available at no cost under the license at http://loinc.org/terms-of-use"

* #1 "Já fez o exame preventivo alguma vez?" "Pergunta para identificar se a paciente já fez o exame preventivo (papanicolau) alguma vez"
* #2 "Usa DIU?" "Pergunta para identificar se a paciente faz uso corrente de DIU"
* #3 "Usa pílula anticoncepcional?" "Pergunta para identificar se a paciente faz uso corrente de pílula anticoncepcional"
* #4 "Já fez tratamento por radioterapia?" "Pergunta para identificar se a paciente já fez tratamento por radioterapia"
* #5 "Tem ou teve algum sangramento após relações sexuais?" "Pergunta para identificar se a paciente tem ou já apresentou sangramento após relação sexual. Observe que a primeira relação sexual na vida da paciente não deve ser considerada para a resposta"
* #6 "Tem ou teve algum sangramento após a menopausa?" "Pergunta para identificar se a paciente já teve ou tem algum sangramento após a menopausa. Não considerar o período em que houve reposição hormonal."
* #7 "Há sinais sugestivos de doenças sexualmente transmissíveis?" "Exame no qual se verifica a presença ou não de sinais sugestivos de doenças sexualmente transmissíveis"