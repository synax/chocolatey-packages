
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://storage.googleapis.com/kubernetes-helm/helm-v2.12.1-windows-amd64.zip'
    Checksum64     = 'dd6a0ca407912cce4e6ac4a3d0e33c293a04922812821712c93b437f85bce279'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
