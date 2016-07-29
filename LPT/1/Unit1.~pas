unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

 function Inp32(PortAdr: word): byte; stdcall; external 'inpout32.dll';
 function Out32(PortAdr: word; Data: byte): byte; stdcall; external 'inpout32.dll';

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
var
    Port: word;
    Data: Byte;
begin
 Port:= 888;  // номер порта, в нашем случае это LPT
 Data:= StrToInt(Edit1.Text);
 Out32(Port, Data);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
    Port: word;
    Data: Byte;
begin
 Port:= 888;
 Data:= StrToInt(Edit1.Text);
 Out32(Port, Data)
end;

end.
 