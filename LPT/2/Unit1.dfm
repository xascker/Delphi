object Form1: TForm1
  Left = 211
  Top = 106
  Width = 478
  Height = 339
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' LPT '#1087#1086#1088#1090#1086#1084' (LED)'
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 153
    Height = 289
    Caption = '  LPT Description  '
    TabOrder = 0
    object SpeedButton2: TSpeedButton
      Left = 16
      Top = 48
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Data Bit 1 (2)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 16
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Data Bit 0 (1)'
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 16
      Top = 80
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Data Bit 2 (3)'
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 16
      Top = 112
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Data Bit 3 (4)'
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 16
      Top = 144
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Data Bit 4 (5)'
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 16
      Top = 176
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Data Bit 5 (6)'
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 16
      Top = 208
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Data Bit 6 (7)'
      OnClick = SpeedButton7Click
    end
    object SpeedButton8: TSpeedButton
      Left = 16
      Top = 240
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Data Bit 7 (8)'
      OnClick = SpeedButton8Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 168
    Top = 16
    Width = 297
    Height = 153
    Caption = ' LPT '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '
    TabOrder = 1
    object SpeedButton9: TSpeedButton
      Left = 16
      Top = 24
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' 1'
      OnClick = SpeedButton9Click
    end
    object SpeedButton10: TSpeedButton
      Left = 152
      Top = 24
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' 4'
      OnClick = SpeedButton10Click
    end
    object SpeedButton11: TSpeedButton
      Left = 16
      Top = 64
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' 2'
      OnClick = SpeedButton11Click
    end
    object SpeedButton12: TSpeedButton
      Left = 152
      Top = 64
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' 5'
      OnClick = SpeedButton12Click
    end
    object SpeedButton13: TSpeedButton
      Left = 16
      Top = 104
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' 3'
      OnClick = SpeedButton13Click
    end
    object SpeedButton14: TSpeedButton
      Left = 152
      Top = 104
      Width = 121
      Height = 33
      AllowAllUp = True
      GroupIndex = 1
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' 6'
      OnClick = SpeedButton14Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 168
    Top = 176
    Width = 297
    Height = 129
    TabOrder = 2
    object SpeedButton15: TSpeedButton
      Left = 8
      Top = 16
      Width = 121
      Height = 33
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077
      OnClick = SpeedButton15Click
    end
    object SpeedButton16: TSpeedButton
      Left = 8
      Top = 56
      Width = 121
      Height = 33
      Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077
      OnClick = SpeedButton16Click
    end
    object Label1: TLabel
      Left = 168
      Top = 16
      Width = 74
      Height = 13
      Caption = #1063#1072#1089#1090#1086#1090#1072', '#1084#1089#1077#1082
    end
    object Edit1: TEdit
      Left = 168
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 0
      Text = '100'
    end
  end
  object TrackBar1: TTrackBar
    Left = 304
    Top = 240
    Width = 153
    Height = 22
    Max = 500
    Min = 1
    Position = 100
    TabOrder = 3
    OnChange = TrackBar1Change
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 8
    Top = 312
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer2Timer
    Left = 40
    Top = 312
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer3Timer
    Left = 8
    Top = 344
  end
  object Timer4: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer4Timer
    Left = 40
    Top = 344
  end
  object Timer5: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer5Timer
    Left = 72
    Top = 344
  end
  object Timer6: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer6Timer
    Left = 104
    Top = 344
  end
  object Timer7: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer7Timer
    Left = 136
    Top = 344
  end
  object Timer8: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer8Timer
    Left = 168
    Top = 344
  end
  object Timer9: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer9Timer
    Left = 200
    Top = 344
  end
  object Timer10: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer10Timer
    Left = 232
    Top = 344
  end
  object Timer11: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer11Timer
    Left = 8
    Top = 376
  end
  object Timer12: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer12Timer
    Left = 40
    Top = 376
  end
  object Timer13: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer13Timer
    Left = 72
    Top = 376
  end
  object Timer14: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer14Timer
    Left = 104
    Top = 376
  end
  object Timer15: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer15Timer
    Left = 136
    Top = 376
  end
  object Timer16: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer16Timer
    Left = 168
    Top = 376
  end
  object Timer17: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer17Timer
    Left = 200
    Top = 376
  end
  object Timer18: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer18Timer
    Left = 232
    Top = 376
  end
  object Timer19: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer19Timer
    Left = 200
    Top = 312
  end
  object Timer20: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer20Timer
    Left = 232
    Top = 312
  end
  object Timer21: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer21Timer
    Left = 8
    Top = 408
  end
  object Timer22: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer22Timer
    Left = 40
    Top = 408
  end
  object Timer23: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer23Timer
    Left = 72
    Top = 408
  end
  object Timer24: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer24Timer
    Left = 104
    Top = 408
  end
  object Timer25: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer25Timer
    Left = 136
    Top = 408
  end
  object Timer26: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer26Timer
    Left = 168
    Top = 408
  end
  object Timer27: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer27Timer
    Left = 200
    Top = 408
  end
  object Timer28: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer28Timer
    Left = 232
    Top = 408
  end
  object Timer29: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer29Timer
    Left = 312
    Top = 312
  end
end
