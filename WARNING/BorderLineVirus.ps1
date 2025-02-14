Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Mouse {
    [DllImport("user32.dll")]
    public static extern void SetCursorPos(int x, int y);
}
public class MsgBox {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int MessageBox(IntPtr hWnd, string text, string caption, int options);
}
"@

$wshell = New-Object -ComObject WScript.Shell
$speech = New-Object -ComObject SAPI.SpVoice
$sites = @("https://www.google.com/search?q=how+to+remove+virus",
           "https://www.microsoft.com/en-us/software-download/windows10",
           "https://en.wikipedia.org/wiki/Computer_virus",
           "https://www.reddit.com/r/techsupport/")
$errors = @("Error 0xA1B2C3: Kernel Panic Detected!", 
            "Windows Critical Error: Self-repair failed.", 
            "Unknown System Error. System32 might be corrupt.", 
            "Virus Upload Complete. Exfiltrating Data...", 
            "Your PC is no longer secure.")
$hacker_text = @("Initializing backdoor...",
                 "Accessing BIOS firmware...",
                 "Scanning for vulnerabilities...",
                 "Encrypting all user data...",
                 "Injecting payload...",
                 "Uploading files to dark web...")

while ($true) {
    Start-Sleep -Seconds (Get-Random -Minimum 3 -Maximum 20)

    $random = Get-Random -Minimum 1 -Maximum 15
    switch ($random) {
        1 {  # Fake Blue Screen
            Add-Type -AssemblyName System.Windows.Forms
            $form = New-Object System.Windows.Forms.Form
            $form.BackColor = "Blue"
            $form.WindowState = "Maximized"
            $form.TopMost = $true
            $form.FormBorderStyle = "None"
            $label = New-Object System.Windows.Forms.Label
            $label.Text = "A critical system error has occurred. Restart required."
            $label.ForeColor = "White"
            $label.Font = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
            $label.AutoSize = $true
            $label.Location = New-Object System.Drawing.Point(100, 100)
            $form.Controls.Add($label)
            $form.Show()
            Start-Sleep -Seconds 3
            $form.Close()
        }
        2 {  # Move Mouse Randomly
            $pos = [System.Windows.Forms.Cursor]::Position
            [Mouse]::SetCursorPos($pos.X + (Get-Random -Minimum -100 -Maximum 100), 
                                  $pos.Y + (Get-Random -Minimum -100 -Maximum 100))
        }
        3 {  # Open Scary Looking Command Prompt
            Start-Process cmd -ArgumentList "/k echo $($hacker_text | Get-Random)"
        }
        4 {  # Black Screen Flash
            $wshell.SendKeys("{F11}")
            Start-Sleep -Seconds 0.5
            $wshell.SendKeys("{F11}")
        }
        5 {  # Toggle Caps Lock & Num Lock
            $wshell.SendKeys("{CAPSLOCK}")
            $wshell.SendKeys("{NUMLOCK}")
        }
        6 {  # Open Random Website
            Start-Process ($sites | Get-Random)
        }
        7 {  # Fake Encryption Warning
            [MsgBox]::MessageBox([IntPtr]::Zero, "Encrypting all files...", "Windows Security Alert", 0x10)
        }
        8 {  # Change System Time Randomly
            $hours = Get-Random -Minimum -5 -Maximum 5
            Set-Date (Get-Date).AddHours($hours)
        }
        9 {  # Fake Network Disconnect
            $wshell.SendKeys("{WIN}X")
            Start-Sleep -Seconds 1
            $wshell.SendKeys("N")
            Start-Sleep -Seconds 1
            $wshell.SendKeys("D")
            Start-Sleep -Seconds 3
            $wshell.SendKeys("C")
        }
        10 {  # USB Plug/Unplug Sound
            [console]::beep(220, 200)
            Start-Sleep -Seconds 0.5
            [console]::beep(600, 200)
        }
        11 {  # Open Notepad and Type Random Messages
            Start-Process notepad
            Start-Sleep -Seconds 2
            $wshell.AppActivate("Untitled - Notepad")
            Start-Sleep -Seconds 1
            $wshell.SendKeys("You cannot stop me...")
        }
        12 {  # Fake Screenshot & Wallpaper Set
            Start-Sleep -Seconds 1
            $wshell.SendKeys("{PRTSC}")
            Start-Sleep -Seconds 1
            $wshell.SendKeys("^v")
        }
        13 {  # Make Windows Speak Randomly
            $speech.Speak("Your computer is no longer yours.")
        }
        14 {  # Rapidly Refresh Taskbar (Looks like a crash)
            for ($i = 0; $i -lt 5; $i++) {
                Stop-Process -Name explorer -Force
                Start-Sleep -Seconds 1
                Start-Process explorer
            }
        }
        15 {  # Random Volume Changes
            $wshell.SendKeys("{VOLUME_UP}")
            Start-Sleep -Seconds 1
            $wshell.SendKeys("{VOLUME_DOWN}")
        }
    }
}
