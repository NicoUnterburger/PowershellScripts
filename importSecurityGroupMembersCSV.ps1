# SCRIPT WILL IMPORT USERS TO A SECURITY GROUP 
# REQUIRE A SOURCE-CSV-FILE WITH FOLLOWING STRUCTUR:
# *member1*;*groupname*
# ...
#

$sourceFile = "C:\temp\source.csv"

Import-CSV -Path $sourceFile -Header 'User', 'Group' -Delimiter ';' | ForEach-Object {
    Write-Host("Add User " + $_.User + " to Group: " + $_.Group) -ForegroundColor Green
    Add-ADGroupMember -Identity $_.User -Members $_.Group
}
