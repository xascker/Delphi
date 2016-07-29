unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, IniFiles, Gauges, Math, jpeg,
  Grids, Unit2, Unit3;

const
  CfgFile = 'LptEngine.ini';

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    Timer6: TTimer;
    Timer7: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    ProgressBar1: TProgressBar;
    GroupBox2: TGroupBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton15: TSpeedButton;
    Timer1: TTimer;
    Timer8: TTimer;
    Timer10: TTimer;
    Timer11: TTimer;
    StatusBar1: TStatusBar;
    Label14: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    TrackBar2: TTrackBar;
    TrackBar1: TTrackBar;
    Edit5: TEdit;
    SpeedButton6: TSpeedButton;
    Label7: TLabel;
    SpeedButton11: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label11: TLabel;
    Label16: TLabel;
    Edit12: TEdit;
    SpeedButton12: TSpeedButton;
    Memo1: TMemo;
    Image1: TImage;
    Timer12: TTimer;
    Edit4: TEdit;
    SpeedButton13: TSpeedButton;
    Label4: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    SpeedButton16: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton17: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SpeedButton14: TSpeedButton;
    Timer13: TTimer;
    Timer14: TTimer;
    Timer9: TTimer;
    SpeedButton18: TSpeedButton;
    GroupBox3: TGroupBox;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label17: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Label18: TLabel;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    Edit16: TEdit;
    Edit17: TEdit;
    Label20: TLabel;
    Edit18: TEdit;
    Label21: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Timer10Timer(Sender: TObject);
    procedure Timer8Timer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer9Timer(Sender: TObject);
    procedure Timer11Timer(Sender: TObject);
    procedure Timer12Timer(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure Timer13Timer(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure Timer14Timer(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
  private
    procedure LoadConfig;
    procedure SaveConfig;
    procedure LoadData(aFileName: string; aData: TStringList);
    procedure SaveData(aFileName: string; aData: TStringList);
    procedure ShowData(aGrid: TStringGrid; aData: TStringList);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Port: Word;
  Data: Byte;
  x,y,z,i : real;
  x2,y2,z2: real; // Кол-во шагов двигателя

implementation

{$R *.dfm}
{$R xpstyle.res}

//function Inp32(PortAdr: word): byte; stdcall; external 'inpout32.dll';
function Out32(PortAdr: word; Data: byte): byte; stdcall; external 'inpout32.dll';

//-------======= Загрузка и сохранение данных ===--------
procedure TForm1.LoadConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       Edit9.Text:=ReadString('Config', 'X1','200');
       Edit10.Text:=ReadString('Config', 'Y1','200');
       Edit11.Text:=ReadString('Config', 'Z1','200');
       Edit13.Text:=ReadString('Config', 'X','40');
       Edit14.Text:=ReadString('Config', 'Y','50');
       Edit15.Text:=ReadString('Config', 'Z','50');
       Edit16.Text:=ReadString('Config', 'X2','200');
       Edit17.Text:=ReadString('Config', 'Y2','200');
       Edit18.Text:=ReadString('Config', 'M','2');
     end;
   finally
 inifile.Free;
end;
end; 

procedure TForm1.SaveConfig;
var
 inifile : TIniFile;
begin
 inifile := TIniFile.Create(CfgFile);
   try
     with inifile do begin
       WriteString('Config', 'X1', Edit9.Text);
       WriteString('Config', 'Y1', Edit10.Text);
       WriteString('Config', 'Z1', Edit11.Text);
       WriteString('Config', 'X', Edit13.Text);
       WriteString('Config', 'Y', Edit14.Text);
       WriteString('Config', 'Z', Edit15.Text);
       WriteString('Config', 'X2', Edit16.Text);
       WriteString('Config', 'Y2', Edit17.Text);
       WriteString('Config', 'M', Edit18.Text);
     end;
  finally
 inifile.Free;
end;
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
  SaveConfig;
end;
//-------------------------------------------------------

procedure TForm1.FormCreate(Sender: TObject);
begin
 Port:= 888;
 Data:= 1 + 16 + 32 + 64;
 Out32(Port, Data);
 Edit5.Text := FloatToStr(TrackBar2.Position/20)+'мм/сек';
 Label10.Caption := IntToStr(TrackBar1.Position)+ ' мм';
 Label11.Caption := IntToStr(TrackBar2.Position);
 LoadConfig;
end;

//---------------============= Клавиатура =========------------
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If Key=VK_RIGHT then  begin
     x := x + (1/StrToInt(Edit13.Text));
     Edit1.Text := FloatToStr(RoundTo(x,-3));
     StatusBar1.Panels[0].Text := FloatToStr(RoundTo(x,-3));
     x2 := x2 + 4;
     StatusBar1.Panels[3].Text := FloatToStr(x2);
      Data:= 1 + 2 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 8 + 1 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
 end;
 If Key=VK_LEFT then  begin
     x := x - (1/StrToInt(Edit13.Text));
     Edit1.Text := FloatToStr(RoundTo(x,-3));
     StatusBar1.Panels[0].Text := FloatToStr(RoundTo(x,-3));
     x2 := x2 - 4;
     StatusBar1.Panels[3].Text := FloatToStr(x2);
      Data:= 8 + 1 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 1 + 2 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
 end;
  If Key=VK_UP then  begin
     y := y + (1/StrToInt(Edit14.Text));
     Edit2.Text := FloatToStr(RoundTo(y,-3));
     StatusBar1.Panels[1].Text := FloatToStr(RoundTo(y,-3));
     y2 := y2 + 4;
     StatusBar1.Panels[4].Text := FloatToStr(y2);
      Data:= 1 + 2 + 32;
      Out32(Port, Data);
       Sleep(1);
      Data:= 2 + 4 + 32;
      Out32(Port, Data);
       Sleep(1);
      Data:= 4 + 8 + 32;
      Out32(Port, Data);
       Sleep(1);
      Data:= 8+ 1 + 32;
      Out32(Port, Data);
       Sleep(1);
 end;
  If Key=VK_DOWN then  begin
     y := y - (1/StrToInt(Edit14.Text));
     Edit2.Text := FloatToStr(RoundTo(y,-3));
     StatusBar1.Panels[1].Text := FloatToStr(RoundTo(y,-3));
     y2 := y2 - 4;
     StatusBar1.Panels[4].Text := FloatToStr(y2);
      Data:= 8 + 1 + 32;
      Out32(Port, Data);
       Sleep(1);
      Data:= 4 + 8 + 32;
      Out32(Port, Data);
       Sleep(1);
      Data:= 2 + 4 + 32;
      Out32(Port, Data);
       Sleep(1);
      Data:= 1 + 2 + 32;
      Out32(Port, Data);
       Sleep(1);
 end;
 If Key=VK_END then  begin
     z := z - (1/StrToInt(Edit15.Text));
     Edit3.Text := FloatToStr(RoundTo(z,-3));
     StatusBar1.Panels[2].Text := FloatToStr(RoundTo(z,-3));
     z2 := z2 - 4;
     StatusBar1.Panels[5].Text := FloatToStr(z2);
      Data:= 1 + 2 + 64;
      Out32(Port, Data);
       Sleep(1);
      Data:= 2 + 4 + 64;
      Out32(Port, Data);
       Sleep(1);
      Data:= 4 + 8 + 64;
      Out32(Port, Data);
       Sleep(1);
      Data:= 8 + 1 + 64;
      Out32(Port, Data);
       Sleep(1);
 end;
  If Key=VK_HOME then  begin
     z := z + (1/StrToInt(Edit15.Text));
     Edit3.Text := FloatToStr(RoundTo(z,-3));
     StatusBar1.Panels[2].Text := FloatToStr(RoundTo(z,-3));
     z2 := z2 + 4;
     StatusBar1.Panels[5].Text := FloatToStr(z2);
      Data:= 8 + 1 + 64;
      Out32(Port, Data);
       Sleep(1);
      Data:= 4 + 8 + 64;
      Out32(Port, Data);
       Sleep(1);
      Data:= 2 + 4 + 64;
      Out32(Port, Data);
       Sleep(1);
      Data:= 1 + 2 + 64;
      Out32(Port, Data);
       Sleep(1);
 end;
  If Key=VK_SPACE then  begin
      Data:= 8 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 4 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 2 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 1 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 1 + 32;
      Out32(Port, Data);
       Sleep(1);
      Data:= 2 + 32;
      Out32(Port, Data);
       Sleep(1);
      Data:= 4 + 32;
      Out32(Port, Data);
       Sleep(1);
      Data:= 8 + 32;
      Out32(Port, Data);
       Sleep(1);
  end;
end;
//---------------------------------------------------------

//----------============= ОСЬ X ===========----------------
//----------====== 50 шагов за полный оборот ======--------
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 Timer3.Enabled := True;
end;


procedure TForm1.Timer3Timer(Sender: TObject);
var
 n : integer ;
begin
n := TrackBar1.Position * StrToInt(Edit13.Text);
  if i<>n then begin
    i :=i + 1;
    x := x + (1/StrToInt(Edit13.Text));
    Edit1.Text := FloatToStr(RoundTo(x,-3));
    StatusBar1.Panels[0].Text := FloatToStr(RoundTo(x,-3));
    x2 := x2 + 4;
    StatusBar1.Panels[3].Text := FloatToStr(x2);
    ProgressBar1.StepIt;
      Data:= 1 + 2 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 8 + 1 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);end ;
  if i=n then begin
    Timer3.Enabled := False;
    i:=0;
  end ;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 Timer2.Enabled := True;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
 n : integer ;
begin
n := TrackBar1.Position * StrToInt(Edit13.Text);
  if i<>n then begin
    i:= i+1;
    x := x - (1/StrToInt(Edit13.Text));
    Edit1.Text := FloatToStr(RoundTo(x,-3));
    StatusBar1.Panels[0].Text := FloatToStr(RoundTo(x,-3));
    x2 := x2 - 4;
    StatusBar1.Panels[3].Text := FloatToStr(x2);
    ProgressBar1.StepIt;
      Data:= 8 + 1 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 1 + 2 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);  end;
    if i=n then begin
      Timer2.Enabled := False;
      i := 0;
  end;
end;


//---------------------------------------------------------
//----------============= ОСЬ Y ===========----------------
procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 Timer4.Enabled := True;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
var
 n: integer ;
begin
n := TrackBar1.Position * StrToInt(Edit14.Text);
  if i<>n then begin
    i:= i+1;
    y:= y + (1/StrToInt(Edit14.Text));
    Edit2.Text := FloatToStr(RoundTo(y,-3));
    StatusBar1.Panels[1].Text := FloatToStr(RoundTo(y,-3));
    y2:= y2 + 4;
    StatusBar1.Panels[4].Text := FloatToStr(y2);
    ProgressBar1.StepIt;
      Data:= 1 + 2 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 8 + 1 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position); end;
    if i=n then begin
      Timer4.Enabled := False;
      i := 0;
  end;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
 Timer5.Enabled := True;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
