unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  
  var
Dummy     : integer=0;
OldKbHook : HHook=0;

implementation

{$R *.dfm}

function KbHook( code: Integer; wparam: Word; lparam: LongInt ): LongInt; stdcall;
begin

if code<0 then Result:=CallNextHookEx( oldKbHook, code, wparam, lparam )
else Result:=1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if OldKbHook <> 0 then
 begin
UnHookWindowshookEx( OldKbHook );
OldKbHook := 0;
end;
SystemParametersInfo( SPI_SETFASTTASKSWITCH, 0, 0, 0);
SystemParametersInfo( SPI_SCREENSAVERRUNNING, 0, 0, 0);
showmessage ('Клавиатура включена');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
SystemParametersInfo( SPI_SETFASTTASKSWITCH, 1, @Dummy, 0);
SystemParametersInfo( SPI_SCREENSAVERRUNNING, 1, @Dummy, 0);
OldKbHook := SetWindowsHookEx( WH_KEYBOARD, @KbHook, HInstance, 0 );
showmessage ('Клавиатура отключена');
end;


end.
 