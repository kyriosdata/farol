Instance: GravidaSim
InstanceOf: BRGravidez
Title: "Usuária está grávida"
Description: "Ao ser perguntada, informa que está grávida."
Usage: #example

* meta.profile = "http://rnds-fhir.saude.gov.br/StructureDefinition/BRGravidez"
* status = #final
* category = $observation-category#survey
* category.text = "Informação fornecida pela usuária"
* code = $loinc#66174-4
* code.text = "Você está grávida?"
* subject = Reference(Patient/paciente1) "Usuária afirma estar grávida"
* effectiveDateTime = "2022-08-29"
* valueCodeableConcept.text = "Sim"
* valueCodeableConcept.coding = $loinc#LA33-6
