# Function to check Windows Updates
function Check-WindowsUpdates {
    Write-Host "Checking for Windows Updates..."
    # This will only check for updates without installing them
    Get-WindowsUpdate -MicrosoftUpdate -WhatIf
}

# Function to check for browser updates
function Check-BrowserUpdates {
    Write-Host "Checking for Browser Updates..."

    # Paths to browser executables, adjust if necessary
    $browserPaths = @{
        "Brave" = "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe";
        "Chrome" = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe";
        "Edge" = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe";
        "Firefox" = "C:\Program Files\Mozilla Firefox\firefox.exe"
    }

    foreach ($browserName in $browserPaths.Keys) {
        $browserPath = $browserPaths[$browserName]

        # Check if the browser's executable exists
        if (Test-Path $browserPath) {
            Write-Host "$browserName is installed. Checking version..."
            # Use the file version info to get the version of the browser
            $versionInfo = (Get-Item $browserPath).VersionInfo.ProductVersion
            Write-Host "$browserName version: $versionInfo"
        } else {
            Write-Host "$browserName is not installed."
        }
    }

    # Clean up
    if (Test-Path 'version.txt') {
        Remove-Item 'version.txt'
    }
}

# Function to check for Chocolatey package updates
function Check-ChocolateyUpdates {
    Write-Host "Checking for Chocolatey package updates..."
    choco outdated
}

# Function to check for VSCode and VSCode extensions updates
function Check-VSCodeUpdates {
    Write-Host "Checking for Visual Studio Code updates..."
    code --list-extensions --show-versions
    code --check-updates
}

# Execute the check functions
Check-WindowsUpdates
Check-BrowserUpdates
Check-ChocolateyUpdates
Check-VSCodeUpdates