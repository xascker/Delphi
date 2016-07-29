unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
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
 bmp: TBitmap;
 DC: HDC;
begin
 bmp:=TBitmap.Create;
 bmp.Height:=Screen.Height;
 bmp.Width:=Screen.Width;
 DC:=GetDC(0); 
 BitBlt(bmp.Canvas.Handle, 0, 0, Screen.Width, Screen.Height,
 DC, 0, 0, SRCCOPY);
 if SaveDialog1.Execute then
   begin
     bmp.SaveToFile(SaveDialog1.FileName);
   end;
 ReleaseDC(0, DC);
end;
end.
