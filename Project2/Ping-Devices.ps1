#Prompt the user to enter the device names
$devices = Read-Host -Prompt "Enter device names separated by commas"

#Split the device names into an array
$deviceArray = $devices.Split(",")

#Name and mark the counter variables
$reachableCount = 0
$unreachableCount = 0

#Loop through the array and ping each device
foreach ($device in $deviceArray) {
    $start = Get-Date
    $ping = Test-Connection -ComputerName $device -Count 1 -Quiet
    $end = Get-Date
    $timeTaken = New-TimeSpan $start $end

    if ($ping) {
        Write-Host "$device is reachable. Response time: $($timeTaken.Milliseconds)ms"
        $reachableCount++
    } else {
        Write-Host "$device is not reachable"
        $unreachableCount++
    }
}

#Output the total count of reachable and unreachable devices

Write-Host "Total reachable devices: $reachableCount"
Write-Host "Total unreachable devices: $unreachableCount"

#End script but only after user clicks enter.
Write-Host "Script complete"
Read-Host -Prompt "Press Enter to exit"
