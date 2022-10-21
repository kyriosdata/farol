### Contexto (problema e participantes)

O exame citopatológico emprega uma [ficha](./requisicao-exame-citopatologico.pdf) (formulário) amplamente usada em todo o território nacional e cujos processos pertinentes são apoiados pelo SISCAN.

A requisição deste exame, criada em um encontro por um profissional
de saúde em um encontro, envolve a coleta de material (amostra) que é enviado a um laboratório
para a produção do laudo correspondente. Cada laudo produzido é assinado manualmente
e transferido fisicamente do laboratório para o estabelecimento de saúde que o requisitou.

O processo acima é desnecessariamente lento (problema principal), em particular, por exigir a assinatura manual do laudo e a subsequente transferência dele até o estabelecimento de saúde de
origem (onde a requisição foi criada).

Este _Guia de Implementação_ oferece uma proposta de emprego do padrão FHIR visando a
transformação digital deste processo, que elimina o problema principal, destacado acima,
ao mesmo tempo que oferece contribuições em outros contextos.

### Necessidade

> Reduzir ao mínimo o tempo entre a produção de laudo de exame citopatológico e a sua
> disponibilidade no estabelecimento de saúde específico para a continuidade do cuidado.

### Componentes da solução

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
