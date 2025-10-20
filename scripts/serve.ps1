# serve.ps1 - Servidor HTTP simple en PowerShell (sin Python ni Node)
# Uso: En PowerShell, sitúate en la carpeta que contiene la carpeta 'fifty-coffees' y ejecuta:
#    powershell -ExecutionPolicy Bypass -File .\fifty-coffees\scripts\serve.ps1
# O abre PowerShell en esa carpeta y ejecuta:
#    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\fifty-coffees\scripts\serve.ps1

$port = 8000
$prefix = "http://localhost:$port/"
$root = Get-Location
Write-Host "Sirviendo archivos desde: $root" -ForegroundColor Green
Write-Host "Abre en el navegador: http://localhost:$port/fifty-coffees/index.html" -ForegroundColor Yellow

# MIME types básicos
$mime = @{
  ".html" = "text/html"
  ".htm"  = "text/html"
  ".css"  = "text/css"
  ".js"   = "application/javascript"
  ".json" = "application/json"
  ".png"  = "image/png"
  ".jpg"  = "image/jpeg"
  ".jpeg" = "image/jpeg"
  ".svg"  = "image/svg+xml"
  ".gif"  = "image/gif"
  ".ico"  = "image/x-icon"
  ".txt"  = "text/plain"
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
try {
    $listener.Start()
} catch {
    Write-Error "No se pudo iniciar HttpListener en $prefix. Comprueba que el puerto no esté en uso o ejecuta PowerShell como administrador."
    return
}

Write-Host "Servidor iniciado en $prefix (CTRL+C para detener)" -ForegroundColor Green

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $req = $context.Request
        $resp = $context.Response

        $urlPath = $req.Url.AbsolutePath.TrimStart('/')
        if ([string]::IsNullOrEmpty($urlPath)) { $urlPath = 'index.html' }

        # Normaliza para servir desde la carpeta actual
        $file = Join-Path $root $urlPath

        if (Test-Path $file -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($file).ToLower()
            $type = $mime[$ext]
            if (-not $type) { $type = 'application/octet-stream' }
            $bytes = [System.IO.File]::ReadAllBytes($file)
            $resp.ContentType = $type
            $resp.ContentLength64 = $bytes.Length
            $resp.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $resp.StatusCode = 404
            $msg = "404 Not Found: $urlPath"
            $buf = [System.Text.Encoding]::UTF8.GetBytes($msg)
            $resp.ContentType = 'text/plain'
            $resp.ContentLength64 = $buf.Length
            $resp.OutputStream.Write($buf, 0, $buf.Length)
        }
        $resp.OutputStream.Close()
    } catch [System.Exception] {
        Write-Warning "Error al procesar petición: $($_.Exception.Message)"
    }
}

$listener.Stop()
$listener.Close()
Write-Host "Servidor detenido." -ForegroundColor Cyan
