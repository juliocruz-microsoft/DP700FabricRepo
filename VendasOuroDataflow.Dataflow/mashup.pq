[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "vendasprata_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "SalesOrderNumber", DestinationColumnName = "SalesOrderNumber"], [SourceColumnName = "SalesOrderLineNumber", DestinationColumnName = "SalesOrderLineNumber"], [SourceColumnName = "OrderDate", DestinationColumnName = "OrderDate"], [SourceColumnName = "Year", DestinationColumnName = "Year"], [SourceColumnName = "Month", DestinationColumnName = "Month"], [SourceColumnName = "FirstName", DestinationColumnName = "FirstName"], [SourceColumnName = "LastName", DestinationColumnName = "LastName"], [SourceColumnName = "EmailAddress", DestinationColumnName = "EmailAddress"], [SourceColumnName = "Item", DestinationColumnName = "Item"], [SourceColumnName = "Quantity", DestinationColumnName = "Quantity"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared vendasprata = let
  Origem = Lakehouse.Contents(null),
  Navegação = Origem{[workspaceId = "6175e975-10b1-48af-972a-63d46f8148cd"]}[Data],
  #"Navegação 1" = Navegação{[lakehouseId = "2443fb80-924e-4402-b819-8b1665ee5cf8"]}[Data],
  #"Navegação 2" = #"Navegação 1"{[Id = "vendasprata", ItemKind = "Table"]}[Data],
  #"Tipo de coluna alterado" = Table.TransformColumnTypes(#"Navegação 2", {{"UnitPrice", Currency.Type}, {"TaxAmount", Currency.Type}}),
  #"Personalização adicionada" = Table.AddColumn(#"Tipo de coluna alterado", "Personalizar", each ([UnitPrice])*[TaxAmount]),
  #"Tipo de coluna alterado 1" = Table.TransformColumnTypes(#"Personalização adicionada", {{"Personalizar", Currency.Type}}),
  #"Colunas renomeadas" = Table.RenameColumns(#"Tipo de coluna alterado 1", {{"Personalizar", "VendasTotais"}})
in
  #"Colunas renomeadas";
shared vendasprata_DataDestination = let
  Pattern = Fabric.Warehouse([HierarchicalNavigation = null, CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "6175e975-10b1-48af-972a-63d46f8148cd"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "af94ff63-d085-44af-91ea-5aace8c7842c"]}[Data],
  TableNavigation = Navigation_2{[Item = "vendasouro", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
