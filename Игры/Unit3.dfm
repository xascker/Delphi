object Form3: TForm3
  Left = 294
  Top = 176
  Width = 437
  Height = 161
  Caption = 'GameOver'
  Color = clWindowText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 425
    Height = 105
    Caption = 'Game Over'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -96
    Font.Name = 'Zapf ChanceC'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 136
    Top = 112
    Width = 137
    Height = 17
    Caption = 'ok'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
end
