Instance: IdentificarPaciente
InstanceOf: ActivityDefinition
Usage: #example
Title: "Identificar paciente"
Description: "Atividade necessária para identificação de paciente"

* url = "http://www.saude.gov.br/fhir/r4/ActivityDefinition/IdentificarPaciente"
* name = "IdentificarPaciente"
* title = "Identificação de paciente"
* subtitle = "A mulher que está sendo assistida"
* status = #draft
* experimental = true

* subjectReference = Reference(mulheres-rastreadas)
* date = "2021-10-20T18:14:34Z"

* contact
  * name = "Fábio Nogueira de Lucena"
  * telecom[0]
    * system = #email
    * value = "kyriosdata@ufg.br"
    * use = #work

* description = "A mulher assistida quanto ao Controle de Câncer de Colo de Útero, ao ser recebida na unidade de saúde, precisa ser identificada."
* useContext.code =  http://terminology.hl7.org/CodeSystem/usage-context-type#program
* useContext.valueReference = Reference(INCA)
* purpose = "Orientar profissionais de saúde acerca de requisitos mínimos para a identificação segura da mulher assistida."