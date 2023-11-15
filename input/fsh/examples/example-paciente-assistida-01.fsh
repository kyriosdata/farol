Instance: Fulana
InstanceOf: Patient
Title: "Mulher assistida (grávida)"
Description: "Paciente assistida pela UBS via Programa Viva Mulher"
Usage: #example

* identifier.use = #official
* identifier.value = "1111111"
* active = true

* name.text = "Fulana da Silva"

* gender = #female
* birthDate = "1987-10-14"

* extension[0].url = $ne
* extension[0].valueCode = $loinc#LA12462-0 "doutorado"
