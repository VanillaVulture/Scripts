$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")

# Attempt to delete all text files on the desktop
$deletedFiles = 0
Get-ChildItem -Path $desktopPath -Filter "*.txt" | ForEach-Object {
    try {
        Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
        $deletedFiles++
    } catch {
        Write-Host "Failed to delete: $($_.FullName)"
    }
}

Write-Host "Cleanup complete. Deleted $deletedFiles text files from the Desktop."