var
 n: integer ;
begin
n := TrackBar1.Position * StrToInt(Edit14.Text);
  if i<>n then begin
    i:= i+1;
    y:= y - (1/StrToInt(Edit14.Text));
    Edit2.Text := FloatToStr(RoundTo(y,-3));
    StatusBar1.Panels[1].Text := FloatToStr(RoundTo(y,-3));
    y2:= y2 - 4;
    StatusBar1.Panels[4].Text := FloatToStr(y2);
    ProgressBar1.StepIt;
      Data:= 8 + 1 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 1 + 2 + 32;
      Out32(Port, Data);
      Sleep(TrackBar2.Position); end;
    if i=n then begin
      Timer5.Enabled := False;
      i := 0;
  end;
end;
//---------------------------------------------------------

//----------============= ОСЬ Z ===========----------------
procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
 Timer6.Enabled := True;
end;

procedure TForm1.Timer6Timer(Sender: TObject);
var
 n: integer ;
begin
n := TrackBar1.Position * StrToInt(Edit15.Text);
  if i<>n then begin
    i:= i+1;
    z:= z + (1/StrToInt(Edit15.Text));
    Edit3.Text := FloatToStr(RoundTo(z,-3));
    StatusBar1.Panels[2].Text := FloatToStr(RoundTo(z,-3));
    z2:= z2 + 4;
    StatusBar1.Panels[5].Text := FloatToStr(z2);
    ProgressBar1.StepIt;
      Data:= 1 + 2 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 8 + 1 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position); end;
    if i=n then begin
      Timer6.Enabled := False;
      i := 0;
  end;
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
  Timer7.Enabled := True;
