/*Funções de Tabela: FILTER, ALL e VALUES*/
/*-----------------------------------------------------*/

FILTER(
    tabela, 
    condição
) /*é uma função iterante, que percorre cada linha da tabela informada no primeiro 
argumento, verificando se a condição do segundo argumento é atendido ou não*/

ALL(tabela ou coluna) /*retorna uma tabela ou Coluna com todos os valores distintos 
removendo/ignorando os filtros existente na tabela ou coluna utilizada como argumento*/

VALUES(tabela ou coluna) /*retorna uma tabela ou coluna com todos os valores distintos 
considerando/devolvendo os filtros existente na tabela ou coluna utilizada como argumento*/


Contagem Exemplo = COUNTROWS(
    FILTER(
        'fVendas',
        'fVendas'[Qtde] > 120
    )
) /*conta linhas da tabela informada, isto é, da tabela que a função FILTER retorna*/

Num Venda Distinto = ALL('fVendas'[Num Venda]) /*retorna tabela com uma única coluna 
contendo os valores distintos da tabela/coluna informada, removendo/ignorando os filtros 
existente nessa*/

Num Venda Distinto = VALUES('fVendas'[Num Venda]) /*retorna tabela com uma única coluna 
contendo os valores distintos da tabela/coluna  informada, considerando/devolvendo os 
filtros existente nessa*/