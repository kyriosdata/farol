Abaixo segue a identificação do escopo do presente trabalho. Os casos de uso
apresentados ocorrem no contexto dos <a href="processos.html">processos</a>
executados por profissionais de saúde.

### Regras de negócio

- Quais os requisitos mínimos para uma requisição ser cadastrada no SISCAN? O preenchimento adequado da "ficha" é suficiente? Ou há outras regras, por exemplo,
limite de requisições por estabelecimento, por paciente, limite por prazo entre 
uma requisição de uma paciente e outra requisição, há idade máxima, mínima? 
- O que não está escrito na "ficha" mas que é considerado relevante para a requisição ser considerada válida?
- Quando uma requisição é criada automaticamente um laboratório já está encarregado
da produção do laudo correspondente?
- Requisições só podem ser recuperadas pelo laboratório encarregado de produzir os laudos correspondentes?
- Um laudo pode ser alterado após produzido? Um laudo pode ser removido? Como tratar estes casos?
- Há alguma verificação da pertinência (pertencimento) do profissional que assina o laudo e o estabelecimento (laboratório) em questão?

### Requisitos de usuário

#### Administração de acesso (contas)

1. _Como administrador de um estabelecimento de saúde eu desejo cadastrar os profissionais de saúde (usuários) e o papel de cada um deles, para que possam usar o SISCAN._

1. _Como administrador de laboratório eu desejo cadastrar os citopatologistas autorizados a acessar o Farol, para que possam assinar digitalmente resultados de exames citopatológicos_.

#### Resultados de exames citopatológicos (enfermeiras)

1. _Como enfermeira eu desejo consultar o resultado de um exame citopatológico para usar tal resultado na continuidade à assistência oferecida à usuária_.

1. _Como enfermeira eu desejo ser informada da conduta esperada para uma dada usuária para garantir que a assistência ocorra conforme esperado_.

1. _Como enfermeira eu desejo disponibilizar o acesso ao resultado de exame citopatológico pela usuária em questão para que ela possa consultá-lo pelo aplicativo móvel_.

#### Assinar digitalmente resultados de exames citopatológicos

1. _Como citopatologista autorizado eu desejo assinar digitalmente um resultao de exame citopatológico para a rápida continuidade do cuidado em questão_.

#### Acesso aos meus resultados

1. _Como usuária eu desejo consultar meus resultados de exames citopatológicos para exercitar meu direito de acesso à informação de meu interesse_.
