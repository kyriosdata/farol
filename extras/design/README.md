# Questões

- Conforme _Digital Authentication of medical records: have we found a solution?_
permanecem alguns desafios para uso seguro de certificados do tipo A1 e A3 no Brasil,
conforme regras vigentes.

- [MicroStream](https://microstream.one/) pode ser uma opção a ser investigada 
com o propósito de minimizar o tempo de carga de perfis para validação de recursos.
Pode-se montar todo o objeto correspondente ([Validator](https://github.com/awslabs/fhir-works-on-aws-deployment/blob/mainline/javaHapiValidatorLambda/src/main/java/software/amazon/fwoa/Validator.java) 
serializá-lo usando os próprios mecanismos de Java ou o MicroStream e, em tempo de execução, 
apenas fazer a carga. Observe que a serialização pode até fazer parte do arquivo Jar gerado.
