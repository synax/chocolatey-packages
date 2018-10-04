
$packageName = 'acs-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/acs-engine/releases/download/v0.22.4/acs-engine-v0.22.4-windows-amd64.zip'
    Checksum64     = '081334f6d93fbb73bd949e1ed2950c3e615283913516c2d8955b7fc7b5fc25d2'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
