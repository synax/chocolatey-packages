
$packageName = 'aks-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/aks-engine/releases/download/v0.42.2/aks-engine-v0.42.2-windows-amd64.zip'
    Checksum64     = '2878795676ef78ba9a4a816ec9cbd3a14b8418c0f7c4db5af433ea69ed0c63e9'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
