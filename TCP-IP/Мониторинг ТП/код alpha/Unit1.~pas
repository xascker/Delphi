unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdUDPBase, IdUDPClient, IdSNTP, IdRawBase,
  IdRawClient, IdIcmpClient, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton14: TSpeedButton;
    GroupBox6: TGroupBox;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton34: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    GroupBox7: TGroupBox;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    GroupBox10: TGroupBox;
    SpeedButton43: TSpeedButton;
    GroupBox11: TGroupBox;
    SpeedButton44: TSpeedButton;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    SpeedButton45: TSpeedButton;
    SpeedButton46: TSpeedButton;
    SpeedButton48: TSpeedButton;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    IdIcmpClient1: TIdIcmpClient;
    Timer1: TTimer;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    SpeedButton47: TSpeedButton;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label44: TLabel;
    Label45: TLabel;
    SpeedButton49: TSpeedButton;
    Label46: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    Animate1: TAnimate;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
var
a : integer;
begin
 a := StrToInt(Edit1.Text);

//--------------------Операторы------------------------
if CheckBox1.Checked then begin
//--------------------dr-oper5------------------------
 IdIcmpClient1.Host :='192.168.33.101' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then begin
   SpeedButton1.Glyph.LoadFromFile('PC.bmp');
   SpeedButton4.Glyph.LoadFromFile('Printer.bmp'); end
 else begin
   SpeedButton1.Glyph.LoadFromFile('ErrConnect.bmp');
   SpeedButton4.Glyph.LoadFromFile('ErrConnect.bmp'); end;
//--------------------dr-oper2------------------------
 IdIcmpClient1.Host :='192.168.33.109' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton3.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton3.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-oper3------------------------
 IdIcmpClient1.Host :='192.168.33.127' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton2.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton2.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-oper4------------------------
 IdIcmpClient1.Host :='192.168.33.126' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton34.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton34.Glyph.LoadFromFile('ErrConnect.bmp');
//----------------------------------------------------
end;
//----------------------------------------------------


//--------------------Приемка-------------------------------
if CheckBox2.Checked then begin
//--------------------dr-tov5-------------------------
 IdIcmpClient1.Host :='192.168.33.118' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton9.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton9.Glyph.LoadFromFile('ErrConnect.bmp');

 SpeedButton10.Glyph.LoadFromFile('ErrConnect.bmp');
 SpeedButton11.Glyph.LoadFromFile('ErrConnect.bmp');
//-----------------------------------------------------
end;
//-----------------------------------------------------

//--------------------dr-director----------------------
if CheckBox4.Checked then begin
 IdIcmpClient1.Host :='192.168.33.128' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton12.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton12.Glyph.LoadFromFile('ErrConnect.bmp');
end;
//-----------------------------------------------------

//--------------------It-отдел-------------------------
if CheckBox5.Checked then begin
//--------------------dr-it----------------------------
 IdIcmpClient1.Host :='192.168.33.132' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton14.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton14.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-dc----------------------------
 IdIcmpClient1.Host :='192.168.33.200' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton45.Glyph.LoadFromFile('server.bmp')
 else
   SpeedButton45.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-dc----------------------------
 IdIcmpClient1.Host :='192.168.33.81' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton46.Glyph.LoadFromFile('server.bmp')
 else
   SpeedButton46.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------SHDSL----------------------------
 IdIcmpClient1.Host :='192.168.33.254' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton47.Glyph.LoadFromFile('modem.bmp')
 else
   SpeedButton47.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Internet-------------------------
 IdIcmpClient1.Host :='192.168.254.2' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton48.Glyph.LoadFromFile('inet.bmp')
 else
   SpeedButton48.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Sprut-------------------------
 IdIcmpClient1.Host :='192.168.0.71' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton49.Glyph.LoadFromFile('Sprut.bmp')
 else
   SpeedButton49.Glyph.LoadFromFile('ErrConnect.bmp');
//------------------------------------------------------
end;
//------------------------------------------------------

//--------------------Ревизоры-------------------------
if CheckBox6.Checked then begin
//--------------------dr-analitik-----------------------
 IdIcmpClient1.Host :='192.168.33.102' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton15.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton15.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-reviz2-------------------------
 IdIcmpClient1.Host :='192.168.33.150' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton16.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton16.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-reviz3-------------------------
 IdIcmpClient1.Host :='192.168.33.108' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton17.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton17.Glyph.LoadFromFile('ErrConnect.bmp');
//------------------------------------------------------
end;
//------------------------------------------------------

