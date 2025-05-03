/*Corrigindo Totais*/
/*-----------------------------------------------------*/

Faturamento > 70mi por Vendedor = 
CALCULATE(
    [Faturamento],
    FILTER(
        VALUES('dVendedores'[Id Vendedor]),
        [Faturamento] > 70000000
    )
) /*retorna o total do faturamento nos contextos em que o vendedor obteve faturamento
maior que 70 milhões*/

Faturamento > 70mi por Vendedor = 
SUMX(
    VALUES('dCalendario'[Ano]), --retorna tabela com os anos
    CALCULATE(
        [Faturamento],
        FILTER(
            VALUES('dVendedores'[Id Vendedor]),
            [Faturamento] > 70000000
        )
    )
) /*retorna o total do faturamento nos contextos em que o vendedor obteve faturamento
maior que 70 milhões, exibindo no rótulo Total a soma correta desses valores, pois agora
estão agregados pelo contexto "Ano"*/