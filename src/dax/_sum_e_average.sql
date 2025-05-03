/*SUM e AVERAGE*/
/*-----------------------------------------------------*/

/*
    Essas funções utilizam apenas o contexto de filtro para realizar os cálculos,
    isto é, retornam o resultado da expressão aplicada em apenas uma coluna
*/

Receita Bruta = SUM('fVendas'[Faturamento]) 

Receita Bruta Media = AVERAGE('fVendas'[Faturamento])