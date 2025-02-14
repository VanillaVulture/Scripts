Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class MsgBox {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int MessageBox(IntPtr hWnd, string text, string caption, int options);
    }
"@
while ($true) {
    Start-Sleep -Seconds (Get-Random -Minimum 10 -Maximum 30)
    [MsgBox]::MessageBox([IntPtr]::Zero, "Error 0x0000002F: Unexpected system failure.", "Critical Error", 0x10)
}
