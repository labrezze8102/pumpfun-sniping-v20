# PumpFun Platform V2 - Server Startup Script
# This script starts both the proxy server and backend API

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  PumpFun Platform V2 - Starting Servers" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js detected: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js not found! Please install Node.js from https://nodejs.org/" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Starting servers..." -ForegroundColor Yellow
Write-Host ""

# Start Proxy Server (Port 3002)
Write-Host "📡 Starting Balance Proxy Server (Port 3002)..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot'; node balance-proxy-server.js" -WindowStyle Normal

Start-Sleep -Seconds 2

# Start Backend API (Port 3001)
Write-Host "🚀 Starting Backend API Server (Port 3001)..." -ForegroundColor Cyan
$backendPath = Join-Path (Split-Path $PSScriptRoot -Parent) "backend"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$backendPath'; `$env:PORT='3001'; npm start" -WindowStyle Normal

Start-Sleep -Seconds 2

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  ✅ Servers Started Successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Proxy Server:  http://localhost:3002" -ForegroundColor White
Write-Host "Backend API:   http://localhost:3001" -ForegroundColor White
Write-Host ""
Write-Host "Now open the platform:" -ForegroundColor Yellow
Write-Host "  pumpfun-platform-v2/index.html" -ForegroundColor White
Write-Host ""
Write-Host "Press any key to exit this window..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

