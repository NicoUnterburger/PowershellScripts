$From = "from@provider.de"
$To = "to@provider.de"
$MailServer = “ip/domain”

$Body = "test1"
$Subject = “test”

Send-MailMessage -From $From -To $To -Subject $Subject -SmtpServer $MailServer -Body $Body
