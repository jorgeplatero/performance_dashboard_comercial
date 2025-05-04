/*SWITCH*/
/*-----------------------------------------------------*/

Categoria Exemplo = SWITCH(
    TRUE() --expressão que interrompe verificação quando atendida
    [Faturamento] > 10000000, 0.05,
    [Faturamento] > 5000000, 0.03,
    0.01
)