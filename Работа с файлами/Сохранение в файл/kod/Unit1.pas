unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  f: TextFile;
  fName: String[80];
  i: integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if SaveDialog1.Execute then
begin
fName := SaveDialog1.FileName;
edit1.Text:= SaveDialog1.FileName;
AssignFile(f, fName);
Append(f); // ������� ��� ����������
// ������ � ����
for i:=0 to Memo1.Lines.Count do // ������ ���������� � ����
writeln(f, Memo1.Lines[i]);
CloseFile(f); // ������� ����
MessageDlg('������ ��������� � ���� ',mtInformation,[mbOk],0);
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
memo1.Clear;
end;

end.
