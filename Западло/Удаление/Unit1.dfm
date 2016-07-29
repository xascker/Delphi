object Form1: TForm1
  Left = 311
  Top = 117
  Width = 413
  Height = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 8
    Width = 377
    Height = 177
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 48
    Top = 160
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 80
    Top = 120
    Width = 225
    Height = 25
    Caption = #1055#1091#1089#1082' '
    TabOrder = 0
    OnClick = Button1Click
  end
  object Animate1: TAnimate
    Left = 48
    Top = 16
    Width = 304
    Height = 60
    CommonAVI = aviDeleteFile
    StopFrame = 24
  end
  object ProgressBar1: TProgressBar
    Left = 40
    Top = 88
    Width = 329
    Height = 17
    TabOrder = 2
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 112
    Top = 144
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 176
    Top = 144
  end
  object Timer3: TTimer
    OnTimer = Timer3Timer
    Left = 248
    Top = 144
  end
end
