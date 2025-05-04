/*Exercício 3 – ALL e ALLSELECTED e organizando medidas por Pasta*/
/*-----------------------------------------------------*/

Margem Contribuicao Gerencia % = DIVIDE(
    [Faturamento],
    CALCULATE( --faturamento fixo 
        [Faturamento],
        ALLSELECTED('dVendedores'[Vendedor])
    )
) /*ignora apenas os filtros no contexto "Vendedor" da tabela "dVendedores, mantendo
os demais filtros externos e internos"*/