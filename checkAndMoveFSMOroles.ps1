$domainname = "contoso.de"
$newFSMOholder = "dc01"

#GET INFORMATION ABOUT FSMO-ROLE HOLDER
Get-ADForest $domainname | Format-Table schemamaster, domainnamingmaster
Get-ADDomain $domainname | Format-Table PDCEmulator,RIDMaster,InfrastructureMaster

MOVE FSMO ROLES
Move-ADDirectoryServerOperationMasterRole -Identity $newFSMOholder –OperationMasterRole DomainNamingMaster,PDCEmulator,RIDMaster,SchemaMaster,InfrastructureMaster