end;

procedure TForm1.Timer7Timer(Sender: TObject);
var
 n: integer ;
begin
n := TrackBar1.Position * StrToInt(Edit15.Text);
  if i<>n then begin
    i:= i+1;
    z:= z - (1/StrToInt(Edit15.Text));
    Edit3.Text := FloatToStr(RoundTo(z,-3));
    StatusBar1.Panels[2].Text := FloatToStr(RoundTo(z,-3));
    z2:= z2 - 4;
    StatusBar1.Panels[5].Text := FloatToStr(z2);
    ProgressBar1.StepIt;
      Data:= 8 + 1 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 1 + 2 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position); end;
    if i=n then begin
      Timer7.Enabled := False;
      i := 0;
  end;
end;
//------------------------------------------------

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
 Timer1.Enabled := False;
 Timer2.Enabled := False;
 Timer3.Enabled := False;
 Timer4.Enabled := False;
 Timer5.Enabled := False;
 Timer6.Enabled := False;
 Timer7.Enabled := False;
 Timer8.Enabled := False;
 Timer9.Enabled := False;
 Timer10.Enabled := False;
 Timer11.Enabled := False;
 Timer12.Enabled := False;
 Timer14.Enabled := False;
end;

//----------====== Слежение за инструментом =========------
procedure TForm1.TrackBar1Change(Sender: TObject);
begin
 Label10.Caption := IntToStr(TrackBar1.Position)+ ' мм';
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
 Edit5.Text := FloatToStr(TrackBar2.Position/20)+'мм/сек';
 Label11.Caption := IntToStr(TrackBar2.Position);
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
 x := 0;
 x2 := 0;
 Edit1.Text := '0';
 StatusBar1.Panels[0].Text := FloatToStr(x);
 StatusBar1.Panels[3].Text := FloatToStr(x2);
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
 y := 0;
 y2 := 0;
 Edit2.Text := '0';
 StatusBar1.Panels[1].Text := FloatToStr(y);
 StatusBar1.Panels[4].Text := FloatToStr(y2);
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
 z := 0;
 z2 := 0;
 Edit3.Text := '0';
 StatusBar1.Panels[2].Text := FloatToStr(z);
 StatusBar1.Panels[5].Text := FloatToStr(z2);
