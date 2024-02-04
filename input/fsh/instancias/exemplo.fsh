Alias: $v2-0074 = http://terminology.hl7.org/CodeSystem/v2-0074
Alias: $loinc = http://loinc.org

Instance: lipids
InstanceOf: Bundle
Usage: #example
* type = #collection
* entry[0].fullUrl = "https://example.com/base/DiagnosticReport/lipids"
* entry[=].resource = Inline-Instance-for-lipids-1
* entry[+].fullUrl = "https://example.com/base/Observation/cholesterol"
* entry[=].resource = cholesterol
* entry[+].fullUrl = "https://example.com/base/Observation/triglyceride"
* entry[=].resource = triglyceride


Instance: Inline-Instance-for-lipids-1
InstanceOf: DiagnosticReport
Usage: #inline
* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/lipidprofile"
* id = "lipids"
* identifier.system = "https://servidor.com/ns/lab"
* identifier.value = "5234342"
* status = #final
* category = $v2-0074#HM
* code = $loinc#57698-3 "Lipid panel with direct LDL - Serum or Plasma"
* subject = Reference(rosa)
* effectiveDateTime = "2011-03-04T08:30:00+11:00"
* issued = "2013-01-27T11:45:33+11:00"
* performer = Reference(laboratorio)
* result[0] = Reference(cholesterol)
* result[1] = Reference(triglyceride)
* result[2] = Reference(EstranhoExemplo)


Instance: cholesterol
InstanceOf: Observation
Usage: #inline
* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/motivo-rejeicao"
* status = #final
* code = $loinc#35200-5
* subject = Reference(rosa)
* performer = Reference(Organization/laboratorio)
* valueBoolean = true

Instance: triglyceride
InstanceOf: Observation
Usage: #inline
* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/laudo-epitelios"
* status = #final
* code = $loinc#35217-9 
* subject = Reference(rosa)
* performer = Reference(laboratorio)
* valueInteger = 10


Instance: EstranhoExemplo
InstanceOf: Observation
Usage: #inline
* meta.profile[0] = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/estranho-perfil"
* status = #final
* code = $loinc#2085-9 
* subject = Reference(rosa)
* performer = Reference(laboratorio)
* valueString = "ok, string"

Instance: rosa
InstanceOf: Patient
Usage: #example
Title: "rosa"
Description: "um exemplo"
* active = true

Instance: laboratorio
InstanceOf: Organization
Usage: #example
Title: "laboratorio"
Description: "lab"

* name = "lab"