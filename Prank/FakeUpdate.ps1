Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class MsgBox {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int MessageBox(IntPtr hWnd, string text, string caption, int options);
}
"@
[MsgBox]::MessageBox([IntPtr]::Zero, "Windows is updating... Please do not turn off your computer.", "Windows Update", 0x40)
