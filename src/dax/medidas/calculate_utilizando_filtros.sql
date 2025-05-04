/*CALCULATE - Utilizando Filtros*/
/*-----------------------------------------------------*/

/*
    Nem todas as vendas são válidas. Portanto, devemos considerar as expressões
    abaixo apenas para o contexto onde 'dStatus'[Id Status] = 1
*/

Faturamento = CALCULATE(
    SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Valor Unit]),
    'dStatus'[Id Status] = 1
) /*retorna o resultado da expressão no contexto informado*/

Faturamento Media = CALCULATE(
    AVERAGEX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Valor Unit]),
    'dStatus'[Id Status] = 1
)

Faturamento Max = CALCULATE(
    MAXX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Valor Unit]),
    'dStatus'[Id Status] = 1
)

Custo = CALCULATE(
    SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Custo Unit]),
    'dStatus'[Id Status] = 1
)

Despesa = CALCULATE(
    SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Despesa Unit]),
    'dStatus'[Id Status] = 1
)

Imposto = CALCULATE(
    SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Impostos Unit]),
    'dStatus'[Id Status] = 1
)

Comissao = CALCULATE(
    SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Comissão Unit]),
    'dStatus'[Id Status] = 1
)