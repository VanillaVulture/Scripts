Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Mouse {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int x, int y);
}
"@ -Language CSharp

while ($true) {
    [Mouse]::SetCursorPos((Get-Random -Minimum 0 -Maximum 1920), (Get-Random -Minimum 0 -Maximum 1080))
    Start-Sleep -Milliseconds (Get-Random -Minimum 50 -Maximum 200)
}
