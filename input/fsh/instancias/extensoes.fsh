// ------------------------------------------------------
// nivel-educacional
// ------------------------------------------------------

Alias: $nivel-educacional = https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/nivel-educacional


Extension: NivelEducacional
Id:   nivel-educacional
Title:  "Nível educacional"
Description: """
Um código que identifica o maior nível educacional obtido pelo paciente. 
O domínio de valores de código é definido por lista bem 
definida ([LOINC LL836-8](https://loinc.org/LL836-8/)).
"""

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Extensão para idade estimada de paciente</div>"

* ^status = #draft

// * ^url = "http://perfil.org/nivel-educational"

* ^context[0].type = #element
* ^context[0].expression = "Patient"

* value[x] only code
* valueCode from $nivel-educacional (required)


// ------------------------------------------------------
// idade
// ------------------------------------------------------

Extension: Idade
Id: idade
Title: "Idade estimada do paciente"
Description: "Idade fornecida no momento da requisição"
Context: Patient

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Extensão para idade estimada de paciente</div>"

* ^status = #draft

// * ^url = "http://perfil.org/idade"

* value[x] only Age
