Profile: Gravidez
Parent: Observation
Id: BRGravidez
Title: "Observação gravidez"
Description: "Você está grávida?"

// Metadados do perfil
* ^meta.lastUpdated = "2015-02-07T13:28:17.239+02:00"
* ^version = "0.1.0"
* ^status = #draft
* ^purpose = "Registrar estado de gravidez da paciente pela própria paciente"

* category = $observation-category#survey

* code.coding 1..*
* code.coding = $loinc#66174-4 (exactly)

* value[x] 1..1
* valueCodeableConcept 1..1
* valueCodeableConcept.coding from $simnaonaosei (required)
* valueCodeableConcept ^short = "Resposta da paciente"