end;
//-------------------------------------------------------
//----------========= Переход в Точку =======------------
procedure TForm1.SpeedButton15Click(Sender: TObject);
var
 x1,y1,z1 : real ;
begin
x1 := StrToFloat(Edit6.Text);
y1 := StrToFloat(Edit7.Text);
z1 := StrToFloat(Edit8.Text);
 if x<x1 then
     Timer10.Enabled := True;
 if x>x1 then
     Timer8.Enabled := True;
 if y<y1 then
     Timer1.Enabled := True;
 if y>y1 then
     Timer9.Enabled := True;
 if z<z1 then
     Timer11.Enabled := True;
 if z>z1 then
     Timer12.Enabled := True;
end;

procedure TForm1.Timer10Timer(Sender: TObject);
var
 x1 : real;
 mf: TMetaFile;   //рисование
 mfc: TMetaFileCanvas;   //рисование
begin
x1 := StrToFloat(Edit6.Text)*(StrToInt(Edit13.Text)*4);

  mf := TMetaFile.Create;
  mfc := TMetafileCanvas.Create(mf, 0);
  with mfc do
  begin
    Pen.Color := clBlack;
    Pen.Width := 2;

  if x2<>x1 then begin
    x := x + (1/StrToInt(Edit13.Text));
    StatusBar1.Panels[0].Text := FloatToStr(RoundTo(x,-3));
    x2 := x2 + 4;
    StatusBar1.Panels[3].Text := FloatToStr(x2);
    Edit1.Text := FloatToStr(RoundTo(x,-3));

      MoveTo(StrToInt(Edit16.Text)+Trunc(StrToFloat(Edit1.Text))+Trunc(StrToFloat(Edit1.Text)),StrToInt(Edit16.Text)+Trunc(StrToFloat(Edit2.Text)+StrToFloat(Edit2.Text)));  //рисование, точка 0
      LineTo(StrToInt(Edit16.Text)+Trunc(StrToFloat(Edit1.Text)*StrToInt(Edit18.Text)),StrToInt(Edit16.Text)+Trunc(StrToFloat(Edit2.Text)*StrToInt(Edit18.Text)));  //рисование, рисовать линию

    ProgressBar1.StepIt;
      Data:= 1 + 2 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 8 + 1 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position); end;
  if x2=x1 then begin
      Timer10.Enabled := False;
  end;
