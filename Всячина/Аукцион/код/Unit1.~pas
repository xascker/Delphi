unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var a,b,c,d:real;
begin
 if Key=VK_RETURN then  begin
      a := StrTofloat (Edit1.Text);
        if a >= 0 then begin
           b := (a/100)*5+a;
           Edit2.Text := FloatToStr (b)  end
         else  ShowMessage('введите число больше нуля');
        if a >= 0 then begin
           c := (a/100)*10+a;
           Edit3.Text := FloatToStr (c);
         end;
       if a>=0 then begin
          d := (a/100)*20+a;
         Edit4.Text := FloatToStr (d);
        end;
   end;
end;

end.
