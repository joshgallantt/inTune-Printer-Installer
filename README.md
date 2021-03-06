# inTune Printer Installer

Adds printers to inTune/My Company Portal so you can manage printers using group policies.

An example printer file is included for reference. If you would like to test using this skip to step 5 using the included .intunewin file.

## Guide

1) Download the inTune Content Prep Tool executable from https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool
2) Each Printer folder should be set up like the included example. (need a Driver folder containing the driver files (including .inf), a unique copy of the .ps1, a copy of the .cmd
3) Edit the script.ps1 file to configure whatever printer you are installing
4) Run IntuneWinAppUtil.exe
    <br>a) Source folder will be the path to the printer file ex: Users/Desktop/HP Color LaserJet Pro M252
    <br>b) Setup File will be the .cmd filename ex: HP Color LaserJet Pro M252.cmd
    <br>c) Output Folder will be same as printer file location (just press up arrow twice to reselect)
    <br>d) Select No to specify the catalog folder

5) A .intunewin file should have been generated using the printer drivers, script, and command file.
6) Log in to Intune and select all Apps and Click to Add. Select App Type to “Windows app (Win32)”
7) Click Select App Package File and choose the .intunewin file we just generated.
8) Add app information (name can be the location in the office + printers product name), leave defaults
9) Under program tab, make sure to specify the install/uninstall commands the same as in step 4b
10) On detection rule, select manually configure detection rules
11) Set key path to Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\PRINTERNAMEHERE
    <br>(Where "PRINTERNAMEHERE" is the same as $name in the script.ps1 file)
12) Assign to the group you want access to this printer
