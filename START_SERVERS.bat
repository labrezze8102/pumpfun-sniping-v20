@echo off
echo.
echo ========================================
echo   PumpFun Platform V2 - Starting Servers
echo ========================================
echo.

REM Start Proxy Server
echo Starting Balance Proxy Server (Port 3002)...
start "Proxy Server" cmd /k "cd /d %~dp0 && node balance-proxy-server.js"

timeout /t 2 /nobreak >nul

REM Start Backend API
echo Starting Backend API Server (Port 3001)...
cd /d %~dp0\..\backend
start "Backend API" cmd /k "set PORT=3001 && npm start"

timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo   Servers Started Successfully!
echo ========================================
echo.
echo Proxy Server:  http://localhost:3002
echo Backend API:   http://localhost:3001
echo.
echo Now refresh your platform in the browser!
echo.
pause

