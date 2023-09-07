# SCRIPT WILL IMPORT USERS TO A SECURITY GROUP 
# REQUIRE A SOURCE-TXT-FILE WITH FOLLOWING STRUCTUR:
# Group: *GROUPNAME*
# member1
# member2
# *SPACE LINE*
#

$sourceFile = "C:\TEMP\source.txt"
$groupName = "notSet" 

foreach($line in (Get-Content -Path $sourceFile)) {
    # CHECK FOR NEW GROUP
    if($line -like "Group: *") {
        $groupName = $line.Replace("Group: ", "")
        Write-Host($groupName)
        $i = 0
        continue
    }

    # CHECK FOR WHITESPACE = ACTUAL GROUP IS DONE
    if([string]::IsNullOrWhitespace($line)) {
        Write-Host("    Added " + $i + " Users to Group: " + $groupName) -ForegroundColor DarkYellow
        Write-Host("")
        continue
    }

    # ADD NAMED ACCOUNT TO THE ACTUAL GROUP AS A MEMBER
    $i = $i + 1
    Write-Host("    Add new Member for " + $groupName + ": " + $line) -ForegroundColor Green
    Add-ADGroupMember -Identity $groupName -Members $line -WhatIf
}
