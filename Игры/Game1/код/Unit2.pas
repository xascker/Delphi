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
    TimerEndLevel1: TTimer;
    TimerLevel2: TTimer;
    Label7: TLabel;
    TimerEndLevel2: TTimer;
    TimerLevel3: TTimer;
    TimerEndLevel3: TTimer;
    TimerLevel4: TTimer;
    TimerEndLevel4: TTimer;
    TimerLevel5: TTimer;
    TimerEND: TTimer;
    TimerLife: TTimer;
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
    procedure TimerEndLevel1Timer(Sender: TObject);
    procedure TimerLevel2Timer(Sender: TObject);
    procedure TimerEndLevel2Timer(Sender: TObject);
    procedure TimerLevel3Timer(Sender: TObject);
    procedure TimerEndLevel3Timer(Sender: TObject);
    procedure TimerLevel4Timer(Sender: TObject);
    procedure TimerEndLevel4Timer(Sender: TObject);
    procedure TimerLevel5Timer(Sender: TObject);
    procedure TimerENDTimer(Sender: TObject);
    procedure TimerLifeTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3, Unit4;
var
life,score,kill:Integer;

{$R *.dfm}

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If Key=VK_LEFT then   begin
    SpeedButton1.Left:=SpeedButton1.Left-7;
      if Timer1.Enabled=false then // если "оружие" не запущено, то оно двигается со мной
        Image1.Left:=Image1.Left-7;  end;
 if Key=VK_RIGHT then    begin
    SpeedButton1.Left:=SpeedButton1.Left+7;
      if Timer1.Enabled=false then
        Image1.Left:=Image1.Left+7;  end;
 if Key=VK_SPACE then
    Timer1.Enabled:= true;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 life:=2;
 kill:=0;
 score:=0;
end;

procedure TForm2.TimerLifeTimer(Sender: TObject);
begin
 if score=3000 then
    begin
     life:=life+1;
     Label4.Caption:=IntToStr(life);
    end
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
  Label7.Visible:=False;
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
     if ((Image1.Top > Image2.Top) and
         (Image1.Top < Image2.Top+Image2.Height) and
         (Image1.Left > Image2.Left) and
         (Image1.Left < Image2.Left+Image2.Width)) or(Image1.Top=Image2.Top)
       then
           begin
             Image1.Visible:=false;
             Image1.Top:=0;
             Image1.Top:=Image1.Top-5;
             score:=score+500;
             Label6.Caption:=IntToStr(score);
             life:=life+1;
             Label4.Caption:=IntToStr(life);
             Timer3.Enabled:=False;
             Label7.Visible:=True;
             Image2.Visible:=false;
             Image2.Top:=+1;
               if kill=20 then                           ////////////
                   TimerLevel2.Enabled:=True else
               if kill=40 then                           ////////////
                   TimerLevel3.Enabled:=True else
               if kill=70 then                           ////////////
                   TimerLevel4.Enabled:=True else
               if kill=100 then                           ////////////
                   TimerLevel5.Enabled:=True;
                      if (Image2.Top=610) or (Image2.Left < 0) then
                          begin
                            Image2.Visible:=False;
                            Timer3.Enabled:=False;
                          end;
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
          (Image1.Left < SpeedButton6.Left+SpeedButton6.Width)) {or(Image1.Top=SpeedButton6.Top) or
          (Image1.Left=SpeedButton6.Left) }
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

procedure TForm2.TimerEndLevel1Timer(Sender: TObject);
begin
  if kill=20 then
     begin
      Timer2.Enabled:=False;
      Timer5.Enabled:=False;
      Timer7.Enabled:=False;
      Timer9.Enabled:=False;
      Image3.Visible:=False;
      Image4.Visible:=False;
      Image5.Visible:=False;
      SpeedButton6.Visible:= false;
      Timer3.Enabled:=True;
      Image2.Left:=random(984);
      TimerEndLevel1.Enabled:=False;;
    end;
end;

