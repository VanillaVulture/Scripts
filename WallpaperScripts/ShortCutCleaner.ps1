# Define the Desktop path dynamically
$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")

# Check if the Desktop folder exists
if (Test-Path $desktopPath) {
    # Get all .lnk (shortcut) files in the Desktop folder
    $shortcutFiles = Get-ChildItem -Path $desktopPath -Filter "*.lnk" -File

    if ($shortcutFiles.Count -gt 0) {
        # Remove all shortcut files
        $shortcutFiles | Remove-Item -Force
        Write-Host "All shortcuts (.lnk files) have been deleted from your desktop."
    } else {
        Write-Host "No shortcuts found on your desktop."
    }
} else {
    Write-Host "Desktop folder not found."
}
