$wshell = New-Object -ComObject WScript.Shell
$words = @("asjdkf", "hmmmm", "why", "help", "ERROR", "idk", "blip blop", "sos")
while ($true) {
    Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 15)
    $wshell.SendKeys(($words | Get-Random) + " ")
}
