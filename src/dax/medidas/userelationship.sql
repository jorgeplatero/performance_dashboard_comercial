/*USERELATIONSHIP*/
/*-----------------------------------------------------*/

Faturamento Envio = CALCULATE(
    [Faturamento],
    USERELATIONSHIP('dCalendario'[Data], 'fVendas'[Data Envio])
) /*USERELATIONSHIP alterar o contexto da da expressão para o relacionamento informado*/