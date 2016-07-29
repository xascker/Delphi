object Form1: TForm1
  Left = 196
  Top = 108
  Width = 231
  Height = 121
  Caption = #1057#1077#1088#1074#1077#1088
  Color = clBtnFace
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
  object ServerSocket1: TServerSocket
    Active = False
    Port = 1003
    ServerType = stNonBlocking
    OnClientRead = ServerSocket1ClientRead
  end
end
