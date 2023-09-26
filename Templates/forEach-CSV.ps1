$sourceFile = "C:\Temp\source.csv"

Import-CSV -Path $source -Delimiter ';' -Header "Row1","Row2" | ForEach-Object {
  continue
}
