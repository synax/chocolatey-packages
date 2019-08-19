
$packageName = 'aks-engine'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/Azure/aks-engine/releases/download/v0.39.2/aks-engine-v0.39.2-windows-amd64.zip'
    Checksum64     = '36e09d2df3dbe9a5ea6650501985e85619efabccbf3fefe2b0c92b6bbb439768'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
