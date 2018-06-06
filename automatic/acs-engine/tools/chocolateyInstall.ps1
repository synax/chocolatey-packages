
$packageName = 'acs-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/acs-engine/releases/download/v0.18.1/acs-engine-v0.18.1-windows-amd64.zip'
    Checksum64     = '467f6dd2feaaafbfaafcb39730f9c41f15f29392ff76a00cd3b10656e32d18b9'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
