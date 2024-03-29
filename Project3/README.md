Ping and Tracert Script

This script is designed to ping a list of devices and perform a tracert on each device to determine the number of routers each device hits. 
It will then sort the devices from fastest to slowest response times. This is a good script for troubleshooting connections of devices on your network
and seeing if the proper channels are being reached when reaching out to the internet. It also works with DNS site names (Ex."www.google.com") 

Requirements

This script requires PowerShell version 3.0 or later to be installed on the computer running the script. 
It also requires that the user has administrative access to run the Test-Connection and tracert commands.

Usage

To use the script, follow these steps:

Open a PowerShell terminal.
Navigate to the directory where the script is saved.
Run the script by typing .\Project3.ps1.
Follow the prompts to enter the list of devices either through a CSV file or by manual input.
The script will output the ping and tracert results for each device, and then display a summary of the total reachable and unreachable devices, 
as well as the response times for each device in ascending order.

Notes
If using a CSV file, make sure the file has a header row with the device names listed under a column named "DeviceName".
If you encounter any issues running the script, please check the usage instructions and requirements, or refer to the documentation in the script file.

Refrences
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/out-gridview?view=powershell-7.3
https://www.clouddirect.net/knowledge-base/KB0011455/using-traceroute-ping-mtr-and-pathping
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/import-csv?view=powershell-7.3
https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-arrays?view=powershell-7.3

Properly formatted in Visual Studio Code!
