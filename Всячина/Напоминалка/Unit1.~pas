unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    Button2: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Button3: TButton;
    Edit3: TEdit;
    OpenDialog2: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  F: TextFile; // файл с настройками
  buf: String;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Timer1.Interval:= StrToInt(Edit2.Text);
 
end;

procedure TForm1.Button1Click(Sender: TObject); //путь к рисунок
var
 fname : string;
begin
 if OpenDialog1.Execute then
   begin
     fName := OpenDialog1.FileName;
     Edit1.Text := OpenDialog1.FileName;
   end;
end;

procedure TForm1.Button3Click(Sender: TObject); // путь к музыке
var
 fname : string;
begin
 if OpenDialog2.Execute then
   begin
     fName := OpenDialog2.FileName;
     Edit3.Text := OpenDialog2.FileName;
   end;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
 if Timer1.Enabled = true then
    begin
      Button2.Caption := 'Старт';
      Timer1.Enabled := false;
    end
       else   begin
         Button2.Caption := 'Стоп';
         Timer1.Enabled := true;
       end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 Close;
end;



end.
