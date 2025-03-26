# Define the Desktop path dynamically
$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")

# Check if the Desktop folder exists
if (Test-Path $desktopPath) {
    # Get all .txt files in the Desktop folder
    $txtFiles = Get-ChildItem -Path $desktopPath -Filter "*.txt" -File

    if ($txtFiles.Count -gt 0) {
        # Remove all .txt files
        $txtFiles | Remove-Item -Force
        Write-Host "All .txt files have been deleted from your desktop."
    } else {
        Write-Host "No .txt files found on your desktop."
    }
} else {
    Write-Host "Desktop folder not found."
}
