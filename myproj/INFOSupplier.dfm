object Form19: TForm19
  Left = 0
  Top = 0
  Caption = 'Form19'
  ClientHeight = 393
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 28
    Top = 36
    Width = 100
    Height = 18
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 28
    Top = 73
    Width = 26
    Height = 18
    Caption = #1058#1080#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 30
    Top = 113
    Width = 30
    Height = 18
    Caption = #1048#1053#1053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 30
    Top = 153
    Width = 54
    Height = 18
    Caption = #1056#1077#1081#1090#1080#1085#1075
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 30
    Top = 208
    Width = 103
    Height = 14
    Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1086#1089#1090#1072#1074#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit_name: TEdit
    Left = 152
    Top = 33
    Width = 121
    Height = 21
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    Text = '-'
  end
  object Edit_type: TEdit
    Left = 104
    Top = 70
    Width = 121
    Height = 21
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 1
    Text = '-'
  end
  object Edit_inn: TEdit
    Left = 104
    Top = 110
    Width = 121
    Height = 21
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 2
    Text = '-'
  end
  object Edit_rate: TEdit
    Left = 171
    Top = 150
    Width = 54
    Height = 21
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 3
    Text = '-'
  end
  object DBGrid1: TDBGrid
    Left = 20
    Top = 244
    Width = 389
    Height = 120
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Data'
        Title.Caption = #1044#1072#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Material'
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Count'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1077#1076'.'
        Width = 137
        Visible = True
      end>
  end
  object ADOTable2: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1050#1091#1088#1089#1086#1074#1072#1103'\1111.md' +
      'b;Persist Security Info=False'
    CursorType = ctStatic
    TableName = 'History_of_reliz'
    Left = 384
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOTable2
    Left = 448
    Top = 16
  end
end
