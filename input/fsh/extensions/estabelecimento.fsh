Extension: Estabelecimento
Id: dados-estabelecimento
Title: "Estabelecimento"
Description: "Dados para montagem de imagem para estabelecimento"
Context: Reference

* ^text.status = #empty
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Dados que já estão disponíveis para estabelecimento de saúde, contudo, exigem acesso à instância em questão para recuperação, o que pode não ser possível em determinado contexto. Desta forma, tais itens permitem 'localizar' o estabelecimento de interesse.</div>"

* ^status = #draft

// Extensão que reúne nome, município e uf
* extension contains 
    uf 0..1 and 
    municipio 0..1 and
    nome 0..1

* extension[uf].value[x] only code
* extension[uf].valueCode from DivisaoGeografica
* extension[municipio].value[x] only string
* extension[nome].value[x] only string