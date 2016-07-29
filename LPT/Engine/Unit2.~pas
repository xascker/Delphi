unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Grids, ValEdit, Menus, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    procedure LoadData(aFileName: string; aData: TStringList);
    procedure SaveData(aFileName: string; aData: TStringList);
    procedure ShowData(aGrid: TStringGrid; aData: TStringList);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses  Math, Unit1;

function NextItem(var aP: PChar): string;
var
  fStart: PChar;
begin
  // Следующее поле строчки
  if aP <> nil then
  begin
    fStart := aP;
    while not (aP^ in [#0, CHR(VK_TAB)]) do
      Inc(aP);
    SetString(Result, fStart, aP - fStart);
    if aP^ = CHR(VK_TAB) then
      Inc(aP)
  end
  else
    Result := ''
end;

function CS(List: TStringList; Index1, Index2: Integer): Integer;
var
  fP1, fP2: PChar;
  fStrItem1, fStrItem2: string;
  fDigit1, fDigit2: Extended;
  isDigit1, isDigit2: Boolean;

begin
  // Сравнивает две строчки
  Result := 0;
  fP1 := Pointer(List[Index1]);
  fP2 := Pointer(List[Index2]);
  if Assigned(fP1) and Assigned(fP2) then
    while (fP1^ <> #0) and (fP2^ <> #0) do
    begin
      fStrItem1 := Trim(NextItem(fP1));
      fStrItem2 := Trim(NextItem(fP2));
      if fStrItem1 <> fStrItem2 then
      begin
        if fStrItem1 = '' then // Пустышки в конец
          Result := 1
        else if fStrItem2 = '' then
          Result := -1
        else
        begin
          isDigit1 := TryStrToFloat(fStrItem1, fDigit1);
          isDigit2 := TryStrToFloat(fStrItem2, fDigit2);
          if isDigit1 and isDigit2 then
            Result := CompareValue(fDigit1, fDigit2) // Два числа
          else if isDigit1 then
            Result := -1 // Число только в первой строке
          else if isDigit2 then
            Result := 1 // Число только во второй строке
          else // Это не числа
            Result := AnsiCompareStr(fStrItem1, fStrItem2);
          // ...в лексикографическом...
        end;
        Exit
      end;
    end
  else if Assigned(fP1) then // Строки - пустышки
    Result := -1
  else if Assigned(fP2) then
    Result := 1
end;

procedure TForm2.LoadData(aFileName: string; aData: TStringList);
begin
  aData.LoadFromFile(aFileName);
  aData.CustomSort(CS);
end;

procedure TForm2.SaveData(aFileName: string; aData: TStringList);
begin
  aData.SaveToFile(aFileName);
end;

procedure TForm2.ShowData(aGrid: TStringGrid; aData: TStringList);
var
  i, j: Integer;
  fP: PChar;
  fTmpStr: string;
begin
  aGrid.ColCount := 0;
  aGrid.RowCount := Succ(aData.Count);
  for i := 0 to Pred(aData.Count) do
  begin
    fP := Pointer(aData[i]);
    j := 0;
    if Assigned(fP) then
      while (fP^ <> #0) do
      begin
        fTmpStr := NextItem(fP);
        if j > aGrid.ColCount - 1 then
          aGrid.ColCount := aGrid.ColCount + 1;
        aGrid.Cells[j, Succ(i)] := fTmpStr;
        Inc(j);
      end
  end;
  for j := 0 to Pred(aGrid.ColCount) do
    {aGrid.Cells[j, 0] := Format('Поле №%d', [j]);}
    StringGrid1.Cells[0,0]:=' Номер';
    StringGrid1.Cells[1,0]:=' Команда';
    StringGrid1.Cells[2,0]:=' X';
    StringGrid1.Cells[3,0]:=' Y';
    StringGrid1.Cells[4,0]:=' Z';
end;

//---------------=========== Открыть =========-------------

procedure TForm2.N3Click(Sender: TObject);
var
  fData: TStringList;
begin
  if not OpenDialog1.Execute then
    Exit;
  fData := TStringList.Create;
  try
    LoadData(OpenDialog1.FileName, fData);
    ShowData(StringGrid1, fData);
  finally
    fData.Free
  end;
end;

//--------------------------------------------------------------------
//-----------------=============== Сохранить ============-------------
procedure TForm2.N2Click(Sender: TObject);
var
  f: textfile;
  x, y: integer;
  fData: TStringList;
begin
if not SaveDialog1.Execute then
    Exit;
  fData := TStringList.Create;
  assignfile(f, SaveDialog1.FileName);
  rewrite(f);
  writeln(f, stringgrid1.colcount);
  writeln(f, stringgrid1.rowcount);
  for X := 0 to stringgrid1.colcount - 1 do
    for y := 0 to stringgrid1.rowcount - 1 do
      writeln(F, stringgrid1.cells[x, y]);
  closefile(f);
  ShowData(StringGrid1, fData);
end;
//-------------------------------------------------------

procedure TForm2.N5Click(Sender: TObject);
begin
Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
// Заполним сетку порталов надписями
StringGrid1.Cells[0,0]:=' Номер';
StringGrid1.Cells[1,0]:=' Команда';
StringGrid1.Cells[2,0]:=' X';
StringGrid1.Cells[3,0]:=' Y';
StringGrid1.Cells[4,0]:=' Z';
// Первый портал по умолчанию
StringGrid1.Cells[0,1]:='1';
StringGrid1.Cells[1,1]:='G01';
StringGrid1.Cells[2,1]:='2';
StringGrid1.Cells[3,1]:='2';
StringGrid1.Cells[4,1]:='0';
end;
//---------======== Добавить строку ===-------------
procedure TForm2.N7Click(Sender: TObject);
var
 maxval,i:integer;
begin
StringGrid1.RowCount:= StringGrid1.RowCount+1;
maxval:=0;
for i:=1 to StringGrid1.RowCount-2 do
  begin
  if StrToInt(trim(StringGrid1.Cells[0,i]))>maxval then
    begin
      maxval:=StrToInt(StringGrid1.Cells[0,i]);
    end;
 end;
 StringGrid1.Cells[0,StringGrid1.RowCount-1]:=IntToStr(maxval+1);
 StringGrid1.Cells[1,StringGrid1.RowCount-1]:='G01';
 StringGrid1.Cells[2,StringGrid1.RowCount-1]:='2';
 StringGrid1.Cells[3,StringGrid1.RowCount-1]:='2';
 StringGrid1.Cells[4,StringGrid1.RowCount-1]:='0';
end;
//---------------------------------------------------
//---------======== Удалить строку ===---------------
procedure TForm2.N8Click(Sender: TObject);
var
 i,j:integer;
begin
i:=StringGrid1.Row;
if (i= StringGrid1.RowCount-1) and (StringGrid1.RowCount>1) then
  begin
  StringGrid1.RowCount:= StringGrid1.RowCount-1;
  end
  else
  begin
  if (i>1) then
    begin
    for j:=i to  StringGrid1.RowCount-2 do
      begin
        StringGrid1.Cells[0,j]:=StringGrid1.Cells[0,j+1];
        StringGrid1.Cells[1,j]:=StringGrid1.Cells[1,j+1];
        StringGrid1.Cells[2,j]:=StringGrid1.Cells[2,j+1];
        StringGrid1.Cells[3,j]:=StringGrid1.Cells[3,j+1];
        StringGrid1.Cells[3,j]:=StringGrid1.Cells[4,j+1];
      end;
   StringGrid1.RowCount:= StringGrid1.RowCount-1;
    end ;
  end;
end;
//---------===== На клавишах (Добавить удалить)====---------
procedure TForm2.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 maxval,i:integer;
  p,j:integer;
begin
if Key=VK_INSERT then  begin
StringGrid1.RowCount:= StringGrid1.RowCount+1;
maxval:=0;
for i:=1 to StringGrid1.RowCount-2 do
  begin
  if StrToInt(trim(StringGrid1.Cells[0,i]))>maxval then
    begin
      maxval:=StrToInt(StringGrid1.Cells[0,i]);
    end;
 end;
 StringGrid1.Cells[0,StringGrid1.RowCount-1]:=IntToStr(maxval+1);
 StringGrid1.Cells[1,StringGrid1.RowCount-1]:='G01';
 StringGrid1.Cells[2,StringGrid1.RowCount-1]:='2';
 StringGrid1.Cells[3,StringGrid1.RowCount-1]:='2';
 StringGrid1.Cells[4,StringGrid1.RowCount-1]:='0';
end;
if Key=VK_DELETE then  begin
p:=StringGrid1.Row;
if (p= StringGrid1.RowCount-1) and (StringGrid1.RowCount>1) then
  begin
  StringGrid1.RowCount:= StringGrid1.RowCount-1;
  end
  else
  begin
  if (p>1) then
    begin
    for j:=p to  StringGrid1.RowCount-2 do
      begin
        StringGrid1.Cells[0,j]:=StringGrid1.Cells[0,j+1];
        StringGrid1.Cells[1,j]:=StringGrid1.Cells[1,j+1];
        StringGrid1.Cells[2,j]:=StringGrid1.Cells[2,j+1];
        StringGrid1.Cells[3,j]:=StringGrid1.Cells[3,j+1];
        StringGrid1.Cells[3,j]:=StringGrid1.Cells[4,j+1];
      end;
   StringGrid1.RowCount:= StringGrid1.RowCount-1;
    end ;
  end;
end; end;
//---------------------------------------------------------

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
const //здесь определяем Ваш цвет. Так же можно использовать цвета по умолчанию.
  clPaleGreen = TColor($CCFFCC);
  clPaleRed = TColor($CCCCFF);
begin
{ if (gdFocused in State) then
  begin
    StringGrid1.Canvas.Brush.Color := clBlack;
    StringGrid1.Canvas.Font.Color := clWhite;
  end
  else //Если же ячейка теряет фокус, то закрашиваем её красным и зелёным
    if ACol = 2 then //Вторая колонка будет зелёной , другие - ячейки красными
      StringGrid1.Canvas.Brush.color := clPaleGreen
    else
      StringGrid1.canvas.brush.Color := clPaleRed;
   if (ACol > 0) and (ARow > 0) then
  begin
    //Закрашиваем бэкграунд
    StringGrid1.Canvas.FillRect(Rect);
    //Закрашиваем текст (Text). Также здесь можно добавить выравнивание и т.д..
    StringGrid1.Canvas.TextOut(Rect.Left, Rect.Top, StringGrid1.Cells[ACol, ARow]);
  end; }
end;

end.
