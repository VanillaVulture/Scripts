$words = @("Hello?", "Are you still there?", "Why am I talking?", "STOP PRESSING KEYS!", "LOL")
while ($true) {
    Start-Process notepad
    Start-Sleep -Seconds 2
    $wshell = New-Object -ComObject WScript.Shell
    Start-Sleep -Seconds 1
    $wshell.AppActivate("Untitled - Notepad")
    Start-Sleep -Seconds 1
    $wshell.SendKeys($words | Get-Random)
    Start-Sleep -Seconds (Get-Random -Minimum 3 -Maximum 7)
}
