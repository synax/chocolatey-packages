
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://get.helm.sh/helm-v2.16.0-windows-amd64.zip'
    Checksum64     = 'be0b350393a1b6fbcb107a4bfe15bf81f9550b0c86a2a3465c4ce422f77c031d'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
