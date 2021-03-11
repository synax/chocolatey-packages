
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://get.helm.sh/helm-v3.5.3-windows-amd64.zip'
    Checksum64     = '33fef4740b255b58a52e5504622068fd8a7d9aea19f1a84438f5cc1c5aade0d6'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
