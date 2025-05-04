/*COUNTROWS e AVERAGE*/
/*-----------------------------------------------------*/

Qtde Linhas Vendas = COUNTROWS('fVendas') /*conta o número de linhas da tabela/coluna 
informada*/

Qtde Vendas = DISTINCTCOUNT('fVendas'[Num Venda]) /*conta o número de valores distintos 
da coluna informada*/

Positivacao Clientes = 
--refere-se a qtde de clientes que efetuaram compras
DISTINCTCOUNT('fVendas'[Id Cliente])

Positivacao Produtos = 
--refere-se a qtde de produtos que vendidos
DISTINCTCOUNT('fVendas'[Id Produto])