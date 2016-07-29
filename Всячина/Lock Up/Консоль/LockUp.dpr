program LockUp;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows;

var
 st:array[0..79] of char;
 i:String;
begin
 i:= 'C:\windows\system32\rundll32.exe user32.dll,LockWorkStation' ;
 WinExec(StrPCopy(st,i),SW_SHOWMiNiMIZED);
 write ('Lock Up operation system.........')
end.
 