$OU = "OU=Groups,DC=contoso,DC=de"
$DateTime = Get-Date -f "yyyyMMddhhmm"
$CSVFile = "C:\exportOU" + $DateTime + ".csv"

$ADGroups += Get-ADGroup -Filter * -SearchBase $ou
$adGroupMembers = foreach ($Group in $ADGroups) {
    Get-ADGroupMember -Identity $Group -Recursive | Select-Object @{Name='Group';Expression={$Group.Name}}, @{Name='Member';Expression={$_.SamAccountName}}
}

# export ad group name and user to csv file
$adGroupMembers | Export-Csv -Path $CSVFile -NoTypeInformation
