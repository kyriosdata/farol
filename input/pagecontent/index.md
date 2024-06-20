### Contexto (processos e atores)

A requisição e o laudo de exame citopatológico emprega uma [ficha](./ficha-numerada.pdf) 
(formulário) cujo uso é apoiado eletronicamente pelo SISCAN (observe que todos os itens de informação desta ficha estão numerados para facilitar a referência a cada um deles.

Em geral, uma requisição de exame citopatológico é criada por um profissional de saúde que
coleta dados relevantes e material (amostra) enviados a um laboratório
para a produção do laudo correspondente. O laudo produzido 
é assinado manualmente pelo citopatologista e então encaminhado fisicamente do
laboratório até o estabelecimento de saúde que o requisitou.

Este fluxo lento e oneroso deixa de ser obrigatório com a
integração com o SISCAN por meio do padrão FHIR, além de criar a 
oportunidade para a integração de sistemas públicos e privados, 
o que contribui com o rastreamento organizado do Câncer de Colo de Útero (CCU). 

Esta iniciativa está 
alinhada com a Política Nacional de Informação e Informática em Saúde e com a Estratégia de Saúde Digital vigentes. 

### Necessidade

> Gerar valor para a saúde por meio de transformação digital do SISCAN, em particular,
> pela agilidade, segurança, custos e promoção do rastreamento organizado em todo o país.

### Requisitos negociais (benefícios)

- Reduzir custos pela substituição do trânsito físico de papel.
- Reduzir o tempo entre a produção do laudo e o consumo efetivo do resultado.
- Assegurar a validade legal do laudo digital.
- Permitir a cobertura nacional do rastreamento organizado.

### Integração eletrônica com o SISCAN via FHIR

O presente portal é um instrumento formal definido pela HL7 (r),
o _Guia de Implementação_, que registra o "contrato" entre o que é oferecido pelo SISCAN para integração com qualquer outro sistema de informação em saúde usando o padrão FHIR.

### Restrição

O SISCAN não é substituído, mas passa a operar com uma nova capacidade, a ser usufruída por integrações de sistemas de informação com a funcionalidade ofertada.

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
