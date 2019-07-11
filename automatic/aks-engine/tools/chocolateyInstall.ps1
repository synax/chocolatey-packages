
$packageName = 'aks-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/aks-engine/releases/download/v0.38.1/aks-engine-v0.38.1-windows-amd64.zip'
    Checksum64     = 'cdb74ae3fc3d43f7fe3d114a205a717f4273e60e54a49a6b95a55971f0171ca4'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
