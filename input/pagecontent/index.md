### Contexto (processos e atores)

O exame citopatológico emprega uma [ficha](./nova-requisicao-anotada.pdf) 
(formulário) usada em todo o território nacional. O 
registro de requisições e de laudos correspondentes
é apoiado pelo SISCAN.

De forma simplificada, a requisição de exame citopatológico é criada por um profissional de saúde que
coleta dados relevantes e material (amostra) enviados a um laboratório
para a produção do laudo correspondente. O laudo produzido 
é assinado manualmente pelo citopatologista e então encaminhado fisicamente do
laboratório até o estabelecimento de saúde que o requisitou.

Este fluxo é lento e oneroso quando comparado com a
proposta apresentada no presente projeto. A proposta é registrada por meio de um instrumento formal, _Guia de Implementação_,
que define como o padrão tecnológico FHIR pode ser empregado para a troca de dados em saúde neste contexto. Tal guia é produzido em conformidade com
as orientações da HL7 para o registro deste tipo de informação.

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
- Perfil [Resultado de Exame Citopatológico](StructureDefinition-BRResultadoExameCitopatologico.html)

### Realização

- [CGIS](https://cgis.ufg.br/)
- [INCA](https://www.inca.gov.br/)
- [Secretaria Municipal de Saúde de Goiânia](https://saude.goiania.go.gov.br/)
