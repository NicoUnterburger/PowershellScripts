#THIS SCRIPT GENERATES NEW INITIAL PASSWORD FOR A COMPLETE OU (INCLUDING SUB OUs) AND GENERATE A CSV WITH ALL NEW PASSWORDS 
$baseOU = "OU=User,DC=contoso,DC=de"
$users = Get-ADUser -Filter * -SearchBase $baseOU
$outfile = "%USERPROFILE%\Desktop\newSetPasswords.csv"
$newcsv = {} | Select "username","password" | Export-Csv $outfile
$csvfile = Import-Csv $outfile

function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$random]
}
 
function Scramble-String([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}

function genPassword() {
    $password = Get-RandomCharacters -length 5 -characters 'abcdefghiklmnoprstuvwxyz'
    $password += Get-RandomCharacters -length 1 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
    $password += Get-RandomCharacters -length 1 -characters '1234567890'
    $password += Get-RandomCharacters -length 1 -characters '!@/\+-'
    $password = Scramble-String $password
    return($password)
}

foreach($user in $users) {
    $newPassword = genPassword
    # REMOVE -whatIf Parameter to set Password propably
    Set-ADAccountPassword -Identity $user -NewPassword (ConvertTo-SecureString -AsPlainText $newPassword -Force) -WhatIf
    $csvfile.username = $user.SamAccountName
    $csvfile.password = $newPassword
    Write-Host("Set Password for User:   " + ($user.SamAccountName))
    $csvfile | Export-CSV $outfile –Append
}
