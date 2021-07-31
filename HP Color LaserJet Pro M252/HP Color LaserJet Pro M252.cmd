@ECHO OFF

SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath="%ThisScriptsDirectory%script.ps1"
cmd /k PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'