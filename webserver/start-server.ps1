param 
(
    [ValidateSet('debug', 'dev', 'shipping')][string] $BuildType = "debug"
)

# first stop any previously running server
& $PSScriptRoot/stop-server.ps1

Write-Host "Starting web-server using 'configs/$BuildType.conf'."

New-Item -ItemType Directory -Path "$PSScriptRoot/logs" -ErrorAction SilentlyContinue | Out-Null
New-Item -ItemType Directory -Path "$PSScriptRoot/temp" -ErrorAction SilentlyContinue | Out-Null

Start-Process -FilePath "$PSScriptRoot/nginx/nginx.exe" -ArgumentList "-c configs/$BuildType.conf" -WorkingDirectory "$PSScriptRoot" -Verbose