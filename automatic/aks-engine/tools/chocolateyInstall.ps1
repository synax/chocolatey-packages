
$packageName = 'aks-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/aks-engine/releases/download/v0.36.4/aks-engine-v0.36.4-windows-amd64.zip'
    Checksum64     = '040a593c8e019d2ecabbce436a49385304c110fbcd8e2ad121fafe752ceb42fc'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
