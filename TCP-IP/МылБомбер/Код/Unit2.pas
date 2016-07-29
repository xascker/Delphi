unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, ExtCtrls;

const
 CfgFile = 'Mail.INI';

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
     procedure LoadConfig;
     procedure SaveConfig;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.LoadConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       Edit1.Text:=ReadString('Config', 'Login','Vasy');
       Edit2.Text:=ReadString('Config', 'Pass','123456');
     end;
   finally
 inifile.Free;
end;
end;

procedure TForm2.SaveConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       WriteString('Config', 'Login', Edit1.Text);
       WriteString('Config', 'Pass', Edit2.Text);
     end;
  finally
 inifile.Free;
end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 LoadConfig;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 SaveConfig;
 Close;
end;

end.
 