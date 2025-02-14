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
$sites = @("https://www.youtube.com/watch?v=dQw4w9WgXcQ",
           "https://www.google.com/search?q=why+is+my+computer+acting+weird",
           "https://www.wikipedia.org/wiki/Computer_bug",
           "https://www.howtogeek.com/")
$messages = @("Why are you looking at me?", "Stop clicking things!", "You have been hacked!", 
              "I AM YOUR COMPUTER NOW", "Your soul belongs to me.")
$errors = @("Critical System Error!", "Unknown Device Failure!", "Fatal Exception 0x000000F!", 
            "BIOS Corruption Detected!", "Virus Uploaded Successfully.")

while ($true) {
    Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 15)

    $random = Get-Random -Minimum 1 -Maximum 10
    switch ($random) {
        1 {  # Random Mouse Movement
            $pos = [System.Windows.Forms.Cursor]::Position
            [Mouse]::SetCursorPos($pos.X + (Get-Random -Minimum -50 -Maximum 50), 
                                  $pos.Y + (Get-Random -Minimum -50 -Maximum 50))
        }
        2 {  # Toggle Caps Lock & Num Lock
            $wshell.SendKeys("{CAPSLOCK}")
            $wshell.SendKeys("{NUMLOCK}")
        }
        3 {  # Open Random Website
            Start-Process ($sites | Get-Random)
        }
        4 {  # Random System Beep
            [console]::beep((Get-Random -Minimum 1000 -Maximum 3000), 500)
        }
        5 {  # Type Random Nonsense
            $wshell.SendKeys(($messages | Get-Random) + " ")
        }
        6 {  # Open Notepad and Type Random Message
            Start-Process notepad
            Start-Sleep -Seconds 2
            $wshell.AppActivate("Untitled - Notepad")
            Start-Sleep -Seconds 1
            $wshell.SendKeys(($messages | Get-Random))
        }
        7 {  # Flash Screen White for a Split Second
            Add-Type -AssemblyName System.Windows.Forms
            $form = New-Object System.Windows.Forms.Form
            $form.BackColor = "White"
            $form.WindowState = "Maximized"
            $form.TopMost = $true
            $form.FormBorderStyle = "None"
            $form.Show()
            Start-Sleep -Milliseconds 200
            $form.Close()
        }
        8 {  # Make the Computer Speak Random Things
            $speech.Speak(($messages | Get-Random))
        }
        9 {  # Show a Fake Error Message
            [MsgBox]::MessageBox([IntPtr]::Zero, ($errors | Get-Random), "System Alert", 0x10)
        }
        10 {  # Change Volume Up and Down
            $wshell.SendKeys("{VOLUME_UP}")
            Start-Sleep -Seconds 1
            $wshell.SendKeys("{VOLUME_DOWN}")
        }
    }
}
