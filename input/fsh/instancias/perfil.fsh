Alias: $loinc = http://loinc.org
Alias: $cholesterol = http://hl7.org/fhir/StructureDefinition/cholesterol
Alias: $triglyceride = http://hl7.org/fhir/StructureDefinition/triglyceride
Alias: $hdlcholesterol = http://hl7.org/fhir/StructureDefinition/hdlcholesterol
Alias: $ldlcholesterol = http://hl7.org/fhir/StructureDefinition/ldlcholesterol

Profile: DiagnosticReportLipidProfile
Parent: DiagnosticReport
Id: lipidprofile
Description: "Lipid Lab Report"

* ^url = "http://testando.com/perfil"

* ^name = "DiagnosticReportLipidProfile"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-summary"
* ^extension[=].valueMarkdown = "This is a test summary [lipids](observation.html)"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #oo
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^status = #draft
* ^experimental = true
* ^date = "2012-05-12"
* ^publisher = "Grahame Grieve"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "grahame@healthintersections.com.au"
* . 1..1
* . ^short = "Lipid Lab Report"
* . ^definition = "The findings and interpretation of a general lipid lab profile."
* . ^comment = "In this profile, mustSupport means that authoring systems must include the ability to report these elements, and processing systems must cater for them by either displaying them to the user or considering them appropriately in decision support systems."
* code 1..1
* code only CodeableConcept
* code = $loinc#57698-3 "Lipid panel with direct LDL - Serum or Plasma" (exactly)
* code ^short = "LOINC Code for Lipid Panel with LDL"
* code ^definition = "LOINC Code for Lipid Panel with LDL."
* code ^comment = "LOINC code includes \"direct\" LDL - does this mean LDL derived by measuring VLDL by ultracentrifugation? This panel includes both measured and calculated LDL."
* result ..4
* result ^slicing.discriminator.type = #value
* result ^slicing.discriminator.path = "resolve().code"
//* result ^slicing.ordered = true
* result ^slicing.rules = #closed
* result contains
    Cholesterol 1..1 MS and
    Triglyceride 1..1 MS and
    HDLCholesterol 1..1 MS and
    LDLCholesterol 0..1 MS
* result[Cholesterol] only Reference($cholesterol)
* result[Cholesterol] ^short = "Cholesterol Result"
* result[Cholesterol] ^definition = "Reference to Cholesterol Result."
* result[Triglyceride] only Reference($triglyceride)
* result[Triglyceride] ^short = "Triglyceride Result"
* result[Triglyceride] ^definition = "Group of elements for Triglyceride result."
* result[HDLCholesterol] only Reference($hdlcholesterol)
* result[HDLCholesterol] ^short = "HDL Cholesterol Result"
* result[HDLCholesterol] ^definition = "Group of elements for HDL Cholesterol result."
* result[LDLCholesterol] only Reference($ldlcholesterol)
* result[LDLCholesterol] ^short = "LDL Cholesterol result, if reported"
* result[LDLCholesterol] ^definition = "LDL Cholesterol result, if reported."
* conclusion 0..1 MS
* conclusion only string
* conclusion ^short = "Clinical Interpretation of Lipid Panel"
* conclusion ^definition = "May include diagnosis or suggestions for follow up testing."
* conclusion ^comment = "It's not unusual for the lab to make some kind of interpretative comment on the set of results."
* conclusionCode 0..0
* conclusionCode only CodeableConcept
* conclusionCode ^short = "No codes for a lipid panel"
* conclusionCode ^definition = "No codes for a lipid panel."
* conclusionCode ^comment = "Not used in this context."