Instance: GravidaNaoSabe
InstanceOf: BRGravidez
Title: "Usuária não sabe se está grávida"
Description: "Ao ser perguntada, responde que não sabe se está grávida"
Usage: #example

* meta.profile = "http://rnds-fhir.saude.gov.br/StructureDefinition/BRGravidez"
* status = #final

* category = $observation-category#survey
* category.text = "Informação fornecida pela usuária"
* code = $loinc#66174-4
* code.text = "Você está grávida?"
* subject = Reference(Patient/Ciclana)
* effectiveDateTime = "2022-08-29"
* valueCodeableConcept.coding = $loinc#LA12688-0
