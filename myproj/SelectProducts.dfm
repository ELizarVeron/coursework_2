object Form10: TForm10
  Left = 0
  Top = 0
  Caption = 'Form10'
  ClientHeight = 454
  ClientWidth = 956
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
    Left = 32
    Top = 32
    Width = 237
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 147
    Width = 55
    Height = 13
    Caption = #1042' '#1085#1072#1083#1080#1095#1080#1080':'
  end
  object Label2: TLabel
    Left = 32
    Top = 178
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 104
    Top = 147
    Width = 4
    Height = 13
    Caption = '-'
  end
  object Label5: TLabel
    Left = 32
    Top = 184
    Width = 64
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object ComboBox1: TComboBox
    Left = 32
    Top = 104
    Width = 166
    Height = 21
    TabOrder = 0
    Text = '-'
    OnChange = ComboBox1Change
  end
  object Edit1: TEdit
    Left = 112
    Top = 181
    Width = 49
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    Text = ' '
  end
  object ListBox1: TListBox
    Left = 261
    Top = 104
    Width = 204
    Height = 93
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 2
  end
  object Button1: TButton
    Left = 24
    Top = 224
    Width = 174
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 261
    Top = 224
    Width = 92
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 374
    Top = 224
    Width = 91
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 5
    OnClick = Button3Click
  end
  object ListBox2: TListBox
    Left = 664
    Top = 120
    Width = 201
    Height = 217
    ItemHeight = 13
    TabOrder = 6
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1050#1091#1088#1089#1086#1074#1072#1103'\1111.md' +
      'b;Persist Security Info=False'
    CursorType = ctStatic
    TableName = 'Products'
    Left = 384
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 464
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 544
    Top = 48
  end
end
