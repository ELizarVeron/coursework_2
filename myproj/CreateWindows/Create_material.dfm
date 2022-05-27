object Form21: TForm21
  Left = 0
  Top = 0
  Caption = 'Form21'
  ClientHeight = 270
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 226
    Height = 19
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 77
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label4: TLabel
    Left = 48
    Top = 117
    Width = 88
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072' '#1077#1076'.'
  end
  object Edit_name: TEdit
    Left = 148
    Top = 74
    Width = 154
    Height = 21
    TabOrder = 0
  end
  object Edit_Cost: TEdit
    Left = 147
    Top = 109
    Width = 155
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object Button1: TButton
    Left = 184
    Top = 168
    Width = 118
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 46
    Top = 168
    Width = 115
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 168
    Top = 224
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 352
    Top = 40
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1050#1091#1088#1089#1086#1074#1072#1103'\1111.md' +
      'b;Persist Security Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 352
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 352
    Top = 160
  end
end
