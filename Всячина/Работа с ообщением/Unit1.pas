unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  procedure Mesanger;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Mesanger;
begin
if MessageDlg('Вы уверены?',
mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
MessageDlg('Поздравляю!!!', mtInformation,[mbOk], 0);
end else begin
MessageDlg('Значит не беременны  :-)!!!',
mtInformation, [mbok], 0);
end;end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Mesanger;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Mesanger;
end;



end.
