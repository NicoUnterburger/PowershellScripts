#THIS SCRIPT SWITCH THE AD-ATTRIBUTE ProxyAdresses, Primary and Alias
$oupath = "OU=Users,DC=contoso,DC=de"
$users = Get-ADUser -Filter * -SearchBase $oupath -Properties SamAccountName, ProxyAddresses
$oldDomain = "@contoso.de"
$newDomain = "@contosonew.de"

Foreach ($user in $users) {
    $oldSAMproxy, $newSAMproxy = $false
    $oldPrimary, $oldAlias = ""
    Write-Host "Check Useraccount:           " $user.SamAccountName
    Foreach ($proxy in $user.ProxyAddresses) {
        If($proxy -eq "SMTP:$($user.SamAccountName)$($oldDomain)") {
            $oldSAMproxy = $true
            $oldPrimary = $proxy
        }
        If($proxy -eq "smtp:$($user.SamAccountName)$($newDomain)") {
            $newSAMproxy = $true
            $oldAlias = $proxy
        }
    }
    If($oldSAMproxy -eq $true -and $newSAMproxy -eq $true) {
        Write-Host("Namensschema passt!")
        Write-Host($oldPrimary + "  =>  " + $oldPrimary.replace($oldDomain, $newDomain))
        Write-Host($oldAlias + "  =>  " + $oldAlias.replace($newDomain, $oldDomain))
        Write-Host("before: " + $user.ProxyAddresses)
        Set-ADUser -Identity $user -Remove @{proxyaddresses = $oldPrimary}
        Set-ADUser -Identity $user -Remove @{proxyaddresses = $oldAlias}
        Set-ADUser -Identity $user -Add @{proxyaddresses = ($oldPrimary.replace($oldDomain, $newDomain))}
        Set-ADUser -Identity $user -Add @{proxyaddresses = ($oldAlias.replace($newDomain, $oldDomain))}
        Write-Host("after: " + $user.ProxyAddresses)
    }
    Write-Host ""
}
