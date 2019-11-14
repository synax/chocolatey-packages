
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://get.helm.sh/helm-v3.0.0-windows-amd64.zip'
    Checksum64     = 'ea3da9092214a11ed3a21a0b7bbd738c25b63cdefbb90f1c921aab7bbcce62c6'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
