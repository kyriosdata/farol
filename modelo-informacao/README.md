# Modelo de informação

A requisição e resultado de exame citopatológico são apresentados
abaixo pelos itens de informação
pertinentes. Tais itens são definidos pelo formulário
de [Requisição de Exame Citopatológico - Colo do útero](modelo-requisicao.pdf).

Os itens estão divididos naqueles empregados pela
requisição propriamente dita e naqueles utilizados para
registro do resultado (laudo).

# Requisição de exame citopatológico

## Nome de fantasia

A "Requisição de exame citopatológico - Colo do útero" é o nome pelo qual a
requisição é conhecida. Há um programa correspondente, "Viva Mulher" ou
"Programa Nacional de Controle do Câncer do Colo do Útero e de Mama".

Precisamos do código único deste
exame, seja via tabela de procedimentos do SUS (SIGTAP) ou
LOINC, por exemplo.

:interrobang: código LOINC do exame citopatológico :interrobang:
:interrobang: código Tabela SUS (Sigtap) do exame citopatológico :interrobang:

## Unidade solicitante

A unidade de saúde que faz a requisição é caracterizada por:

- Nome da unidade
- Município
- UF
- CNES

#### Informações determinantes

- CNES

## Profissional solicitante e que faz a coleta

- Profissional que realizou a coleta, além de preencher os dados da anamnese e do exame clínico.

#### Informações determinantes

- CNS do profissional
- Este CNS deve estar lotado no CNES em questão com o papel compatível.

## Data da requisição e da coleta

A data da coleta pode ser diferente da data da requisição?

- Data da coleta

#### Informações determinantes

- Data

## Paciente

- Nome (da mulher)
- Nome da mãe
- Apelido (da mulher)
- Identidade + Órgão emissor + UF
- CPF
- Data de nascimento
- Idade
- CNS (cartão SUS)
- Residência (logradouro, número, complemento, bairro, uf, município, cep)
- Ponto de referência
- telefone (com DDD)

Observação: a idade é calculada com base na data de nascimento e
a data em que a coleta é feita em um dado ano de interesse.

#### Informações determinantes

- CNS ou CPF

## Outras informações

- Prontuário (identificador de uso local) ⁉️ faz sentido em cenário digital ⁉️ :interrobang:

