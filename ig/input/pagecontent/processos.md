Abaixo são identificados os processos que fazem parte do escopo do Farol.
Estes processos definem o cenário desejado e não aquele corrente.
Estão agrupados conforme o principal ator envolvido.

### Enfermeira(o)

O profissional de saúde que assiste a mulher (usuário) não tem suas atribuições alteradas,
conforme ilustrado abaixo.

<div>
<img src="enfermeira.png" width="600px">
</div>
<br clear="all"/>

### Registro de laudo e a assinatura digital (citopatologista)

O citopatologista tem suas atribuições ampliadas. Abaixo segue o que é acrescentado,
atividades destacadas, além do que este profissional já faz atualmente por meio do SISCAN.

<div>
<img src="citopatologista.png" width="500px">
</div>
<br clear="all"/>

Conforme ilustrado acima, após o registro do resultado no SISCAN, o citopatologista
deverá recuperar este resultado empregando o Farol, o que é possível apenas após
o SISCAN enviar o referido resultado para o Farol. Esta comunicação entre SISCAN
e Farol não existe atualmente, trata-se de uma integração a ser desenvolvida.

Convém ressaltar que neste fluxo, elimina-se a possibilidade do
SISCAN conter um resultado (não assinado) diferente daquele
assinado digitalmente.

Convém observar que o "resultado assinado" torna-se imediatamente disponível na unidade de saúde, sem qualquer outra ação do citopatologista ou laboratório
em questão.

### Usuária (mulher assistida)

A usuária (mulher assistida) tem acesso ao resultado pelo aplicativo, sem
necessidade de impressão.

> O acesso ao resultado só será permitido após a "liberação" realizada por profissional da unidade de saúde em questão.

<div>
<img src="usuaria.png" width="550px">
</div>
<br clear="all"/>

O aplicativo disponibilizado para a usuária possui outras funções (por simplicidade não documentadas aqui).

### Cliente (sistema de software)

Sistemas de software podem necessitar de acesso ao resultado (inclusive assinado digitalmente) para atender outras necessidades. O processo abaixo oferece a oportunidade de acesso a tais resultados.

<div>
<img src="cliente.png" width="300px">
</div>
<br clear="all"/>

> A proposta acima é de acesso automático (software falando com software).

### Unidade de saúde

A unidade tem processos adicionais executados com apoio do
software a ser disponibilizado pelo projeto (via navegador).

Um deles é para liberar o resultado para que a usuária possa ter acesso ao mesmo por meio do aplicativo. O outro é o acesso ao resultado pelo próprio profissional de saúde.

<div>
<img src="unidade-saude.png" width="600px">
</div>
<br clear="all"/>

### SISCAN

O SISCAN tem papel fundamental na otimização dos processos ora empregados, o que exige dele
a execução do seguinte processo:

<div>
<img src="siscan.png" width="450px">
</div>
<br clear="all"/>

### Sistema suporte

O sistema a ser construído apoia os processos ilustrados abaixo. Observe que um deles é executado automaticamente, enquanto o outro depende de operador.

<div>
<img src="sistema.png" width="450px">
</div>
<br clear="all"/>

Os processos acima ainda ilustram depósitos de dados necessários para a operação do sistema. Um contendo requerimentos, outro os resultados, antes de serem assinados e, posteriormente, também aqueles assinados, além das condutas e de informações de segurança. As informações de segurança incluem senhas e também certificados digitais.
