(vNomeArquivo as text) =>
let
    Fonte = Csv.Document(File.Contents("C:\Users\platero\performance_dashboad_comercial\data\exercicios\Exercício 7\" & vNomeArquivo), [Delimiter=";", Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Adicionando coluna Filial indicando a filial do vendedor" = Table.AddColumn(Fonte, "Personalizar", each if [Column1] = "Local" then [Column2] else null),
    #"Preenchendo coluna Filial" = Table.FillDown(#"Adicionando coluna Filial indicando a filial do vendedor",{"Personalizar"}),
    #"Removendo linhas superiores" = Table.Skip(#"Preenchendo coluna Filial",4),
    #"Adicionando nova coluna Filial para auxiliar a promoção de cabeçalhos" = Table.AddColumn(#"Removendo linhas superiores", "Personalizar.1", each if [Column1] = "Vendedor" then "Unidade" else [Personalizar]),
    #"Removendo coluna Filial" = Table.RemoveColumns(#"Adicionando nova coluna Filial para auxiliar a promoção de cabeçalhos",{"Personalizar"}),
    #"Promovendo cabeçalhos" = Table.PromoteHeaders(#"Removendo coluna Filial", [PromoteAllScalars=true]),
    #"Transformando colunas com as das em linhas" = Table.UnpivotOtherColumns(#"Promovendo cabeçalhos", {"Unidade", "Vendedor", "Id Vendedor"}, "Data", "Valor"),
    #"Removendo linhas sem dados na coluna Valor" = Table.SelectRows(#"Transformando colunas com as das em linhas", each ([Valor] <> ""))
in
    #"Removendo linhas sem dados na coluna Valor"