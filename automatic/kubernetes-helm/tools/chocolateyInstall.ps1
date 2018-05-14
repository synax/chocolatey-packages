
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-windows-amd64.zip'
    Checksum64     = 'da8a11ec91a19f4a7c1d62f4e11fd3b88d4ce722878451371c197d8f96295fbe'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
