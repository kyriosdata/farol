
Instance: consulta
InstanceOf: Encounter
Title: "Consulta na qual requisição foi produzida"
Description: "Consulta na qual a coleta é realizada e a requisição de exame citopatológico é criada."
Usage: #example

* status =  http://hl7.org/fhir/encounter-status#finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB

* serviceProvider = Reference(ubs)
