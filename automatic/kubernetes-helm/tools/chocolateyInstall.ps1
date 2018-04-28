
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://storage.googleapis.com/kubernetes-helm/helm-v2.8.0-windows-amd64.zip'
    Checksum64     = '6b8fbe206511ab790a4f5be690e42fe418dd95fc6a69714ed03cfa70c488827d'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $tempDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs

# Remove temp folder
Remove-Item "$tempDir\*" -recurse
Remove-Item "$tempDir"
