unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Gauges;

type
  TForm1 = class(TForm)
    Bevel1: TBevel;
    Button1: TButton;
    Animate1: TAnimate;
    Label1: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    ProgressBar1: TProgressBar;
    Timer3: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  MessageDlg('Удалить все данные с вашего компьютера?',
  mtWarning, [mbOk,mbYes] ,0) ;
  MessageDlg('Вы уверены?',
  mtConfirmation , [mbOk] , 0);
  Animate1.Visible:= True;
  ProgressBar1.Visible := True;
  Animate1.StartFrame:=1;
  Animate1.StopFrame:=Animate1.FrameCount;
  Animate1.Active:=True;
  Label1.Caption:= 'Идет удаление диска С:\' ;
  Timer2.Enabled := True;
  Timer3.Interval:= 60000;
  Timer3.Enabled := True;
  Timer1.Interval:= 30000;
  Timer1.Enabled := True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 Label1.Caption:= 'Идет удаление диска E:\';
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Timer2.Interval:= 3000;
  ProgressBar1.StepIt ;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
ProgressBar1.Visible := False;
Animate1.Visible := False;
Timer1.Enabled := False;
Timer2.Enabled := False;
Timer3.Enabled := False;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
 Timer1.Enabled := False;
 Timer2.Enabled := False;
 Animate1.Active:= False;
 Label1.Caption:= '';
 MessageDlg('Все данные с вашего компьютера удалены',
 mtInformation, [mbOk],0) ;
end;


end.
