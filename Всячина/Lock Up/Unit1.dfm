object Form1: TForm1
  Left = 218
  Top = 112
  Width = 234
  Height = 202
  Caption = 'Lock up v0.1'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Timer: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TimerTimer
    Left = 160
  end
end
