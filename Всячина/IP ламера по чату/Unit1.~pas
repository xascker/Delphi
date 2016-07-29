unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, IdCustomHTTPServer,
  IdHTTPServer, Menus, ComCtrls, StdCtrls,ClipBrd;

type
  TForm1 = class(TForm)
    MMenu: TMainMenu;
    lbAddConnect: TListBox;
    Status: TStatusBar;
    ClickMenu: TPopupMenu;
    Server: TIdHTTPServer;
    N1: TMenuItem;
    mStart: TMenuItem;
    mStop: TMenuItem;
    mExit: TMenuItem;
    cmCopy1: TMenuItem;
    cmClearAll1: TMenuItem;
    procedure mStartClick(Sender: TObject);
    procedure mStopClick(Sender: TObject);
    procedure ServerConnect(AThread: TIdPeerThread);
    procedure cmCopy1Click(Sender: TObject);
    procedure cmClearAll1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.mStartClick(Sender: TObject);
begin
 Server.Active:=True; //запускаем "сервер"
 lbAddConnect.Items.Add('Сервер активирован: '+FormatDateTime('hh.nn.ss',now));
 Status.Panels[0].Text:='Монитор работает'; //вывод инфы пользователю, что сервер работает
 mStart.Enabled:=False;
 mStop.Enabled:=True;
end;

procedure TForm1.mStopClick(Sender: TObject);
begin
 Server.Active:=False; //вырубаем "сервер"
 lbAddConnect.Items.Add('Сервер остановлен: '+FormatDateTime('hh.nn.ss',now));
 Status.Panels[0].Text:='Монитор не работает';
 mStart.Enabled:=True;
 mStop.Enabled:=False;
end;

procedure TForm1.ServerConnect(AThread: TIdPeerThread);
begin
 lbAddConnect.Items.Add('Внимание, обнаружен коннект:');
 lbAddConnect.Items.Add(AThread.Connection.Socket.Binding.PeerIP); // определение IP подсоединившегося
end;

procedure TForm1.cmCopy1Click(Sender: TObject);
var Bo: TClipboard;
begin
{Копируем в буфер обмена}
 Bo:=TClipboard.Create; //создается объект клипборда
 Bo.SetTextBuf(pchar(lbAddConnect.Items.Strings[lbAddConnect.ItemIndex])); //копируется
 Bo.Free; //уничтожается созданный ранее объект
end;

procedure TForm1.cmClearAll1Click(Sender: TObject);
begin
 lbAddConnect.Items.Clear;
end;

end.
