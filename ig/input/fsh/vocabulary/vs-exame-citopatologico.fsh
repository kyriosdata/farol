ValueSet: BRQuestoesExameCitopatologico
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

* include codes from system http://www.saude.gov.br/fhir/r4/CodeSystem/BRQuestoesExameCitopatologico
* $loinc#60432-2 "Data do último exame preventivo"
* $loinc#66174-4 "Está grávida?"
* $loinc#63873-4 "Já usou hormônio para sintomas da menopausa?"
* $loinc#8665-2 "Data da última menstruação"
* $loinc#12044-4 ""