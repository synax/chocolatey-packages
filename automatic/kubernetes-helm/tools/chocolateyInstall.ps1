
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://get.helm.sh/helm-v3.1.1-windows-amd64.zip'
    Checksum64     = '5efc1c7bdea42a17a1ea197a3a2e47c8f1b0a5464894b98ae73a4c0620163040'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
