Instance: resultado
InstanceOf: BRResultadoExameCitopatologico
Title: "Resultado de exame citopatológico"
Description: "O resultado (laudo) de exame citopatológico"
Usage: #example
* status = #final
* subject = Reference(paciente2)
* code = $loinc#1-8
* basedOn = Reference(requisicao-tipica)