end;
  mfc.Free;
  Form3.Canvas.Draw(0, 0, mf);
  mf.Free;
end;

procedure TForm1.Timer8Timer(Sender: TObject);
var
 x1 : real;
 mf: TMetaFile;   //рисование
 mfc: TMetaFileCanvas;   //рисование
begin
x1 := StrToFloat(Edit6.Text)*(StrToInt(Edit13.Text)*4);

  mf := TMetaFile.Create;
  mfc := TMetafileCanvas.Create(mf, 0);
  with mfc do
  begin
    Pen.Color := clBlack;
    Pen.Width := 2;

  if x2<>x1 then begin
    x := x - (1/StrToInt(Edit13.Text));
    Edit1.Text := FloatToStr(RoundTo(x,-3));
    StatusBar1.Panels[0].Text := FloatToStr(RoundTo(x,-3));
    x2 := x2 - 4;
    StatusBar1.Panels[3].Text := FloatToStr(x2);

     MoveTo(StrToInt(Edit16.Text)+Trunc(StrToFloat(Edit1.Text))+Trunc(StrToFloat(Edit1.Text)),StrToInt(Edit16.Text)+Trunc(StrToFloat(Edit2.Text)+StrToFloat(Edit2.Text)));   //рисование, точка 0
     LineTo(StrToInt(Edit16.Text)+Trunc(StrToFloat(Edit1.Text)*StrToInt(Edit18.Text)),StrToInt(Edit16.Text)+Trunc(StrToFloat(Edit2.Text)*StrToInt(Edit18.Text)));        //рисование, рисовать линию

    ProgressBar1.StepIt;
      Data:= 8 + 1 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 1 + 2 + 16;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);  end;
    if x2=x1 then begin
      Timer8.Enabled := False;
  end;
end;
  mfc.Free;
  Form3.Canvas.Draw(0, 0, mf);
  mf.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
 y1 : real;
 mf: TMetaFile;   //рисование
 mfc: TMetaFileCanvas;   //рисование
