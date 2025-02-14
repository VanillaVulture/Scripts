while ($true) {
    [console]::beep((Get-Random -Minimum 1000 -Maximum 3000), 300)
    Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 15)
}
