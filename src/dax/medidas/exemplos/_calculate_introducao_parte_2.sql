/*CALCULATE – Introdução Parte 2*/
/*-----------------------------------------------------*/

Qtde Linhas v4 = CALCULATE(
    COUNTROWS('_Exemplo'),
    ALL('_Exemplo'[Representante]),
    '_Exemplo'[Produto] = "Mouse"
) /*retorna quantidade de linhas da tabela informada de acordo com o contexto aplicado,
isto é, a quantidade de linhas da tabela "_Exemplo" ignorando os filtros aplicados na 
coluna "Representante" e aplicando o contexto "Mouse" na coluna "Produto"*/

Qtde Gold = CALCULATE(
    COUNTROWS('_Exemplo'),
    '_Exemplo'[Cor] = "Gold"
) /*retorna quantidade de linhas da tabela informada de acordo com o contexto aplicado,
isto é, a quantidade de linhas da tabela "_Exemplo" aplicando o contexto "Gold" na coluna 
"Cor"*/

Qtde Gold KEEPFILTERS = CALCULATE(
    COUNTROWS('_Exemplo'),
    KEEPFILTERS('_Exemplo'[Cor] = "Gold")
) /*retorna quantidade de linhas da tabela informada de acordo com o contexto aplicado,
isto é, a quantidade de linhas da tabela "_Exemplo" aplicando o contexto "Gold" na coluna 
"Cor", não exibindo o resultado para outros contextos da visualização*/

/*
    O KEEPFILTERS deixa de exibir o resultado para outros contextos aplicados na 
    visualização quando verifica que não há dados para ambos os contextos, o aplicado 
    na função CALCULATE e o aplicado internamente na visualização, exibindo apenas os 
    resultados para o contexto aplicado na função CALCULATE
*/

Qtde Gold e Black = CALCULATE(
    COUNTROWS('_Exemplo'),
    '_Exemplo'[Cor] = "Gold" || '_Exemplo'[Cor] = "Black"
) /*retorna quantidade de linhas da tabela informada de acordo com o contexto aplicado,
isto é, a quantidade de linhas da tabela "_Exemplo" aplicando o contexto "Gold" ou "Black" 
na coluna "Cor"*/