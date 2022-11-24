### Contexto (problema e participantes)

O exame citopatológico emprega uma [ficha](./requisicao-exame-citopatologico.pdf) (formulário) amplamente usada em todo o território nacional e cujos processos pertinentes são apoiados pelo SISCAN.

A requisição deste exame é criada por um profissional, em um encontro com a paciente,
no qual é feita a coleta de material (amostra) enviado a um laboratório
para a produção do laudo correspondente. No sentido inverso, o laudo produzido e assinado à mão
e transferido fisicamente do laboratório para o estabelecimento de saúde que o requisitou.

O processo acima é lento (problema principal), em particular, por exigir a assinatura manual do laudo e a subsequente transferência dele até o estabelecimento de saúde de
origem (onde a requisição foi criada).

Este _Guia de Implementação_ oferece uma proposta de emprego do padrão FHIR visando a
transformação digital deste processo, que elimina o problema principal, destacado acima,
ao mesmo tempo que oferece contribuições em outros contextos.

### Necessidade

> Reduzir ao mínimo o tempo entre a produção de laudo de exame citopatológico e a sua
> disponibilidade no estabelecimento de saúde específico para a continuidade do cuidado.

### Solução proposta

> Transformação digital dos <a href="requisitos.html">casos de uso</a> de submissão de requisição e
> a assinatura digital do laudo correspondente a serem apoiados pela RNDS,
> em conformidade com a Estratégia de Saúde Digital 2000-2028.

### Como chegamos até aqui?

Os <a href="requisitos.html">casos de uso</a> a serem atendidos,
no contexto dos <a href="processos.html">processos</a>
considerados, resultou na divisão da [ficha](./requisicao-exame-citopatologico.pdf)
em duas partes: a requisição de exame e o laudo correspondente. De fato, a ficha
original, em sua primeira "folha", contém a requisição, enquanto o "verso" detalha
o resultado (laudo).

Cada uma destas partes foi criteriosamente analisada, tanto
a [requisição](./requisicao-anotada.pdf) quanto o
[resultado](./laudo-anotado.pdf). Estas análises resultaram
nos modelos de informação correspondentes, ou seja, o
modelo de informação da <a href="requisicao.html">requisição</a>
e o modelo de informação do <a href="resultado.html">resultado</a>.
Estes modelos seguem a mesma estrutura
de outros já formalmente publicados por portarias do Ministério da Saúde.

Tais modelos são insumos necessários para definição do que é conhecido por
Guia de Implementação, o que é exatamente o conteúdo deste portal. Ou seja,
o presente Guia detalha como o padrão FHIR, adotado pelo Brasil, pode ser empregado
para viabilizar a integração com a RNDS.

Os modelos de informação supracitados são para consumo de profissionais de
saúde, enquanto o Guia de Implementação como um todo é um instrumento tecnológico
empregado por engenheiros de software e outros da indústria da Tecnologia da Informação
e Comunicação (TIC).

### Organização

- <a href="requisitos.html">Requisitos</a> definem casos de uso e requisitos de usuário.
- <a href="processos.html">Processos</a> de negócio pertinentes aos casos de uso e requisitos.
- Modelo de informação de <a href="requisicao.html">requisição</a> de exame citopatológico.
- Modelo de informação de <a href="resultado.html">resultado</a> de exame citopatológico.
- Perfil [Requisição de Exame Citopatológico](StructureDefinition-BRRequisicaoExameCitopatologico.html)
- Perfil [Resultado de Exame Citopatológico](StructureDefinition-BRResultadoExameCitopatologico.html)

### Realização

- [CGIS](https://cgis.ufg.br/)
- [INCA](https://www.inca.gov.br/)
- [Secretaria Municipal de Saúde de Goiânia](https://saude.goiania.go.gov.br/)
