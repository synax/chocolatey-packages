
$packageName = 'aks-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/aks-engine/releases/download/v0.41.1/aks-engine-v0.41.1-windows-amd64.zip'
    Checksum64     = '4eb5faf7f10b1ecf137492e1afdcc5b9c17b27a77aff903c6a3b3ceb8b42c23f'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
