unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
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
st:array[0..79] of char;
i:String;
begin
i:= 'C:\Winamplist.exe' ;
WinExec(StrPCopy(st,i),SW_SHOWMAXIMIZED);// ����� SW_SHOWMiNiMIZED
end;

end.
