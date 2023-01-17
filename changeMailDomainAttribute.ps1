$oupath = "OU=Users,DC=contoso,DC=de"
$users = Get-ADUser -Filter * -SearchBase $oupath -Properties SamAccountName, Mail
$oldDomain = "@contoso.de"
$newDomain = "@contosonew.de"

Foreach ($user in $users) {
    $oldmail = $user.Mail
    Write-Host "Check Useraccount:           " $user.SamAccountName
    If($oldmail -like "*@contoso.de") {
        Write-Host("WOULD CHANGE!")
        $newmail = $oldmail.replace($oldDomain, $newDomain)
        Write-Host "User Old:               " $oldmail
        Write-Host "User New:               " $newmail
        Set-ADUser -Identity $user -EmailAddress $newmail
    }
    Write-Host "------------------------------------------"
}
