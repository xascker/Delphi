unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
   Graphics, Controls, Forms, MMSystem,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
begin
mciSendString('Set cdaudio door open wait', nil,
 0, handle);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
mciSendString('Set cdaudio door closed wait', nil,
0, handle);
end;

end.
