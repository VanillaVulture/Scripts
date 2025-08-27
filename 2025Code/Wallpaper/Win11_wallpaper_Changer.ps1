# Define path to Downloads folder and wallpaper
$downloads = [Environment]::GetFolderPath("UserProfile") + "\Downloads"
$wallpaperPath = Join-Path $downloads "wallpaper.png"

# Check if the file exists
if (Test-Path $wallpaperPath) {
    # Set registry key for wallpaper
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $wallpaperPath

    # Update the system to apply changes
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
    Write-Output "Wallpaper changed successfully to $wallpaperPath"
} else {
    Write-Output "No wallpaper.png found in Downloads folder."
}
