unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
if SpeedButton1.Down = true then  begin
      SpeedButton1.Caption:= 'Нажал';
      label1.Caption:= 'Проверка'; end
  else
if SpeedButton1.Down = false then   begin
      SpeedButton1.Caption:= 'Не нажал';
      label1.Caption:= 'Работает'; end;
end;

end.
