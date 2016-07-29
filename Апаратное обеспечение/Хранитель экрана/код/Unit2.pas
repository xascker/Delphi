unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Unit1;

type
  TForm2 = class(TForm)
    tmrTick: TTimer;
    procedure tmrTickTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure DrawSphere(x, y, size : integer; color : TColor);
    procedure DeactivateScrnSaver(var Msg : TMsg; var Handled : boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  crs : TPoint;

implementation

{$R *.dfm}


function Min(a, b : integer) : integer;
begin
 if b < a then
 Result := b
   else
  Result := a;
end;

procedure TForm2.DrawSphere(x, y, size : integer; color : TColor);
var
 i, dw    : integer;
 cx, cy   : integer;
 xy1, xy2 : integer;
 r, g, b  : byte;
begin
 with Canvas do begin
   {Заполняем установки карандаша и кисти.}
   Pen.Style := psClear;
   Brush.Style := bsSolid;
   Brush.Color := color;
   {Подготовим цвета для сфер.}
   r := GetRValue(color);
   g := GetGValue(color);
   b := GetBValue(color);
  {Рисуем сферу.}
  dw := size div 16;
    for i := 0 to 15 do begin
    xy1 := (i * dw) div 2;
    xy2 := size - xy1;
    Brush.Color := RGB(Min(r + (i * 8), 255), Min(g + (i * 8), 255),Min(b + (i * 8), 255));
    Ellipse(x + xy1, y + xy1, x + xy2, y + xy2);
   end;
  end;
end;

procedure TForm2.tmrTickTimer(Sender: TObject);
var
sphcount : integer;
 x, y    : integer;
 size    : integer;
 r, g, b : byte;
 color   : TColor;
begin
  if sphcount > Form1.spnSpheres.Value then begin
    Refresh;
    sphcount := 0;
  end;
     Inc(sphcount);
     x := Random(ClientWidth);
     y := Random(ClientHeight);
     size := Form1.spnSize.Value + Random(50) - 25;
     x := x - size div 2;
     y := y - size div 2;
     r := Random($80);
     g := Random($80);
     b := Random($80);
    DrawSphere(x, y, size, RGB(r, g, b));
end;

procedure TForm2.DeactivateScrnSaver(var Msg : TMsg; var Handled : boolean);
var
 done : boolean;
begin
  if Msg.message = WM_MOUSEMOVE then
    done := (Abs(LOWORD(Msg.lParam) - crs.x) > 5) or
    (Abs(HIWORD(Msg.lParam) - crs.y) > 5)
      else
        done := (Msg.message = WM_KEYDOWN) or (Msg.message = WM_ACTIVATE) or
        (Msg.message = WM_ACTIVATEAPP) or (Msg.message = WM_NCACTIVATE);
      if done then
  Close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 GetCursorPos(crs);
 tmrTick.Interval      := 1000 - Form1.spnSpeed.Value * 90;
 tmrTick.Enabled       := true;
 Application.OnMessage := DeactivateScrnSaver;
 ShowCursor(false);
end;

procedure TForm2.FormHide(Sender: TObject);
begin
 Application.OnMessage := nil;
 tmrTick.Enabled       := false;
 ShowCursor(true);
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 WindowState := wsMaximized;
end;

end.
