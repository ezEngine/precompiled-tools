# reliably kills all nginx processes
Stop-Process -Force -Name "nginx" -Verbose -ErrorAction SilentlyContinue