$Battery = (Get-WmiObject win32_battery).estimatedChargeRemaining
Get-Content -Path "D:\banner.txt"
    
While ($Battery -gt 10) {$Battery
	Write-Progress -Activity "Observing Current Battery Percentage" -Status "Current Percentage: $Battery"
}
    if ($Battery -le 74) {break}
    
$serial = get-wmiobject win32_Bios | Select-object -ExpandProperty Serialnumber -first 1
    New-Item -Path "D:\Reports\SN_$serial" -Itemtype Directory
        Write-Host "`n"
    
powercfg /batteryreport /duration 14 /Output "D:\Reports\SN_$serial\Batteryreport-SN-$serial.html"
    Write-Host "`n"

powercfg /energy duration 100 /output "D:\Reports\SN_$serial\Energyreport-SN-$serial.html"
