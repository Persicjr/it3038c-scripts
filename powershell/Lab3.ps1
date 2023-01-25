function getIP{
    (Get-NetIPAddress).IPv4Address | Select-String "192*"
    }

$IP = getIP
$USER = $env:UserName
$Hostname = $env:COMPUTERNAME
$Version = $HOST.version.Major
$Date_S = Get-Date -format "dddd, MMMM dd yyyy"

$Body = ("This machine's IP is $IP. User is $User. Hostname is $Hostname. PowerShell Version $Version. Today's date is $Date_S")

Write-Host($Body)

Send-MailMessage -To "persicjr@uc.mail.edu" -From "jakepersic2019@gmail.com" -Subject "IT3038C Windows SysInfo" -Body $Body -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential)