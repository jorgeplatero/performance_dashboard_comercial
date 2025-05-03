/*Exercício – cláusulas AND e OR na Calculate*/
/*-----------------------------------------------------*/

Faturamento DVD || Monitor KEEPFILTERS = CALCULATE(
    [Faturamento],
    KEEPFILTERS('dProdutos'[Subcategoria] = "DVD" || 'dProdutos'[Subcategoria] = "Monitor")
)

Faturamento DVD || Monitor VALUES = CALCULATE(
    [Faturamento],
    FILTER(
        VALUES('dProdutos'[Subcategoria]),
        'dProdutos'[Subcategoria] = "DVD" || 'dProdutos'[Subcategoria] = "Monitor"
    )
)

Faturamento DVD || Videos = CALCULATE(
    [Faturamento],
    KEEPFILTERS('dProdutos'[Subcategoria] = "DVD" || 'dProdutos'[Categoria] = "Videos")
)

Faturamento DVD || Videos = CALCULATE(
    [Faturamento],
    FILTER(
        'dProdutos'[Subcategoria],
        'dProdutos'[Subcategoria] = "DVD" || 'dProdutos'[Categoria] = "Videos"
    )
)

Faturamento Fone && 2020 = CALCULATE(
    [Faturamento],
    KEEPFILTERS('dProdutos'[Subcategoria] = "Fone"),
    'dCalendario'[Ano] = 2020
) /*ao usar KEEPFILTERS, não podemos utilizar o operador && ao filtrar tabelas distintas*/

/*
    Quando o contexto é uma tabela calendário, a função CALCULATE retorna dados
    apenas para o contexto do filtro aplicado pela tabela calendário, não sendo 
    necessário utilizar as funções KEEPFILTERS ou VALUES para exibir os dados
    apenas no contexto da data filtrada
*/

Faturamento DVD && Videos = CALCULATE(
    [Faturamento],
    KEEPFILTERS('dProdutos'[Subcategoria] = "DVD" && 'dProdutos'[Categoria] = "Videos")
)