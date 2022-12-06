#CREATE A NEW CODESIGNINGCERT
$CN = "CN=nunterburger@contoso.de"
$validFor = (Get-Date).AddYears(3)
$location = "Cert:\CurrentUser\My"

New-SelfSignedCertificate -CertStoreLocation $location -Subject $CN -NotAfter $validFor -KeyLength 2048 -KeyUsage DigitalSignature -Type CodeSigningCert -KeyExportPolicy Exportable

#SIGNING A POWERSHELL SCRIPT WITH ABOVE CERT
Set-AuthenticodeSignature -FilePath C:\Test.ps1 -Certificate (Get-ChildItem -Path Cert:\CurrentUser\My\ -CodeSigningCert
