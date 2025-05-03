/*CALCULATE – Introdução Parte 1*/
/*-----------------------------------------------------*/

/*
    Essa função sobreescreve o contexto atual, aplicando os contextos informado 
    no parâmetro 
*/

Qtde Linhas = COUNTROWS('_Exemplo') 

Qtde Linhas v2 = CALCULATE(
    COUNTROWS('_Exemplo'),
    ALL('_Exemplo')
) /*retorna quantidade de linhas da tabela informada de acordo com o contexto aplicado,
isto é, a quantidade de linhas da tabela "_Exemplo" ignorando os filtros aplicados na 
tabela "_Exemplo"*/

Qtde Linhas v2 = CALCULATE(
    COUNTROWS('_Exemplo'),
    ALL('_Exemplo'[Representante])
) /*retorna quantidade de linhas da tabela informada de acordo com o contexto aplicado,
isto é, a quantidade de linhas da tabela "_Exemplo" ignorando os filtros aplicados na 
coluna "Representante"*/