Instance: GravidaNao
InstanceOf: BRGravidez
Title: "Usuária não está grávida"
Description: "Ao ser perguntada, informa que não está grávida."
Usage: #example

* meta.profile = "http://rnds-fhir.saude.gov.br/StructureDefinition/BRGravidez"
* status = #final
* category = $observation-category#survey
* category.text = "Informação fornecida pela usuária"
* code = $loinc#66174-4
* code.text = "Você está grávida?"
* subject = Reference(Patient/Beltrana) "Usuária afirma não estar grávida"
* effectiveDateTime = "2022-08-29"
* valueCodeableConcept = $loinc#LA32-8