begin
y1 := StrToFloat(Edit7.Text)*(StrToInt(Edit14.Text)*4);

  mf := TMetaFile.Create;
  mfc := TMetafileCanvas.Create(mf, 0);
  with mfc do
  begin
    Pen.Color := clBlack;
    Pen.Width := 2;

  if y2<>y1 then begin
    y:= y + (1/StrToInt(Edit14.Text));
    Edit2.Text := FloatToStr(RoundTo(y,-3));
    StatusBar1.Panels[1].Text := FloatToStr(RoundTo(y,-3));
    y2 := y2 + 4;
    StatusBar1.Panels[4].Text := FloatToStr(y2);

     MoveTo(StrToInt(Edit17.Text)+Trunc(StrToFloat(Edit1.Text)+StrToFloat(Edit1.Text)),StrToInt(Edit17.Text)+Trunc(StrToFloat(Edit2.Text))+Trunc(StrToFloat(Edit2.Text)));   //рисование, точка 0
     LineTo(StrToInt(Edit17.Text)+Trunc(StrToFloat(Edit1.Text)*StrToInt(Edit18.Text)),StrToInt(Edit17.Text)+Trunc(StrToFloat(Edit2.Text)*StrToInt(Edit18.Text)));       //рисование, рисовать линию

    ProgressBar1.StepIt;
      Data:= 1 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 8 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position); end;
    if y2=y1 then begin
      Timer1.Enabled := False;
  end;
end;
  mfc.Free;
  Form3.Canvas.Draw(0, 0, mf);
  mf.Free;
end;

procedure TForm1.Timer9Timer(Sender: TObject);
var
 y1 : real;
 mf: TMetaFile;   //рисование
 mfc: TMetaFileCanvas;   //рисование
begin
y1 := StrToFloat(Edit7.Text)*(StrToInt(Edit14.Text)*4);

  mf := TMetaFile.Create;
  mfc := TMetafileCanvas.Create(mf, 0);
  with mfc do
  begin
    Pen.Color := clBlack;
    Pen.Width := 2;
    
  if y2<>y1 then begin
    y:= y - (1/StrToInt(Edit14.Text));
    Edit2.Text := FloatToStr(RoundTo(y,-3));
    StatusBar1.Panels[1].Text := FloatToStr(RoundTo(y,-3));
    y2 := y2 - 4;
    StatusBar1.Panels[4].Text := FloatToStr(y2);

     MoveTo(StrToInt(Edit17.Text)+Trunc(StrToFloat(Edit1.Text)+StrToFloat(Edit1.Text)),StrToInt(Edit17.Text)+Trunc(StrToFloat(Edit2.Text))+Trunc(StrToFloat(Edit2.Text)));     //рисование, точка 0
     LineTo(StrToInt(Edit17.Text)+Trunc(StrToFloat(Edit1.Text)*StrToInt(Edit18.Text)),StrToInt(Edit17.Text)+Trunc(StrToFloat(Edit2.Text)*StrToInt(Edit18.Text)));         //рисование, рисовать линию

    ProgressBar1.StepIt;
      Data:= 8 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 1 + 32;
      Out32(Port, Data);
       Sleep(TrackBar2.Position); end;
    if y2=y1 then begin
      Timer9.Enabled := False;
  end;
end;
  mfc.Free;
  Form3.Canvas.Draw(0, 0, mf);
  mf.Free;
end;

procedure TForm1.Timer11Timer(Sender: TObject);
var
 z1 : real;
begin
z1 := StrToFloat(Edit8.Text)*(StrToInt(Edit15.Text)*4);
  if z2<>z1 then begin
    z:= z + (1/StrToInt(Edit15.Text));
    Edit3.Text := FloatToStr(RoundTo(z,-3));
    StatusBar1.Panels[2].Text := FloatToStr(RoundTo(z,-3));
    z2 := z2 + 4;
    StatusBar1.Panels[5].Text := FloatToStr(z2);
    ProgressBar1.StepIt;
      Data:= 1 + 2 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 8 + 1 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position); end;
    if z2=z1 then begin
      Timer11.Enabled := False;
  end;
