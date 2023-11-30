Instance: ns-cpf
InstanceOf: NamingSystem
Title: "Identificador de Cadastro de Pessoa Física (CPF)"
Description: "Declaração do identificador de números de inscrição no Cadastro de Pessoa Física"
Usage: #definition

* name = "CPF"
* status = #draft
* kind = #identifier
* date = "2023-11-13"
* publisher = "Ministério da Saúde (Brasil)"
* responsible = "Receita Federal do Brasil"

* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* type.coding[0].code = #TAX
* type.text = "Número de inscrição no Cadastro de Pessoa Física (CPF)"

* description = "Identificador do número de inscrição no Cadastro de Pessoas Físicas (CPF)"

* jurisdiction[0].coding[0].system = "urn:iso:std:iso:3166"
* jurisdiction[0].coding[0].code = #BR
* jurisdiction[0].text = "Em todo o território nacional (brasileiro)"

* usage = "Fornecido pelo interessado como parte da identificação do paciente"

* uniqueId[0].type = #uri
* uniqueId[0].value = "http://goias.gov.br/fhir/ns/cpf"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Criado pela ausência de NamingSystem nacional para o CPF"
* uniqueId[0].period.start = "2023-11-13"
