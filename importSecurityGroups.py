$inputFile = "%USERPROFILE%\Desktop\administrativGroups.txt"
$ou = "OU=Administrativ,OU=Groups,DC=contoso,DC=de"

foreach ($groupname in Get-Content $inputFile) {
    Write-Host("Create following Group:   " + $groupname)
    New-ADGroup -Name $groupname -GroupCategory Security -Path $ou -GroupScope Global
}
