/*Exercício – Filtros na Calculate*/
/*-----------------------------------------------------*/

Faturamento Paola KEEPFILTERS = CALCULATE(
    [Faturamento],
    KEEPFILTERS('dVendedores'[Vendedor] = "Paola")
)


Faturamento Paola VALUES = CALCULATE(
    [Faturamento],
    FILTER(
        VALUES('dVendedores'[Vendedor]),
        'dVendedores'[Vendedor] = "Paola"
    )
)
