object Form9: TForm9
  Left = 0
  Top = 0
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077
  ClientHeight = 167
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label3: TLabel
    Left = 26
    Top = 60
    Width = 49
    Height = 23
    Caption = #1040#1075#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 26
    Top = 16
    Width = 86
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 179
    Top = 16
    Width = 5
    Height = 16
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 98
    Top = 90
    Width = 77
    Height = 14
    Caption = '*'#1085#1086#1074#1099#1081' '#1072#1075#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 98
    Top = 57
    Width = 121
    Height = 27
    Style = csOwnerDrawFixed
    ItemHeight = 21
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Button2: TButton
    Left = 26
    Top = 110
    Width = 193
    Height = 27
    Caption = #1055#1088#1077#1076#1086#1089#1090#1072#1074#1080#1090#1100' '#1082#1072#1090#1072#1083#1086#1075' '
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 26
    Top = 110
    Width = 193
    Height = 27
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077
    TabOrder = 2
    Visible = False
    OnClick = Button1Click
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'docx'
    InitialDir = ' D:\'#1050#1091#1088#1089#1086#1074#1072#1103'\'#1055#1088#1077#1076#1083#1086#1078#1077#1085#1080#1103'_'#1076#1083#1103'_'#1072#1075#1077#1085#1090#1086#1074
    Left = 256
    Top = 16
  end
end
