# Add Mouse Control Functions
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Mouse {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int x, int y);
    
    [DllImport("user32.dll")]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);
    
    public const int MOUSEEVENTF_LEFTDOWN = 0x02;
    public const int MOUSEEVENTF_LEFTUP = 0x04;
    
    public static void Click() {
        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    }
}
"@ -Language CSharp

# Minimize PowerShell Window
Add-Type -Name Window -Namespace Win32 -MemberDefinition @"
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    [DllImport("kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();
"@
[Win32.Window]::ShowWindow([Win32.Window]::GetConsoleWindow(), 0) # Minimizes window

# Mouse Movement + Clicking
while ($true) {
    $x = Get-Random -Minimum 0 -Maximum 1920
    $y = Get-Random -Minimum 0 -Maximum 1080
    [Mouse]::SetCursorPos($x, $y)

    # 50% chance to randomly click
    if ((Get-Random -Minimum 0 -Maximum 2) -eq 1) {
        [Mouse]::Click()
    }

    Start-Sleep -Milliseconds (Get-Random -Minimum 50 -Maximum 200)
}
