program shellProject;

uses
  Forms,
  Windows,
  shellUnit in 'C:\Documents and Settings\karpenko\Рабочий стол\Учеб delphi\Books2\Delphi_for_ professionals\Example\31_1\shellUnit.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  ShowWindow(Application.Handle, SW_HIDE);

  Application.Title := 'This is TrayIcon Example';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
