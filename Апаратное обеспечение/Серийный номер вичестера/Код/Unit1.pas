unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
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

SerialNum : dword;
a, b : dword;
Buffer  : array [0..255] of char;
begin

if GetVolumeInformation('c:\', Buffer, SizeOf(Buffer), @SerialNum, a, b, nil, 0) then
Label1.Caption := IntToStr(SerialNum);
end; 

end.
