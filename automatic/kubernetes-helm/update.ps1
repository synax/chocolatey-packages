import-module au

$releases = 'https://github.com/kubernetes/helm/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
            "(^[$]packageVersion\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
        }
     }
}

function global:au_GetLatest {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    $download_page = Invoke-WebRequest -Uri $releases 

    $re  = "helm-.+windows-amd64.(tar.gz|zip)"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href

    $version = ($url -split '-' | Select-Object -Last 3 | Select-Object -First 1).TrimStart('v')

    $content = Invoke-WebRequest $url | Select-Object -ExpandProperty Content
    $checksum = Get-FileHash -Algorithm SHA256 -InputStream ([System.IO.MemoryStream]::New($Content))

    $Latest = @{ URL64 = $url; Checksum64 = $checksum.Hash.ToLower(); Version = $version }

    return $Latest
} 

Update-Package -ChecksumFor 64 -Verbose 