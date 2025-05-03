/*Escondendo Datas Futuras via Coluna*/
/*-----------------------------------------------------*/

Data com Venda = 'dCalendario'[Data] <= MAX('fVendas'[Data Pedido]) /*coluna auxiliar 
criada na tabela calendário. Retorna True quando a data máxima da venda é maior ou 
igual a data atual da tabela calendário*/

Faturamento Acumulado YTD = CALCULATE(
    [Faturamento],
    CALCULATETABLE(
        DATESYTD('dCalendario'[Data]),
        'dCalendario'[Data com Venda] = TRUE()
    )
)
