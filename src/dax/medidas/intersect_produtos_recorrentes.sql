/*INTERSECT – Produtos Recorrentes*/
/*-----------------------------------------------------*/

Produtos Recorrentes Mes Anterior = 
VAR vProdutosAtuais = VALUES(
    'fVendas'[Id Produto]
)
VAR vProdutosPeriodoAnterior = CALCULATETABLE(
    VALUES('fVendas'[Id Produto]),
    PREVIOUSMONTH('dCalendario'[Data])
)
VAR vRecorrentes = INTERSECT(vProdutosAtuais, vProdutosPeriodoAnterior)
RETURN
COUNTROWS(vRecorrentes)