/*Exercício 5: Rank Dinâmico com Parâmetros*/
/*-----------------------------------------------------*/

Rank Vendedor Top 5 % = 
VAR vRankVendedorAtual = CALCULATE(
    [Faturamento],
    KEEPFILTERS(
        TOPN(
            [Valor Segmentador Rank],
            ALL('dVendedores'[Vendedor]), --ignora o contexto de filtro do visual
            [Faturamento]
        )
    )
) 
VAR vRankVendedorTotal = CALCULATE(
    [Faturamento],
    TOPN(
        [Valor Segmentador Rank],
        ALL('dVendedores'[Vendedor]), --ignora o contexto de filtro do visual
        [Faturamento]
    )
)
RETURN
    DIVIDE(vRankVendedorAtual, vRankVendedorTotal)


Rank Vendedor Top 5 TOPN = CALCULATE(
    [Faturamento],
    KEEPFILTERS(
        TOPN(
            [Valor Segmentador Rank],
            ALL('dVendedores'[Vendedor]),
            [Faturamento]
        )
    )
)