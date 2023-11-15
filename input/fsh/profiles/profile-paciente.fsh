Profile: BRIndividuo
Parent: Patient
Id: BRIndividuo-1.0
Title: "Indivíduo"
Description: "Sujeito da assistência à saúde."
* ^meta.lastUpdated = "2020-03-13T19:47:50.646+00:00"
* ^language = #pt-BR
* ^url = "http://rnds-fhir.saude.gov.br/StructureDefinition/BRIndividuo-1.0"
* ^version = "01.10"
* ^publisher = "Ministério da Saúde do Brasil"
* ^purpose = """
**IMPORTANTE**: redefinição exigida para acrescentar nível educacional.

O indivíudo é o sujeito central para os processos informativos de dados em saúde. Não deve ser utilizado quando na condição de profissional.
"""
* . MS
* . ^short = "Sujeito da assistência à saúde"
* . ^definition = "Dados demográficos sobre um indivíduo enquanto sujeito de ações e serviços de saúde."
* . ^comment = "Redefinido porque exige acréscimo de extensão para registro do nível educacional."
* . ^alias[0] = "Paciente"
* . ^alias[1] = "Cidadão"
* . ^alias[2] = "Pessoa"
* . ^alias[3] = "Usuário"

