object Form1: TForm1
  Left = 0
  Top = 0
  Caption = '7'
  ClientHeight = 309
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 16
    Width = 201
    Height = 41
    AutoSize = False
    Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 97
    Height = 23
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 128
    Width = 53
    Height = 23
    Caption = #1051#1086#1075#1080#1085
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 183
    Width = 65
    Height = 23
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 176
    Top = 67
    Width = 169
    Height = 31
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    ParentFont = False
    TabOrder = 0
    Text = #1052#1072#1089#1090#1077#1088' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
    Items.Strings = (
      #1052#1077#1085#1077#1078#1077#1088
      #1052#1072#1089#1090#1077#1088' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
      '')
  end
  object Edit1: TEdit
    Left = 176
    Top = 123
    Width = 169
    Height = 31
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'sssssss1'
  end
  object Edit2: TEdit
    Left = 176
    Top = 180
    Width = 169
    Height = 31
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    Text = 'sssssss'
  end
  object Button1: TButton
    Left = 176
    Top = 224
    Width = 145
    Height = 25
    Caption = #1042#1086#1081#1090#1080
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 224
    Width = 129
    Height = 25
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    TabOrder = 4
    OnClick = Button2Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\'#1050#1091 +
      #1088#1089#1086#1074#1072#1103'\1111.mdb;Mode=Share Deny None;Persist Security Info=False' +
      ';Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLE' +
      'DB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Databa' +
      'se Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:' +
      'Global Bulk Transactions=1;Jet OLEDB:New Database Password="";Je' +
      't OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=' +
      'False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Com' +
      'pact Without Replica Repair=False;Jet OLEDB:SFP=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'MSDAOSP'
    Left = 40
  end
  object DataSource1: TDataSource
    Left = 296
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *FROM AGENT')
    Left = 8
  end
end
