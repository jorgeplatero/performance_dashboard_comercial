/*IF, HASONEVALUE e SELECTEDVALUE*/
/*-----------------------------------------------------*/

Positivacao Clientes = IF(
    HASONEVALUE('dProdutos'[Subcategoria]),
    DISTINCTCOUNT('fVendas'[Id Cliente]),
    BLANK()
) /*a função HASONEVALUE verifica se há apenas um único valor na coluna informada,
retornando TRUE or FALSE. Dessa forma, evita com que a contagem de clientes seja
retornada no Rótulo Total de uma tabela*/

Selecao Vendedor = SELECTEDVALUE(
    'dVendedores'[Vendedor], "Selecione um Vendedor"
) /*a função SELECTEDVALUE retorna o valor filtrado na coluna informada. Caso não haja
filtro, retorna mensagem alternativa informada*/

Selecao Vendedor Foto = SELECTEDVALUE(
    'dVendedores'[URL Foto], "https://i.ibb.co/qRCdccb/Sem-Selecao.png"
) /*medida para ser utilizada no visual Image by CloudScope*/