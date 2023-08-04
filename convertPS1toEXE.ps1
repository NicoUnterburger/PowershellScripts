if (-Not (Get-Module -ListAvailable -Name ps2exe)) {
    Write-Host "Need to Install Powershell-Module: ps2exe"
    Install-Module ps2exe -Force
} 

$source = Read-Host("Pfad zum Quell-Powershell-Script")
$target = Read-Host("Pfad zur Ziel-EXE")
$productName = Read-Host("Wie soll das Produkt heißen")
$version = Read-Host("Version des Produktes")
$creator = "Nico Unterburger"

Invoke-PS2EXE $source $target -noConsole -title $productName -description $source -company $creator -product $productName -copyright $creator -version $version
