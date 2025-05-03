/*Utilizando Variáveis*/
/*-----------------------------------------------------*/

Margem Contribuicao % = 
VAR vFaturamentoFixo = CALCULATE(
    [Faturamento],
    ALLSELECTED('fVendas')
)
RETURN
DIVIDE(
        [Faturamento],
        vFaturamentoFixo
)