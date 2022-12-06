#RUN AS AN ADMIN
$key = "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"

#CHECK ACTUAL VERSION
DISM /Online /Get-CurrentEdition

#CHECK AVAILABLE VERSIONs
DISM /online /Get-TargetEditions

#PERFORM UPGRADE, DONT RUN ON AN DC!
DISM /online /Set-Edition:ServerDatacenter /ProductKey:$key /AcceptEula
