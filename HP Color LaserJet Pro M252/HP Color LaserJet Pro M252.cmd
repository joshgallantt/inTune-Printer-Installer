@ECHO OFF

SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath="%ThisScriptsDirectory%script.ps1"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'sada
