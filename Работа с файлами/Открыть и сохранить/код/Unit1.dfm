object Form1: TForm1
  Left = 246
  Top = 167
  Width = 394
  Height = 444
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
  object Button1: TButton
    Left = 320
    Top = 16
    Width = 41
    Height = 25
    Caption = '. . .'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 368
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' '
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 16
    Width = 281
    Height = 21
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 24
    Top = 48
    Width = 337
    Height = 305
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Button3: TButton
    Left = 232
    Top = 368
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 360
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 168
    Top = 368
  end
end
