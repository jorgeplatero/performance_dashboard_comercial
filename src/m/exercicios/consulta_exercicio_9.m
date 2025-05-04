let
    FonteCSV = Csv.Document(
        File.Contents("C:\Users\platero\performance_dashboad_comercial\data\exercicios\Exercício 9\dCidades.txt"), [Delimiter=";", Columns=4, Encoding=1252, QuoteStyle=QuoteStyle.None]
    ),
    FonteXLSX = Excel.Workbook(
        File.Contents("C:\Users\platero\performance_dashboad_comercial\data\exercicios\Exercício 9\dClientes.xlsx"), null, true
    ),
    TbCidades = Table.PromoteHeaders(FonteCSV, [PromoteAllScalars=true]),
    TbClientes = Table.TransformColumnTypes(
        FonteXLSX{[Item="Clientes", Kind="Table"]}[Data],
        {
            {"Id Cliente", type text}, 
            {"Cliente", type text}, 
            {"Id Cidade", type text}
        }
    ),
    TbMesclada = Table.TransformColumnTypes(
        Table.RemoveColumns(Table.Join(TbClientes, "Id Cidade", TbCidades, "Id Cidade"), {"Id Cidade"}),
        {
            {"Id Cliente", Int64.Type}, 
            {"Cliente", type text}, {"Cidade", type text}, 
            {"UF", type text}, 
            {"Estado", type text}
        }
    )
in
    TbMesclada