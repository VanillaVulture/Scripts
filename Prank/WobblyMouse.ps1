Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Mouse {
        [DllImport("user32.dll")]
        public static extern void SetCursorPos(int x, int y);
    }
"@
while ($true) {
    $pos = [System.Windows.Forms.Cursor]::Position
    [Mouse]::SetCursorPos($pos.X + (Get-Random -Minimum -15 -Maximum 15), $pos.Y + (Get-Random -Minimum -15 -Maximum 15))
    Start-Sleep -Seconds (Get-Random -Minimum 2 -Maximum 5)
}
