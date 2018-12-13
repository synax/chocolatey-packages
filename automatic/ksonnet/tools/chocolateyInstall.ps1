
$packageName = 'ksonnet'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://github.com/ksonnet/ksonnet/releases/download/v0.13.1/ks_0.13.1_windows_amd64.zip'
    Checksum64     = 'ca76063a2819ade0c4e2749c59fb92cfd7210d1c1196e7b4c20b0f4b4bd2bebc'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