- :fire: Escolaridade. Encaminhar como extensão a ser incluída em
  [Indivíduo](https://simplifier.net/redenacionaldedadosemsaude/brindividuo).

#### Informações determinantes

- Escolaridade (https://loinc.org/LL836-8/ deu origem ao _CodeSystem_ denominado **NivelEducacional**)

## Anamnese

1. Fez o exame preventivo (Papanicolaou) alguma vez? (Sim, não, não sabe). Se sim, preencher com o ano do último exame.
1. Usa DIU (sim, não, não sabe).
1. Está grávida (sim, não, não sabe).
1. Usa píbula anticoncepcional (sim, não, não sabe)
1. Usa hormônio/remédio para tratar a menopausa (sim, não, não sabe)
1. Já fez tratamento por radioterapia (sim, não, não sabe)
1. Data da última menstruação/regra (sim, não, não sabe) Se sim, então fornecer data, se souber.
1. Tem ou teve algum sangramento após relações sexuais? (não considerar a primeira relação sexual na vida) (sim, não, não sabe)
1. Tem ou teve algum sangramento após a menopausa (sim, não, não sabe)

#### Informações determinantes

Todas estas informações da anamnese.

### Exame clínico

- Inspeção do colo: normal, ausente, alterado, colo não visualizado
- Sinais sugestivos de doenças sexualmente transmissíveis (sim, não)

#### Informações determinantes

Todas estas informações do exame clínico.

# Laudo (resultado) de exame citopatológico

# Não tratado

Onde registrar as orientações para a paciente para que a coleta seja feita e a requisição possa ser construída? [link](https://portaldeboaspraticas.iff.fiocruz.br/atencao-mulher/coleta-e-indicacoes-para-o-exame-citopatologico-do-colo-uterino/#:~:text=Coleta%20e%20Indica%C3%A7%C3%B5es%20para%20o%20Exame%20Citopatol%C3%B3gico%20do%20Colo%20Uterino,-22%20out%202019&text=O%20exame%20citopatol%C3%B3gico%20%C3%A9%20um,estrat%C3%A9gia%20para%20detectar%20les%C3%B5es%20precocemente).

A requisição é registrada em um ServiceRequest. A ser realizada por uma Organization.
A Organization oferece serviços (HealthcareService).

Se alguma informação é gerada da análise do contexto, execução das regras de negócio,
por exemplo, uma Communication é gerada e entregue com base na requisição
([CommunicationRequest](https://www.hl7.org/fhir/communicationrequest.html)).

Observar também CDS Hooks, que me parece
ser mais apropriado. Neste caso inclui [GuidanceResponse](https://www.hl7.org/fhir/guidanceresponse.html).

# Modelo de Informação

Segue o estilo adotado pelo Ministério da Saúde conforme
modelos já publicados formalmente.

## Requisição

## Resultado

Em uma consulta é feita a coleta para o exame citopatológico, juntamente com o preenchimento da anamnese e informações pertinentes ao exame clínico.

## Modelos

- Qual é o procedimento realizado durante a consulta
  no qual é feito a coleta?

- Há um único profissional envolvido? Só há espaço
  para um assinar (denominado coletor).

  - Como detalhar a amostra biológica?
    [amostra rnds](https://kyriosdata.github.io/rnds-ig/StructureDefinition-BRAmostraBiologica.html)

- Nível educacional mais alto obtido pelo paciente. Deve ser uma sugestão de acréscimo. Mudança no perfil [Individuo](https://simplifier.net/redenacionaldedadosemsaude/brindividuo)

- CMD: documento público que coleta os dados dos atendimentos em saúde realizados em qualquer estabelecimento de saúde do país, público ou privado, em cada contato assistencial. A RNDS publicou o
  [Conjunto Mínimo de Dados](https://simplifier.net/redenacionaldedadosemsaude/brconjuntominimodados). Parece-me que temos que registrar estas informações do contato assistencial aqui. Por exemplo,
  a anamnese e o exame clínico devem estar encaixados aqui.

- Uma requisição ([ServiceRequest](https://www.hl7.org/fhir/servicerequest.tml#ServiceRequest) é baseada em um plano de cuidado ([CarePlan](https://www.hl7.org/fhir/careplan.html)) que é definido para um paciente específico ou grupo de pacientes.

- Mulheres assistidas fazem parte de um grupo bem-definido. Talvez vários grupos por idade, condição. Veja [Group](https://www.hl7.org/fhir/group.html). Precisamos caracterizar o(s) grupo(s).

- Sim, não, Unable To Determine (UTD) (https://loinc.org/LL3139-4/)
- STD (https://loinc.org/45687-1/)

# Documento Google

Reunião 18/04

Identificação do procedimento usado para obter laudo:
https://browser.ihtsdotools.org/?perspective=full&conceptId1=440623000&edition=MAIN/2022-03-31&release=&languages=en

Itens de informação
Identificação de terminologias empregadas pela requisição de exame citopatológico e do laudo correspondente.

O [LOINC](https://loinc.org/) é a terminologia de referência para exames laboratoriais e, portanto, o ponto de partida. Outras terminologias podem ser analisadas e utilizadas como [CIAP-2](http://www.saude.ba.gov.br/wp-content/uploads/2018/08/Tabela-CIAP-2.pdf), Tabela de procedimentos do SUS, CID e SNOMED-CT, além de outras.

Itens em ordem que aparecem no “formulário” de requisição/laudo.

Tipo da amostra
https://loinc.org/53903-1/

convencional ou líquido?

Forma de análise do laudo (wet preparation)
https://loinc.org/14317-2/

RESULTADO NORMAL OU BENIGNO (conclusão)
https://browser.ihtsdotools.org/?perspective=full&conceptId1=416032004&edition=MAIN/2022-03-31&release=&languages=en

Há uma consulta (encontro), na qual se faz um procedimento (coleta)

Encounter.reasonReference Reference(procedure)

[Procedure.category](https://www.hl7.org/fhir/procedure-definitions.html#Procedure.category):

- SubgrupoTabelaSUS: https://simplifier.net/redenacionaldedadosemsaude/brsubgrupotabelasus
  https://kyriosdata.github.io/rnds-ig/ValueSet-BRCategoriaExame-1.0.html
  https://kyriosdata.github.io/rnds-ig/CodeSystem-BRSubgrupoTabelaSUS.html#BRSubgrupoTabelaSUS-0203
  0203 Diagnóstico em anatomia patológica e citopatologia

[Precedure.code](https://www.hl7.org/fhir/procedure-definitions.html#Procedure.code)
BRProcedimentosNacionais-1.0
https://kyriosdata.github.io/rnds-ig/ValueSet-BRProcedimentosNacionais-1.0.html
https://kyriosdata.github.io/rnds-ig/CodeSystem-BRTabelaSUS.html#BRTabelaSUS-0201020033

- BRTabelaSUS:
  0201020033
  COLETA DE MATERIAL PARA EXAME CITOPATOLÓGICO DE COLO DE ÚTERO

NESTA CONSULTA E REQUISITADO UM EXAME (identificação propriamente dita do exame)

0203010086
EXAME CITOPATOLÓGICO CERVICO VAGINAL/MICROFLORA-RASTREAMENTO
(preferencial)

Nesta consulta é criada uma requisição de exame
Escolaridade
https://www.hl7.org/fhir/v3/EducationLevel/cs.html
https://loinc.org/LL836-8/

Anamnese

1. Fez o exame preventivo (Papanicolaou) alguma vez?
   https://loinc.org/60432-2/

2. Usa DIU (sim, não, não sabe)?

3. Está grávida? (sim, não, não sabe)
   https://loinc.org/66174-4/
4. Usa pílula anticoncepcional? (sim, não, não sabe)

Método de controle de natalidade (https://loinc.org/8659-5/)
Está usando algum método de controle de natalidade (https://loinc.org/64628-1/)
Tomou pílula para controle de natalidade nos últimos 3 meses (https://loinc.org/65931-8/)
Métodos de controle de natalidade que está empregando (https://loinc.org/64629-9/)

Início do último período menstrual (https://loinc.org/8665-2/)

75329-3 Date of intrauterine device insertion
LL4578-2 Birth control methods

- Sim, não, Unable To Determine (UTD) (https://loinc.org/LL3139-4/)
- STD (https://loinc.org/45687-1/)

CIAP-2 (Classificação Internacional da Atenção Primária)
X86 Esfregaço Papanicolau anormal (CIAP-2) é pertinente para algum item?
W11 Contracepção oral W12 Contracepção intra-uterina (CIAP-2)

5. Usa hormônio/remédio para tratar a menopausa? (sim, não, não sabe)

6. Já fez tratamento por radioterapia? (sim, não, não sabe)

7. Data da última menstruação/regra (dia/mes/ano, não sabe/não lembra)

8. Tem ou teve algum sangramento após relações sexuais? (não considerar a primeira relação sexual na vida) (sim, não/nãosabe/não lembra)

9. Tem ou teve algum sangramento após a menopausa? (não considerar o(s) sangramento(s) na vigência de reposição hormonal) (sim, não/nãosabe/não lembra/não está na menopausa)

Exame clínico

10. Inspeção do colo
    normal,
    ausente (anomalias congênitas ou retirado cirurgicamente)
    alterado
    colo não visualizado

11. Sinais sugestivos de doenças sexualmente transmissíveis?
    (sim, não)
