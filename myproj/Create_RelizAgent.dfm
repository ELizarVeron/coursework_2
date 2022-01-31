object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Form8'
  ClientHeight = 341
  ClientWidth = 373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 24
    Width = 138
    Height = 25
    Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 230
    Width = 101
    Height = 23
    Caption = #1050#1086#1083#1080#1095#1077#1089#1074#1090#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 135
    Width = 137
    Height = 23
    Caption = #1040#1088#1090#1080#1082#1091#1083' '#1090#1086#1074#1072#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 56
    Top = 88
    Width = 42
    Height = 23
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 56
    Top = 182
    Width = 129
    Height = 23
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit3: TEdit
    Left = 210
    Top = 230
    Width = 121
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    OnChange = Edit3Change
  end
  object DatePicker1: TDatePicker
    Left = 208
    Top = 79
    Width = 121
    Date = 44590.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 210
    Top = 131
    Width = 121
    Height = 27
    Style = csOwnerDrawFixed
    ItemHeight = 21
    TabOrder = 2
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 208
    Top = 288
    Width = 123
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 56
    Top = 288
    Width = 123
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 210
    Top = 182
    Width = 121
    Height = 27
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = '-'
  end
end
