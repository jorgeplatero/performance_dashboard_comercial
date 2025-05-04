/*RANKX e TOPN*/
/*-----------------------------------------------------*/

Rank Vendedor Faturamento = IF(
    HASONEVALUE('dVendedores'[Vendedor]),
    RANKX(
        ALL('dVendedores'),
        [Faturamento]
    )
) /*retorna rank de vendedores de acordo com seu faturamento*/

Rank Vendedor Top 5 Faturamento = CALCULATE(
    [Faturamento], 
    FILTER(
        'dVendedores',
        [Rank Vendedor Faturamento] <= 5
    )
) /*retorna faturamento quando o vendedor está no top 5*/

Rank Vendedor Top 5 Faturamento TOPN = CALCULATE(
    [Faturamento],
    KEEPFILTERS(
        TOPN(
            5,
            ALL('dVendedores'[Vendedor]), --ignora o contexto de filtro do visual
            [Faturamento]
        )
    )
) /*retorna faturamento quando o vendedor está no top 5. O KEEPFILTERS mantém valores
apenas quando o filtro no contexto do visual pode ser interseccionado com a tabela
nele encapsulada*/