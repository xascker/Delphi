unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
var a:integer;
begin
 a:=AlphaBlendValue;
   if AlphaBlendValue=1 then; AlphaBlendValue:=a+1;
   if AlphaBlendValue=255 then  Timer1.Enabled:= False ;
    { While not AlphaBlendValue=255 do; begin
       AlphaBlendValue:=a+1;
       Timer1.Enabled:=False;         end; }

end;

end.
