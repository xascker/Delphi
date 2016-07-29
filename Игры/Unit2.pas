unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls;

type
  TForm2 = class(TForm)
    Splitter1: TSplitter;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Timer2: TTimer;
    Timer3: TTimer;
    Image2: TImage;
    Timer4: TTimer;
    Timer5: TTimer;
    Timer6: TTimer;
    Timer7: TTimer;
    Timer8: TTimer;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Timer9: TTimer;
    Timer10: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure Timer8Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer9Timer(Sender: TObject);
    procedure Timer10Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3;
var
life,score,kill:Integer;

{$R *.dfm}

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If Key=VK_LEFT then   begin
    SpeedButton1.Left:=SpeedButton1.Left-5;
      if Timer1.Enabled=false then // если "оружие" не запущено, то оно двигается со мной
        Image1.Left:=Image1.Left-5;  end;
 if Key=VK_RIGHT then    begin
    SpeedButton1.Left:=SpeedButton1.Left+5;
      if Timer1.Enabled=false then
        Image1.Left:=Image1.Left+5;  end;
 if Key=VK_SPACE then
    Timer1.Enabled:= true;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 life:=2;
 kill:=0;
 score:=0; 
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
 Image1.Visible:=true;
 Image1.Top:=Image1.Top-5; // ввер на 5 точек
 if Image1.Top <0 then // если ушла за пределы формы то...
    begin
     Image1.Visible:=false;
     Image1.Left:=SpeedButton1.Left+12;
     Image1.Top:=SpeedButton1.Top-5; // ставим в исходную позицию
     Timer1.Enabled:=false;
   end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);   // Старт
begin
  Timer3.Enabled:=False;
  Timer5.Enabled:=False;
  Image2.Visible:=False;
  Image3.Visible:=False;
  Image4.Visible:=False;
  Image5.Visible:=False;
  SpeedButton6.Visible:= false;
  Timer2.Enabled:=true;
  Timer3.Enabled:=False;
  Timer5.Enabled:=False;
  Timer7.Enabled:=False;
  Timer9.Enabled:=False;
  SpeedButton6.Top:=+1;
  Image2.Top:=+1;
  Image3.Top:=+1;
  Image4.Top:=+1;
  Image5.Top:=+1;
end;

procedure TForm2.Timer3Timer(Sender: TObject);
begin
 Image2.Visible:=true;
 Image2.Top:=Image2.Top+1;
 Image2.Left:=Image2.Left-1;
     if ((Image1.Top > Image2.Top) and
         (Image1.Top < Image2.Top+Image2.Height) and
         (Image1.Left > Image2.Left) and
         (Image1.Left < Image2.Left+Image2.Width)) or(Image1.Top=Image2.Top) or
         (Image1.Left=Image2.Left)
       then
           begin
             Image1.Visible:=false;
             Image1.Top:=0;
             Image1.Top:=Image1.Top-5;
             score:=score+100;
             Label6.Caption:=IntToStr(score);
            end;
   if Image2.Left < 5 then
       begin
        Image2.Visible:=false;

        Timer3.Enabled:=False;
       end;
end;

procedure TForm2.Timer2Timer(Sender: TObject);
begin
 SpeedButton6.Visible:= True;
 SpeedButton6.Top:=SpeedButton6.Top+1;
   if SpeedButton6.Top=610 then
     begin
        life:=life-1;
        Label4.Caption:=IntToStr(life);
        SpeedButton6.Top:=+1;
           if life=0 then
             begin
               Timer1.Enabled:=False;
               Timer2.Enabled:=False;
               Timer3.Enabled:=False;
               Timer5.Enabled:=False;
               Timer7.Enabled:=False;
               Timer9.Enabled:=False;
               Form3.Show;
             end;
     end;
      if ((Image1.Top > SpeedButton6.Top) and
          (Image1.Top < SpeedButton6.Top+SpeedButton6.Height) and
          (Image1.Left > SpeedButton6.Left) and
          (Image1.Left < SpeedButton6.Left+SpeedButton6.Width)) or(Image1.Top=SpeedButton6.Top) or
          (Image1.Left=SpeedButton6.Left)
      then
         begin
             Image1.Visible:=false;
             Image1.Top:=0;
             Image1.Top:=Image1.Top-5;
             SpeedButton6.Glyph.LoadFromFile('en_exp.bmp');
             kill:=kill+1;
             score:=score+50;
             Label1.Caption:=IntToStr(kill); // выводим их на экран
             Label6.Caption:=IntToStr(score);
             Timer4.Enabled:=True;
             Timer5.Enabled:=True;
             {Timer3.Enabled:=true;}
             Timer2.Enabled:=false;
         end;
end;

procedure TForm2.Timer4Timer(Sender: TObject);
begin
 SpeedButton6.Visible:=false;
   if SpeedButton6.Visible=false then
        begin
          Timer4.Enabled:=False;
          SpeedButton6.Top:=+1;
          SpeedButton6.Left:=random(984);
          SpeedButton6.Glyph.LoadFromFile('en_exp2.bmp');
        end;
end;

