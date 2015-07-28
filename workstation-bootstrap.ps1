Set-ExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtension
Install-WindowsUpdate  -acceptEula
Update-ExecutionPolicy RemoteSigned
Enable-RemoteDesktop
cinst 7zip
cinst adb
cinst autohotkey
cinst bind-toolsonly
cinst ccleaner
cinst chefdk
cinst ChocolateyGUI
cinst clink
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
cinst sysinternals
cinst Teamspeak3
cinst tortoisehg
cinst tortoisesvn
cinst vlc
cinst windirstat
cinst winmerge
cinst WinPcap
cinst wireshark
cinst wizmouse

#Turn off Aero Shake - Must sign out/in for this to take effect.
New-Item -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer
Set-ItemProperty HKCU:\Software\Policies\Microsoft\Windows\Explorer NoWindowMinimizingShortcuts 1