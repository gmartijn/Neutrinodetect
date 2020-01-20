# Script to check on a host to determine whether the Neutrino Botnet is active on this machine
# This is the path in which the Neutrino Software in-stalls by default. 
$WantFile = "C:\Users\$ENV:Username\Appdata\Roaming\Z0BAZwxx"
$FileExists = Test-Path $WantFile
# This is the registry path in which Neutrino writes certain parameters
$RegEnt = "HKCU:\Software\Z0BAZwxx"
$RegExists = Test-Path -Path $Regent
# Determine whether the file path exists, count 1
If ($FileExists -eq $True) {$IOC1=1} else {$IOC1=0}
# Determine whether the Registry entry is present, count 1
If ($RegExists -eq $True) {$IOC2=1} else {$IOC2=0}
# Determine the total sum of the IOC's on a host level
$IOC = $IOC2 + $IOC1
Write-Host $IOC
If ($IOC -eq 2) {Write-Host 2 indicators found!} else {Write-Host -}
#Check whether the firewall rule exists, by querying the Firewall rules with a specific name.
$Fireexist = Get-NetFirewallRule | select Displayname
# If the Firewall rules exist, looks for the value Ena-bled.
If ($Fireexist -match "Z0BAZwxx") {$IOC3=1} else {$IOC3=0}
$IOCFW = $IOC + $IOC3
If ($IOCFW -eq 3) {Write-Host 3 indicators found!} else {Write-Host -}
Write-Host $IOCFW
