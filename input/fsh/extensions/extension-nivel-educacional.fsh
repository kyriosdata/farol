Extension: BRNivelEducacionalExtension
Id:   br-nivel-educacional-extension
Title:  "Nível educacional"
Description: """
Um código que identifica o maior nível educacional obtido pelo paciente. 
O domínio de valores de código é definido por lista bem 
definida ([LOINC LL836-8](https://loinc.org/LL836-8/)).
"""

* value[x] only code
* valueCode from http://rnds-fhir.saude.gov.br/ValueSet/BRNivelEducacional (required)