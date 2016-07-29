unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls;

const
  CfgFile = 'Convector.INI';

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
     procedure LoadConfig;
     procedure SaveConfig;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.LoadConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       Edit1.Text:=ReadString('Config', 'Edit1','0,19801');
       Edit2.Text:=ReadString('Config', 'Edit2','1');
       Edit3.Text:=ReadString('Config', 'Edit3','4,77');
       Edit4.Text:=ReadString('Config', 'Edit4','0,19801');
       CheckBox1.Checked:=ReadBool('Config','CheckBox1',CheckBox1.Checked);
       CheckBox2.Checked:=ReadBool('Config','CheckBox2',CheckBox2.Checked);
       CheckBox3.Checked:=ReadBool('Config','CheckBox3',CheckBox3.Checked);
       CheckBox4.Checked:=ReadBool('Config','CheckBox4',CheckBox4.Checked);
     end;
   finally
 inifile.Free;
end;end;

procedure TForm2.SaveConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       WriteString('Config', 'Edit1', Edit1.Text);
       WriteString('Config', 'Edit2', Edit2.Text);
       WriteString('Config', 'Edit3', Edit3.Text);
       WriteString('Config', 'Edit4', Edit4.Text);
       WriteBool('Config','CheckBox1',CheckBox1.Checked);
       WriteBool('Config','CheckBox2',CheckBox2.Checked);
       WriteBool('Config','CheckBox3',CheckBox3.Checked);
       WriteBool('Config','CheckBox4',CheckBox4.Checked);
     end;
  finally
 inifile.Free;
end;end;


procedure TForm2.FormCreate(Sender: TObject);
begin
 LoadConfig;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 SaveConfig;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
a,b,c,d : real;
E1,E2,E3,E4 : real;
begin
 a := StrToFloat (Edit1.Text);
 b := StrToFloat (Edit2.Text);
 c := StrToFloat (Edit3.Text);
 d := StrToFloat (Edit4.Text);
 E1 := 1/a;
 E2 := 1/b;
 E3 := 1/c;
 E4 := 1/d;
  if CheckBox1.Checked then begin
      Edit1.Text := FloatToStr (E1); end;
  if CheckBox2.Checked then begin
      Edit2.Text := FloatToStr (E2); end;
  if CheckBox3.Checked then begin
      Edit3.Text := FloatToStr (E3); end;
  if CheckBox4.Checked then begin
      Edit4.Text := FloatToStr (E4); end;
end;

end.
