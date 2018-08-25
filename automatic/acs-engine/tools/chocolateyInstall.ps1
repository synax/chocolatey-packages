
$packageName = 'acs-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/acs-engine/releases/download/v0.21.1/acs-engine-v0.21.1-windows-amd64.zip'
    Checksum64     = 'b3e837ac7f0d4191a646bfb8b03c163c4aa227c36aa77af7ec8066be35172aa9'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
