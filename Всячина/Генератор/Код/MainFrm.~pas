{
Copyright © 1998 by Delphi 4 Developer's Guide - Xavier Pacheco and Steve Teixeira
}

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, Gauges;

type

  { Define a TThread descendant }
  TTestThread = class(TThread)
    procedure Execute; override;
  end;

  TMainForm = class(TForm)
    btnCreateThread: TButton;
    Label1: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    procedure btnCreateThreadClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    TestThread  : TTestThread;
    Counter     : Integer;
    GoThread    : Boolean;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TTestThread.Execute;
begin
  while MainForm.GoThread do
  begin
    MainForm.Label1.Caption := IntToStr(MainForm.Counter);
    MainForm.Memo1.Lines.Add(IntToStr(MainForm.Counter));
    Inc(MainForm.Counter);
  end;
end;



procedure TMainForm.btnCreateThreadClick(Sender: TObject);
begin
  if TestThread = nil then
  begin
    GoThread   := True;
    TestThread := TTestThread.Create(False);
  end;
end;


procedure TMainForm.Button1Click(Sender: TObject);
begin
GoThread   := False;
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
f: TextFile;
fName: String;
i: integer;
begin
if  SaveDialog1.Execute then
begin
fName:= SaveDialog1.FileName;
AssignFile(f, fName);
Rewrite(f);
for i:=0 to Memo1.Lines.Count do
writeln(f, Memo1.Lines[i]);
CloseFile(f);
MessageDlg('Данные записаны в файл ',mtInformation,[mbOk],0);
end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
Memo1.Clear;
end;

end.
