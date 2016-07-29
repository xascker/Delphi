object Form1: TForm1
  Left = 230
  Top = 110
  Width = 555
  Height = 464
  Caption = 'WinampList Generate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    547
    418)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 0
    Width = 168
    Height = 17
    Caption = 'Winamp playlist file (m3u)'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 280
    Top = 400
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10485760
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 400
    Top = 16
    Width = 57
    Height = 25
    Caption = ' . . .'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 464
    Top = 16
    Width = 65
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 272
    Top = 368
    Width = 89
    Height = 25
    Caption = #1057#1075#1077#1085#1080#1088#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 368
    Top = 368
    Width = 81
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 456
    Top = 368
    Width = 81
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 6
    OnClick = Button5Click
  end
  object Edit1: TEdit
    Left = 0
    Top = 16
    Width = 393
    Height = 21
    TabOrder = 7
  end
  object FilesListBox: TListBox
    Left = 0
    Top = 40
    Width = 265
    Height = 377
    Style = lbOwnerDrawFixed
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 1
    OnDrawItem = FilesListBoxDrawItem
  end
  object ValueListEditor1: TValueListEditor
    Left = 272
    Top = 48
    Width = 273
    Height = 313
    Anchors = [akLeft, akTop, akRight]
    DefaultColWidth = 250
    DropDownRows = 0
    KeyOptions = [keyUnique]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goThumbTracking]
    TabOrder = 2
    TitleCaptions.Strings = (
      #1053#1072#1079#1074#1072#1085#1080#1077' '
      #1063#1072#1089#1090#1086#1090#1072)
    ColWidths = (
      218
      49)
  end
  object OpenDialog1: TOpenDialog
    FileName = '*.m3u'
    Filter = '*.m3u'
    Left = 416
    Top = 65520
  end
  object OpenDialog2: TOpenDialog
    FileName = '*.mp3;*.wav'
    Filter = '*.mp3;*.wav'
    Left = 488
    Top = 65520
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 65512
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N5Click
      end
    end
    object N6: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object N7: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1057#1075#1077#1085#1080#1088#1080#1088#1086#1074#1072#1090#1100
        OnClick = N9Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = '*.m3u'
    Filter = '*.m3u'
    Left = 368
    Top = 65520
  end
end
