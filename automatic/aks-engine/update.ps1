import-module au -Force

$releases = 'https://github.com/Azure/aks-engine/releases'
$github = 'https://github.com'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*Url64bit\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^\s*Checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $ProgressPreference = 'SilentlyContinue'
    $hash_check_file_path = "$pwd/aksengine.hashcheck"
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re  = "aks-engine-.+windows-amd64.zip"
    $url = $github + $($download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href)

    $version = ($url -split '-' | Select-Object -Last 3 | Select-Object -First 1).TrimStart('v')

    $wc = New-Object net.webclient
    $wc.Downloadfile($url, $hash_check_file_path)
    $checksum = Get-FileHash -Algorithm SHA256 -Path $hash_check_file_path #-InputStream ([System.IO.MemoryStream]::New($Content))
    $checksum64 = $checksum.Hash.ToLower()

    $Latest = @{ URL64 = "$url"; Version = $version; Checksum64 = $checksum64}

    return $Latest
}

Update-Package -ChecksumFor none -Verbose
