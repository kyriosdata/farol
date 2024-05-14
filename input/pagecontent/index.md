### Contexto (processos e atores)

A requisição e o laudo de exame citopatológico emprega uma [ficha](./ficha-numerada.pdf) 
(formulário) cujo uso é apoiado eletronicamente pelo SISCAN (observe qe todos os itens de informação desta ficha estão enumerados apenas para facilitar a referência a cada um deles tanto pelo modelo de informação quanto pelo modelo computacional FHIR).

De forma simplificada, uma requisição de exame citopatológico é criada por um profissional de saúde que
coleta dados relevantes e material (amostra) enviados a um laboratório
para a produção do laudo correspondente. O laudo produzido 
é assinado manualmente pelo citopatologista e então encaminhado fisicamente do
laboratório até o estabelecimento de saúde que o requisitou.

Este fluxo é lento e oneroso quando comparado com a
proposta apresentada no presente projeto. A proposta baseia-se na oferta
de um mecanismo de integração com o SISCAN por meio do padrão FHIR, o que está
alinhado com a Política Nacional de Informação e Informática em Saúde e com a Estratégia de Saúde Digital vigentes. 

A realização desta proposta exige manutenção no SISCAN com o propósito
de estender este sistema eletrônico com este novo mecanismo de integração com outros sistemas eletrônicos, ao mesmo tempo em que 
o ecossistema existente é mantido operacional.

O registro da proposta é um instrumento formal definido pela HL7,
o _Guia de Implementação_, que descreve de forma rigorosa o "contrato" entre o que é oferecido pelo SISCAN para integração com outros sistemas.

### Requisitos

- Reduzir custos pela substituição do trânsito físico de papel.
- Reduzir o tempo entre a produção do laudo e o consumo efetivo do resultado.
- Assegurar a validade legal do laudo digital.


### Restrição

Requisitos devem 
estender as capacidades do SISCAN sem ruptura no funcionamento deste sistema e do ecossistem
existente.

Interpretação: o SISCAN não é substituído, mas passa a operar com uma nova capacidade, a ser usufruída paulatinamente por integrações de sistemas de terceiros com a funcionalidade ofertada.

### Necessidade

> Gerar valor para a saúde por meio de transformação digital do SISCAN, em particular,
> pela agilidade, segurança e custos nos processos envolvendo os exames citopatológicos.

### Solução proposta

> Estender o SISCAN com o uso do padrão FHIR para assegurar interoperabilidade em todo o
> território nacional no que diz respeito à requisição e disponibilidade de laudo de 
> exame citopatológico. 

### Processo em andamento

Os <a href="requisitos.html">casos de uso</a> a serem atendidos,
no contexto dos <a href="processos.html">processos</a>
considerados, resultou na divisão da [ficha](./nova-requisicao-anotada.pdf) em duas partes: a requisição de exame (primeira "folha" da ficha) e o laudo correspondente ("verso").

Cada uma destas partes foi analisada, o que resultou
nos modelos de informação correspondentes, ou seja, o
modelo de informação da <a href="requisicao.html">requisição</a>
e o modelo de informação do <a href="resultado.html">resultado</a>.
Estes modelos seguem a mesma estrutura
de outros já formalmente publicados por portarias do Ministério da Saúde.

Tais modelos foram empregados na produção de artefatos tecnológicos 
conforme o uso esperado do padrão FHIR, estabelecido pela HL7, conhecido por
_Guia de Implementação_. Em tempo, FHIR é o padrão
adotado pelo Ministério da Saúde para troca de dados em saúde. 

O _Guia de Implementação_ é um documento. Para os requisitos citados acima
serem realizados é preciso produzir software correspondente. 
O _design_ de uma integração
da implementação deste Guia com o SISCAN também foi proposta, e uma 
prova de conceito se encontra em análise para posterior desenvolvimento.

### Organização

- <a href="requisitos.html">Requisitos</a> definem casos de uso e requisitos de usuário.
- <a href="processos.html">Processos</a> de negócio pertinentes aos casos de uso e requisitos.
- Modelo de informação de <a href="requisicao.html">requisição</a> de exame citopatológico.
- Modelo de informação de <a href="resultado.html">resultado</a> de exame citopatológico.

### Realização

- [CGIS](https://cgis.ufg.br/)
- [INCA](https://www.inca.gov.br/)
- [Secretaria Municipal de Saúde de Goiânia](https://saude.goiania.go.gov.br/)
