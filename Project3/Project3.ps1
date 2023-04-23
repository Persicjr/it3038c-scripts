#Prompt user to choose between CSV file and manual input
$inputMethod = Read-Host -Prompt "Enter 'CSV' to input devices from a CSV file, or 'Manual' to input device names manually"

if ($inputMethod = "CSV") {
	#Prompt user to enter the file path
	Write-Host
	Write-Host "Be sure to add 'DeviceName' in the first cell of your CSV file"
	$filePath = Read-Host -Prompt "Enter the path of the CSV file"
    
	#Reading path and CSV file under column with DeviceName
	$devices = Get-Content $filePath | ConvertFrom-Csv | Select-Object -ExpandProperty DeviceName
}
elseif ($inputMethod = "Manual") {
	#Prompt user to enter the device names
	Write-Host
	$devices = Read-Host -Prompt "Enter device names separated by commas"
	$devices = $devices.Split(",")
	Write-Host
}
else {
	Write-Host
	Write-Host "Invalid input method. Please check steps on how to use on Github."
	Read-Host -Prompt "Press Enter to exit"
}

#Name and mark the counter variables
$reachableCount = 0
$unreachableCount = 0

#Initialize an empty array to store ping times and tracert results
$results = @()

#Loop through array and ping and tracert each device
foreach ($device in $devices) {
	$start = Get-Date
	$ping = Test-Connection -ComputerName $device -Count 1 -Quiet
	$end = Get-Date
	$pingTime = New-TimeSpan $start $end
	$result = [PSCustomObject] @{
		DeviceName   = $device
		IsReachable  = $ping
		ResponseTime = $pingTime.Milliseconds
		Tracert      = if ($ping) { tracert -hops 30 $device | Out-String } else { "" }
	}
	$results += $result
	if ($ping) {
		Write-Host "$device is reachable. Response time: $($pingTime.Milliseconds)ms"
		$reachableCount++
	}
 else {
		Write-Host "$device is not reachable"
		$unreachableCount++
	}
}

#Sort results by response time and output the sorted list
$sortedResults = $results | Sort-Object ResponseTime

Write-Host
Write-Host "Reachable devices:"
$sortedResults | Where-Object IsReachable -eq $true | Select-Object DeviceName, ResponseTime, @{Name = "Tracert"; Expression = { $_.Tracert.Trim() } } | Format-Table -AutoSize
Write-Host "Total reachable devices: $reachableCount"
Write-Host "Total unreachable devices: $unreachableCount"

#Output total count of reachable and unreachable devices
$sortedResults | Group-Object IsReachable | ForEach-Object {
	Write-Host
	if ($_.Name -eq $true) {
		Write-Host "Total reachable devices: $($_.Count)"
	}
 else {
		Write-Host "Total unreachable devices: $($_.Count)"
	}
}
#Output full results in a grid view
$sortedResults | Out-GridView

#End script but only after user clicks enter.
Write-Host "Script complete"
Read-Host -Prompt "Press Enter to exit"
