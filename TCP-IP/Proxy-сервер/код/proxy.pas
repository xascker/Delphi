unit proxy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPServer,
  IdMappedPortTCP, Buttons, Spin, ComCtrls, ExtCtrls, IniFiles, Menus;

const
  CfgFile = 'Proxy32.INI';
  WM_MYICONNOTIFY = WM_USER + 123;  // константа дл€ сворачивани€ в трей

type
  TForm1 = class(TForm)
    Button1: TButton;
    IdMappedPortTCP: TIdMappedPortTCP;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ProxyServer_MappedHost_Edit: TEdit;
    CheckBox1: TCheckBox;
    IpEdit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    ProxyServer_MappedPort_SpinEdit: TSpinEdit;
    ProxyServer_DefaultPort_SpinEdit: TSpinEdit;
    RichEdit1: TRichEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Button3: TButton;
    CheckBox2: TCheckBox;
    Panel1: TPanel;
    IpEdit2: TEdit;
    IpEdit3: TEdit;
    IpEdit4: TEdit;
    Edit1: TEdit;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdMappedPortTCPExecute(AThread: TIdMappedPortThread);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure IdMappedPortTCPConnect(AThread: TIdMappedPortThread);
  private
     ShownOnce: Boolean;
     procedure LoadConfig;
     procedure SaveConfig;
     procedure WriteLogConect;

  public
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
{$R xpstyle.res} // стиль WinXP

//начало кода сворачивани€ в трей

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
end;

// конец кода сворачивани€ в трей

function ReplaceSub(str, sub1, sub2: String): String;
var
 aPos: Integer;
 rslt: String;
begin
 aPos := Pos(sub1, str);
 rslt := '';
   while (aPos <> 0) do begin
     rslt := rslt + Copy(str, 1, aPos - 1) + sub2;
     Delete(str, 1, aPos + Length(sub1) - 1);
     aPos := Pos(sub1, str);
   end;
 Result := rslt + str;
end; 

procedure TForm1.LoadConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       ProxyServer_MappedPort_SpinEdit.Value:=ReadInteger('Config', 'MappedPort', 80);
       ProxyServer_DefaultPort_SpinEdit.Value:= ReadInteger('Config', 'DefaultPort', 3138);
       ProxyServer_MappedHost_Edit.Text:=ReadString('Config', 'MappedHost','192.168.254.2');
       IpEdit1.Text:=ReadString('Config', 'IP1','192.168.33.122');
       IpEdit2.Text:=ReadString('Config', 'IP2','127.0.0.1');
       IpEdit3.Text:=ReadString('Config', 'IP3','127.0.0.1');
       IpEdit4.Text:=ReadString('Config', 'IP4','127.0.0.1');
       CheckBox1.Checked:=ReadBool('Config','CheckBox1',CheckBox1.Checked);
       CheckBox2.Checked:=ReadBool('Config','CheckBox2',CheckBox2.Checked);
     end;
   finally
 inifile.Free;
end;
end; 

procedure TForm1.SaveConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       WriteInteger('Config', 'MappedPort', ProxyServer_MappedPort_SpinEdit.Value);
       WriteInteger('Config', 'DefaultPort', ProxyServer_DefaultPort_SpinEdit.Value);
       WriteString('Config', 'MappedHost', ProxyServer_MappedHost_Edit.Text);
       WriteString('Config', 'IP1', IpEdit1.Text);
       WriteString('Config', 'IP2', IpEdit2.Text);
       WriteString('Config', 'IP3', IpEdit3.Text);
       WriteString('Config', 'IP4', IpEdit4.Text);
       WriteBool('Config','CheckBox1',CheckBox1.Checked);
       WriteBool('Config','CheckBox2',CheckBox2.Checked);
     end;
  finally
 inifile.Free;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LoadConfig;
  Button2.Enabled:=False;
 //это необходмо дл€ тре€
 ShownOnce:= False;
 CreateTrayIcon(1);
 N2.Enabled := False;
 //конец кода тре€
end;

procedure TForm1.WriteLogConect;
var
 F: TextFile;
begin
 AssignFile(F, 'c:\LOGproxy.log');
 if FileExists('c:\LOGproxy.log')
 then Append(F)
 else ReWrite(F);
 WriteLn(F, '—ервер активирован: '+ DateTimeToStr(Now));
 CloseFile(F);
end;

procedure WriteLogDisconect;
var
 F: TextFile;