//--------------------Товароведы-------------------------
if CheckBox7.Checked then begin
//--------------------dr-tov1---------------------------
 IdIcmpClient1.Host :='192.168.33.125' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton19.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton19.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-tov3---------------------------
 IdIcmpClient1.Host :='192.168.33.106' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton18.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton18.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-tov4---------------------------
 IdIcmpClient1.Host :='192.168.33.105' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then begin
   SpeedButton20.Glyph.LoadFromFile('PC.bmp');
   SpeedButton24.Glyph.LoadFromFile('Printer.bmp'); end
 else begin
   SpeedButton20.Glyph.LoadFromFile('ErrConnect.bmp');
   SpeedButton24.Glyph.LoadFromFile('ErrConnect.bmp'); end;
//------------------------------------------------------
end;
//------------------------------------------------------

//--------------------Бухгалтерия-------------------------
if CheckBox8.Checked then begin
//--------------------dr-buh1---------------------------
 IdIcmpClient1.Host :='192.168.33.130' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton21.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton21.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-buh2---------------------------
 IdIcmpClient1.Host :='192.168.33.122' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton22.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton22.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-kassir-------------------------
 IdIcmpClient1.Host :='192.168.33.123' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton23.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton23.Glyph.LoadFromFile('ErrConnect.bmp');
//------------------------------------------------------
end;
//------------------------------------------------------

//--------------------Кассы-------------------------
if CheckBox9.Checked then begin
//--------------------dr-cash1-------------------------
 IdIcmpClient1.Host :='192.168.33.119' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton35.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton35.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-cash2-------------------------
 IdIcmpClient1.Host :='192.168.33.107' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton39.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton39.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-cash3-------------------------
 IdIcmpClient1.Host :='192.168.33.110' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton36.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton36.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-cash4-------------------------
 IdIcmpClient1.Host :='192.168.33.115' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton40.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton40.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-cash5-------------------------
 IdIcmpClient1.Host :='192.168.33.114' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton37.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton37.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-cash6-------------------------
 IdIcmpClient1.Host :='192.168.33.111' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton41.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton41.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-cash7-------------------------
 IdIcmpClient1.Host :='192.168.33.116' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton38.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton38.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------dr-cash8--------------------------
 IdIcmpClient1.Host :='192.168.33.117' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton42.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton42.Glyph.LoadFromFile('ErrConnect.bmp');
//-------------------------------------------------------
end;
//-------------------------------------------------------


//--------------------dr-admin---------------------------
if CheckBox10.Checked then begin
 IdIcmpClient1.Host :='192.168.33.113' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton43.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton43.Glyph.LoadFromFile('ErrConnect.bmp');
end;
//--------------------dr-security------------------------
if CheckBox11.Checked then begin
 IdIcmpClient1.Host :='192.168.33.103' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton44.Glyph.LoadFromFile('PC.bmp')
 else
   SpeedButton44.Glyph.LoadFromFile('ErrConnect.bmp');
end;
//-------------------------------------------------------

//--------------------Вессы-------------------------
if CheckBox3.Checked then begin
//--------------------Аквариум------------------------
 IdIcmpClient1.Host :='192.168.33.55' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton13.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton13.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Кулинария------------------------
 IdIcmpClient1.Host :='192.168.33.54' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton25.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton25.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Колбаса------------------------
 IdIcmpClient1.Host :='192.168.33.56' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton26.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton26.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Сыр------------------------
 IdIcmpClient1.Host :='192.168.33.52' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton27.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton27.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Кондитерка------------------------
 IdIcmpClient1.Host :='192.168.33.51' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton28.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton28.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Фрукты------------------------
 IdIcmpClient1.Host :='192.168.33.53' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton30.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton30.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Фрукты2------------------------
 IdIcmpClient1.Host :='192.168.33.60' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton31.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton31.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Банет------------------------
 IdIcmpClient1.Host :='192.168.33.57' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton32.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton32.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Мясо------------------------
 IdIcmpClient1.Host :='192.168.33.59' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton33.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton33.Glyph.LoadFromFile('ErrConnect.bmp');
//--------------------Рыба------------------------
 IdIcmpClient1.Host :='192.168.33.58' ;
 IdIcmpClient1.Ping() ;
 if IdIcmpClient1.ReplyStatus.MsRoundTripTime < a then
   SpeedButton29.Glyph.LoadFromFile('vesi.bmp')
 else
   SpeedButton29.Glyph.LoadFromFile('ErrConnect.bmp');
//-------------------------------------------------------
end;
//-------------------------------------------------------

 Animate1.Visible := False;
 Animate1.Active:= False;
 Timer1.Enabled := False;
end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  Animate1.Visible:= True;
  Animate1.StartFrame:=1;
  Animate1.StopFrame:=Animate1.FrameCount;
  Animate1.Active:=True;
end;

end.





