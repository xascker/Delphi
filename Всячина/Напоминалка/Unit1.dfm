object Form1: TForm1
  Left = 184
  Top = 114
  Width = 282
  Height = 210
  Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1083#1082#1072' '
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
    Top = 0
    Width = 257
    Height = 49
    Caption = #1050#1072#1088#1090#1080#1085#1082#1072
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 16
      Width = 41
      Height = 25
      Caption = '... '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 64
      Top = 16
      Width = 185
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 112
    Width = 257
    Height = 57
    Caption = #1042#1088#1103#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
    TabOrder = 1
    object Label1: TLabel
      Left = 184
      Top = 8
      Width = 47
      Height = 13
      Caption = #1084#1080#1083'. '#1089#1077#1082'.'
    end
    object Edit2: TEdit
      Left = 184
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 0
      Text = '1000'
    end
    object Button2: TButton
      Left = 16
      Top = 24
      Width = 65
      Height = 25
      Caption = #1057#1090#1086#1087
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 56
    Width = 257
    Height = 49
    Caption = #1052#1091#1079#1099#1082#1072
    TabOrder = 2
    object Button3: TButton
      Left = 8
      Top = 16
      Width = 41
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button3Click
    end
    object Edit3: TEdit
      Left = 64
      Top = 16
      Width = 185
      Height = 21
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 136
    Top = 176
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 184
    Top = 176
  end
  object OpenDialog2: TOpenDialog
    Left = 96
    Top = 176
  end
end
