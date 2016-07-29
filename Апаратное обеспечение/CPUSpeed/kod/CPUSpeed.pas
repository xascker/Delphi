unit CPUSpeed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Stop: boolean;
implementation

{$R *.dfm}


function GetCPUSpeed: Double;
const
 DelayTime =500;
var
 TimerHi, TimerLo: DWORD;
 PriorityClass, Priority: Integer;
begin
 PriorityClass := GetPriorityClass(GetCurrentProcess);
 Priority := GetThreadPriority(GetCurrentThread);
 SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
 SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);
 Sleep(10);
 asm
 dw 310Fh
 mov TimerLo, eax
end;
 sleep(DelayTime);
 asm
 dw 310Fh
 sub eax, TimerLo
 Sbb edx, TimerHi
 mov TimerLo, eax
 mov TimerHi, edx
end;
 SetThreadPriority(GetCurrentThread,Priority);
 SetPriorityClass(GetCurrentProcess,PriorityClass);
 Result:= TimerLo/(1000.0*DelayTime);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Button1.Enabled := False;
 Button2.Enabled := True;
 Stop := False;
 while not Stop do
 begin
 label1.Caption := 'Скорость процессора:  '+FloatToStr(GetCPUSpeed)+' MHz';
 application.ProcessMessages;
 end;
 Button1.Enabled := True;
 Button2.Enabled := False;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Stop:= True;
end;

end.
