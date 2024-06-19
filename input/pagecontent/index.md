### Contexto (processos e atores)

A requisição e o laudo de exame citopatológico emprega uma [ficha](./ficha-numerada.pdf) 
(formulário) cujo uso é apoiado eletronicamente pelo SISCAN (observe que todos os itens de informação desta ficha estão numerados para facilitar a referência a cada um deles.

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

### Organização

- <a href="requisitos.html">Requisitos</a> definem casos de uso e requisitos de usuário.
- <a href="processos.html">Processos</a> de negócio pertinentes aos casos de uso e requisitos.
- Modelo de informação de <a href="requisicao.html">requisição</a> de exame citopatológico.
- Modelo de informação de <a href="resultado.html">resultado</a> de exame citopatológico.

### Realização

- [CGIS](https://cgis.ufg.br/)
- [INCA](https://www.inca.gov.br/)
