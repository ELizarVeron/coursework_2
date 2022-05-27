object Form18: TForm18
  Left = 0
  Top = 0
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1103
  ClientHeight = 237
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label5: TLabel
    Left = 32
    Top = 152
    Width = 64
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object Label4: TLabel
    Left = 32
    Top = 115
    Width = 55
    Height = 13
    Caption = #1042' '#1085#1072#1083#1080#1095#1080#1080':'
  end
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 173
    Height = 19
    Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 104
    Top = 115
    Width = 4
    Height = 13
    Caption = '-'
  end
  object ComboBox1: TComboBox
    Left = 32
    Top = 72
    Width = 166
    Height = 21
    TabOrder = 0
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object ListBox1: TListBox
    Left = 261
    Top = 72
    Width = 204
    Height = 93
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 1
  end
  object Button1: TButton
    Left = 24
    Top = 192
    Width = 174
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 261
    Top = 192
    Width = 92
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 374
    Top = 192
    Width = 91
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 112
    Top = 149
    Width = 49
    Height = 21
    NumbersOnly = True
    TabOrder = 5
    Text = ' '
  end
  object SaveDialog1: TSaveDialog
    Left = 440
    Top = 8
  end
end