end;

procedure TForm1.Timer12Timer(Sender: TObject);
var
 z1 : real;
begin
z1 := StrToFloat(Edit8.Text)*(StrToInt(Edit15.Text)*4);
  if z2<>z1 then begin
    z:= z - (1/StrToInt(Edit15.Text));
    Edit3.Text := FloatToStr(RoundTo(z,-3));
    StatusBar1.Panels[2].Text := FloatToStr(RoundTo(z,-3));
    z2 := z2 - 4;
    StatusBar1.Panels[5].Text := FloatToStr(z2);
    ProgressBar1.StepIt;
      Data:= 8 + 1 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 4 + 8 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 2 + 4 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position);
      Data:= 1 + 2 + 64;
      Out32(Port, Data);
       Sleep(TrackBar2.Position); end;
    if z2=z1 then begin
      Timer12.Enabled := False;
  end;
end;
//-------------------------------------------------------
procedure TForm1.Timer13Timer(Sender: TObject);
begin
StatusBar1.Panels[6].Text:=TimeToStr(Time);
end;
//-------------------------------------------------------

//------------======= Программирование =====-------------
procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
      Data:= 1 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 1 + 2 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 2 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 2 + 4 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 4 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 4 + 8 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 8 + 16;
      Out32(Port, Data);
       Sleep(1);
      Data:= 8 + 1 + 16;
      Out32(Port, Data);
       Sleep(1);
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
begin
Form2.Show;
end;

//---------------------======== Работа с файлом ==========-----------
function NextItem(var aP: PChar): string;
var
  fStart: PChar;
