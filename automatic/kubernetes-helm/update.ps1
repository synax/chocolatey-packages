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

    #tidy-5.1.25-win64.zip
    $re  = "helm-.+windows-amd(32|64).tar.gz"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 2 -expand href

    $version = ($url[0] -split '-' | Select-Object -Last 3 | Select-Object -First 1).TrimStart('v')
    $url64 = $url[0]
    $checksumByte = Invoke-WebRequest -Uri $url[1] | Select-Object -ExpandProperty Content
    $checksum64 = ([System.Text.Encoding]::UTF8.GetString($checksumByte)).Trim()

    $Latest = @{ URL64 = $url64; Checksum64 = $checksum64; Version = $version }

    return $Latest
} 

Update-Package -ChecksumFor 64 -Verbose