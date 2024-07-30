#  https://www.veeam.com/kb4349

Add-Type -AssemblyName 'system.security'
$sourceFile = "C:\Users\Administrator\Desktop\creds.csv"

Import-CSV -Path $sourceFile -Header name, salt, note, date -Delimiter ';' | ForEach-Object {
    Write-Host("Check Salt: " + $_.name)
    Write-Host("Note: " + $_.note)
    Write-Host("Created at: " + $_.date)
    $data = [Convert]::FromBase64String($_.salt)
    $raw = [System.Security.Cryptography.ProtectedData]::Unprotect($data, $null, [System.Security.Cryptography.DataProtectionScope]::LocalMachine)
    $pwd = [System.Text.Encoding]::UTF8.GetString($raw)
    Write-Host("Encrypted Password: " + $pwd) -ForegroundColor Green
    Write-Host("")
} 
