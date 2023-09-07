#COUNT FILES IN EACH SUB-FOLDER
 $folder = "C:\TEMP"

Get-ChildItem $folder -Directory -Recurse | Measure-Object.Count
