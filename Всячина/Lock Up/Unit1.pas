unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ExtCtrls, Buttons, Spin;

const
 WM_MYICONNOTIFY = WM_USER + 123;

type
  TForm1 = class(TForm)
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    ShownOnce: Boolean;
  public
    { Public declarations }
    procedure WMICON(var msg: TMessage); message WM_MYICONNOTIFY;
    procedure WMSYSCOMMAND(var msg: TMessage);message WM_SYSCOMMAND;
    procedure RestoreMainForm;
    procedure HideMainForm;
    procedure CreateTrayIcon(n:Integer);
    procedure DeleteTrayIcon(n:Integer);
    procedure DeactivateTimer(var Msg: TMsg; var Handled: boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses ComObj,  activex, ShellApi, shlobj, registry;



procedure TForm1.WMICON(var msg: TMessage);
var P : TPoint;
begin
 case msg.LParam of
 WM_LBUTTONDOWN:
  begin
   GetCursorPos(p);
   SetForegroundWindow(Application.MainForm.Handle);
   PopupMenu1.Popup(P.X, P.Y);
  end;
 WM_LBUTTONDBLCLK : N1Click(Self);
 end;
end;

procedure TForm1.WMSYSCOMMAND(var msg: TMessage);
begin
 inherited;
 if (Msg.wParam=SC_MINIMIZE) then N2Click(Self);
end;


procedure TForm1.HideMainForm;
begin
  Application.ShowMainForm := False;
  ShowWindow(Application.Handle, SW_HIDE);
  ShowWindow(Application.MainForm.Handle, SW_HIDE);
end;

procedure TForm1.RestoreMainForm;
var i,j : Integer;
begin
  Application.ShowMainForm := True;
  ShowWindow(Application.Handle, SW_RESTORE);
  ShowWindow(Application.MainForm.Handle, SW_RESTORE);
  if not ShownOnce then
  begin
    for I := 0 to Application.MainForm.ComponentCount -1 do
      if Application.MainForm.Components[I] is TWinControl then
        with Application.MainForm.Components[I] as TWinControl do
          if Visible then
          begin
            ShowWindow(Handle, SW_SHOWDEFAULT);
            for J := 0 to ComponentCount -1 do
              if Components[J] is TWinControl then
                ShowWindow((Components[J] as TWinControl).Handle, SW_SHOWDEFAULT);
          end;
    ShownOnce := True;
  end;

end;

procedure TForm1.CreateTrayIcon(n:Integer);
var nidata : TNotifyIconData;
begin
 with nidata do
  begin
   cbSize := SizeOf(TNotifyIconData);
   Wnd := Self.Handle;
   uID := 1;
   uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
   uCallBackMessage := WM_MYICONNOTIFY;
   hIcon := Application.Icon.Handle;
   StrPCopy(szTip,Application.Title);
  end;
  Shell_NotifyIcon(NIM_ADD, @nidata);
end;

procedure TForm1.DeleteTrayIcon(n:Integer);
var nidata : TNotifyIconData;
begin
 with nidata do
  begin
   cbSize := SizeOf(TNotifyIconData);
   Wnd := Self.Handle;
   uID := 1;
  end;
  Shell_NotifyIcon(NIM_DELETE, @nidata);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 ShownOnce:= False;
 CreateTrayIcon(1);
 N2.Enabled := False;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 DeleteTrayIcon(1);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 RestoreMainForm;
 DeleteTrayIcon(1);
 N1.Enabled := False;
 N2.Enabled := True;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 HideMainForm;
 CreateTrayIcon(1);
 N2.Enabled := False;
 N1.Enabled := True;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.DeactivateTimer(var Msg: TMsg; var Handled: boolean);
var done: boolean;
    crs : TPoint;
    a,b : integer;
begin
if Msg.message = WM_MOUSEMOVE then
    done := (Abs(LOWORD(Msg.lParam) - crs.X) <> 3) or
     (Abs(HIWORD(Msg.lParam) - crs.Y) <> 3)
 else
    done := (Msg.message = WM_KEYDOWN) or (Msg.message = WM_KEYUP) or
     (Msg.message = WM_SYSKEYDOWN) or (Msg.message = WM_SYSKEYUP) or
     (Msg.message = WM_ACTIVATE) or (Msg.message = WM_NCACTIVATE) or
     (Msg.message = WM_ACTIVATEAPP) or (Msg.message = WM_LBUTTONDOWN) or
     (Msg.message = WM_RBUTTONDOWN) or (Msg.message = WM_MBUTTONDOWN);
 if not done then
    begin
     { a:=StrToInt(Edit.Text);
      b:=a*60000;
      Timer.Interval:=b; }
      Label3.Caption:='ghfghfghfghfhffghfgh'
    end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var a,b : integer;
begin
 Timer.Enabled:=True;
 a:=StrToInt(Edit.Text);
 b:=a*60000;
 Timer.Interval:=b;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 Timer.Enabled:= False;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 LockUp;
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
 LockUp;
end;

procedure TForm1.CheckBoxClick(Sender: TObject);
var a,b : integer;
begin
 if CheckBox.Checked then
    begin
      Timer.Enabled:=True;
      a:=StrToInt(Edit.Text);
      b:=a*60000;
      Timer.Interval:=b;
      Application.OnMessage:=DeactivateTimer;
    end;
 if CheckBox.Checked=False then
    Timer.Enabled:=False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
label3.Caption:='' ;
{Timer1.Enabled:=false; }
end;

end.
