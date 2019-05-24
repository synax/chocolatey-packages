
$packageName = 'aks-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/aks-engine/releases/download/v0.36.1/aks-engine-v0.36.1-windows-amd64.zip'
    Checksum64     = '479f3ce4eefdc27f20cf0c5fe9abc9928a0c6ba4a6734a2047d3b16a8dd5db5c'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
