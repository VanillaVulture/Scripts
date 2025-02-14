while ($true) {
    Set-ItemProperty -Path 'HKCU:\Control Panel\Mouse' -Name SwapMouseButtons -Value 1
    Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 10)
    Set-ItemProperty -Path 'HKCU:\Control Panel\Mouse' -Name SwapMouseButtons -Value 0
    Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 10)
}
