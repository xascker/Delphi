unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls;

type
  TForm3 = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}


procedure TForm3.FormCreate(Sender: TObject);
var i: real;
begin
 Timer1.Enabled:=True;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
var
  mf: TMetaFile;
  mfc: TMetaFileCanvas;
begin
  mf := TMetaFile.Create;
  mfc := TMetafileCanvas.Create(mf, 0);
  with mfc do
  begin
    Pen.Color := clRed;
    FrameRect(ClipRect);

    MoveTo(0, 370);
    LineTo(250, 370);
    LineTo(245, 368);            //x
    MoveTo(250, 370);
    LineTo(245, 372);

   MoveTo(5, 375);
    LineTo(5, 120);
    LineTo(3, 125);             //y
    MoveTo(5, 120);
    LineTo(7, 125);

      {MoveTo(300, 100);
      LineTo(100, 200);  //y
      LineTo(150, 200);   //x }

   Brush.Style := bsClear;
    Font.name := 'arial';
    Font.Size := 6;
    TextOut(5, 110, 'Y');
    TextOut(255, 361, 'X');

  end;
  mfc.Free;
  Form3.Canvas.Draw(0, 0, mf);
  mf.Free;
end;

end.
