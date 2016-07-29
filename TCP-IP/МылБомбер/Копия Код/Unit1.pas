unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdMessage, IniFiles, Menus;

const
 CfgFile = 'Mail.INI';

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    Label8: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
     procedure LoadConfig;
     procedure SaveConfig;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

//uses Unit2 ;

{$R *.dfm}
{$R xpstyle.res}

procedure TForm1.LoadConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       Edit1.Text:=ReadString('Config', 'Host','192.168.33.200');
       Edit2.Text:=ReadString('Config', 'Port','25');
       Edit4.Text:=ReadString('Config', 'Who','@');
       Edit5.Text:=ReadString('Config', 'From','@');
       Edit6.Text:=ReadString('Config', 'Name','Spamer');
       Edit7.Text:=ReadString('Config', 'Whaw_Many','5');
       Memo1.Text:=ReadString('Config', 'Text','lllll');
     end;
   finally
 inifile.Free;
end;
 SaveConfig;
end;

procedure TForm1.SaveConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       WriteString('Config', 'Host', Edit1.Text);
       WriteString('Config', 'Port', Edit2.Text);
       WriteString('Config', 'Who', Edit4.Text);
       WriteString('Config', 'From', Edit5.Text);
       WriteString('Config', 'Name', Edit6.Text);
       WriteString('Config', 'Whaw_Many', Edit7.Text);
       WriteString('Config', 'Text', Memo1.Text);
     end;
  finally
 inifile.Free;
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 i, num, j: integer;
begin
  IdSMTP1.Host := Edit1.Text;
 IdSMTP1.Port := StrToInt(Edit2.Text);
//IdSMTP1.Username := 'karpenko';
//IdSMTP1.Password := '030603';
 IdMessage1.From.Address := Edit5.Text;  //Адрес опавителя
 IdMessage1.From.Name := Edit6.Text;   // Имя отправителя
 IdMessage1.Subject := Edit3.Text;   // Тема
 IdMessage1.Body.Assign(Memo1.Lines);
 IdMessage1.Recipients.Add;
 IdMessage1.Recipients.Items[0].Text := Edit4.Text;  //Кому
 IdSMTP1.Connect;
j := StrToInt(edit7.text);
 for I := 1 to j do
   begin
     num := StrToInt(edit7.text) - 1;
     edit7.text := IntToStr(num);
     IdSMTP1.Send(IdMessage1); //шлем почту
   end;
 //IdSMTP1.Authenticate;
 IdSMTP1.Send(IdMessage1);
 IdSMTP1.Disconnect;
 SaveConfig;
 Label8.Caption := ' Письмо отправлено ' ;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 LoadConfig;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 if Label8.Caption = ' Письмо отправлено ' then
       begin
         Label8.Caption := ' '  ;
        // 
       end
end;

end.
