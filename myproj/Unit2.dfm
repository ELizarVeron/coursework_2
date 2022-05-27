object Form2: TForm2
  Left = 0
  Top = 51
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
  ClientHeight = 379
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  TextHeight = 13
  object Label1: TLabel
    Left = 50
    Top = 25
    Width = 91
    Height = 19
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 50
    Top = 78
    Width = 66
    Height = 16
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 50
    Top = 134
    Width = 43
    Height = 16
    Caption = #1051#1086#1075#1080#1085'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 50
    Top = 191
    Width = 51
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 50
    Top = 247
    Width = 96
    Height = 16
    Caption = #1055#1086#1074#1090#1086#1088' '#1087#1072#1088#1086#1083#1103'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 178
    Top = 274
    Width = 128
    Height = 14
    Caption = #1055#1072#1088#1086#1083#1080' '#1085#1077' '#1089#1086#1074#1087#1072#1076#1072#1102#1090'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 178
    Top = 75
    Width = 153
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 0
    Text = #1052#1077#1085#1077#1078#1077#1088
    Items.Strings = (
      #1052#1077#1085#1077#1078#1077#1088
      #1052#1072#1089#1090#1077#1088' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072)
  end
  object Edit1: TEdit
    Left = 178
    Top = 131
    Width = 153
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 178
    Top = 188
    Width = 153
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 178
    Top = 304
    Width = 153
    Height = 33
    Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100#1089#1103
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 178
    Top = 244
    Width = 153
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 4
  end
  object DataSource1: TDataSource
    Left = 8
    Top = 376
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1050#1091#1088#1089#1086#1074#1072#1103'\1111.md' +
      'b;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 384
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1050#1091#1088#1089#1086#1074#1072#1103'\Databas' +
      'e2.mdb;Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Users')
    Left = 8
    Top = 320
  end
end
