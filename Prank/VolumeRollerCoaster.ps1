$wshell = New-Object -ComObject WScript.Shell
while ($true) {
    Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 10)
    $wshell.SendKeys("{VOLUME_UP}")
    Start-Sleep -Seconds 1
    $wshell.SendKeys("{VOLUME_DOWN}")
}
