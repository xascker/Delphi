program VNC;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

function CreateProcessWithLogonW(user:pwidechar; domain:pwidechar; 
passw:pwidechar; flags: DWORD; lpApplicationName: PwideChar; lpCommandLine: PwideChar; 
  dwCreationFlags: DWORD; lpEnvironment: Pointer; 
  lpCurrentDirectory: PWideChar; const lpStartupInfo: TStartupInfo; 
  var lpProcessInformation: TProcessInformation): BOOL; stdcall;external 'advapi32.dll' name 'CreateProcessWithLogonW'; 

var
    si: TSTARTUPINFO; 
    pif: PROCESS_INFORMATION; 
begin 
  si.cb := SizeOf(tstartupinfo); 
   si.dwFlags  := STARTF_USESHOWWINDOW; 
   si.wShowWindow := SW_SHOWDEFAULT; 
   si.lpReserved := nil; 
   si.lpDesktop := nil;
   si.lpTitle := nil;
  CreateProcessWithLogonW('root', nil, 'cbyufAFpfnhjy', 0,
     nil, 'C:\Program Files\UltraVNC\winvnc.exe',0, nil, nil, si, pif);
 write('  Starting winVNC........')     
end.
 