object Form1: TForm1
  Left = 175
  Top = 191
  Width = 1005
  Height = 797
  Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '
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
  object PaintBox1: TPaintBox
    Left = 0
    Top = 224
    Width = 1257
    Height = 1000
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1257
    Height = 225
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 47
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072' - '
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 51
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072' -  '
    end
    object Label3: TLabel
      Left = 160
      Top = 64
      Width = 127
      Height = 20
      Caption = #1064#1080#1088#1080#1085#1072' '#1082#1080#1089#1090#1080' - 6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object height: TEdit
      Left = 56
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object width: TEdit
      Left = 56
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object gen: TButton
      Left = 184
      Top = 16
      Width = 89
      Height = 41
      Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 2
      OnClick = genClick
    end
    object Memo2: TMemo
      Left = 360
      Top = 8
      Width = 393
      Height = 169
      TabOrder = 3
    end
    object TrackBar1: TTrackBar
      Left = 8
      Top = 64
      Width = 150
      Height = 45
      Hint = #1064#1080#1088#1080#1085#1072' '#1082#1080#1089#1090#1080
      Max = 6
      Min = 1
      Position = 6
      TabOrder = 4
      OnChange = TrackBar1Change
    end
  end
end
