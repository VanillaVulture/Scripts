$searches = @("why is my computer slow", "how to fix a computer", "why is my mouse moving", "what is hacking", "how to stop PowerShell scripts", "how to delete system32", "Cats", "Is my PC on fire", "Help i accidently built a shed")
while ($true) {
    Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 20)
    Start-Process "https://www.google.com/search?q=$($searches | Get-Random)"
}
