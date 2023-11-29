Alias: $loinc = http://loinc.org

ValueSet: NivelEducacional
Id: niveis-escolaridade
Title: "Nível educacional"
Description: """
Identifica o nível educacional do paciente (maior obtido).

**IMPORTANTE**: é preciso verificar a conformidade com a orientação formal
do Ministério da Educação.
"""

* ^url = "http://perfil.org/vs-niveis-escolaridade"

* ^status = #draft
* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Extensão para idade estimada de paciente</div>"
* ^version = "1.0.0"

// Conforme https://www.hl7.org/fhir/loinc.html#4.3.3.2
* ^copyright = "This content LOINC® is copyright © 1995 Regenstrief Institute, Inc. and the LOINC Committee, and available at no cost under the license at http://loinc.org/terms-of-use"

* $loinc#LA36-9 "Ensino infantil ou menos"
* $loinc#LA12456-2 "Ensino fundamental"
* $loinc#LA12457-0 "Ensino médio"
* $loinc#LA12458-8 "Curso técnico"
* $loinc#LA12460-4 "Graduação"
* $loinc#LA12461-2 "Mestrado"
* $loinc#LA12462-0 "Doutorado"
* $loinc#LA4489-6 "Desconhecido"