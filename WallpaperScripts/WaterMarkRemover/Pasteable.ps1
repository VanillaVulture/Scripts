# Disable svsvc service responsible for the Windows watermark
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\svsvc" -Name Start -Value 4 -Force

# Restart the computer to apply changes
Restart-Computer -Force
