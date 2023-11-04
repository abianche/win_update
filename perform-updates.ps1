# Function to perform Windows Updates
function Update-Windows {
    Write-Host "Updating Windows..."
    Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
}

# Function to update browsers
function Update-Browsers {
    Write-Host "Attempting to update Browsers..."

    # Hashtable for browser paths, adjust if necessary
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
            Write-Host "Starting $browserName to check for updates..."
            Start-Process $browserPath
            # Note: Browsers don't typically provide a command line switch to force an update
            # Starting the browser will rely on its built-in mechanism to check for updates
        } else {
            Write-Host "$browserName is not installed or path is incorrect."
        }
    }

    Write-Host "All available browsers have been started. Please check each browser for update status."
}

# Function to update Chocolatey packages
function Update-ChocolateyPackages {
    Write-Host "Updating Chocolatey packages..."
    choco upgrade all -y
}

# Function to update VSCode and VSCode extensions
function Update-VSCode {
    Write-Host "Updating Visual Studio Code and Extensions..."
    code --install-extension ms-vscode.vscode-typescript-next
    # To update all extensions
    code --list-extensions | %{ code --install-extension $_ }
}


# Execute the update functions
Update-Windows
Update-Browsers
Update-ChocolateyPackages
Update-VSCode