object Form4: TForm4
  Left = 2
  Top = 2
  Caption = '\'
  ClientHeight = 775
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsUnderline]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = -5
    Width = 889
    Height = 777
    ActivePage = Agents
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
        Left = 0
        Top = 49
        Width = 566
        Height = 624
        BevelOuter = bvNone
        Color = clMoneyGreen
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
          Left = 296
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
          Left = 448
          Top = 11
          Width = 115
          Height = 24
          Caption = #1044#1086#1072#1073#1074#1080#1090#1100
          TabOrder = 3
        end
      end
      inline Navigator_Agent_Frame: TFrame10
        Left = 176
        Top = 679
        Width = 220
        Height = 72
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        ExplicitLeft = 176
        ExplicitTop = 679
        inherited Panel2: TPanel
          Left = 0
          Top = 28
          BevelOuter = bvNone
          Color = clGradientInactiveCaption
          ParentBackground = False
          ExplicitLeft = 0
          ExplicitTop = 28
          inherited LeftLabel: TLabel
            OnClick = Navigator_Agent_FrameLeftLabelClick
          end
          inherited Label_1: TLabel
            OnClick = Navigator_Agent_FrameLabel_1Click
          end
          inherited Label_2: TLabel
            OnClick = Navigator_Agent_FrameLabel_2Click
          end
          inherited Label_3: TLabel
            OnClick = Navigator_Agent_FrameLabel_3Click
          end
          inherited Label_4: TLabel
            OnClick = Navigator_Agent_FrameLabel_4Click
          end
          inherited RightLabel: TLabel
            OnClick = Navigator_Agent_FrameRightLabelClick
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
      object Panel3: TPanel
        Left = 3
        Top = 49
        Width = 566
        Height = 624
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 3
        Top = 2
        Width = 566
        Height = 41
        TabOrder = 1
        object Edit_Sup: TEdit
          Left = 0
          Top = 8
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = Edit1Change
        end
        object Sort_Sup: TComboBox
          Left = 146
          Top = 8
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filter_Sup: TComboBox
          Left = 297
          Top = 8
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
        end
        object Button2: TButton
          Left = 451
          Top = 8
          Width = 115
          Height = 24
          Caption = #1044#1086#1072#1073#1074#1080#1090#1100
          TabOrder = 3
        end
      end
      inline Navigator_Supplier_Frame: TFrame10
        Left = 176
        Top = 640
        Width = 220
        Height = 72
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        ExplicitLeft = 176
        ExplicitTop = 640
        inherited Panel2: TPanel
          Left = 3
          ExplicitLeft = 3
          inherited Label_1: TLabel
            OnClick = Navigator_Agent_FrameLabel_1Click
          end
          inherited Label_2: TLabel
            OnClick = Navigator_Agent_FrameLabel_2Click
          end
          inherited Label_3: TLabel
            OnClick = Navigator_Agent_FrameLabel_3Click
          end
          inherited Label_4: TLabel
            OnClick = Navigator_Agent_FrameLabel_4Click
          end
          inherited RightLabel: TLabel
            OnClick = Navigator_Agent_FrameRightLabelClick
          end
        end
      end
    end
    object Requests: TTabSheet
      Caption = #1047#1072#1103#1074#1082#1080
      ImageIndex = 2
      object Panel6: TPanel
        Left = 0
        Top = 49
        Width = 566
        Height = 624
        TabOrder = 0
        inline Frame91: TFrame9
          Left = 0
          Top = 0
          Width = 461
          Height = 116
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 2
        Width = 566
        Height = 41
        TabOrder = 1
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
          Left = 148
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filter_Req: TComboBox
          Left = 294
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
          Left = 448
          Top = 11
          Width = 115
          Height = 24
          Caption = #1057#1086#1079#1076#1072#1090#1100
          TabOrder = 3
          OnClick = Button3Click
        end
      end
      inline Navigator_Request_Frame: TFrame10
        Left = 176
        Top = 687
        Width = 220
        Height = 72
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        ExplicitLeft = 176
        ExplicitTop = 687
        inherited Panel2: TPanel
          inherited RightLabel: TLabel
            OnClick = Navigator_Agent_FrameRightLabelClick
          end
        end
      end
    end
    object Productions: TTabSheet
      Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      ImageIndex = 3
      object Panel7: TPanel
        Left = 3
        Top = 49
        Width = 566
        Height = 624
        TabOrder = 0
      end
      object Panel8: TPanel
        Left = 3
        Top = 3
        Width = 566
        Height = 41
        TabOrder = 1
        object Edit_Prod: TEdit
          Left = 0
          Top = 11
          Width = 142
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = Edit1Change
        end
        object Sort_Prod: TComboBox
          Left = 156
          Top = 11
          Width = 149
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filter_Prod: TComboBox
          Left = 311
          Top = 11
          Width = 138
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
        end
        object Button4: TButton
          Left = 451
          Top = 11
          Width = 115
          Height = 24
          Caption = #1044#1086#1072#1073#1074#1080#1090#1100
          TabOrder = 3
        end
      end
      inline Navigator_Production_Frame: TFrame10
        Left = 136
        Top = 656
        Width = 220
        Height = 72
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        ExplicitLeft = 136
        ExplicitTop = 656
        inherited Panel2: TPanel
          inherited Label_1: TLabel
            OnClick = Navigator_Agent_FrameLabel_1Click
          end
          inherited Label_2: TLabel
            OnClick = Navigator_Agent_FrameLabel_2Click
          end
          inherited Label_3: TLabel
            OnClick = Navigator_Agent_FrameLabel_3Click
          end
          inherited Label_4: TLabel
            OnClick = Navigator_Agent_FrameLabel_4Click
          end
          inherited RightLabel: TLabel
            OnClick = Navigator_Agent_FrameRightLabelClick
          end
        end
      end
    end
  end
end