object Form4: TForm4
  Left = 2
  Top = 2
  BorderStyle = bsSingle
  Caption = '\'
  ClientHeight = 785
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsUnderline]
  Position = poDefault
  OnClose = FormClose
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 889
    Height = 777
    ActivePage = Suppliers
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Agents: TTabSheet
      Caption = #1040#1075#1077#1085#1090#1099
      object Panel1: TPanel
        Left = 3
        Top = 49
        Width = 563
        Height = 624
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
      object Panel9: TPanel
        Left = 3
        Top = 2
        Width = 566
        Height = 41
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object Edit_Agent: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = Edit1Change
        end
        object Sort_Agent: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filtr_Agent: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
        end
        object Button1: TButton
          Left = 450
          Top = 11
          Width = 115
          Height = 21
          Caption = #1044#1086#1072#1073#1074#1080#1090#1100
          TabOrder = 3
          OnClick = Button1Click
        end
      end
      inline Navigator_Agent_Frame: TFrame10
        Left = 168
        Top = 672
        Width = 185
        Height = 41
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        ExplicitLeft = 168
        ExplicitTop = 672
        ExplicitWidth = 185
        ExplicitHeight = 41
        inherited Panel2: TPanel
          Left = 0
          Top = 0
          Width = 185
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 185
          inherited LeftLabel: TLabel
            Top = 7
            OnClick = NavigatorFrameLeftLabelClick
            ExplicitTop = 7
          end
          inherited Label_1: TLabel
            OnClick = NavigatorFrameLabel_1Click
          end
          inherited Label_2: TLabel
            OnClick = NavigatorFrameLabel_2Click
          end
          inherited Label_3: TLabel
            OnClick = NavigatorFrameLabel_3Click
          end
          inherited Label_4: TLabel
            OnClick = NavigatorFrameLabel_4Click
          end
          inherited RightLabel: TLabel
            OnClick = NavigatorFrameRightLabelClick
          end
          inherited no_line: TLabel
            Left = 142
            Top = 7
            ExplicitLeft = 142
            ExplicitTop = 7
          end
          inherited line: TLabel
            Left = 142
            Top = 26
            Width = 16
            Height = 13
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            ExplicitLeft = 142
            ExplicitTop = 26
            ExplicitWidth = 16
            ExplicitHeight = 13
          end
        end
      end
    end
    object Suppliers: TTabSheet
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      OnContextPopup = SuppliersContextPopup
      object Panel3: TPanel
        Left = 3
        Top = 49
        Width = 563
        Height = 624
        BevelOuter = bvNone
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 3
        Top = 2
        Width = 566
        Height = 41
        BevelOuter = bvNone
        TabOrder = 1
        object Edit_Sup: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = Edit1Change
        end
        object Sort_Sup: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filter_Sup: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
        end
        object Button2: TButton
          Left = 450
          Top = 11
          Width = 115
          Height = 21
          Caption = #1044#1086#1072#1073#1074#1080#1090#1100
          TabOrder = 3
          OnClick = Button2Click
        end
      end
      inline Navigator_Supplier_Frame: TFrame10
        Left = 168
        Top = 672
        Width = 185
        Height = 41
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        ExplicitLeft = 168
        ExplicitTop = 672
        ExplicitWidth = 185
        ExplicitHeight = 41
        inherited Panel2: TPanel
          Left = 0
          Top = 0
          Width = 185
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 185
          inherited LeftLabel: TLabel
            OnClick = NavigatorFrameLeftLabelClick
          end
          inherited Label_1: TLabel
            OnClick = NavigatorFrameLabel_1Click
          end
          inherited Label_2: TLabel
            OnClick = NavigatorFrameLabel_2Click
          end
          inherited Label_3: TLabel
            OnClick = NavigatorFrameLabel_3Click
          end
          inherited Label_4: TLabel
            OnClick = NavigatorFrameLabel_4Click
          end
          inherited RightLabel: TLabel
            OnClick = NavigatorFrameRightLabelClick
          end
          inherited line: TLabel
            Width = 16
            Height = 13
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            ExplicitWidth = 16
            ExplicitHeight = 13
          end
        end
      end
    end
    object Requests: TTabSheet
      Caption = #1047#1072#1103#1074#1082#1080
      ImageIndex = 2
      object Panel5: TPanel
        Left = 3
        Top = 2
        Width = 566
        Height = 41
        BevelOuter = bvNone
        TabOrder = 0
        object Edit_Req: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = Edit1Change
        end
        object Sort_Req: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filter_Req: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
        end
        object Button3: TButton
          Left = 450
          Top = 11
          Width = 115
          Height = 21
          Caption = #1057#1086#1079#1076#1072#1090#1100
          TabOrder = 3
          OnClick = Button3Click
        end
      end
      inline Navigator_Request_Frame: TFrame10
        Left = 168
        Top = 672
        Width = 185
        Height = 41
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        ExplicitLeft = 168
        ExplicitTop = 672
        ExplicitWidth = 185
        ExplicitHeight = 41
        inherited Panel2: TPanel
          Left = 0
          Top = 0
          Width = 185
          Align = alClient
          BevelOuter = bvNone
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 185
          inherited LeftLabel: TLabel
            OnClick = NavigatorFrameLeftLabelClick
          end
          inherited Label_1: TLabel
            OnClick = NavigatorFrameLabel_1Click
          end
          inherited Label_2: TLabel
            OnClick = NavigatorFrameLabel_2Click
          end
          inherited Label_3: TLabel
            OnClick = NavigatorFrameLabel_3Click
          end
          inherited Label_4: TLabel
            OnClick = NavigatorFrameLabel_4Click
          end
          inherited RightLabel: TLabel
            Top = 7
            OnClick = NavigatorFrameRightLabelClick
            ExplicitTop = 7
          end
          inherited line: TLabel
            Left = 142
            Top = 27
            Width = 16
            Height = 13
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            ExplicitLeft = 142
            ExplicitTop = 27
            ExplicitWidth = 16
            ExplicitHeight = 13
          end
        end
      end
      object Panel6: TPanel
        Left = 3
        Top = 49
        Width = 563
        Height = 624
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
    object Productions: TTabSheet
      Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      ImageIndex = 3
      object Panel7: TPanel
        Left = 3
        Top = 50
        Width = 563
        Height = 624
        BevelOuter = bvNone
        TabOrder = 0
      end
      object Panel8: TPanel
        Left = 3
        Top = 2
        Width = 566
        Height = 41
        BevelOuter = bvNone
        TabOrder = 1
        object Edit_Prod: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = Edit1Change
        end
        object Sort_Prod: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filter_Prod: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
        end
        object Button4: TButton
          Left = 450
          Top = 11
          Width = 115
          Height = 21
          Caption = #1044#1086#1072#1073#1074#1080#1090#1100
          TabOrder = 3
          OnClick = Button4Click
        end
      end
      inline Navigator_Production_Frame: TFrame10
        Left = 168
        Top = 672
        Width = 185
        Height = 41
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        ExplicitLeft = 168
        ExplicitTop = 672
        ExplicitWidth = 185
        ExplicitHeight = 41
        inherited Panel2: TPanel
          Left = 0
          Top = 0
          Width = 185
          Align = alClient
          BevelOuter = bvNone
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 185
          inherited LeftLabel: TLabel
            OnClick = NavigatorFrameLeftLabelClick
          end
          inherited Label_1: TLabel
            OnClick = NavigatorFrameLabel_1Click
          end
          inherited Label_2: TLabel
            OnClick = NavigatorFrameLabel_2Click
          end
          inherited Label_3: TLabel
            OnClick = NavigatorFrameLabel_3Click
          end
          inherited Label_4: TLabel
            OnClick = NavigatorFrameLabel_4Click
          end
          inherited RightLabel: TLabel
            OnClick = NavigatorFrameRightLabelClick
          end
          inherited line: TLabel
            Width = 16
            Height = 13
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            ExplicitWidth = 16
            ExplicitHeight = 13
          end
        end
      end
    end
  end
end
