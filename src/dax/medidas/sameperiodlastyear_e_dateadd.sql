/*SAMEPERIODLASTYEAR e DATEADD*/
/*-----------------------------------------------------*/

Faturamento LY = CALCULATE(
    [Faturamento],
    SAMEPERIODLASTYEAR('dCalendario'[Data])
) /*retorna o resultado da expressão para o mesmo período do ano anterior 
para cada contexto de data aplicado*/

Resultado LY = CALCULATE(
    [Resultado],
    DATEADD('dCalendario'[Data], -1, YEAR)
) /*retorna o resultado da expressão para o mesmo período do ano anterior 
para cada contexto de data aplicado. Diferente da função SAMEPERIODLASTYEAR,
com a função DATEADD é possível retorna a expressão para outras extensões de 
período, MONTH, DAY, etc.*/

Faturamento YoY % = DIVIDE(
    [Faturamento] - [Faturamento LY],
    [Faturamento LY]
) /*retorna o percentual de faturamento em relação ao mesmo período do ano anterior
para cada contexto de data aplicado*/

Resultado YoY % = DIVIDE(
    [Resultado] - [Resultado LY],
    [Resultado LY]
)