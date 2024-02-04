Alias: $loinc = http://loinc.org

Profile: DiagnosticReportLipidProfile
Parent: DiagnosticReport
Id: lipidprofile
Description: "Lipid Lab Report"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/lipidprofile"

* ^name = "DiagnosticReportLipidProfile"
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
* result only Reference(motivo-rejeicao or laudo-epitelios)
* result ^slicing.discriminator.type = #value
* result ^slicing.discriminator.path = "resolve().code"
//* result ^slicing.ordered = true
* result ^slicing.rules = #closed
* result contains
    motivo 1..1 MS and
    epitelios 1..1 MS 
* result[motivo] only Reference(motivo-rejeicao)
* result[epitelios] only Reference(laudo-epitelios)
* result[epitelios] ^short = "epitelios Result"
* result[epitelios] ^definition = "Group of elements for Triglyceride result."

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

// ------------------------------------------------------
// motivo-rejeicao
// ------------------------------------------------------

Profile: MotivoRejeicao
Parent: Observation
Id: motivo-rejeicao
Title: "Motivo Rejeicao"
Description: "Define estrutura para registro do motivo da rejeição"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/motivo-rejeicao"
* ^status = #draft
* code = $loinc#35200-5
* value[x] only boolean

// ------------------------------------------------------
// epitelios
// ------------------------------------------------------

Profile: LaudoEpitelios
Parent: Observation
Id: laudo-epitelios
Title: "Observação sobre epitélios"
Description: "Define estrtutura para registro de epitélios"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/laudo-epitelios"
* ^status = #draft
* code = $loinc#35217-9 
* value[x] only integer


Profile: Estranho
Parent: Observation
Id: estranho-perfil
Title: "estranho-perfil"
Description: "Define estrtutura para registro de epitélios"

* ^url = "https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/estranho-perfil"
* ^status = #draft
* code = $loinc#2085-9
* value[x] only string
