unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
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

procedure TForm1.Button1Click(Sender: TObject);
var
Time: real;
play: real; {стоимость разговора}
summa: real;
begin
time:= strtofloat(Edit1.text);
play:= strtofloat(Edit3.text);
summa:= play*time;
label1.Caption:= 'К оплате ' + floatTostr(summa) + 'грн.';
end;

end.
