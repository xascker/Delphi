object Form1: TForm1
  Left = 192
  Top = 107
  Width = 460
  Height = 347
  Caption = 'IP monitoring'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbAddConnect: TListBox
    Left = 0
    Top = 0
    Width = 452
    Height = 282
    Align = alClient
    ItemHeight = 13
    PopupMenu = ClickMenu
    TabOrder = 0
  end
  object Status: TStatusBar
    Left = 0
    Top = 282
    Width = 452
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object MMenu: TMainMenu
    object N1: TMenuItem
      AutoHotkeys = maAutomatic
      Caption = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075
      object mStart: TMenuItem
        Caption = #1057#1090#1072#1088#1090
        OnClick = mStartClick
      end
      object mStop: TMenuItem
        Caption = #1057#1090#1086#1087
        OnClick = mStopClick
      end
      object mExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
      end
    end
  end
  object ClickMenu: TPopupMenu
    Left = 64
    object cmCopy1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = cmCopy1Click
    end
    object cmClearAll1: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077
      OnClick = cmClearAll1Click
    end
  end
  object Server: TIdHTTPServer
    Bindings = <>
    CommandHandlers = <>
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnConnect = ServerConnect
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 136
  end
end
