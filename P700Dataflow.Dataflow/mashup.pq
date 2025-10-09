[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimEmployee_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "EmployeeKey", DestinationColumnName = "EmployeeKey"], [SourceColumnName = "Full Name", DestinationColumnName = "Full Name"], [SourceColumnName = "Nome", DestinationColumnName = "Nome"], [SourceColumnName = "Sobrenome", DestinationColumnName = "Sobrenome"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "EmailAddress", DestinationColumnName = "EmailAddress"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared DimEmployee = let
  Origem = Sql.Databases("jcdp300sqlserver.database.windows.net"),
  #"Navegação 1" = Origem{[Name = "AdventureWorksDW2020"]}[Data],
  #"Navegação 2" = #"Navegação 1"{[Schema = "dbo", Item = "DimEmployee"]}[Data],
  #"Linhas filtradas" = Table.SelectRows(#"Navegação 2", each ([SalesPersonFlag] = true)),
  #"Colunas removidas" = Table.RemoveColumns(#"Linhas filtradas", {"DepartmentName", "VacationHours", "SickLeaveHours", "CurrentFlag", "EmergencyContactPhone", "Gender", "BaseRate"}),
  #"As outras colunas foram removidas" = Table.SelectColumns(#"Colunas removidas", {"EmployeeKey", "FirstName", "LastName", "Title", "EmailAddress"}),
  #"Colunas mescladas" = Table.CombineColumns(#"As outras colunas foram removidas", {"FirstName", "LastName"}, Combiner.CombineTextByDelimiter(" ", QuoteStyle.None), "Full Name"),
  #"Coluna duplicada" = Table.DuplicateColumn(#"Colunas mescladas", "EmailAddress", "EmailAddress – Cópia"),
  #"Dividir coluna por delimitador" = Table.SplitColumn(#"Coluna duplicada", "EmailAddress – Cópia", Splitter.SplitTextByEachDelimiter({"@"}, QuoteStyle.Csv), {"EmailAddress – Cópia.1", "EmailAddress – Cópia.2"}),
  #"Colunas removidas 1" = Table.RemoveColumns(#"Dividir coluna por delimitador", {"EmailAddress – Cópia.2"}),
  #"Dividir coluna por delimitador 1" = Table.SplitColumn(#"Colunas removidas 1", "EmailAddress – Cópia.1", Splitter.SplitTextByEachDelimiter({"-"}, QuoteStyle.Csv), {"EmailAddress – Cópia.2", "EmailAddress – Cópia.3"}),
  #"Colunas renomeadas" = Table.RenameColumns(#"Dividir coluna por delimitador 1", {{"EmailAddress – Cópia.2", "Nome"}, {"EmailAddress – Cópia.3", "Sobrenome"}}),
  #"Colunas reordenadas" = Table.ReorderColumns(#"Colunas renomeadas", {"EmployeeKey", "Full Name", "Nome", "Sobrenome", "Title", "EmailAddress"}),
  #"Texto em maiúscula" = Table.TransformColumns(#"Colunas reordenadas", {{"Nome", each Text.Upper(_), type nullable text}}),
  #"Todas as palavras foram colocadas em maiúscula" = Table.TransformColumns(#"Texto em maiúscula", {{"Sobrenome", each Text.Proper(_), type nullable text}})
in
  #"Todas as palavras foram colocadas em maiúscula";
shared DimEmployee_DataDestination = let
  Pattern = Fabric.Warehouse([HierarchicalNavigation = null, CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "6175e975-10b1-48af-972a-63d46f8148cd"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "af94ff63-d085-44af-91ea-5aace8c7842c"]}[Data],
  TableNavigation = Navigation_2{[Item = "DimEmployee", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
