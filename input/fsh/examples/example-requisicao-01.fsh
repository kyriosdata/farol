Instance: requisicao-tipica
InstanceOf: RequisicaoExameCitopatologico
Title: "Requisição típica"
Description: "Requisição de example citopatológico"
Usage: #example

/*
Substitui a narrativa gerada automaticamente, que é mais completa.
Daí segue o exemplo, mas comentado.

* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative: Practitioner</b></p></div>"
* text.status = #additional

*/

* meta.lastUpdated = "2022-08-09T23:18:22.558Z"

/*
  O identificador da requisição
*/
* identifier[0]
  * system = "http://goias.gov.br/fhir/ns/siscan"
  * value = "12345678"

* status = #active
* intent = #order

* instantiatesCanonical = "http://farol-ig.s3-website-sa-east-1.amazonaws.com/ActivityDefinition-coleta.html"
* instantiatesUri = "http://farol-ig.s3-website-sa-east-1.amazonaws.com/ActivityDefinition-coleta.html"

* code = $loinc#19766-5

* subject = Reference(Ciclana)

/*
  Consulta na qual a requisição foi criada
*/

* encounter = Reference(consulta)

* authoredOn = "2022-08-09T23:18:22.558Z"

/*
  Unidade que requisita
*/

* requester = Reference(enfermeira)

* category = $SCT#108252007

