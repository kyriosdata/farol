Instance: GravidaNaoSabe
InstanceOf: BRGravidez
Title: "Usuária não sabe se está grávida"
Description: "Ao ser perguntada, responde que não sabe se está grávida"
Usage: #example

* meta.profile = "http://www.saude.gov.br/fhir/r4/StructureDefinition/BRGravidez"
* status = #final

* category = $observation-category#survey
* category.text = "Informação fornecida pela usuária"
* code = $loinc#66174-4
* code.text = "Você está grávida?"
* subject = Reference(Patient/paciente3)
* effectiveDateTime = "2022-08-29"
* valueCodeableConcept.coding = $loinc#LA12688-0
