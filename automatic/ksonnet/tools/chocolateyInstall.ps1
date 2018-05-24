
$packageName = 'ksonnet'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/ksonnet/ksonnet/releases/download/v0.10.2/ks_0.10.2_windows_amd64.zip'
    Checksum64     = '5fe4651830b6aab093f197ed66e2184aeae950a3b9a88a2f331d67cc7d5d91c5'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
