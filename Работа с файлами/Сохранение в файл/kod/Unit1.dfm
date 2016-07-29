object Form1: TForm1
  Left = 243
  Top = 223
  Width = 433
  Height = 335
  Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
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
  object Edit1: TEdit
    Left = 8
    Top = 16
    Width = 273
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 296
    Top = 16
    Width = 89
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 56
    Width = 385
    Height = 233
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object SaveDialog1: TSaveDialog
    Left = 392
    Top = 16
  end
end
