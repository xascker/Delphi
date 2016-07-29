object Form1: TForm1
  Left = 436
  Top = 116
  Width = 266
  Height = 162
  BorderIcons = [biSystemMenu]
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 11
    Width = 68
    Height = 14
    Alignment = taRightJustify
    Caption = #1057#1092#1077#1088': '
  end
  object Label2: TLabel
    Left = 13
    Top = 43
    Width = 76
    Height = 14
    Alignment = taRightJustify
    Caption = #1056#1072#1079#1084#1077#1088': '
  end
  object Label3: TLabel
    Left = 10
    Top = 80
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100': '
  end
  object spnSpheres: TSpinEdit
    Left = 160
    Top = 8
    Width = 53
    Height = 23
    MaxValue = 500
    MinValue = 1
    TabOrder = 0
    Value = 50
  end
  object spnSize: TSpinEdit
    Left = 160
    Top = 40
    Width = 53
    Height = 23
    MaxValue = 250
    MinValue = 50
    TabOrder = 1
    Value = 100
  end
  object spnSpeed: TSpinEdit
    Left = 160
    Top = 72
    Width = 57
    Height = 22
    MaxValue = 10
    MinValue = 1
    TabOrder = 2
    Value = 10
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 104
    Width = 57
    Height = 25
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 80
    Top = 104
    Width = 81
    Height = 25
    TabOrder = 4
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 176
    Top = 104
    Width = 73
    Height = 25
    Caption = #1058#1077#1089#1090
    TabOrder = 5
    OnClick = BitBtn3Click
    Kind = bkIgnore
  end
end
