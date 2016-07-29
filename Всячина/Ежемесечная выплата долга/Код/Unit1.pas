unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
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

function payment(princ, int, term: double): double; var temp: double;
begin
int := int / 100;
temp := exp(ln(int + 1) * term);
result := princ * ((int * temp) / (temp - 1));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
a,b,MyVar: real;
c: integer;
begin
a:= StrToFloat(Edit1.Text);
b:= StrToFloat(Edit2.Text);
c:= StrToInt(Edit3.Text);
MyVar := PAYMENT(a, b/12, c);
Label1.Caption := FloatToStr(MyVar);
end;

end.
 