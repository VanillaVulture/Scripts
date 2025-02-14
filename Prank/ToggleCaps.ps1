$wshell = New-Object -ComObject WScript.Shell
while ($true) {
    Start-Sleep -Seconds (Get-Random -Minimum 2 -Maximum 6)
    $wshell.SendKeys("{CAPSLOCK}")
}
