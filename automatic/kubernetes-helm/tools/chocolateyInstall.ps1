
$packageName = 'kubernetes-helm'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = "$toolsDir\temp"

$packageArgs = @{
    PackageName    = $packageName
    Url64bit       = 'https://get.helm.sh/helm-v3.1.0-windows-amd64.zip'
    Checksum64     = 'f6a6ee20bd216beb2f0195f083b03d43b8801e885a483011807824bd0915b835'
    ChecksumType64 = 'sha256'
    UnzipLocation  = $toolsDir
}

# Download and unzip into a temp folder
Install-ChocolateyZipPackage @packageArgs
