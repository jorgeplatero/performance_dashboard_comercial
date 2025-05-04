/*Remoção de filtros com ALL e ALLSELECTED*/
/*-----------------------------------------------------*/

Faturamento Fixo = CALCULATE(
    [Faturamento],
    ALL('fVendas')
)

Margem Contribuicao % = DIVIDE(
    [Faturamento],
    CALCULATE(
        [Faturamento],
        ALL('fVendas')
    )
) /*a função ALL remove todos os filtros, internos e externos ao visual*/

Margem Contribuicao % = DIVIDE(
    [Faturamento],
    CALCULATE(
        [Faturamento],
        ALLSELECTED('fVendas')
    )
) /*a função ALLSELECTED ignora apenas os filtros do visual em que foi aplicada 
no contexto informado, permitindo com a medida seja filtrada por filtros externos*/

Margem Contribuicao Gerencia % = DIVIDE(
    [Faturamento],
    CALCULATE( --faturamento fixo 
        [Faturamento],
        ALLSELECTED('dVendedores'[Vendedor])
    )
) /*ignora apenas os filtros no contexto "Vendedor" da tabela "dVendedores, mantendo
os demais filtros externos e internos"*/