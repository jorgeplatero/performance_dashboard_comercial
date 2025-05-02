let
    DataMin = List.Min(fVendas[Data Pedido] & fMetas[Data]),
    DataMax = List.Max(fVendas[Data Envio]),
    AnoMin = Date.Year(DataMin),
    AnoMax = Date.Year(DataMax),
    vDuracaoDias = Duration.Days(#date(AnoMax, 12, 31) - #date(AnoMin, 1, 1)) + 1,

    Fonte = List.Dates(#date(AnoMin, 1, 1), vDuracaoDias, #duration(1, 0, 0, 0)),
    #"Convertendo lista para tabela" = Table.FromList(Fonte, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Renomeando coluna" = Table.RenameColumns(#"Convertendo lista para tabela",{{"Column1", "Data"}}),
    #"Alterando tipo da coluna Data para Data" = Table.TransformColumnTypes(#"Renomeando coluna",{{"Data", type date}}),
    #"Inserindo coluna Ano" = Table.AddColumn(#"Alterando tipo da coluna Data para Data", "Ano", each Date.Year([Data]), Int64.Type),
    #"Inserindo coluna Nome do Mes" = Table.AddColumn(#"Inserindo coluna Ano", "Nome do Mes", each Date.MonthName([Data]), type text),
    #"Transformando coluna Nome do Mes para obter meses com iniciais maiúsculas" = Table.TransformColumns(#"Inserindo coluna Nome do Mes",{{"Nome do Mes", Text.Proper, type text}}),
    #"Inserindo coluna Nome do Mes Abreviado" = Table.AddColumn(#"Transformando coluna Nome do Mes para obter meses com iniciais maiúsculas", "Nome do Mes Abreviado", each Text.Start([Nome do Mes], 3)),
    #"Inserindo coluna Mes-Ano" = Table.AddColumn(#"Inserindo coluna Nome do Mes Abreviado", "Mes-Ano", each Text.Combine({[Nome do Mes Abreviado], "-", Text.From([Ano], "pt-BR")}), type text),
    #"Inserindo coluna Mes" = Table.AddColumn(#"Inserindo coluna Mes-Ano", "Mes", each Date.Month([Data]), Int64.Type),
    #"Inserindo Mes-Ano Classificacao" = Table.AddColumn(#"Inserindo coluna Mes", "Mes-Ano Classificacao", each [Ano] * 100 + [Mes]),
    #"Inserindo coluna Dia" = Table.AddColumn(#"Inserindo Mes-Ano Classificacao", "Dia", each Date.Day([Data]), Int64.Type),
    #"Inserindo coluna Semestre" = Table.AddColumn(#"Inserindo coluna Dia", "Semestre", each if [Mes] <= 6 then "Sem1" else "Sem2"),
    #"Inserindo coluna Trimestre" = Table.AddColumn(#"Inserindo coluna Semestre", "Trimestre", each if [Mes] <= 3 then "Trim1" else if [Mes] <= 6 then "Trim2" else if [Mes] <= 9 then "Trim3" else "Trim4"),
    #"Alterando tipo das colunas Mes-Ano Classificacao, Mes Abreviado, Trimestre e Semestre para texto" = Table.TransformColumnTypes(#"Inserindo coluna Trimestre",{{"Mes-Ano Classificacao", Int64.Type}, {"Nome do Mes Abreviado", type text}, {"Trimestre", type text}, {"Semestre", type text}})
in
    #"Alterando tipo das colunas Mes-Ano Classificacao, Mes Abreviado, Trimestre e Semestre para texto"