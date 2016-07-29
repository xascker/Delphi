unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function GetComputerNetName: string;
var 
 buffer: array[0..255] of char; 
 size: dword; 
begin 
 size := 256; 
 if GetComputerName(buffer, size) then
   Result := buffer 
 else 
   Result := ''
end; 


procedure TForm1.Button1Click(Sender: TObject);
begin
ShowMessage (GetComputerNetName);
end;

end.
