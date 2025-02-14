Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Mouse {
    [DllImport("user32.dll")]
    public static extern void SetCursorPos(int x, int y);
}
"@
while ($true) {
    for ($i=0; $i -lt 360; $i+=30) {
        $x = 500 + [math]::sin($i) * 50
        $y = 500 + [math]::cos($i) * 50
        [Mouse]::SetCursorPos($x, $y)
        Start-Sleep -Milliseconds 100
    }
}
