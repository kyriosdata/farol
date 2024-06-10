Abaixo é apresentado no formato de mapa mental, principalmente para profissionais de saúde, a relação entre os itens de informação, tanto de uma requisição quanto de um laudo, todos eles numerados ([ficha](./ficha-numerada.pdf)), com os recursos e elementos correspondentes do padrão FHIR. Esta representação é informal. A modelagem FHIR definitiva e que é consultada por ferramentas está disponível em [artefatos](artifacts.html). 

### Requisição

A requisição de exame citopatológico, conforme abaixo, é mapeado para o recurso ServiceRequest. Este recurso possui vários elementos que recebem os itens de informação da ficha, por exemplo, a "Unidade de Saúde" requisitante, que pode ser facilmente localizada na ficha enumerada com o número 2. De forma análoga, o "Número do protocolo" está marcado com o número 3 na ficha. 

Os elementos de recursos seguem com fundo branco, enquanto instâncias de recursos estão com fundo cinza. Ou seja, uma requisição depende de instâncias de outros recursos, conforme a figura, uma para dados demográficos da Paciente (Patient), uma para a Anamnese (Questionnaire), outra para o Exame Clínico (Observation) e outra para a Amostra (Specimen). A anamnese, por ser extensa por si só, segue mais adiante. A contribuição das demais instâncias para os itens de informação de uma requisição de exame citopatológico seguem identificados, são os elementos "Inspeção do colo" (40), "Sinais sugestivos de infecções sexualmente transmissíveis" (41) e os demais indicados por (42) e (43). 

<div>
{% include requisicao.svg %}
</div>

### Paciente
Convém destacar que o nome do município (22) não segue na estrutura abaixo por ser redundante, dado que o código do município é fornecido (21). De fato, pelo mesmo motivo, poder-se-ia ter removido o código do estado (20), que foi mantido. Por fim, a escolaridade (27) segue modelo empregado pelo e-SUS AB, onde outros termos são utilizados. 

<div>
{% include paciente.svg %}
</div>

### Anamnese

A anamnese é formada por um conjunto de questões. Duas delas, convém destacar, são "diferentes" do que consta na ficha. A primeira questão da ficha segue dividida em duas questões: (a) fez exame preventivo anteriormente? (29) e (b) Quando fez o último exame? (30). De forma análoga temos Sabe a data da última menstruação/regra? (36) e Data da última menstruação/regra (37).

<div>
{% include anamnese.svg %}
</div>

### Documento clínico 

Uma requisição de exame citopatológico é um documento clínico. Tal documento é representado no padrão FHIR como um conjunto de instâncias de recursos que não se alteram (são imutáveis). 