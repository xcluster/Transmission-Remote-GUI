; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#ifndef AppVersion
  #define AppVersion GetFileVersion(SourcePath+'..\units\transgui.exe')
  #define tmpvar Copy(AppVersion, 1, RPos('.', AppVersion) - 1)
  #define AppVersion Copy(tmpvar, 1, RPos('.', tmpvar) - 1)
  #undef tmpvar
  #define AppVersion AppVersion+'-beta'
#endif

#define MyAppName "Transmission Remote GUI"
#define MyAppVerName MyAppName + " " + AppVersion
#define MyAppPublisher "Yury Sidorov"
#define MyAppURL "http://code.google.com/p/transmisson-remote-gui/"
#define MyAppExeName "transgui.exe"

[Setup]
AppId=transgui
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppCopyright=Copyright (c) 2008-2009 by Yury Sidorov
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}

VersionInfoVersion={#GetFileVersion(SourcePath+'..\units\transgui.exe')}
VersionInfoTextVersion={#GetFileVersion(SourcePath+'..\units\transgui.exe')}

DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=..\LICENSE.txt
InfoAfterFile=..\history.txt
OutputDir=..\Release
OutputBaseFilename=transgui-{#AppVersion}-setup

Compression=lzma/max
InternalCompressLevel=max
SolidCompression=no

PrivilegesRequired=poweruser
ChangesAssociations=yes

WizardImageFile=compiler:\WizModernImage-IS.bmp
WizardSmallImageFile=compiler:\WizModernSmallImage-IS.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: regfileext; Description: "{cm:AssocFileExtension,{#MyAppName},.torrent}"; Flags: unchecked
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\units\transgui.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\readme.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\history.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\History"; Filename: "{app}\history.txt"
Name: "{group}\Read me"; Filename: "{app}\readme.txt"
Name: "{group}\License"; Filename: "{app}\LICENSE.txt"
Name: "{group}\Home page"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Registry]
Root: HKCU; Subkey: "Software\Classes\.torrent"; ValueType: string; ValueName: ""; ValueData: "{#MyAppName}"; Flags: uninsdeletevalue; Tasks: regfileext
Root: HKCU; Subkey: "Software\Classes\{#MyAppName}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"",0"; Flags: uninsdeletevalue; Tasks: regfileext
Root: HKCU; Subkey: "Software\Classes\{#MyAppName}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Flags: uninsdeletevalue; Tasks: regfileext

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#MyAppName}}"; Flags: nowait postinstall skipifsilent

