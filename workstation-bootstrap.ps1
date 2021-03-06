Set-ExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtension
Install-WindowsUpdate  -acceptEula
Update-ExecutionPolicy RemoteSigned
Enable-RemoteDesktop

Enable-WindowsOptionalFeature -Online -FeatureName MSMQ-Server -All

cinst 7zip
cinst adb
cinst autohotkey
cinst bind-toolsonly
cinst ccleaner
cinst chefdk
cinst ChocolateyGUI
cinst clink
cinst clover
cinst conemu
cinst cpu-z
cinst CrashPlan
cinst crystaldiskmark
cinst Cygwin
cinst ditto
cinst dropbox
cinst Evernote
cinst filezilla
cinst Firefox
cinst jdk8
cinst freemind
cinst git
cinst git.install
cinst google-chrome-x64
cinst googledrive
cinst greenshot
cinst OptiPNG
cinst handbrake
cinst hexchat
cinst keepass.portable
cinst lastpass
cinst lastpass-for-applications
cinst licecap
cinst listary
cinst logmein-rescue-console-desktop
cinst paint.net
cinst putty
cinst Quicktime
cinst rdcman
cinst scansnapmanager
cinst skype
cinst slack
cinst SourceTree
cinst SublimeText3
cinst SublimeText3.PackageControl
cinst sysinternals
cinst Teamspeak3
cinst tortoisehg
cinst tortoisesvn
cinst vlc
cinst windirstat
cinst winmerge
cinst WinPcap
# Provides makecert.exe utility
cinst windows-sdk-7.1
cinst wireshark
cinst wizmouse
cinst wget

#Turn off Aero Shake - Must sign out/in for this to take effect.
New-Item -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer
Set-ItemProperty HKCU:\Software\Policies\Microsoft\Windows\Explorer NoWindowMinimizingShortcuts 1

# Install SublimeText Powershell syntax highlighting
$sublimePackagesPath=Join-Path $env:AppData "Sublime Text 3\Packages"
$target=Join-Path $env:TEMP "PowerShell"
if (Test-Path $target) { Remove-Item -Recurse -Force $target }
cd $env:TEMP
# This command makes noise, but it can be ignored. See https://github.com/dahlbyk/posh-git/issues/109
git clone https://github.com/SublimeText/PowerShell
Move-Item $target $sublimePackagesPath

# Configure greenshot
$greenshotconfig = "C:\Users\$env:USERNAME\AppData\Roaming\Greenshot\greenshot-fixed.ini"
# Dealing with wonky line endings when pulling from github.
$tempgreenshot = [System.IO.Path]::GetTempFileName()
Invoke-WebRequest "https://raw.githubusercontent.com/silverl/boxstarter/master/greenshot-fixed.ini" -OutFile $tempgreenshot
Get-Content $tempgreenshot | Set-Content -Path $greenshotconfig

# Configure git
git config --global credential.helper wincred


# Configure workstation for WinRM remote management
# start WinRM service
Start-Service WinRM
# enable the local account token filter policy
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name LocalAccountTokenFilterPolicy -Value 1 -Type DWord
# now you can add all computers to your TrustedHosts list
Set-Item WSMan:\localhost\Client\TrustedHosts  -Value "*"
