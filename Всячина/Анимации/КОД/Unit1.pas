unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    Animate1: TAnimate;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CFrame: integer; // номер отображаемого кадра


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if Animate1.Active = False
then begin
Animate1.StartFrame:=1; // вывод с первого
Animate1.StopFrame:=Animate1.FrameCount; // по последний кадр
Animate1.Active:=True;
Button1.caption:='Стоп';
end
else
begin
Animate1.Active:=False;
Button1.caption:='Пуск';
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if CFrame = 1 then Button2.Enabled := True;
if CFrame < Animate1.FrameCount then begin
  CFrame := CFrame + 1;
  // вывести кадр
  Animate1.StartFrame := CFrame;
  Animate1.StopFrame := CFrame;
  Animate1.Active := True;
     if CFrame = Animate1.FrameCount // текущий кадр — последний
     then Button3.Enabled:=False;
      end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if CFrame = Animate1.FrameCount
then Button2.Enabled := True;
if CFrame > 1 then begin
  CFrame := CFrame - 1;
  // вывести кадр
  Animate1.StartFrame := CFrame;
  Animate1.StopFrame := CFrame;
  Animate1.Active := True;
   if CFrame = 1 // текущий кадр — первый
   then Form1.Button2.Enabled := False;
   end;
end;

end.
