# PowershellScripts
all content is written with standard Powershell installation (Win10/Win11, Version 5.1)

## Script Template-Blocks
| Script                                               | Description                                                                                     |
| ---------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| [synopsis.ps1](./Templates/synopsis.ps1) | Standard Powershell Synopsis |
| [forEach-CSV.ps1](./Templates/forEach-CSV.ps1) | For each Line in .csv File ... |
| [forEach-TXT.ps1](./Templates/forEach-TXT.csv) | For each Line in .txt File ... |
| [GUI.ps1](./Templates/GUI.ps1) | GUI Initialising |
| [countFilesInFolder.ps1](./Templates/countFilesInFolder.ps1) | Count all Files in each Subfolder |
| [sendSMTPmail.ps1](./Templates/sendSMTPmail.ps1) | Simple Script to send Mails via SMTP |

## Ready to use Scripts
| Script                                               | Description                                                                                     |
| ---------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| [WinServer-EvalToFull.ps1](WinServer-EvalToFull.ps1) | Convert Windows Server from Evaluation Mode to Standard or Datacenter                  |
| [changeMailDomainAttribute.ps1](changeMailDomainAttribute.ps1) | Switch Domain from Mail-Attribute |
| [checkAndMoveFSMOroles.ps1](checkAndMoveFSMOroles.ps1) | Move FSMO-Roles to new DC | 
| [checkComputerAvailability.ps1](checkComputerAvailability.ps1) | Ping Computer via Script | 
| [convertPS1toEXE.ps1](convertPS1toEXE.ps1) | Convert .ps1-File to an executable EXE File |
| [createCodeSigningCert.ps1](createCodeSigningCert.ps1) | Create new CodeSigning Certificate |
| [exportSecurityGroupMembers.ps1](exportSecurityGroupMembers.ps1) | Export Members from all Security Groups |
| [importSecurityGroupsTXT.ps1](importSecurityGroupsTXT.ps1) | Create SecurityGroups from source .txt File |
| [importSecurityGroupsCSV.ps1](importSecurityGroupsCSV.ps1) | Create SecurityGroups from source .csv File |
| [importSecurityGroupMembersTXT.ps1](./importSecurityGroupMembersTXT.ps1) | Import Users to an AD Security Group, based on a .txt File |
| [importSecurityGroupMembersCSV.ps1](importSecurityGroupMembersCSV.ps1) | Import Users to an AD Security Group, based on a .csv File |
| [resetPasswordForOU.ps1](resetPasswordForOU.ps1) | Reset Password for each User in OU (and Sub-OUs) |
| [searchPCNameAD.ps1](searchPCNameAD.ps1) | Search Name and Description Computer-Objects |
| [switchProxyAddresses.ps1](switchProxyAddresses.ps1) | Switch primary and alias Adresses from AD-ProxyAdresses |
| [winAssetGenerator.ps1](winAssetGenerator.ps1) | Generate Full Overview of all mentioned Computer-Objects |
