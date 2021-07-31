<# Configure the Printer Here#>


$name = "Tech Printer" <# Name the printer here #>
$location = "Location Description Here"
$ipAddress = "203.0.113.12" <# The IP Address of the printer on the network #>
$driverName = “HP Color LaserJet Pro M252 PCL 6”  <# Needs to be specific. You find this in the drivers .inf file #>
$driverPath = “$PSScriptRoot\Driver” <# Folder with all the driver files in i #>
$driverInf = “$PSScriptRoot\Driver\hpor3c2a_x64.inf” <# .inf File location #>

function update-status{
$global:portExists = Get-Printerport -Name $name -ErrorAction SilentlyContinue
$global:printDriverExists = Get-PrinterDriver -name $driverName -ErrorAction SilentlyContinue
$global:printertInstalled = Get-Printer -name $name -ErrorAction SilentlyContinue
}

update-status

<# This can be used if inTune doesnt remove the printer how i'd expect it to:

if ($portExists -and $printDriverExists -and $printertInstalled){
    Write-Host("uninstalling $($name) please wait...") -ForegroundColor "Yellow"
    Remove-Printer -Name $name
    Remove-PrinterPort -Name $name
    Remove-PrinterDriver -Name $driverName
    Write-Host("$($name) Uninstalled!") -ForegroundColor "Red"
}
#>

if (-not $portExists) {
    Add-PrinterPort -Name $name -PrinterHostAddress $ipAddress
}


if (-not $printDriverExists) {
    Write-Host("No driver detected, installing driver for $($name)") -ForegroundColor "Yellow"
    cscript “C:\Windows\System32\Printing_Admin_Scripts\en-US\Prndrvr.vbs” -a -m $driverName -h $driverPath -i $DriverInf
}

update-status

if ($portExists -and $printDriverExists -and !$printertInstalled){
    Write-Host("Configuring $($name)... please wait this can take a few minutes") -ForegroundColor "Yellow"
    Add-Printer -DriverName $driverName -Name $name -PortName $name -Location $ipAddress
    Write-Host("$($name) Installed!") -ForegroundColor "Green"
}

<# Remove this if using the above if statement: #>
else{
    Write-Host("$($name) Already Installed!") -ForegroundColor "Green"
}