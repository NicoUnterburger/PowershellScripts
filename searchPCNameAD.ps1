#SCRIPT WILL BE SEARCHING FOR NAME AND DESCRIPTION
Function Get-Input([string] $message, [string] $title = "AD Computersuche", [string] $defaultText) {
    Add-Type -AssemblyName Microsoft.VisualBasic
    return [Microsoft.VisualBasic.Interaction]::InputBox($message, $title, $defaultText)
}

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
$searchInput = Get-Input("Nach welcher Beschreibung soll gesucht werden?")
$Properties = @('Name', 'Description', 'DistinguishedName', 'OperatingSystem', 'IPv4Address', 'DNSHostName', 'lastLogonDate')

if ([string]::IsNullOrEmpty($searchInput)) { [System.Windows.Forms.Messagebox]::Show("Leere Eingabe nicht zulaessig!")
} else {
    $searchInput = "*" + $searchInput + "*"
    Get-ADComputer -Filter {Description -like $searchInput -Or Name -like $searchInput} -Properties $Properties | Sort-Object Name | Select-Object $Properties | Out-GridView -Title "AD Computer - Suchergebnisse"
}
