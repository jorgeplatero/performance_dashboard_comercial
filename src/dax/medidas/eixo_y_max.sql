/*Eico Y MAX*/
/*-----------------------------------------------------*/

Eixo Y Max = 
VAR vTabela = 
    ALLSELECTED('dCalendario'[Nome do Mes Abreviado], 'dCalendario'[Mes])
VAR vMaiorValor = 
    MAXX(vTabela, [Faturamento])
RETURN
    vMaiorValor * 1.5

/*Faturamento Formatado*/
/*-----------------------------------------------------*/
VAR vValor = SELECTEDMEASURE()
VAR vFormatacao = SWITCH(
    TRUE(),
    ABS(vValor) >= 1e9, FORMAT(vValor, "#,0,,,.0 Bi"),
    ABS(vValor) >= 1e6, FORMAT(vValor, "#,0,,.0 Mi"),
    ABS(vValor) >= 1e3, FORMAT(vValor, "#,0,.0 Mil"),
    FORMAT(vValor, "0")
)
RETURN
"""" & vFormatacao & """"