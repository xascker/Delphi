object Form1: TForm1
  Left = 305
  Top = 135
  Width = 369
  Height = 267
  Caption = #1050#1086#1085#1074#1077#1082#1090#1086#1088' '#1042#1072#1083#1102#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 345
    Height = 201
    TabOrder = 2
    object Label1: TLabel
      Left = 48
      Top = 24
      Width = 65
      Height = 16
      Caption = #1042#1072#1083#1102#1090#1072' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 48
      Top = 120
      Width = 65
      Height = 16
      Caption = #1042#1072#1083#1102#1090#1072' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 160
      Width = 97
      Height = 16
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 64
      Width = 97
      Height = 16
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 128
      Top = 8
      Width = 201
      Height = 89
      Caption = ' '#1042#1074#1086#1076' '
      TabOrder = 0
      object Edit1: TEdit
        Left = 8
        Top = 56
        Width = 185
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '1'
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 32
    Width = 185
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 0
    Text = ' -'
    Items.Strings = (
      #1044#1086#1083#1083#1072#1088
      #1043#1088#1080#1074#1085#1072
      #1056#1091#1073#1099#1083#1100
      #1045#1074#1088#1086)
  end
  object GroupBox2: TGroupBox
    Left = 136
    Top = 112
    Width = 201
    Height = 89
    Caption = ' '#1042#1099#1074#1086#1076' '
    TabOrder = 3
    object Edit2: TEdit
      Left = 8
      Top = 56
      Width = 185
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '1'
    end
  end
  object ComboBox2: TComboBox
    Left = 144
    Top = 128
    Width = 185
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 1
    Text = ' -'
    Items.Strings = (
      #1044#1086#1083#1083#1072#1088
      #1043#1088#1080#1074#1085#1072
      #1056#1091#1073#1099#1083#1100
      #1045#1074#1088#1086)
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 16
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N4: TMenuItem
        Caption = #1047#1072#1088#1099#1090#1100
        OnClick = N4Click
      end
    end
    object N2: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object N5: TMenuItem
        Caption = #1054#1073#1084#1077#1085#1085#1099#1077' '#1082#1091#1088#1089#1099
        OnClick = N5Click
      end
    end
    object Help1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N3: TMenuItem
        Caption = #1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N3Click
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 16
    Top = 96
  end
end
