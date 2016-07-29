{
Copyright © 1998 by Delphi 4 Developer's Guide - Xavier Pacheco and Steve Teixeira
}

program Password;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
