$computer = "DNS-NAME"

Try{
  "Try $computer";
  if (Test-Connection -ComputerName $computer -Quiet -Count 1){
    Write-Host PC ist online
  } else {
    Write-Host "Not Online $computer" -ForegroundColor Yellow 
    }
  }
Catch {
  Write-Host "No WinRM Active $computer" -ForegroundColor Red 
}
