program server;

uses
  Forms,
  Windows,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

var
 WhEvent:THandle;
begin
  Application.Initialize;
  ShowWindow(Application.Handle,SW_Hide);
  Form1:=TForm1.Create(nil);
  Application.Run;

  WhEvent:=CreateEvent(nil, true,false, 'et');
  while (true) do
   begin
    WaitForSingleObject(WhEvent,1000);
    Application.ProcessMessages;
   end;
end.
