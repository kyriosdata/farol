Instance: requisicao-tipica
InstanceOf: BRRequisicaoExameCitopatologico
Title: "Requisição típica"
Description: "Requisição de example citopatológico"
Usage: #example


/*
Substitui a narrativa gerada automaticamente, que é mais completa.
Daí segue o exemplo, mas comentado.

* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative: Practitioner</b></p></div>"
* text.status = #additional

*/

* meta.profile = "http://www.saude.gov.br/fhir/r4/StructureDefinition/BRRequisicaoExameCitopalologico"
* meta.lastUpdated = "2022-08-09T23:18:22.558Z"

/*
  O identificador do solicitante, neste exemplo, é 123456. 
*/
* identifier[0]
  * system = "http://www.saude.gov.br/fhir/r4/NamingSystem/BRRNDS-123456"
  * value = "codigo-gerado-pelo-solicitante-para-identificar-a-requisicao"

* status = #active
* intent = #order

* instantiatesCanonical = "http://farol-ig.s3-website-sa-east-1.amazonaws.com/ActivityDefinition-coleta.html"
* instantiatesUri = "http://farol-ig.s3-website-sa-east-1.amazonaws.com/ActivityDefinition-coleta.html"

* code = $loinc#19766-5

* subject = Reference(paciente3)

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

