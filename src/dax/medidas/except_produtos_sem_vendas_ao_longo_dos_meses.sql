/*EXCEPT – Produtos sem vendas ao longo dos Meses*/
/*-----------------------------------------------------*/

Negativacao Produto = 
VAR vPositivados = VALUES(
    'fVendas'[Id Produto]
)
VAR vCadastrados = VALUES(
    'dProdutos'[Id Produto]
)
VAR vNegativados = EXCEPT(
    vCadastrados, vPositivados
)
RETURN
COUNTROWS(vNegativados) /*EXCEPT retorna os valores para os quais não há interseção
nas tabelas informadas*/