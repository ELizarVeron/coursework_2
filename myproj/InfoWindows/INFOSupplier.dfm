object Form19: TForm19
  Left = 0
  Top = 0
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1077
  ClientHeight = 415
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 13
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
  object Label1: TLabel
    Left = 366
    Top = 40
    Width = 133
    Height = 13
    Caption = #1055#1086#1089#1090#1072#1074#1083#1103#1077#1084#1099#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
  end
  object Edit_name: TEdit
    Left = 30
    Top = 33
    Width = 195
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
  object ListBox1: TListBox
    Left = 366
    Top = 70
    Width = 211
    Height = 294
    ItemHeight = 13
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 20
    Top = 244
    Width = 301
    Height = 120
    TabOrder = 5
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
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Material'
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Count'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1077#1076'.'
        Width = 80
        Visible = True
      end>
  end
end
