$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")
$counter = 1

while ($counter -le 1000) {
    $fileName = -join ((65..90) + (97..122) | Get-Random -Count 10) + ".txt"
    $filePath = [System.IO.Path]::Combine($desktopPath, $fileName)
    
    if (!(Test-Path $filePath)) {
        New-Item -Path $filePath -ItemType File -Force | Out-Null
        $counter++
    }
}

Write-Host "Created $counter blank files on Desktop."
