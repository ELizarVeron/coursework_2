object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 369
  ClientWidth = 640
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
    Width = 311
    Height = 25
    Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1087#1088#1080#1086#1088#1080#1090#1077#1090#1072
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
    Left = 56
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
        FieldName = 'login manager'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'change'
        Width = 121
        Visible = True
      end>
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1050#1091#1088#1089#1086#1074#1072#1103'\Databas' +
      'e2.mdb;Persist Security Info=False'
    CursorType = ctStatic
    TableName = 'History_of_priority'
    Left = 464
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 544
    Top = 88
  end
end
