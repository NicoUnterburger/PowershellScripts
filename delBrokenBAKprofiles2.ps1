if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
gci 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList' | %{
    $hklmpath = $_.name -replace "HKEY_LOCAL_MACHINE","hklm:"
    $path =  (Get-ItemProperty -LiteralPath $hklmpath -Name ProfileImagePath).ProfileImagePath
    if(-not(test-path $path)) {
            Remove-Item -Path $hklmpath
    }
}
