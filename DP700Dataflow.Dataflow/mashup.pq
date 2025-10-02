[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimEmployee_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "File", TransformationQueryName = "DimEmployee_DataDestinationTransform"]]]}]
shared DimEmployee = let
  Source = Sql.Databases("jcdp300sqlserver.database.windows.net"),
  #"Navigation 1" = Source{[Name = "AdventureWorksDW2020"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "dbo", Item = "DimEmployee"]}[Data],
  #"Filtered rows" = Table.SelectRows(#"Navigation 2", each ([SalesPersonFlag] = true)),
  #"Removed columns" = Table.RemoveColumns(#"Filtered rows", {"BaseRate", "MaritalStatus", "EmergencyContactName", "HireDate", "LoginID", "Phone"}),
  #"Removed other columns" = Table.SelectColumns(#"Removed columns", {"EmployeeKey", "FirstName", "LastName", "EmailAddress", "Title"}),
  #"Merged columns" = Table.CombineColumns(#"Removed other columns", {"FirstName", "LastName"}, Combiner.CombineTextByDelimiter(" ", QuoteStyle.None), "Full Name"),
  #"Duplicated column" = Table.DuplicateColumn(#"Merged columns", "EmailAddress", "EmailAddress - Copy"),
  #"Split column by delimiter" = Table.SplitColumn(#"Duplicated column", "EmailAddress - Copy", Splitter.SplitTextByEachDelimiter({"@"}, QuoteStyle.Csv), {"EmailAddress - Copy.1", "EmailAddress - Copy.2"}),
  #"Removed columns 1" = Table.RemoveColumns(#"Split column by delimiter", {"EmailAddress - Copy.2"}),
  #"Split column by delimiter 1" = Table.SplitColumn(#"Removed columns 1", "EmailAddress - Copy.1", Splitter.SplitTextByEachDelimiter({"-"}, QuoteStyle.Csv), {"EmailAddress - Copy.2", "EmailAddress - Copy.3"}),
  #"Renamed columns" = Table.RenameColumns(#"Split column by delimiter 1", {{"EmailAddress - Copy.2", "First Name"}, {"EmailAddress - Copy.3", "Last Name"}}),
  #"Reordered columns" = Table.ReorderColumns(#"Renamed columns", {"EmployeeKey", "Full Name", "Last Name", "EmailAddress", "Title", "First Name"}),
  #"Renamed columns 1" = Table.RenameColumns(#"Reordered columns", {{"Full Name", "FullName"}}),
  #"Reordered columns 1" = Table.ReorderColumns(#"Renamed columns 1", {"EmployeeKey", "FullName", "First Name", "Last Name", "EmailAddress", "Title"}),
  #"Renamed columns 2" = Table.RenameColumns(#"Reordered columns 1", {{"First Name", "FirstName"}, {"Last Name", "LastName"}})
in
  #"Renamed columns 2";
shared DimEmployee_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "f371512d-3806-4888-9fc4-a407e39710ae"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "557bcfcd-744d-4a21-a76c-98d7672aadd0"]}[Data],
  Navigation_3 = Navigation_2{[Id = "Files", ItemKind = "Folder"]}[Data],
  Navigation_4 = Navigation_3{[Name = "bronze"]}[Content],
  FileNavigation = Navigation_4{[Name = "DimEmployeebronze.csv"]}?[Content]?
in
  FileNavigation;
shared DimEmployee_DataDestinationTransform = (binaryStream, columnNameAndTypePairs) => let
  Pattern = Csv.Document(binaryStream, [Columns = List.Transform(columnNameAndTypePairs, each _{0}), CsvStyle = CsvStyle.QuoteAfterDelimiter, IncludeByteOrderMark = true, ExtraValues = ExtraValues.Ignore, Delimiter = ",", Encoding = 65001]),
  PromoteHeaders = Table.PromoteHeaders(Pattern),
  TransformColumnTypes = Table.TransformColumnTypes(PromoteHeaders, columnNameAndTypePairs, [MissingField = MissingField.Ignore])
in
  TransformColumnTypes;
