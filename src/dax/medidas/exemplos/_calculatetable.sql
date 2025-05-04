/*CALCULATETABLE*/
/*-----------------------------------------------------*/

Tabela Vendas Guardiola = FILTER(
    'fVendas',
    'fVendas'[Id Vendedor] IN {1, 2, 7}
) /*utilizando FILTER. Não é possível filtrar por outras tabelas*/

Tabela Vendas Audio CALCULATETABLE = CALCULATETABLE(
    'fVendas',
    'dProdutos'[Categoria] = "Audios"
) /*retorna tabela aplicando filtro com dados de outra tabela*/

Qtde Linhas Categoria Audios = COUNTROWS(
    CALCULATETABLE(
        'fVendas',
        'dProdutos'[Categoria] = "Audios"
    )
) /*retorna número de linha da tabela calculada*/