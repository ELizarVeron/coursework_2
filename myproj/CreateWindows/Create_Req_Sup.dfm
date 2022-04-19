object Form23: TForm23
  Left = 0
  Top = 0
  Caption = 'Form23'
  ClientHeight = 366
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 92
    Height = 13
    Caption = #1042#1099#1073#1086#1088'  '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  end
  object Label2: TLabel
    Left = 40
    Top = 77
    Width = 76
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1074#1090#1086' '#1077#1076
  end
  object Label3: TLabel
    Left = 40
    Top = 139
    Width = 100
    Height = 13
    Caption = #1042#1099#1073#1086#1088'  '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
  end
  object Label4: TLabel
    Left = 40
    Top = 104
    Width = 54
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
  end
  object Label5: TLabel
    Left = 152
    Top = 104
    Width = 4
    Height = 13
    Caption = '-'
  end
  object ComboBox1: TComboBox
    Left = 152
    Top = 37
    Width = 129
    Height = 21
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Edit1: TEdit
    Left = 152
    Top = 77
    Width = 129
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnChange = Edit1Change
  end
  object ButtonCreate: TButton
    Left = 224
    Top = 312
    Width = 153
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 2
    OnClick = ButtonCreateClick
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 170
    Width = 337
    Height = 136
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Rate'
        Title.Caption = #1056#1077#1081#1090#1080#1085#1075
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier.Title'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Type'
        Title.Caption = #1058#1080#1087
        Width = 180
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 376
    Top = 56
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1050#1091#1088#1089#1086#1074#1072#1103'\1111.md' +
      'b;Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Supplier.*, Material.Title FROM Supplier  INNER JOIN (Mat' +
        'erial INNER JOIN Materials_from_supplier ON Material.Article = M' +
        'aterials_from_supplier.Article_material) ON Supplier.id = Materi' +
        'als_from_supplier.Id_supplier ')
    Left = 408
    Top = 136
  end
end
