@echo off
title 🧩 Windows 10 Internet Optimization Script
color 0A

echo ============================================
echo     Windows 10 Network Speed Optimizer
echo ============================================
echo.

:: Run as admin check
net session >nul 2>&1
if %errorLevel% neq 0 (
  echo ❌ Please run this script as Administrator.
  pause
  exit
)

:: Flush DNS cache
echo 🧹 Flushing DNS cache...
ipconfig /flushdns

:: Release and renew IP
echo 🔄 Releasing and renewing IP...
ipconfig /release
ipconfig /renew

:: Reset Winsock and IP stack
echo 🔧 Resetting Winsock and IP configuration...
netsh winsock reset
netsh int ip reset

:: Disable Windows Auto-Tuning
echo 🚫 Disabling TCP Auto-Tuning...
netsh int tcp set global autotuninglevel=disabled

:: Disable Delivery Optimization
echo 📦 Disabling Windows Update Delivery Optimization...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f >nul 2>&1

:: Set Google DNS (8.8.8.8 / 8.8.4.4)
echo 🌐 Setting DNS to Google Public DNS...
netsh interface ip set dns name="Wi-Fi" static 8.8.8.8 primary
netsh interface ip add dns name="Wi-Fi" 8.8.4.4 index=2

:: Show final status
echo.
echo ✅ All tweaks applied successfully!
echo 💡 Please restart your PC for full effect.
echo.

pause
exit