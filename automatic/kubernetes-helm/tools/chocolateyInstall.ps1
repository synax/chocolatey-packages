$packageArgs = @{
    $packageName    = 'helm'
    $packageVersion = '2.9.0'
    $url64          = 'https://storage.googleapis.com/kubernetes-helm/helm-v2.9.0-windows-amd64.zip'
    $checksum64     = '6b8fbe206511ab790a4f5be690e42fe418dd95fc6a69714ed03cfa70c488827d'
    $checksumType64 = 'sha256'
    $toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    $tempDir        = "$toolsDir\temp"
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage  @packageArgs

# Untar into tools folder
Get-ChocolateyUnzip -PackageName "$packageName" -FileFullPath "$tempDir" -Destination "$toolsDir"

# Remove temp folder
Remove-Item "$tempDir\*" -recurse
Remove-Item "$tempDir"
