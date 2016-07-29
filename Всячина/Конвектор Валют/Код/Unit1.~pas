unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    Help1: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    Timer1: TTimer;
    procedure N5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

{$R xpstyle.res}

procedure TForm1.N5Click(Sender: TObject);
begin
 Form2.ShowModal;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
Dol,Grn,Rub,Evr : real;
Dollar,Grivna,Rubl,Evro : real ;
a,b : real ;
begin
 Dol := StrToFloat (Form2.Edit1.Text);
 Grn := StrToFloat (Form2.Edit2.Text);
 Rub := StrToFloat (Form2.Edit3.Text);
 Evr := StrToFloat (Form2.Edit4.Text);

 a := StrToFloat (Edit1.Text);
 b := StrToFloat (Edit2.Text);

 if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'Доллар' then begin
     if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Доллар' then begin
        Dollar := Dol * a / Dol ;
        Edit2.Text := FloatToStr (Dollar);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Гривна' then begin
        Dollar := Grn * a / Dol ;
        Edit2.Text := FloatToStr (Dollar);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Рубыль' then begin
        Dollar := Rub * a / Dol ;
        Edit2.Text := FloatToStr (Dollar);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Евро' then begin
        Dollar := Evr * a / Dol ;
        Edit2.Text := FloatToStr (Dollar);
     end;
 end;

 if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'Гривна' then begin
     if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Гривна' then begin
        Grivna := Grn * a / Grn ;
        Edit2.Text := FloatToStr (Grivna);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Доллар' then begin
        Grivna := Dol * a / Grn ;
        Edit2.Text := FloatToStr (Grivna);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Рубыль' then begin
        Grivna := Rub * a / Grn ;
        Edit2.Text := FloatToStr (Grivna);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Евро' then begin
        Grivna := Evr * a / Grn ;
        Edit2.Text := FloatToStr (Grivna);
     end;
 end;

 if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'Рубыль' then begin
     if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Доллар' then begin
        Rubl := Dol * a / Rub ;
        Edit2.Text := FloatToStr (Rubl);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Гривна' then begin
        Rubl := Grn * a / Rub ;
        Edit2.Text := FloatToStr (Rubl);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Рубыль' then begin
        Rubl := Rub * a / Rub ;
        Edit2.Text := FloatToStr (Rubl);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Евро' then begin
        Rubl := Evr * a / Rub ;
        Edit2.Text := FloatToStr (Rubl);
     end;
 end;

 if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'Евро' then begin
     if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Доллар' then begin
        Evro := Dol * a / Evr ;
        Edit2.Text := FloatToStr (Evro);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Гривна' then begin
        Evro := Grn * a / Evr ;
        Edit2.Text := FloatToStr (Evro);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Рубыль' then begin
        Evro := Rub * a / Evr ;
        Edit2.Text := FloatToStr (Evro);
     end;
      if ComboBox1.Items.Strings[ComboBox2.ItemIndex] = 'Евро' then begin
        Evro := Evr * a / Evr ;
        Edit2.Text := FloatToStr (Evro);
     end;
 end;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 Form3.ShowModal;
end;

end.
