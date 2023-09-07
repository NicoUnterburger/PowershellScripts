$sourceFile = "C:\TEMP\source.csv"
$targetOU = "OU=Users,DC=contoso,DC=de"
$i = 0

Import-CSV -Path $sourceFile -Header 'groupName', 'groupDesc' -Delimiter ';' | ForEach-Object {
    $i = $i + 1
    Write-Host("Create new Security-Group (Global):   " + $_.groupName + " (" + $_.groupDesc + ")") -ForegroundColor Yellow
    New-ADGroup -Name $_.groupName -GroupCategory Security -Path $targetOU -Description $_.groupDesc -GroupScope Global -WhatIf 
}

Write-Host("Created " + $i + " new Security Groups to the following OU: " + $targetOU) -ForegroundColor Green
