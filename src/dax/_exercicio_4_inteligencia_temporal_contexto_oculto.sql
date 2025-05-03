/*Exercício 4 - Inteligência Temporal + Contexto Oculto*/
/*-----------------------------------------------------*/

Faturamento Fixo Ano = CALCULATE(
        [Faturamento],
        ALL(
            'dCalendario'[Nome do Mes Abreviado],
            'dCalendario'[Mes],
            'dCalendario'[Dia]
        )
) /*como os dados estão ordenados por "Mes" e consta "Dia" na hierarquia, é necessário
ignorar também esses contextos*/

Faturamento Fixo LY = CALCULATE(
    [Faturamento],
    PREVIOUSYEAR('dCalendario'[Data])
) /*retorna a expressão para todo o período do ano anterior*/
