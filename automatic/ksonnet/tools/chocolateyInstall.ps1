
$packageName = 'ksonnet'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/ksonnet/ksonnet/releases/download/v0.13.0/ks_0.13.0_windows_amd64.zip'
    Checksum64     = '3bf9af50f15951aa96677d6aa211e779d5d67807b0773ec1c2b2ad61eb545b68'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
