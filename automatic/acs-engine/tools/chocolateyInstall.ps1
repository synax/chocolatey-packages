
$packageName = 'acs-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/acs-engine/releases/download/v0.26.2/acs-engine-v0.26.2-windows-amd64.zip'
    Checksum64     = 'a229207ec3fe1d08ae01a68d3a36f8cab49d0c035f96f43f7db9a0998c995a78'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
