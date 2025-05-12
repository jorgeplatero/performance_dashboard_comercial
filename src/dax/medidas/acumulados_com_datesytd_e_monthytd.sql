/*Acumulados com DATESYTD e MONTHYTD*/
/*-----------------------------------------------------*/

Faturamento Acumulado YTD = CALCULATE(
    [Faturamento],
    DATESYTD('dCalendario'[Data])
) /*retorna o resultado da expressão acumulando-o do início da coluna "Data" até o 
final*/


Faturamento Acumulado MTD = CALCULATE(
    [Faturamento],
    DATESMTD('dCalendario'[Data])
) /*retorna o resultado da expressão acumulando-o do início do mês até o 
final*/

Faturamento Acumulado YTD LY = CALCULATE(
    [Faturamento],
    CALCULATETABLE(
        DATESYTD(SAMEPERIODLASTYEAR('dCalendario'[Data])),
        'dCalendario'[Data com Venda] = TRUE()
    )
)