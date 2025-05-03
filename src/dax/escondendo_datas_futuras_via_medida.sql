/*Escondendo Datas Futuras via Medida*/
/*-----------------------------------------------------*/

--abordagem incorreta
Faturamento LY v2 = IF(
    [Faturamento],
    CALCULATE(
        [Faturamento],
        SAMEPERIODLASTYEAR('dCalendario'[Data])
    )
) /*impede com que o faturamento seja trazido até o final da tabela calendário. Porém,
a soma do último período continua considerando todo o faturamento do período anterior*/

--abordagem correta
Faturamento LY = 
VAR vUltimaDataComVenda = CALCULATE( --abordagem correta
    MAX('fVendas'[Data Pedido]),
    ALLSELECTED('dCalendario')
) --obtém a última data de venda do contexto aplicado 
VAR vTabela = FILTER(
    VALUES('dCalendario'[Data]),
    'dCalendario'[Data] <= vUltimaDataComVenda
) --retorna tabela calendário do início até a a última data de venda do contexto aplicado
RETURN
CALCULATE(
    [Faturamento],
    SAMEPERIODLASTYEAR(vTabela)
) --retorna a expressão aplicada para o mesmo período do ano anterior do contexto aplicado

Margem % LY = 
VAR vUltimaDataComVenda = CALCULATE(
    MAX('fVendas'[Data Pedido]),
    ALLSELECTED('dCalendario')
)
VAR vTabela = FILTER(
    VALUES('dCalendario'[Data]),
    'dCalendario'[Data] <= vUltimaDataComVenda
)
RETURN
CALCULATE(
    [Margem %],
    SAMEPERIODLASTYEAR(vTabela)
) 

Resultado LY = 
VAR vUltimaDataComVenda = CALCULATE(
    MAX('fVendas'[Data Pedido]),
    ALLSELECTED('dCalendario')
)
VAR vTabela = FILTER(
    VALUES(dCalendario[Data]),
    'dCalendario'[Data] <= vUltimaDataComVenda
)
RETURN
CALCULATE(
    [Resultado],
    DATEADD(vTabela, -1, YEAR)
)

