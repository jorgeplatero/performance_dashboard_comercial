/*Atenção com uso de variáveis na CALCULATE*/
/*-----------------------------------------------------*/

--abordagem incorreta
Faturamento Paola VAR = 
VAR vFaturamento = [Faturamento]
RETURN
CALCULATE(
    vFaturamento,
    'dVendedores'[Vendedor] = "Paola"
) /*variáveis são constantes e não sofrem alterações de contexto depos de instanciadas*/