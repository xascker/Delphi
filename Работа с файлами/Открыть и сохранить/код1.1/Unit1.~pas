unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
Memo1.Clear;
Button1.Enabled := True;
Button2.Enabled := True;
Button3.Enabled := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
f: TextFile;
buf: String[80];
fname : string[80];
begin
if OpenDialog1.Execute then
begin
fName := OpenDialog1.FileName;
Edit1.Text := OpenDialog1.FileName;
;AssignFile(f, fName);
{$I-}
Reset(f); // открыть для чтения
{$I+}
if IOResult <> 0 then begin
MessageDlg ('Ошибка доступа к файлу ' + fName,
mtError,[mbOk],0); exit;
 end;
// чтение из файла
while not EOF(f) do begin
readln(f, buf); // прочитать строку из файла
Memo1.Lines.Add(buf); // добавить строку в поле Memo1
end;
CloseFile(f); // закрыть файл
end;
Button1.Enabled := True;
Button2.Enabled := True;
Button3.Enabled := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
f: TextFile;
fName: String[80];
i: integer;
begin
if  SaveDialog1.Execute then
begin
fName:= SaveDialog1.FileName;
Edit1.Text:=  SaveDialog1.FileName;
AssignFile(f, fName);
Rewrite(f); // открыть для перезаписи
// запись в файл
for i:=0 to Memo1.Lines.Count do // строки нумеруются с нуля
writeln(f, Memo1.Lines[i]);
CloseFile(f); // закрыть файл
MessageDlg('Данные записаны в файл ',mtInformation,[mbOk],0);
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
f: TextFile;
fName: String[80];
i: integer;
begin
fName:= Edit1.Text;
AssignFile(f, fName);
Rewrite(f);

for i:=0 to Memo1.Lines.Count do
writeln(f, Memo1.Lines[i]);
CloseFile(f);
MessageDlg('Данные записаны в файл ',mtInformation,[mbOk],0);
end;

end.
