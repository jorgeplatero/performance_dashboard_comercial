/*Entendendo o Comportamento da ALL e VALUES em contextos*/
/*-----------------------------------------------------*/

Qtde Vendas VALUES = COUNTROWS(VALUES('fVendas'[Num Venda])) /*conta as linhas da tabela ou
coluna informada no parâmetro, isto é, da coluna virtual criada com os valores distintos da 
coluna Num Venda de fVendas. Essa medida considera os filtros de contexto aplicados*/

Qtde Vendas ALL = COUNTROWS(ALL('fVendas'[Num Venda])) /*conta as linhas da tabela ou
coluna informada no parâmetro, isto é, da coluna virtual criada com os valores distintos da 
coluna Num Venda de fVendas. Essa medida ignora os filtros de contexto aplicados*/