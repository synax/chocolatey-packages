
$packageName = 'acs-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/acs-engine/releases/download/v0.21.2/acs-engine-v0.21.2-windows-amd64.zip'
    Checksum64     = 'e49f05c03078cc0e05391476b700de9b9c128ff737bf76f30179694164a415d4'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
