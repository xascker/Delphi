unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

function Inp32(PortAdr: word): byte; stdcall; external 'inpout32.dll';
function Out32(PortAdr: word; Data: byte): byte; stdcall; external 'inpout32.dll';

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    GroupBox2: TGroupBox;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    GroupBox3: TGroupBox;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    Timer6: TTimer;
    Timer7: TTimer;
    Timer8: TTimer;
    Timer9: TTimer;
    Edit1: TEdit;
    Label1: TLabel;
    Timer10: TTimer;
    Timer11: TTimer;
    Timer12: TTimer;
    Timer13: TTimer;
    Timer14: TTimer;
    Timer15: TTimer;
    Timer16: TTimer;
    Timer17: TTimer;
    Timer18: TTimer;
    Timer19: TTimer;
    Timer20: TTimer;
    TrackBar1: TTrackBar;
    Timer21: TTimer;
    Timer22: TTimer;
    Timer23: TTimer;
    Timer24: TTimer;
    Timer25: TTimer;
    Timer26: TTimer;
    Timer27: TTimer;
    Timer28: TTimer;
    Timer29: TTimer;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure Timer8Timer(Sender: TObject);
    procedure Timer9Timer(Sender: TObject);
    procedure Timer10Timer(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Timer11Timer(Sender: TObject);
    procedure Timer12Timer(Sender: TObject);
    procedure Timer13Timer(Sender: TObject);
    procedure Timer14Timer(Sender: TObject);
    procedure Timer15Timer(Sender: TObject);
    procedure Timer16Timer(Sender: TObject);
    procedure Timer17Timer(Sender: TObject);
    procedure Timer18Timer(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Timer19Timer(Sender: TObject);
    procedure Timer20Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure Timer21Timer(Sender: TObject);
    procedure Timer22Timer(Sender: TObject);
    procedure Timer23Timer(Sender: TObject);
    procedure Timer24Timer(Sender: TObject);
    procedure Timer25Timer(Sender: TObject);
    procedure Timer26Timer(Sender: TObject);
    procedure Timer27Timer(Sender: TObject);
    procedure Timer28Timer(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Timer29Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Port: Word;
  Data: Byte;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Edit1.Text := IntToStr(TrackBar1.Position);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Edit1.Text := IntToStr(TrackBar1.Position);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 if SpeedButton1.Down = True then  begin
      Port:= 888;
      Data:= 1;
      Out32(Port, Data);           end
  else
 if SpeedButton1.Down = False then begin
      Port:= 888;
      Data:= 0;
      Out32(Port, Data);           end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 if SpeedButton2.Down = True then  begin
      Port:= 888;
      Data:= 2;
      Out32(Port, Data);           end
  else
 if SpeedButton2.Down = False then begin
      Port:= 888;
      Data:= 0;
      Out32(Port, Data);           end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 if SpeedButton3.Down = True then  begin
      Port:= 888;
      Data:= 4;
      Out32(Port, Data);           end
  else
 if SpeedButton3.Down = False then begin
      Port:= 888;
      Data:= 0;
      Out32(Port, Data);           end;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
 if SpeedButton4.Down = True then  begin
      Port:= 888;
      Data:= 8;
      Out32(Port, Data);           end
  else
 if SpeedButton4.Down = False then begin
      Port:= 888;
      Data:= 0;
      Out32(Port, Data);           end;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
 if SpeedButton5.Down = True then  begin
      Port:= 888;
      Data:= 16;
      Out32(Port, Data);           end
  else
 if SpeedButton5.Down = False then begin
      Port:= 888;
      Data:= 0;
      Out32(Port, Data);           end;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
 if SpeedButton6.Down = True then  begin
      Port:= 888;
      Data:= 32;
      Out32(Port, Data);           end
  else
 if SpeedButton6.Down = False then begin
      Port:= 888;
      Data:= 0;
      Out32(Port, Data);           end;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
 if SpeedButton7.Down = True then  begin
      Port:= 888;
      Data:= 64;
      Out32(Port, Data);           end
  else
 if SpeedButton7.Down = False then begin
      Port:= 888;
      Data:= 0;
      Out32(Port, Data);           end;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
 if SpeedButton8.Down = True then  begin
      Port:= 888;
      Data:= 128;
      Out32(Port, Data);           end
  else
 if SpeedButton8.Down = False then begin
      Port:= 888;
      Data:= 0;
      Out32(Port, Data);           end;
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
begin
 Port:= 888;
 Data:= 255;
 Out32(Port, Data);
end;

procedure TForm1.SpeedButton16Click(Sender: TObject);
begin
 Port:= 888;
 Data:= 0;
 Out32(Port, Data);
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
    Timer13.Enabled := False;
    Timer14.Enabled := False;
    Timer15.Enabled := False;
    Timer16.Enabled := False;
    Timer17.Enabled := False;
    Timer18.Enabled := False;
    Timer19.Enabled := False;
    Timer20.Enabled := False;
    Timer21.Enabled := False;
    Timer22.Enabled := False;
    Timer23.Enabled := False;
    Timer24.Enabled := False;
    Timer25.Enabled := False;
    Timer26.Enabled := False;
    Timer27.Enabled := False;
    Timer28.Enabled := False;
    Timer29.Enabled := False;
end;

//--------------- Программа 1 ---------------------
procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
 if SpeedButton9.Down = True then
    Timer1.Enabled := True
  else
 if SpeedButton9.Down = False then begin
   Timer1.Enabled := False;
   Timer2.Enabled := False;  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 Timer1.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 255;
 Out32(Port, Data);
 Timer1.Enabled := False;
 Timer2.Enabled := True;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
 Timer1.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 0;
 Out32(Port, Data);
 Timer2.Enabled := False;
 Timer1.Enabled := True;
end;
//-------------- Конец программы 1 --------------------

//--------------- Программа 2 -------------------------
procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
 if SpeedButton11.Down = True then
    Timer3.Enabled := True
  else
 if SpeedButton11.Down = False then begin
   Timer3.Enabled := False;
   Timer4.Enabled := False;
   Timer5.Enabled := False;
   Timer6.Enabled := False;
   Timer7.Enabled := False;
   Timer8.Enabled := False;
   Timer9.Enabled := False;
   Timer10.Enabled := False;
  end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
 Timer3.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 1;
 Out32(Port, Data);
 Timer3.Enabled := False;
 Timer4.Enabled := True;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
 Timer4.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 2;
 Out32(Port, Data);
 Timer4.Enabled := False;
 Timer5.Enabled := True;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
 Timer5.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 4;
 Out32(Port, Data);
 Timer5.Enabled := False;
 Timer6.Enabled := True;
end;

procedure TForm1.Timer6Timer(Sender: TObject);
begin
 Timer6.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 8;
 Out32(Port, Data);
 Timer6.Enabled := False;
 Timer7.Enabled := True;
end;

procedure TForm1.Timer7Timer(Sender: TObject);
begin
 Timer7.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 16;
 Out32(Port, Data);
 Timer7.Enabled := False;
 Timer8.Enabled := True;
end;

procedure TForm1.Timer8Timer(Sender: TObject);
begin
 Timer8.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 32;
 Out32(Port, Data);
 Timer8.Enabled := False;
 Timer9.Enabled := True;
end;

procedure TForm1.Timer9Timer(Sender: TObject);
begin
 Timer9.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 64;
 Out32(Port, Data);
 Timer9.Enabled := False;
 Timer10.Enabled := True;
end;

procedure TForm1.Timer10Timer(Sender: TObject);
begin
 Timer10.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 128;
 Out32(Port, Data);
 Timer10.Enabled := False;
 Timer3.Enabled := True;
end;
//-------------- Конец программы 2 --------------------

//--------------- Программа 3 -------------------------
procedure TForm1.SpeedButton13Click(Sender: TObject);
begin
 if SpeedButton13.Down = True then
    Timer11.Enabled := True
  else
 if SpeedButton13.Down = False then begin
   Timer11.Enabled := False;
   Timer12.Enabled := False;
   Timer13.Enabled := False;
   Timer14.Enabled := False;
   Timer15.Enabled := False;
   Timer16.Enabled := False;
   Timer17.Enabled := False;
   Timer18.Enabled := False;
  end;
end;

procedure TForm1.Timer11Timer(Sender: TObject);
begin
 Timer11.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 128;
 Out32(Port, Data);
 Timer11.Enabled := False;
 Timer12.Enabled := True;
end;

procedure TForm1.Timer12Timer(Sender: TObject);
begin
 Timer12.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 64;
 Out32(Port, Data);
 Timer12.Enabled := False;
 Timer13.Enabled := True;
end;

procedure TForm1.Timer13Timer(Sender: TObject);
begin
 Timer13.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 32;
 Out32(Port, Data);
 Timer13.Enabled := False;
 Timer14.Enabled := True;
end;

procedure TForm1.Timer14Timer(Sender: TObject);
begin
 Timer14.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 16;
 Out32(Port, Data);
 Timer14.Enabled := False;
 Timer15.Enabled := True;
end;

procedure TForm1.Timer15Timer(Sender: TObject);
begin
 Timer15.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 8;
 Out32(Port, Data);
 Timer15.Enabled := False;
 Timer16.Enabled := True;
end;

procedure TForm1.Timer16Timer(Sender: TObject);
begin
 Timer16.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 4;
 Out32(Port, Data);
 Timer16.Enabled := False;
 Timer17.Enabled := True;
end;

procedure TForm1.Timer17Timer(Sender: TObject);
begin
 Timer17.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 2;
 Out32(Port, Data);
 Timer17.Enabled := False;
 Timer18.Enabled := True;
end;

procedure TForm1.Timer18Timer(Sender: TObject);
begin
 Timer18.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 1;
 Out32(Port, Data);
 Timer18.Enabled := False;
 Timer11.Enabled := True;
end;
//-------------- Конец программы 3 --------------------

//--------------- Программа 4 -------------------------
procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
 if SpeedButton10.Down = True then
    Timer19.Enabled := True
   else
 if SpeedButton10.Down = False then begin
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
    Timer13.Enabled := False;
    Timer14.Enabled := False;
    Timer15.Enabled := False;
    Timer16.Enabled := False;
    Timer17.Enabled := False;
    Timer18.Enabled := False;
  end;
end;

procedure TForm1.Timer19Timer(Sender: TObject);
begin
 Port:= 888;
 Data:= 4;
 Out32(Port, Data);
 Timer19.Enabled := False;
 Timer3.Enabled := True;
 Timer20.Enabled := True;
end;

procedure TForm1.Timer20Timer(Sender: TObject);
begin
 Port:= 888;
 Data:= 4;
 Out32(Port, Data);
 Timer20.Enabled := False;
 Timer11.Enabled := True;
end;
//-------------- Конец программы 4 --------------------

//--------------- Программа 5 -------------------------
procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
 if SpeedButton12.Down = True then
    Timer21.Enabled := True
   else
 if SpeedButton12.Down = False then begin
    Timer21.Enabled := False;
    Timer22.Enabled := False;
    Timer23.Enabled := False;
    Timer24.Enabled := False;
    Timer25.Enabled := False;
    Timer26.Enabled := False;
    Timer27.Enabled := False;
    Timer28.Enabled := False;
  end;
end;

procedure TForm1.Timer21Timer(Sender: TObject);
begin
 Timer21.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 2;
 Out32(Port, Data);
 Timer21.Enabled := False;
 Timer22.Enabled := True;
end;

procedure TForm1.Timer22Timer(Sender: TObject);
begin
 Timer22.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 8;
 Out32(Port, Data);
 Timer22.Enabled := False;
 Timer23.Enabled := True;
end;

procedure TForm1.Timer23Timer(Sender: TObject);
begin
 Timer23.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 32;
 Out32(Port, Data);
 Timer23.Enabled := False;
 Timer24.Enabled := True;
end;

procedure TForm1.Timer24Timer(Sender: TObject);
begin
 Timer24.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 128;
 Out32(Port, Data);
 Timer24.Enabled := False;
 Timer25.Enabled := True;
end;

procedure TForm1.Timer25Timer(Sender: TObject);
begin
 Timer25.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 64;
 Out32(Port, Data);
 Timer25.Enabled := False;
 Timer26.Enabled := True;
end;

procedure TForm1.Timer26Timer(Sender: TObject);
begin
 Timer26.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 16;
 Out32(Port, Data);
 Timer26.Enabled := False;
 Timer27.Enabled := True;
end;

procedure TForm1.Timer27Timer(Sender: TObject);
begin
 Timer27.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 4;
 Out32(Port, Data);
 Timer27.Enabled := False;
 Timer28.Enabled := True;
end;

procedure TForm1.Timer28Timer(Sender: TObject);
begin
 Timer28.Interval := StrToInt(Edit1.Text);
 Port:= 888;
 Data:= 1;
 Out32(Port, Data);
 Timer28.Enabled := False;
 Timer21.Enabled := True;
end;
//-------------- Конец программы 5 --------------------

//--------------- Программа 6 -------------------------
procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
 if SpeedButton14.Down = True then
    Timer29.Enabled := True
   else
 if SpeedButton14.Down = False then begin
    Timer29.Enabled := False;
  end;
end;

procedure TForm1.Timer29Timer(Sender: TObject);
var
 a: array  [1..9] of Byte;
 i: Integer;
begin
   a[1]:=1;
   a[2]:=2;
   a[3]:=4;
   a[4]:=8;
   a[5]:=16;
   a[6]:=32;
   a[7]:=64;
   a[8]:=128;
   a[9]:=255;
 Timer29.Interval := StrToInt(Edit1.Text);
 Port:= 888;
  for i:= 1 to 9  do  begin
     Data := random(a[i]); end;
 Out32(Port, Data);
end;
//-------------- Конец программы 6 --------------------
end.
