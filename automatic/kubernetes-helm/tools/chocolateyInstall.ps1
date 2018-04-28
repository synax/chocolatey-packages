$packageArgs = @{
    $packageName    = 'helm'
    $packageVersion = '2.8.2'
    $url64          = 'https://storage.googleapis.com/kubernetes-helm/helm-v2.8.2-windows-amd64.zip'
    $checksum64     = '8fbc9e425eb5f806b7f562a03ed03e12fad702a8ce7fc52b7b3409522f33c4f9'
    $checksumType64 = 'sha256'    
    $toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    $tempDir    = "$toolsDir\temp"
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs

# Untar into tools folder
Get-ChocolateyUnzip -PackageName "$packageName" -FileFullPath "$tempDir" -Destination "$toolsDir"

# Remove temp folder
Remove-Item "$tempDir\*" -recurse
Remove-Item "$tempDir"
