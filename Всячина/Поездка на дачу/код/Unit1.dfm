object Form1: TForm1
  Left = 505
  Top = 129
  Width = 357
  Height = 395
  Caption = 'Form1'
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
  object Label1: TLabel
    Left = 128
    Top = 40
    Width = 80
    Height = 13
    Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077', '#1082#1084
  end
  object Label2: TLabel
    Left = 96
    Top = 96
    Width = 125
    Height = 13
    Caption = #1062#1077#1085#1072' '#1073#1077#1085#1079#1080#1085#1072' ('#1075#1088#1085'/'#1083#1080#1090#1088')'
  end
  object Label3: TLabel
    Left = 16
    Top = 152
    Width = 209
    Height = 17
    BiDiMode = bdLeftToRight
    Caption = #1055#1086#1090#1088#1077#1073#1083#1077#1085#1080' '#1073#1077#1085#1079#1080#1085#1072' ('#1083#1080#1090#1088#1086#1074' '#1085#1072' 100 '#1082#1084')'
    Color = clBtnFace
    ParentBiDiMode = False
    ParentColor = False
  end
  object Label4: TLabel
    Left = 48
    Top = 216
    Width = 75
    Height = 13
    Caption = #1090#1091#1076#1072' '#1080' '#1086#1073#1088#1072#1090#1085#1086
  end
  object Label5: TLabel
    Left = 19
    Top = 264
    Width = 309
    Height = 89
  end
  object Edit1: TEdit
    Left = 232
    Top = 32
    Width = 105
    Height = 25
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 232
    Top = 88
    Width = 105
    Height = 25
    TabOrder = 1
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 232
    Top = 144
    Width = 105
    Height = 25
    TabOrder = 2
    OnChange = Edit3Change
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 216
    Width = 17
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 224
    Top = 208
    Width = 113
    Height = 33
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100' '
    TabOrder = 4
    OnClick = Button1Click
  end
end
