@echo off
chcp 65001 >nul
title JPC. Labs · Limpieza y Mantenimiento del Sistema
mode con: cols=86 lines=25
color 0B

:MENU
cls
echo.
echo  ╔══════════════════════════════════════════════════════════════════════════════════╗
echo  ║               J.P.C. LABS · LIMPIEZA Y MANTENIMIENTO DEL SISTEMA                 ║
echo  ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
echo    [1] Mantenimiento RÁPIDO    (Eliminar temporales de usuario + Vaciar caché DNS)
echo    [2] Mantenimiento COMPLETO  (Limpieza profunda + Actualizar software con Winget)
echo    [0] Salir del programa
echo.
echo  ────────────────────────────────────────────────────────────────────────────────────
set "OP="
set /p "OP=  Seleccione una opción [0-2]: "

if "%OP%"=="1" goto RAPIDA
if "%OP%"=="2" goto COMPLETA
if "%OP%"=="0" exit /b
goto MENU

:RAPIDA
cls
echo.
echo  ╔══════════════════════════════════════════════════════════════════════════════════╗
echo  ║                       EJECUTANDO MANTENIMIENTO RÁPIDO                            ║
echo  ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1/2] Eliminando archivos temporales del usuario...
del /s /f /q "%temp%\*.*" >nul 2>&1
for /d %%p in ("%temp%\*.*") do rmdir "%%p" /s /q >nul 2>&1

echo   [2/2] Vaciando caché DNS para optimizar la conexión...
ipconfig /flushdns >nul 2>&1

echo.
echo  ────────────────────────────────────────────────────────────────────────────────────
echo  [OK] Mantenimiento rápido completado satisfactoriamente.
echo  ────────────────────────────────────────────────────────────────────────────────────
echo.
pause
goto MENU

:COMPLETA
cls
echo.
echo  ╔══════════════════════════════════════════════════════════════════════════════════╗
echo  ║                      EJECUTANDO MANTENIMIENTO COMPLETO                           ║
echo  ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1/3] Eliminando archivos temporales del usuario y del sistema...
del /s /f /q "%temp%\*.*" >nul 2>&1
for /d %%p in ("%temp%\*.*") do rmdir "%%p" /s /q >nul 2>&1
del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1

echo   [2/3] Vaciando caché DNS del sistema...
ipconfig /flushdns >nul 2>&1

echo   [3/3] Buscando y aplicando actualizaciones de software (Winget)...
echo         (Si algún instalador solicita confirmación, acéptela en pantalla)
echo.
winget upgrade --all --accept-source-agreements --accept-package-agreements

echo.
echo  ────────────────────────────────────────────────────────────────────────────────────
echo  [OK] Mantenimiento completo finalizado con éxito.
echo  ────────────────────────────────────────────────────────────────────────────────────
echo.
pause
goto MENU
