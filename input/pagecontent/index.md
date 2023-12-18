### Contexto (processos e atores)

O exame citopatológico emprega uma [ficha](./requisicao-exame-citopatologico.pdf) 
(formulário) amplamente usada em todo o território nacional e cujos processos 
pertinentes são apoiados pelo SISCAN.

A requisição deste exame é criada por um profissional de saúde, em um encontro com a paciente,
no qual são coletados dados relevantes e material (amostra) enviados a um laboratório
para a produção do laudo correspondente. O laudo produzido 
é então manualmente assinado pelo citopatologista e encaminhado fisicamente do
laboratório até o estabelecimento de saúde que o requisitou.

Este cenário cria uma oportunidade contemplada
pelo presente _Guia de Implementação_, um instrumento formal 
para mostrar como o padrão FHIR pode ser empregado em um dado cenário.
Neste caso, para promover a integração entre o SISCAN e qualquer sistema
de informação em saúde que emite requisições de exames citopatológicos
ou produz laudos para estes exames. Em particular, laudos devem ser
assinados digitalmente, o que permite o seu consumo imediato, o que 
é imprescindível para ação rápida, se necessária.


### Necessidade

> Reduzir ao mínimo o tempo entre a produção de laudo de exame citopatológico e a sua
> disponibilidade no estabelecimento de saúde específico para a continuidade do cuidado.

### Solução proposta

> Transformação digital dos <a href="requisitos.html">casos de uso</a> pertinentes à submissão de requisição e
> ao registro de laudo de exame citopatológico com assinatura digital, realizados por todo e qualquer sistema de informação em saúde integrado à RNDS.

### Como chegamos até aqui?

Os <a href="requisitos.html">casos de uso</a> a serem atendidos,
no contexto dos <a href="processos.html">processos</a>
considerados, resultou na divisão da [ficha](./requisicao-exame-citopatologico.pdf)
empregada em todo o país em duas partes: a requisição de exame e o laudo correspondente.
Observe que a ficha definida pelo INCA, em sua primeira "folha", contém a requisição, enquanto o "verso" detalha
o resultado (laudo).

Cada uma destas partes foi criteriosamente analisada, conforme as anotações
tanto na [requisição](./requisicao-anotada.pdf) quanto no
[resultado](./laudo-anotado.pdf). Estas análises resultaram
nos modelos de informação correspondentes, ou seja, o
modelo de informação da <a href="requisicao.html">requisição</a>
e o modelo de informação do <a href="resultado.html">resultado</a>.
Estes modelos seguem a mesma estrutura
de outros já formalmente publicados por portarias do Ministério da Saúde.

Tais modelos são insumos necessários para definição do que é conhecido por
Guia de Implementação, o que é exatamente o conteúdo deste portal. Ou seja,
o presente Guia detalha como o padrão FHIR, adotado pelo Brasil, pode ser empregado
para viabilizar a integração com a RNDS. Algumas informações foram incluídas,
além do que se espera em um guia, apenas para manter um histórico mínimo e não apenas
o resultado final.

Os modelos de informação supracitados são para consumo de profissionais de
saúde, enquanto o Guia de Implementação como um todo é um instrumento tecnológico
empregado por engenheiros de software e outros da indústria da Tecnologia da Informação
e Comunicação (TIC).

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
