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
* entry[+].fullUrl = "https://example.com/base/Observation/hdlcholesterol"
* entry[=].resource = hdlcholesterol
* entry[+].fullUrl = "https://example.com/base/Observation/ldlcholesterol"
* entry[=].resource = ldlcholesterol

Instance: Inline-Instance-for-lipids-1
InstanceOf: DiagnosticReport
Usage: #inline
* meta.profile[0] = "http://testando.com/perfil"
* id = "lipids"
* identifier.system = "https://servidor.com/ns/lab"
* identifier.value = "5234342"
* status = #final
* category = $v2-0074#HM
* code = $loinc#57698-3 "Lipid panel with direct LDL - Serum or Plasma"
* subject = Reference(Patient/pat2)
* effectiveDateTime = "2011-03-04T08:30:00+11:00"
* issued = "2013-01-27T11:45:33+11:00"
* performer = Reference(Organization/1832473e-2fe0-452d-abe9-3cdb9879522f) "Acme Laboratory, Inc"
* result[0].id = "1"
* result[=] = Reference(cholesterol)
* result[+].id = "2"
* result[=] = Reference(triglyceride)
* result[+].id = "3"
* result[=] = Reference(hdlcholesterol)
* result[+].id = "4"
* result[=] = Reference(ldlcholesterol)

Instance: cholesterol
InstanceOf: Observation
Usage: #inline
* status = #final
* code = $loinc#35200-5 "SerP"
* code.text = "Cholesterol"
* subject = Reference(Patient/pat2)
* performer = Reference(Organization/1832473e-2fe0-452d-abe9-3cdb9879522f) "Acme Laboratory, Inc"
* valueQuantity = 6.3 'mmol/L' "mmol/L"
* referenceRange.high = 4.5 'mmol/L' "mmol/L"

Instance: triglyceride
InstanceOf: Observation
Usage: #inline
* status = #final
* code = $loinc#35217-9 "Level"
* code.text = "Triglyceride"
* subject = Reference(Patient/pat2)
* performer = Reference(Organization/1832473e-2fe0-452d-abe9-3cdb9879522f) "Acme Laboratory, Inc"
* valueQuantity = 1.3 'mmol/L' "mmol/L"
* referenceRange.high = 2 'mmol/L' "mmol/L"

Instance: hdlcholesterol
InstanceOf: Observation
Usage: #inline
* status = #final
* code = $loinc#2085-9 "Level"
* code.text = "Cholesterol in HDL"
* subject = Reference(Patient/pat2)
* performer = Reference(Organization/1832473e-2fe0-452d-abe9-3cdb9879522f) "Acme Laboratory, Inc"
* valueQuantity = 1.3 'mmol/L' "mmol/L"
* referenceRange.low = 1.5 'mmol/L' "mmol/L"

Instance: ldlcholesterol
InstanceOf: Observation
Usage: #inline
* status = #final
* code = $loinc#13457-7 "Level"
* code.text = "LDL Chol. (Calc)"
* subject = Reference(Patient/pat2)
* performer = Reference(Organization/1832473e-2fe0-452d-abe9-3cdb9879522f) "Acme Laboratory, Inc"
* valueQuantity = 4.6 'mmol/L' "mmol/L"
* referenceRange.high = 3 'mmol/L' "mmol/L"