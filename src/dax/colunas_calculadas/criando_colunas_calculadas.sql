/*Criando colunas calculadas*/
/*-----------------------------------------------------*/

Faturamento = 'fVendas'[Qtde] * 'fVendas'[Valor Unit] --faturamento

Custo = 'fVendas'[Qtde] * 'fVendas'[Custo Unit]

Despesa = 'fVendas'[Qtde] * 'fVendas'[Despesa Unit]

Imposto = 'fVendas'[Qtde] * 'fVendas'[Impostos Unit]

Comissao = 'fVendas'[Qtde] * 'fVendas'[Comissão Unit]

Abatimento = 'fVendas'[Custo] + 'fVendas'[Imposto] + 'fVendas'[Despesa] + 'fVendas'[Comissao]

Resultado Bruto ='fVendas'[Faturamento] - 'fVendas'[Custo]

Resultado = 'fVendas'[Faturamento] - 'fVendas'[Abatimento]

Margem Bruta = (('fVendas'[Faturamento] - 'fVendas'[Resultado Bruto]) / 'fVendas'[Faturamento]) * 100 

Margem Operacional = (('fVendas'[Faturamento] - 'fVendas'[Resultado]) / 'fVendas'[Faturamento]) * 100

Margem Operacional % = 'fVendas'[Resultado] / 'fVendas'[Faturamento]