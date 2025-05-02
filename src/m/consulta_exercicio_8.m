let
    Pasta = 
        File.Contents("C:\Users\platero\performance_dashboad_comercial\data\exercicios\Exercício 8\Dimensões.xlsx"),
    AbrirArquivo = Excel.Workbook(Pasta),
    TabelaClientes = AbrirArquivo{[Kind = "Table", Item = "Clientes"]}[Data],
    TabelaCidades = AbrirArquivo{[Kind = "Table", Item = "Cidades"]}[Data],
    MesclaTabelas = Table.Join(TabelaClientes, "Id Cidade", TabelaCidades, "Id Cidade")
in 
    MesclaTabelas