begin
  // Следующее поле строчки
  if aP <> nil then
  begin
    fStart := aP;
    while not (aP^ in [#0, CHR(VK_TAB)]) do
      Inc(aP);
    SetString(Result, fStart, aP - fStart);
    if aP^ = CHR(VK_TAB) then
      Inc(aP)
  end
  else
    Result := ''
end;

function CS(List: TStringList; Index1, Index2: Integer): Integer;
var
  fP1, fP2: PChar;
  fStrItem1, fStrItem2: string;
  fDigit1, fDigit2: Extended;
  isDigit1, isDigit2: Boolean;
begin
  // Сравнивает две строчки
  Result := 0;
  fP1 := Pointer(List[Index1]);
  fP2 := Pointer(List[Index2]);
  if Assigned(fP1) and Assigned(fP2) then
    while (fP1^ <> #0) and (fP2^ <> #0) do
    begin
      fStrItem1 := Trim(NextItem(fP1));
      fStrItem2 := Trim(NextItem(fP2));
      if fStrItem1 <> fStrItem2 then
      begin
        if fStrItem1 = '' then // Пустышки в конец
          Result := 1
        else if fStrItem2 = '' then
          Result := -1
        else
        begin
          isDigit1 := TryStrToFloat(fStrItem1, fDigit1);
          isDigit2 := TryStrToFloat(fStrItem2, fDigit2);
          if isDigit1 and isDigit2 then
            Result := CompareValue(fDigit1, fDigit2) // Два числа
          else if isDigit1 then
            Result := -1 // Число только в первой строке
          else if isDigit2 then
            Result := 1 // Число только во второй строке
          else // Это не числа
            Result := AnsiCompareStr(fStrItem1, fStrItem2);
          // ...в лексикографическом...
        end;
        Exit
      end;
    end
  else if Assigned(fP1) then // Строки - пустышки
    Result := -1
  else if Assigned(fP2) then
    Result := 1
end;

procedure TForm1.LoadData(aFileName: string; aData: TStringList);
begin
  aData.LoadFromFile(aFileName);
  aData.CustomSort(CS);
end;

procedure TForm1.SaveData(aFileName: string; aData: TStringList);
begin
  aData.SaveToFile(aFileName);
end;

procedure TForm1.ShowData(aGrid: TStringGrid; aData: TStringList);
var
  i, j: Integer;
  fP: PChar;
  fTmpStr: string;
begin
  aGrid.ColCount := 0;
  aGrid.RowCount := Succ(aData.Count);
  for i := 0 to Pred(aData.Count) do
  begin
    fP := Pointer(aData[i]);
    j := 0;
    if Assigned(fP) then
      while (fP^ <> #0) do
      begin
        fTmpStr := NextItem(fP);
        if j > aGrid.ColCount - 1 then
          aGrid.ColCount := aGrid.ColCount + 1;
        aGrid.Cells[j, Succ(i)] := fTmpStr;
        Inc(j);
      end
  end;
  for j := 0 to Pred(aGrid.ColCount) do
    Form2.StringGrid1.Cells[0,0]:=' Номер';
    Form2.StringGrid1.Cells[1,0]:=' Команда';
    Form2.StringGrid1.Cells[2,0]:=' X';
    Form2.StringGrid1.Cells[3,0]:=' Y';
    Form2.StringGrid1.Cells[4,0]:=' Z';
end;

//---------------=========== Открыть =========-------------
procedure TForm1.SpeedButton13Click(Sender: TObject);
var
  fData: TStringList;
begin
  if not OpenDialog1.Execute then
    Exit;
  Edit4.Text := OpenDialog1.FileName;
  fData := TStringList.Create;
  try
    LoadData(OpenDialog1.FileName, fData);
    ShowData(Form2.StringGrid1, fData);
    Form2.Show;
  finally
    fData.Free
  end;
end;
//----------------------------------------------------------
//----------------------------------------------------------

//------------============ Старт =============--------------
procedure TForm1.SpeedButton16Click(Sender: TObject);
begin
 if (Timer9.Enabled=False) and (Timer8.Enabled=False) and (Timer1.Enabled=False)
 and (Timer11.Enabled=False) and (Timer12.Enabled=False) and (Timer10.Enabled=False) then
   Timer14.Enabled := True;
end;

procedure TForm1.Timer14Timer(Sender: TObject);
var
 x1,y1,z1,j : real;
 n,s: integer;
begin
 n := StrToInt(Form2.StringGrid1.Cells[0,Form2.StringGrid1.RowCount-1]);
if i<>n then begin
  if (Timer9.Enabled=False) and (Timer8.Enabled=False) and (Timer1.Enabled=False)
  and (Timer11.Enabled=False) and (Timer12.Enabled=False) and (Timer10.Enabled=False) then
   begin
    i:=i+1;
    s:=Round(i);
    Form2.StringGrid1.Cells[5,s] := 'Work...';
      if s>1 then Form2.StringGrid1.Cells[5,s-1] := 'OK';
    Edit6.Text := Form2.StringGrid1.Cells[2,s];
    Edit7.Text := Form2.StringGrid1.Cells[3,s];
    Edit8.Text := Form2.StringGrid1.Cells[4,s];
    x1 := StrToFloat(Form2.StringGrid1.Cells[2,s]);
    y1 := StrToFloat(Form2.StringGrid1.Cells[3,s]);
    z1 := StrToFloat(Form2.StringGrid1.Cells[4,s]);
 if x<x1 then
     Timer10.Enabled := True;
 if x>x1 then
     Timer8.Enabled := True;
 if y<y1 then
     Timer1.Enabled := True;
 if y>y1 then
     Timer9.Enabled := True;
 if z<z1 then
     Timer11.Enabled := True;
 if z>z1 then
     Timer12.Enabled := True;  
    end;
  end;
 if i=n then begin
   Timer14.Enabled := False;
   i:=0;
 end;
end;
//-------------------------------------------------------
//-------=========== Виртуальный стол =========----------
procedure TForm1.SpeedButton18Click(Sender: TObject);
begin
Form3.Show;
end;

end.
