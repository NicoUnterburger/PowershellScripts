#REQUIRE A TXT FILE WITH COMPUTER-DNS-NAMES LINE-PER-LINE
#REQUIRE LOCAL ADMIN PRIVILEGES AND ACTIVE WinRM

foreach  ($computer in Get-Content "C:\systemlist.txt")
{
    Try{
        "Try $computer";
        if (Test-Connection —ComputerName $computer -Quiet -Count 1){

            $ComputerSystem = Get-WmiObject -Class Win32_ComputerSystem -Computername $Computer
            $BootConfiguration = Get-WmiObject -Class Win32_BootConfiguration -Computername $Computer
            $BIOS = Get-WmiObject -Class Win32_BIOS -Computername $Computer
            $OS = Get-WmiObject -Class Win32_OperatingSystem -Computername $Computer
            $CPU = Get-WmiObject -class win32_Processor -Computername $Computer
            $GPU = Get-WmiObject -class cim_PCVideoController -Computername $Computer
            $HDD  = Get-WmiObject -class win32_DiskDrive -Computername $Computer
            $NIC  = Get-WmiObject Win32_NetworkAdapterConfiguration -Computername $Computer | where{$_.IPEnabled -eq "True"}
            $HDDindex = 1
            $NICindex = 1

            $report = New-Object psobject
            $report | Add-Member -MemberType NoteProperty -name ComputerName -Value $BIOS.PSComputerName
            $report | Add-Member -MemberType NoteProperty -name PC-Hersteller -Value $ComputerSystem.Manufacturer
            $report | Add-Member -MemberType NoteProperty -name PC-Modell -Value $ComputerSystem.Model
            $report | Add-Member -MemberType NoteProperty -name Beschreibung -Value $ComputerSystem.Description
            $report | Add-Member -MemberType NoteProperty -name OSTyp -Value $ComputerSystem.SystemType
            $report | Add-Member -MemberType NoteProperty -name AnzahlSockets -Value $ComputerSystem.NumberOfProcessors
            $report | Add-Member -MemberType NoteProperty -name RAM -Value ($ComputerSystem.TotalPhysicalMemory)
            $report | Add-Member -MemberType NoteProperty -name BIOS-Hersteller -Value $BIOS.Manufacturer
            $report | Add-Member -MemberType NoteProperty -name BIOS-Version -Value $BIOS.Version
            $report | Add-Member -MemberType NoteProperty -name BIOS-Name -Value $BIOS.Name
            $report | Add-Member -MemberType NoteProperty -name BIOS-Serialnumber -Value $BIOS.SerialNumber
            $report | Add-Member -MemberType NoteProperty -name CPU-Name -Value $CPU.Name.Trim()
            $report | Add-Member -MemberType NoteProperty -name CPU-Befehlssatz -Value $CPU.Datawidth
            $report | Add-Member -MemberType NoteProperty -name CPU-CoreAnzahl -Value $CPU.NumberOfCores
            $report | Add-Member -MemberType NoteProperty -name CPU-ThreadAnzahl -Value $CPU.NumberOfLogicalProcessors
            $report | Add-Member -MemberType NoteProperty -name GPU-Name -Value $GPU.Name

            ForEach($Item in $HDD) {
                $Modelname = "HDD-Model" + $HDDindex
                $KapazitaetName = "HDD" + $HDDindex
                $report | Add-Member -MemberType NoteProperty -Name $Modelname -Value $Item.Model -Force
                $report | Add-Member -MemberType NoteProperty -Name $KapazitaetName -Value $Item.Size -Force
                $HDDindex++
            }

            $report | Add-Member -MemberType NoteProperty -Name OS-Hersteller -Value $OS.Manufacturer
            $report | Add-Member -MemberType NoteProperty -Name OS-Name -Value $OS.Name
            $report | Add-Member -MemberType NoteProperty -Name OS-Version -Value $OS.Version
            $report | Add-Member -MemberType NoteProperty -Name OS-Build -Value $OS.BuildNumber

            ForEach($Item in $NIC) {
                $DHCPact =  "DHCP-Aktiviert" + $HDDindex
                $DHCPser ="DHCP-Server" + $HDDindex
                $IP = "IP-Adresse" + $HDDindex
                $MAC = "MAC-Adresse" + $HDDindex
                $report | Add-Member -MemberType NoteProperty -Name $DHCPact -Value $Item.DHCPEnabled[0] -Force
                $report | Add-Member -MemberType NoteProperty -Name $DHCPser -Value $Item.DHCPServer -Force
                $report | Add-Member -MemberType NoteProperty -Name $IP -Value $Item.IPAddress[0] -Force
                $report | Add-Member -MemberType NoteProperty -Name $MAC -Value $Item.MACAddress[0] -Force
                $NICindex++
            }
            Write-Host "Record Inserted: $computer" -ForegroundColor Green

        }
        else {
            Write-Host "Not Online $computer" -ForegroundColor Yellow 
        }
    }
    Catch {
        Write-Host "No WinRM Active $computer" -ForegroundColor Red 
    }
}


$report | export-csv .\export-assets.csv -NoTypeInformation
