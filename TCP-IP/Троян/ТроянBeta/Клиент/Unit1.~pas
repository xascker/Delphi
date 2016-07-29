unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ClientSocket1: TClientSocket;
    Button3: TButton;
    Button4: TButton;
    SB: TStatusBar;
    Button5: TButton;
    Button8: TButton;
    Button11: TButton;
    Button6: TButton;
    Button7: TButton;
    Button10: TButton;
    Button9: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Connecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('1');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('2');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('3');
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('4');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('5');
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('6');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('7');
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('8');
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('9');
 ClientSocket1.Active:=true;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('10');
 ClientSocket1.Active:=true;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('11');
 ClientSocket1.Active:=true;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText('12');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 ClientSocket1.Host:=Edit1.Text;
 ClientSocket1.Active:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 ClientSocket1.Active:=false;
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 sb.SimpleText:= 'Подклечение к '+Edit1.Text+' прошло успешно';
 SpeedButton1.Font.Color:= clLime;
end;

procedure TForm1.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
 sb.SimpleText:='Произошла ошибка при подключении к '+ Edit1.Text;
 SpeedButton1.Font.Color:= clRed;
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 sb.SimpleText:= 'Клиент '+Edit1.Text+' отключен';
 SpeedButton1.Font.Color:= clRed;
end;

procedure TForm1.ClientSocket1Connecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 sb.SimpleText:= 'Подключаюсь к '+ Edit1.Text;
end;


end.