procedure TForm2.TimerLevel2Timer(Sender: TObject);
begin
  if TimerLevel2.Enabled=true then
     begin
       sleep(2500);
       Timer2.Interval:=4 ;
       Timer2.Interval:=17 ;
       Timer5.Interval:=10 ;
       Timer7.Interval:=17 ;
       Timer9.Interval:=10 ;
       Label7.Visible:=False;
       Label7.Caption:='Level3';
       Timer2.Enabled:=True;
       TimerLevel2.Enabled:=False;
    end;
end;

procedure TForm2.TimerEndLevel2Timer(Sender: TObject);
begin
 if kill=40 then
     begin
      Timer2.Enabled:=False;
      Timer5.Enabled:=False;
      Timer7.Enabled:=False;
      Timer9.Enabled:=False;
      Image3.Visible:=False;
      Image4.Visible:=False;
      Image5.Visible:=False;
      SpeedButton6.Visible:= false;
      Timer3.Enabled:=True;
      Image2.Left:=random(984);
      TimerEndLevel2.Enabled:=False;;
    end;
end;

procedure TForm2.TimerLevel3Timer(Sender: TObject);
begin
  if TimerLevel3.Enabled=true then
     begin
       sleep(2500);
       Timer1.Interval:=3 ;
       Timer2.Interval:=15 ;
       Timer5.Interval:=15 ;
       Timer7.Interval:=15 ;
       Timer9.Interval:=15 ;
       Label7.Visible:=False;
       Label7.Caption:='Level4';
       Timer2.Enabled:=True;
       Timer7.Enabled:=True;
       TimerLevel3.Enabled:=False;
    end;
end;

procedure TForm2.TimerEndLevel3Timer(Sender: TObject);
begin
 if kill=70 then
     begin
      Timer2.Enabled:=False;
      Timer5.Enabled:=False;
      Timer7.Enabled:=False;
      Timer9.Enabled:=False;
      Image3.Visible:=False;
      Image4.Visible:=False;
      Image5.Visible:=False;
      SpeedButton6.Visible:= false;
      Timer3.Enabled:=True;
      Image2.Left:=random(984);
      TimerEndLevel3.Enabled:=False;
    end;
end;

procedure TForm2.TimerLevel4Timer(Sender: TObject);
begin
 if TimerLevel4.Enabled=true then
     begin
       sleep(2500);
       Timer1.Interval:=2 ;
       Timer2.Interval:=15 ;
       Timer5.Interval:=12 ;
       Timer7.Interval:=15 ;
       Timer9.Interval:=12 ;
       Label7.Visible:=False;
       Label7.Caption:='Level5';
       Timer2.Enabled:=True;
       Timer7.Enabled:=True;
       TimerLevel4.Enabled:=False;
    end;
end;

procedure TForm2.TimerEndLevel4Timer(Sender: TObject);
begin
  if kill=100 then
     begin
      Timer2.Enabled:=False;
      Timer5.Enabled:=False;
      Timer7.Enabled:=False;
      Timer9.Enabled:=False;
      Image3.Visible:=False;
      Image4.Visible:=False;
      Image5.Visible:=False;
      SpeedButton6.Visible:= false;
      Timer3.Enabled:=True;
      Image2.Left:=random(984);
      TimerEndLevel4.Enabled:=False;
    end;
end;

procedure TForm2.TimerLevel5Timer(Sender: TObject);
begin
  if TimerLevel5.Enabled=true then
     begin
       sleep(2500);
       Timer1.Interval:=1 ;
       Timer2.Interval:=12 ;
       Timer5.Interval:=12 ;
       Timer7.Interval:=12 ;
       Timer9.Interval:=12 ;
       Label7.Visible:=False;
       Label7.Caption:='The End';
       Timer2.Enabled:=True;
       Timer7.Enabled:=True;
       TimerLevel5.Enabled:=False;
    end;
end;

procedure TForm2.TimerENDTimer(Sender: TObject);
begin
   if kill=150 then
     begin
      Timer2.Enabled:=False;
      Timer5.Enabled:=False;
      Timer7.Enabled:=False;
      Timer9.Enabled:=False;
      Image3.Visible:=False;
      Image4.Visible:=False;
      Image5.Visible:=False;
      TimerEnd.Enabled:=False;
      Label7.Visible:=True;
    end;
end;

end.
