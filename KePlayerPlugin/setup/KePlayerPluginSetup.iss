; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "KaerPlayerPlugin"
#define MyAppVersion "0.52"
#define MyAppPublisher "Kaer, Inc."
#define MyAppURL "http://www.kaer.cn/"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{74BB359D-EB46-44C8-8AE4-A4800135442D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=KaerPlayerPluginSetup
Compression=lzma
SolidCompression=yes
VersionInfoVersion=0.5.2.0


[Languages]
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Files]
Source: "msvcp100.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msvcr100.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "AVPlay.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "DllDeinterlace.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "hi_h264dec_w.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "lib_VoiceEngine_dll32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "npKePlayerPlugin.dll"; DestDir: "{app}"; Flags: ignoreversion regserver 32bit
Source: "npKePlayerPlugin.dll.embed.manifest"; DestDir: "{app}"; Flags: ignoreversion
Source: "REG.BAT"; DestDir: "{app}"; Flags: ignoreversion
Source: "UNREG.BAT"; DestDir: "{app}"; Flags: ignoreversion
Source: "pluginTest/*"; DestDir: "{app}/pluginTest"; Flags: ignoreversion  recursesubdirs createallsubdirs
Source: "pluginconfig.ini"; DestDir: "{app}"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins"; Flags: uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins\@kaer.com/KePlayerPlugin,version=3.0"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins\@kaer.com/KePlayerPlugin,version=3.0\MimeTypes"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins\@kaer.com/KePlayerPlugin,version=3.0\MimeTypes\application/keplayer-plugin"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins\@kaer.com/KePlayerPlugin,version=3.0"; ValueType: string; ValueName: "Path"; ValueData:"{app}/npKePlayerPlugin.dll"
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins\@kaer.com/KePlayerPlugin,version=3.0"; ValueType: string; ValueName: "GeckoVersion"; ValueData:"1.00"
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins\@kaer.com/KePlayerPlugin,version=3.0"; ValueType: string; ValueName: "Version"; ValueData:"3.00"
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins\@kaer.com/KePlayerPlugin,version=3.0"; ValueType: string; ValueName: "Vendor"; ValueData:"Kaer"
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins\@kaer.com/KePlayerPlugin,version=3.0"; ValueType: string; ValueName: "Description"; ValueData:"Kaer camera play plugin"
Root: HKLM; Subkey: "SOFTWARE\MozillaPlugins\@kaer.com/KePlayerPlugin,version=3.0"; ValueType: string; ValueName: "ProductName"; ValueData:"KePlayerPlugin"