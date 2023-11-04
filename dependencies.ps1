# Check if PSWindowsUpdate module is installed
if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Write-Host "PSWindowsUpdate module is not installed."

    # Prompt the user for installation
    $userResponse = Read-Host "Do you want to install the PSWindowsUpdate module now? (Y/N)"
    
    if ($userResponse -eq 'Y') {
        # Attempt to install the PSWindowsUpdate module
        try {
            Write-Host "Installing the PSWindowsUpdate module. Please wait..."
            Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser
            Write-Host "PSWindowsUpdate module installed successfully."
        } catch {
            Write-Host "Error installing module: $_"
            exit
        }
    } else {
        Write-Host "PSWindowsUpdate module is required to check and install Windows updates. Exiting script."
        exit
    }
} else {
    Write-Host "PSWindowsUpdate module is already installed."
}
