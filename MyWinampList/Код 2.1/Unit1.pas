unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs, Grids, ValEdit, StdCtrls, Menus, Buttons,  ComCtrls,
  ShellCtrls, ExtCtrls, FileCtrl, SkinCtrls, spSkinShellCtrls, Mask,
  SkinBoxCtrls, spfilectrl, SkinData, DynamicSkinForm, SkinMenus;

type
  TForm1 = class(TForm)
    ValueListEditor1: TValueListEditor;
    spSkinOpenDialog1: TspSkinOpenDialog;
    spSkinOpenDialog2: TspSkinOpenDialog;
    spSkinSaveDialog1: TspSkinSaveDialog;
    spSkinSpeedButton1: TspSkinSpeedButton;
    spSkinSpeedButton2: TspSkinSpeedButton;
    spSkinSpeedButton3: TspSkinSpeedButton;
    spSkinSpeedButton4: TspSkinSpeedButton;
    spSkinSpeedButton5: TspSkinSpeedButton;
    spSkinLabel1: TspSkinLabel;
    spSkinLabel2: TspSkinLabel;
    spSkinEdit1: TspSkinEdit;
    FilesListBox: TListBox;
    spSkinMainMenu: TspSkinMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Classic1: TMenuItem;
    spSkinSpeedButton6: TspSkinSpeedButton;
    spSkinOpenDialog3: TspSkinOpenDialog;
    spSkinSpeedButton7: TspSkinSpeedButton;
    spDynamicSkinForm: TspDynamicSkinForm;
    spSkinData: TspSkinData;
    N11: TMenuItem;
    spSkinPopupMenu1: TspSkinPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FilesListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure spSkinSpeedButton1Click(Sender: TObject);
    procedure spSkinSpeedButton2Click(Sender: TObject);
    procedure spSkinSpeedButton3Click(Sender: TObject);
    procedure spSkinSpeedButton4Click(Sender: TObject);
    procedure spSkinSpeedButton5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure spSkinSpeedButton7Click(Sender: TObject);
    procedure spSkinSpeedButton6Click(Sender: TObject);
    procedure Classic1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FullList:TStringList;

    procedure FillFileList;
    procedure GenerateFileList;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 SpSkinData.LoadFromCompressedFile('1.skn');
 SpSkinSpeedButton3.Enabled := False;
 SpSkinSpeedButton4.Enabled := False;
 SpSkinSpeedButton5.Enabled := False;
 N3.Enabled := False;
 N4.Enabled := False;
 FullList:=TStringList.Create;
end;

procedure TForm1.FillFileList;
begin
  with FilesListBox do
    begin
      FilesListBox.Items:=FullList;
    end;
end;

procedure TForm1.spSkinSpeedButton1Click(Sender: TObject);
var
i:integer;
begin
  if spSkinOpenDialog1.Execute then
    begin
      spSkinEdit1.Text:=spSkinOpenDialog1.FileName;
      with FullList do
        begin
          LoadFromFile(spSkinEdit1.Text);
          i:=0;
          while i<=Count-1 do
            begin
              if (Trim(Strings[i])='') or (Strings[i][1]='#') then
                Delete(i)
              else Inc(i);
            end;
        end;
      FillFileList;
    end;
  spSkinSpeedButton3.Enabled := True;
  spSkinSpeedButton4.Enabled := True;
  N3.Enabled := True;
  N4.Enabled := True;
  spSkinLabel2.Caption := ' PlayList ������ ��� �������������� ';
end;

procedure TForm1.spSkinSpeedButton2Click(Sender: TObject);
var
fName : string;
v : integer;
begin
  if spSkinOpenDialog2.Execute then
    begin
      fName := spSkinOpenDialog2.FileName;
      ValueListEditor1.Values[fName] := spSkinOpenDialog2.Title;
      if  fName <>'' then ValueListEditor1.Values[fName]:='4';
   end;
v := ValueListEditor1.Strings.Count;
spSkinLabel2.Caption := ' ��������� '+ FloatToStr(v)+' �����' ;
SpSkinSpeedButton5.Enabled := True; 
end;

procedure TForm1.GenerateFileList;
var i,j:integer;
begin
  with FilesListBox do
    begin
          FilesListBox.Items:=FullList;
      for j:=1 to ValueListEditor1.RowCount-1 do
        begin
          i:=0;
          if  ValueListEditor1.Cells[0,j]<>'' then
            while i<=Count-1 do
              begin
                if (i mod (StrToIntDef(ValueListEditor1.Cells[1,j],4)+j))=0 then
                  begin
                    Items.Insert(i,ValueListEditor1.Cells[0,j]);
                    Inc(i);
                  end;
                Inc(i);
              end;
        end;
    end;
end;

