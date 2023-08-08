#SCRIPT WILL BE SEARCHING FOR NAME AND DESCRIPTION
Function Get-Input([string] $message, [string] $title = "AD Computersuche", [string] $defaultText) {
    Add-Type -AssemblyName Microsoft.VisualBasic
    return [Microsoft.VisualBasic.Interaction]::InputBox($message, $title, $defaultText)
}

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
$Properties = @('Name', 'Description', 'DistinguishedName', 'OperatingSystem', 'IPv4Address', 'DNSHostName', 'lastLogonDate')
$runAgain = 1

while($runAgain -eq 1) {
    $searchInput = Get-Input("Nach welcher Beschreibung soll gesucht werden?")
    if ([string]::IsNullOrEmpty($searchInput)) {
        [System.Windows.Forms.Messagebox]::Show("Leere Eingabe nicht zulaessig!")
    } else {
        $searchInput = "*" + $searchInput + "*"
        if ($result = Get-ADComputer -Filter {Description -like $searchInput -Or Name -like $searchInput} -Properties $Properties | Select-Object $Properties) {
            $result | Sort-Object Name | Out-GridView -Title "AD Computer - Suchergebnisse"
            $runAgain = 0
        } else {
            [System.Windows.Forms.Messagebox]::Show("Es wurde kein Ergebnis gefunden")
            $runAgain = 1
        }
    }
}
