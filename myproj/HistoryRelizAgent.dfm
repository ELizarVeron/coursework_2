object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 646
  ClientWidth = 635
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
    Left = 64
    Top = 16
    Width = 280
    Height = 25
    Caption = #1048#1089#1090#1086#1088#1080#1103' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1072#1075#1077#1085#1090#1072' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 64
    Top = 120
    Width = 182
    Height = 13
    Caption = #1059#1087#1089'...'#1047#1076#1077#1089#1100' '#1087#1086#1082#1072' '#1077#1097#1077' '#1085#1080#1095#1077#1075#1086' '#1085#1077#1090'...'
  end
  object DBGrid1: TDBGrid
    Left = 48
    Top = 84
    Width = 401
    Height = 136
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Date'
        Title.Caption = #1044#1072#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product Name'
        Title.Caption = #1053#1072#1080#1084#1077#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Articul Product'
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Count'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1074#1090#1086
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 24
    Top = 252
    Width = 185
    Height = 33
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 252
    Width = 185
    Height = 33
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1050#1091#1088#1089#1086#1074#1072#1103'\Databas' +
      'e2.mdb;Persist Security Info=False'
    CursorType = ctStatic
    TableName = 'History_of_reliz'
    Left = 376
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 448
    Top = 16
  end
end