procedure TForm1.spSkinSpeedButton3Click(Sender: TObject);
Var v : integer;
begin
 GenerateFileList;
 v := ValueListEditor1.Strings.Count;
 spSkinLabel2.Caption := ' �������������� '+ FloatToStr(v)+' �����' ;
end;

procedure TForm1.spSkinSpeedButton4Click(Sender: TObject);
var TSL:TStringList;
begin
  TSL:=TStringList.Create;
  TSL.Text:=FilesListBox.Items.Text;
  TSL.Insert(0,'#EXTM3U');
  TSL.SaveToFile(spSkinEdit1.Text);
  TSL.Free;
  spSkinLabel2.Caption := ' PlayList �������� '
end;

procedure TForm1.spSkinSpeedButton5Click(Sender: TObject);
begin
 ValueListEditor1.Strings.Delete(0);
 spSkinLabel2.Caption := ' ���� ������';
end;

procedure TForm1.FilesListBoxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var t:integer;
begin
  if ValueListEditor1.FindRow(FilesListBox.Items[Index],t) then
     FilesListBox.Canvas.Font.Color := clRed;
     FilesListBox.Canvas.TextRect(Rect,Rect.Left+1,Rect.Top+1,FilesListBox.Items[Index]);
end;

procedure TForm1.spSkinSpeedButton6Click(Sender: TObject);
begin
 if spSkinOpenDialog3.Execute then
   SpSkinData.LoadFromCompressedFile(spSkinOpenDialog3.FileName);
end;

procedure TForm1.spSkinSpeedButton7Click(Sender: TObject);
begin
 Close;
end;

// ���� "����" //////////////////////  � "������"

procedure TForm1.N2Click(Sender: TObject);
var
i:integer;
begin
  if spSkinOpenDialog1.Execute then
    begin
      spSkinEdit1.Text:=spSkinOpenDialog1.FileName;
      with FullList do
        begin
          LoadFromFile(spSkinEdit1.Text);
          i:=0;
          while i<=Count-1 do
            begin
              if (Trim(Strings[i])='') or (Strings[i][1]='#') then
                Delete(i)
              else Inc(i);
            end;
        end;
      FillFileList;
    end;
  spSkinSpeedButton3.Enabled := True;
  spSkinSpeedButton4.Enabled := True;
  N3.Enabled := True;
  N4.Enabled := True;
  spSkinLabel2.Caption := ' PlayList ������ ��� �������������� ';
end;

procedure TForm1.N3Click(Sender: TObject);
var TSL:TStringList;
begin
  TSL:=TStringList.Create;
  TSL.Text:=FilesListBox.Items.Text;
  TSL.Insert(0,'#EXTM3U');
  TSL.SaveToFile(spSkinEdit1.Text);
  TSL.Free;
  spSkinLabel2.Caption := ' PlayList �������� '
end;

procedure TForm1.N4Click(Sender: TObject);
var TSL:TStringList;
begin
  TSL:=TStringList.Create;
  if spSkinSaveDialog1.Execute then
    begin
      TSL.Text:=FilesListBox.Items.Text;
      TSL.Insert(0,'#EXTM3U');
      TSL.SaveToFile(spSkinSaveDialog1.FileName);
    end;
  TSL.Free;
  spSkinLabel2.Caption := ' PlayList �������� '
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.N7Click(Sender: TObject);
var
fName : string;
v : integer;
begin
  if spSkinOpenDialog2.Execute then
    begin
      fName := spSkinOpenDialog2.FileName;
      ValueListEditor1.Values[fName] := spSkinOpenDialog2.Title;
      if  fName <>'' then ValueListEditor1.Values[fName]:='4';
   end;
v := ValueListEditor1.Strings.Count;
spSkinLabel2.Caption := ' ��������� '+ FloatToStr(v)+' �����' ;
SpSkinSpeedButton5.Enabled := True; 
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 ValueListEditor1.Strings.Delete(0);
 spSkinLabel2.Caption := ' ���� ������';
end;

procedure TForm1.N9Click(Sender: TObject);
Var v : integer;
begin
 GenerateFileList;
 v := ValueListEditor1.Strings.Count;
 spSkinLabel2.Caption := ' �������������� '+ FloatToStr(v)+' �����' ;
end;

procedure TForm1.Classic1Click(Sender: TObject);
begin
 if spSkinOpenDialog3.Execute then
   SpSkinData.LoadFromCompressedFile(spSkinOpenDialog3.FileName);
end;
 
procedure TForm1.N11Click(Sender: TObject);
begin
 if spDynamicSkinForm.AlphaBlend= true then
      N11.Caption:= '�� ���������� �����'
   else
 if spDynamicSkinForm.AlphaBlend= False then
     N11.Caption:= '�������������� �����'
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  spDynamicSkinForm.AlphaBlend:= True ;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
 spDynamicSkinForm.AlphaBlend:= False ;
end;

end.
