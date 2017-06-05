; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
#include "scripts\products2.iss"

#include "scripts\products\winversion.iss"
#include "scripts\products\fileversion.iss"
#include "scripts\products\kb835732.iss"

#include "scripts\products\msi20.iss"
#include "scripts\products\msi31.iss"

#include "scripts\products\dotnetfx20.iss"
//#include "scripts\products\dotnetfx20lp.iss"
#include "scripts\products\dotnetfx20sp1.iss"
//#include "scripts\products\dotnetfx20sp1lp.iss"
#include "scripts\products\dotnetfx20sp2.iss"
//#include "scripts\products\dotnetfx20sp2lp.iss"
#include "scripts\products\directx90c.iss"

#define MyAppName "RC Desk Pilot"
#define AircraftEditorName "Aircraft Editor"
#define UserManual "User Manual"
#define AircraftEditorManual "Aircraft Editor Manual"
#define MyAppVerName "RC Desk Pilot 0.2.2"
#define MyAppPublisher "rcdeskpilot.com"
#define MyAppURL "http://www.rcdeskpilot.com"
#define MyAppExeName "RCDeskPilot.exe"

[CustomMessages]
win2000sp3_title=Windows 2000 Service Pack 3
winxpsp2_title=Windows XP Service Pack 2

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{DFFD7D4F-6C61-402D-8D16-72B8AC33FE5A}
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=..\license.txt
OutputDir=.
OutputBaseFilename=setup
SetupIconFile=..\Resources\icon.ico
Compression=lzma
SolidCompression=yes

ArchitecturesAllowed=x86 x64 ia64
ArchitecturesInstallIn64BitMode=x64 ia64


[Languages]
Name: en; MessagesFile: compiler:Default.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}

[Files]
Source: ..\bin\Final Release\RCDeskPilot.exe; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: ..\bin\Final Release\Bonsai.dll; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\RCDeskPilot.API.dll; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\RCDPAircraftEditor.exe; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\demo.dat; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\frameworkconfig.xml; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly; Permissions: everyone-modify
Source: ..\bin\Final Release\icon16.ico; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\flight0.dat; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\flight1.dat; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\flight2.dat; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\flight3.dat; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\towing.dat; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\icon_blueprint_42.ico; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\RC Desk Pilot - Manual.pdf; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\Aircraft Editor Manual.pdf; DestDir: {app}; Flags: ignoreversion overwritereadonly uninsremovereadonly
Source: ..\bin\Final Release\data\*; DestDir: {app}\data; Flags: overwritereadonly uninsremovereadonly ignoreversion recursesubdirs createallsubdirs
Source: ..\bin\Final Release\Aircraft\*; DestDir: {app}\aircraft; Flags: overwritereadonly uninsremovereadonly ignoreversion recursesubdirs createallsubdirs
Source: ..\bin\Final Release\Repository\*; DestDir: {app}\repository; Flags: overwritereadonly uninsremovereadonly ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; WorkingDir: {app}; IconFilename: {app}\RCDeskPilot.exe; IconIndex: 0; Tasks: ; Languages: 
Name: {group}\{#UserManual}; Filename: {app}\RC Desk Pilot - Manual.pdf
Name: {group}\{#AircraftEditorName}; Filename: {app}\RCDPAircraftEditor.exe; WorkingDir: {app}; IconFilename: {app}\RCDPAircraftEditor.exe; IconIndex: 0; Tasks: ; Languages: 
Name: {group}\{#AircraftEditorManual}; Filename: {app}\Aircraft Editor Manual.pdf
Name: {group}\{cm:ProgramOnTheWeb,{#MyAppName}}; Filename: {#MyAppURL}
Name: {commondesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon; WorkingDir: {app}; IconFilename: {app}\RCDeskPilot.exe; IconIndex: 0

[Run]
Filename: {app}\{#MyAppExeName}; Description: {cm:LaunchProgram,{#MyAppName}}; Flags: nowait postinstall skipifsilent runascurrentuser; WorkingDir: {app}
[Dirs]
Name: {app}\data; Permissions: everyone-modify
Name: {app}\; Permissions: everyone-modify
Name: {app}\aircraft; Permissions: everyone-modify
Name: {userdocs}\RC Desk Pilot\Aircraft; Permissions: everyone-modify
Name: {userdocs}\RC Desk Pilot\Scenery; Permissions: everyone-modify

[Code]
function InitializeSetup(): Boolean;
begin
	//init windows version
	initwinversion();

	//check if dotnetfx20 can be installed on this OS
	if not minwinspversion(5, 0, 3) then begin
		MsgBox(FmtMessage(CustomMessage('depinstall_missing'), [CustomMessage('win2000sp3_title')]), mbError, MB_OK);
		exit;
	end;
	if not minwinspversion(5, 1, 2) then begin
		MsgBox(FmtMessage(CustomMessage('depinstall_missing'), [CustomMessage('winxpsp2_title')]), mbError, MB_OK);
		exit;
	end;

	//if (not iis()) then exit;

	msi20('2.0');
	msi31('3.0');

	//install .netfx 2.0 sp2 if possible; if not sp1 if possible; if not .netfx 2.0
	if minwinversion(5, 1) then begin
		dotnetfx20sp2();
		//dotnetfx20sp2lp();
		manageddirectx90c();
	end else begin
		if minwinversion(5, 0) and minwinspversion(5, 0, 4) then begin
			kb835732();
			dotnetfx20sp1();
			//dotnetfx20sp1lp();
			manageddirectx90c();
		end else begin
			dotnetfx20();
			//dotnetfx20lp();
			manageddirectx90c();
		end;
	end;

	Result := true;
end;


[InstallDelete]
Name: {app}\aircraft\cessna; Type: filesandordirs
Name: {app}\aircraft\extra; Type: filesandordirs
