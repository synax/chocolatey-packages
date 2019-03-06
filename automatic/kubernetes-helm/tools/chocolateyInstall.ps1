
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://storage.googleapis.com/kubernetes-helm/helm-v2.13.0-windows-amd64.zip'
    Checksum64     = '63fdb71ad6fac0572a21ad81da7508b1f0cae960ea944670f4d2f7fbaf23acb2'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
