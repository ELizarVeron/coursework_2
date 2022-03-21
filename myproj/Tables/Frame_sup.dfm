object Frame5: TFrame5
  Left = 0
  Top = 0
  Width = 563
  Height = 96
  TabOrder = 0
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 557
    Height = 90
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 4
    BorderStyle = bsSingle
    Color = clHighlightText
    ParentBackground = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnClick = Panel1Click
    object Label2: TLabel
      Tag = 1
      Left = 40
      Top = 8
      Width = 153
      Height = 14
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 40
      Top = 28
      Width = 22
      Height = 13
      Caption = #1058#1080#1087':'
    end
    object Label4: TLabel
      Left = 123
      Top = 28
      Width = 31
      Height = 13
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 41
      Top = 47
      Width = 21
      Height = 13
      Caption = #1048#1053#1053
    end
    object Label6: TLabel
      Left = 123
      Top = 47
      Width = 31
      Height = 13
      Caption = 'Label6'
    end
    object Label10: TLabel
      Left = 312
      Top = 9
      Width = 45
      Height = 13
      Caption = #1056#1077#1081#1090#1080#1085#1075':'
    end
    object Label11: TLabel
      Left = 363
      Top = 9
      Width = 4
      Height = 13
      Caption = '-'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 459
    Top = 27
    object N1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
      OnClick = N1Click
    end
  end
end
