unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit1: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Label6: TLabel;
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
var Rab4,Opl4,Dni,OplPit,Proc:integer;
    Result,Zp1,Pitanie,Prem : real;
begin
 Rab4:= StrToInt(Edit1.Text);
 Opl4:= StrToInt(Edit1.Text);
 Dni:= StrToInt(Edit1.Text);
 OplPit:= StrToInt(Edit1.Text);
 Proc:= StrToInt(Edit1.Text);
     Zp1:= Rab4*Opl4 ;
   Pitanie:= OplPit* Dni;
     if Proc<89 then Prem:=0;
     if (Proc<=90) and (Proc<95) then Prem:=Zp1*0.1;
     if Proc>=95 then Prem:=Zp1*0.15;
 Result:=Zp1+Prem+Pitanie;
LaBel6.Caption:='���� ��������: '+ FloatToStr(Result)+ ' !!!!!';
end;

end.