procedure TForm2.Timer5Timer(Sender: TObject);
begin
 Image3.Visible:= True;
 Image3.Top:=Image3.Top+1;
   if Image3.Top=610 then
     begin
        life:=life-1;
        Label4.Caption:=IntToStr(life);
        Image3.Top:=+1;
           if life=0 then
             begin
               Timer1.Enabled:=False;
               Timer2.Enabled:=False;
               Timer3.Enabled:=False;
               Timer5.Enabled:=False;
               Timer7.Enabled:=False;
               Timer9.Enabled:=False;
               Form3.Show;
             end;
     end;
      if ((Image1.Top > Image3.Top) and
          (Image1.Top < Image3.Top+Image3.Height) and
          (Image1.Left > Image3.Left) and
          (Image1.Left < Image3.Left+Image3.Width)) or(Image1.Top=Image3.Top) 
      then
         begin
             Image1.Visible:=false;
             Image1.Top:=0;
             Image1.Top:=Image1.Top-5;
             Image3.Picture.LoadFromFile('en_exp.bmp');
             kill:=kill+1;
             score:=score+50;
             Label1.Caption:=IntToStr(kill); // выводим их на экран
             Label6.Caption:=IntToStr(score);
             Timer6.Enabled:=True;
             Timer7.Enabled:=True;
             {Timer3.Enabled:=true;}
             Timer5.Enabled:=false;
         end;
end;

procedure TForm2.Timer6Timer(Sender: TObject);
begin
 Image3.Visible:=false;
   if Image3.Visible=false then
        begin
          Timer6.Enabled:=False;
          Image3.Top:=+1;
          Image3.Left:=random(984);
          Image3.Picture.LoadFromFile('en_exp2.bmp');
        end;
end;

procedure TForm2.Timer7Timer(Sender: TObject);
begin
 Image4.Visible:= True;
 Image4.Top:=Image4.Top+1;
   if Image4.Top=610 then
     begin
        life:=life-1;
        Label4.Caption:=IntToStr(life);
        Image4.Top:=+1;
           if life=0 then
             begin
               Timer1.Enabled:=False;
               Timer2.Enabled:=False;
               Timer3.Enabled:=False;
               Timer5.Enabled:=False;
               Timer7.Enabled:=False;
               Timer9.Enabled:=False;
               Form3.Show;
             end;
     end;
      if ((Image1.Top > Image4.Top) and
          (Image1.Top < Image4.Top+Image4.Height) and
          (Image1.Left > Image4.Left) and
          (Image1.Left < Image4.Left+Image4.Width)) or(Image1.Top=Image4.Top)
      then
         begin
             Image1.Visible:=false;
             Image1.Top:=0;
             Image1.Top:=Image1.Top-5;
             Image4.Picture.LoadFromFile('en_exp.bmp');
             kill:=kill+1;
             score:=score+50;
             Label1.Caption:=IntToStr(kill); // выводим их на экран
             Label6.Caption:=IntToStr(score);
             Timer8.Enabled:=True;
             Timer9.Enabled:=True;
             {Timer3.Enabled:=true;}
             Timer7.Enabled:=false;
         end;
end;

procedure TForm2.Timer8Timer(Sender: TObject);
begin
 Image4.Visible:=false;
   if Image4.Visible=false then
        begin
          Timer8.Enabled:=False;
          Image4.Top:=+1;
          Image4.Left:=random(984);
          Image4.Picture.LoadFromFile('en_exp2.bmp');
        end;
end;


procedure TForm2.Timer9Timer(Sender: TObject);
begin
 Image5.Visible:= True;
 Image5.Top:=Image5.Top+1;
   if Image5.Top=610 then
     begin
        life:=life-1;
        Label4.Caption:=IntToStr(life);
        Image5.Top:=+1;
           if life=0 then
             begin
               Timer1.Enabled:=False;
               Timer2.Enabled:=False;
               Timer3.Enabled:=False;
               Timer5.Enabled:=False;
               Timer7.Enabled:=False;
               Timer9.Enabled:=False;
               Form3.Show;
             end;
     end;
      if ((Image1.Top > Image5.Top) and
          (Image1.Top < Image5.Top+Image5.Height) and
          (Image1.Left > Image5.Left) and
          (Image1.Left < Image5.Left+Image5.Width)) or(Image1.Top=Image5.Top)
      then
         begin
             Image1.Visible:=false;
             Image1.Top:=0;
             Image1.Top:=Image1.Top-5;
             Image5.Picture.LoadFromFile('en_exp.bmp');
             kill:=kill+1;
             score:=score+50;
             Label1.Caption:=IntToStr(kill); // выводим их на экран
             Label6.Caption:=IntToStr(score);
             Timer10.Enabled:=True;
             Timer2.Enabled:=True;
             {Timer3.Enabled:=true;}
             Timer9.Enabled:=false;
         end;
end;

procedure TForm2.Timer10Timer(Sender: TObject);
begin
 Image5.Visible:=false;
   if Image5.Visible=false then
        begin
          Timer10.Enabled:=False;
          Image5.Top:=+1;
          Image5.Left:=random(984);
          Image5.Picture.LoadFromFile('en_exp2.bmp');
        end;
end;

end.
