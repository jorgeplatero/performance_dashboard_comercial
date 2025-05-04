/*SUMX e AVERAGEX*/
/*-----------------------------------------------------*/

Faturamento = SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Valor Unit]) /*soma os resultados 
de uma expressão aplicada a cada linha de uma tabela*/

Faturamento Media = AVERAGEX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Valor Unit]) /*retorna a 
média dos valores resultantes de uma expressão aplicada a cada linha de uma tabela*/

Faturamento Max = MAXX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Valor Unit]) /*retorna o valor
máximo resultante de uma expressão aplicada a cada linha de uma tabela*/

Custo = SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Custo Unit])

Despesa = SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Despesa Unit])

Imposto = SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Impostos Unit])

Comissao = SUMX('fVendas', 'fVendas'[Qtde] * 'fVendas'[Comissão Unit])