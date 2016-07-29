unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
  w:real; h:real; opt:real; d:real;
begin
w:=strtoint(edit1.Text);
h:=StrToInt(Edit2.Text);
opt:=h-100;
  if w=opt then
Label3.caption:='Bu в хорошей форме!'
else
  if w < opt then
begin
d:=opt-w;
Label3.caption:='Вам надо поправиться, на '
+ FloatToStr(d)+ 'кг.';
end
else
begin
d:=w-opt;
Label3.caption:='Haдo немного похудеть, на '
+ FloatTostr(d)+ ' кг.';
end;
end;




end.



