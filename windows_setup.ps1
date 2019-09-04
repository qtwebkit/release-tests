# Disable unnecessary background services which tend to consume
# a lot of resources
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableArchiveScanning $true
Set-MpPreference -DisableBehaviorMonitoring $true
sc.exe config TrustedInstaller start=disabled; sc.exe stop TrustedInstaller
sc.exe config wuauserv start=disabled; sc.exe stop wuauserv
Add-MpPreference -ExclusionPath C:\
Add-MpPreference -ExclusionProcess cmake.exe
Add-MpPreference -ExclusionProcess cl.exe
Add-MpPreference -ExclusionProcess link.exe

Add-MpPreference -ExclusionProcess g++.exe
Add-MpPreference -ExclusionProcess ld.exe
Add-MpPreference -ExclusionProcess mingw32-make.exe
