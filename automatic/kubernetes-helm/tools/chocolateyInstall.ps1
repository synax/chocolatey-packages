
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://storage.googleapis.com/kubernetes-helm/helm-v2.12.3-windows-amd64.zip'
    Checksum64     = 'c01a9e7ad27d5dded85511f244201a4821fe7157f1edbf5b601cff78c55d06a2'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
