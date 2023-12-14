Instance: enfermeira
InstanceOf: Practitioner
Title: "Enfermeira"
Description: "Profissional lotada na UBS que oferece rastreamento"
Usage: #example

/*
Substitui a narrativa gerada automaticamente, que é mais completa.
Daí segue o exemplo, mas comentado.

* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative: Practitioner</b></p></div>"
* text.status = #additional

*/

// * meta.profile = "http://rnds-fhir.saude.gov.br/StructureDefinition/BRProfissional-1.0"
* meta.lastUpdated = "2022-08-09T23:18:22.558Z"

* identifier[0]
  * system = "https://fhir.fabrica.inf.ufg.br/ns/cns"
  * use = #usual
  * value = "2345234234234"

* identifier[1]
  * system = "https://fhir.fabrica.inf.ufg.br/ns/cpf"
  * use = #usual
  * value = "234.523.423-42"

* active = true

* name[0]
  * text = "Maria José"
  * use = #official

* name[1]
  * text = "Dama da Lamparina"
  * use = #nickname

* telecom[0]
  * system = #fax
  * value = "2345-6789"
  * use = #work
  * rank = 3

* telecom[1]
  * system = #phone
  * value = "1111-2222"
  * use = #home
  * rank = 1

* telecom[2]
  * system = #email
  * value = "maria.jose.enfermeira@hospital.com.br"
  * use = #work
  * rank = 2  

* address[0]
  * use = #home
  * type = #postal
  * line = #008
  * line = "Av. T2"
  * city = "Goiânia"
  * state = "Goiás"
  * postalCode = "74215-010"

* address[1]
  * use = #work
  * type = #postal
  * line = #008
  * line = "Rua do Hospital"
  * city = "Aparecida de Goiânia"
  * state = "Goiás"
  * postalCode = "74215-010"

* gender = #female
* birthDate = "1987-10-14"

* qualification.code.coding = $cbo#223505