begin
 AssignFile(F, 'c:\LOGproxy.log');
 if FileExists('c:\LOGproxy.log')
 then Append(F)
 else ReWrite(F);
 WriteLn(F, '—ервер остановлен: '+ DateTimeToStr(Now));
 CloseFile(F);
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
 SaveConfig;
 IdMappedPortTCP.DefaultPort:=ProxyServer_DefaultPort_SpinEdit.Value;
 IdMappedPortTCP.MappedHost:=ProxyServer_MappedHost_Edit.Text;
 IdMappedPortTCP.MappedPort:=ProxyServer_MappedPort_SpinEdit.Value;
 IdMappedPortTCP.Active:=True;
   if IdMappedPortTCP.Active then
     begin
       SpeedButton1.Font.Color:= clLime;
       RichEdit1.Lines.Add('—ервер активирован: '+ DateTimeToStr(Now));
       WriteLogConect;
       ProxyServer_DefaultPort_SpinEdit.Enabled:=False;
       ProxyServer_MappedHost_Edit.Enabled:=False;
       ProxyServer_MappedPort_SpinEdit.Enabled:=False;
       IpEdit1.Enabled:=False;
       IpEdit2.Enabled:=False;
       IpEdit3.Enabled:=False;
       IpEdit4.Enabled:=False;
       CheckBox1.Enabled:=False;
       Button1.Enabled:=False;
       Button2.Enabled:=True;
     end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  IdMappedPortTCP.Active:=False;
  RichEdit1.Lines.Add('—ервер остановлен: '+ DateTimeToStr(Now));
  WriteLogDisconect;
  SpeedButton1.Font.Color:= clRed;
  ProxyServer_DefaultPort_SpinEdit.Enabled:=True;
  ProxyServer_MappedHost_Edit.Enabled:=True;
  ProxyServer_MappedPort_SpinEdit.Enabled:=True;
  IpEdit1.Enabled:=True;
  IpEdit2.Enabled:=True;
  IpEdit3.Enabled:=True;
  IpEdit4.Enabled:=True;
  CheckBox1.Enabled:=True;
  Button1.Enabled:=True;
  Button2.Enabled:=False;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 RichEdit1.Clear;
end;

procedure TForm1.IdMappedPortTCPExecute(AThread: TIdMappedPortThread);
var
 F: TextFile;
 i: Integer;
 str: String;
begin

for i:= 1 to RichEdit1.Lines.Count - 1 do
str:= RichEdit1.Lines.Strings[i];

 AssignFile(F, 'c:\LOGproxy.log');
 if FileExists('c:\LOGproxy.log')
 then Append(F)
 else ReWrite(F);
 WriteLn(F, DateTimeToStr(Now)+' - '+
 (AThread.Connection.Socket.Binding.PeerIP) );

 {while not EOF(f) do begin
      WriteLn(F, AThread.NetData);
        {RichEdit1.Lines.Add(AThread.NetData);
     end; }

 WriteLn(F,(AThread.NetData));
 CloseFile(F);

 RichEdit1.Lines.Add(DateTimeToStr(Now)+' - '+
 (AThread.Connection.Socket.Binding.PeerIP));

 AThread.NetData:=ReplaceSub(AThread.NetData,'Referer: http://'+'/','Referer: http://'+ProxyServer_MappedHost_Edit.Text+'/');
 RichEdit1.Lines.Add(AThread.NetData); 
{ RichEdit1.Lines.Strings[1] ;  }
 {Add(AThread.NetData);  }
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
 if CheckBox1.Checked
    then Form1.FormStyle:=fsStayOnTop
    else Form1.FormStyle:=fsNormal;
 end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked then begin
      IpEdit1.ReadOnly:=True;
      IpEdit2.ReadOnly:=True;
      IpEdit3.ReadOnly:=True;
      IpEdit4.ReadOnly:=True;  end
 else  begin
      IpEdit1.ReadOnly:=False;
      IpEdit2.ReadOnly:=False;
      IpEdit3.ReadOnly:=False;
      IpEdit4.ReadOnly:=False; end;
end;

procedure TForm1.IdMappedPortTCPConnect(AThread: TIdMappedPortThread);
begin
   if CheckBox1.Checked then begin
     if (AThread.Connection.Socket.Binding.PeerIP=IpEdit1.Text) or
        (AThread.Connection.Socket.Binding.PeerIP=IpEdit2.Text) or
        (AThread.Connection.Socket.Binding.PeerIP=IpEdit3.Text) or
        (AThread.Connection.Socket.Binding.PeerIP=IpEdit4.Text) then
     AThread.Connection.Disconnect;
  end;
end;

end.
