object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Form3'
  ClientHeight = 738
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 606
    Height = 738
    ActivePage = TabMan
    Align = alClient
    DoubleBuffered = True
    HotTrack = True
    ParentDoubleBuffered = False
    TabOrder = 0
    object TabMan: TTabSheet
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
      inline Navigator_Manufacture: TFrame10
        Left = 224
        Top = 568
        Width = 220
        Height = 72
        TabOrder = 0
        ExplicitLeft = 224
        ExplicitTop = 568
        inherited Panel2: TPanel
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
            ExplicitWidth = 16
            ExplicitHeight = 13
          end
        end
      end
      object Panel_manufacture: TPanel
        Left = 16
        Top = 64
        Width = 575
        Height = 498
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
      object PanelUpMan: TPanel
        Left = 3
        Top = 0
        Width = 566
        Height = 41
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object Edit_Agent: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
        end
        object Sort_man: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
        end
        object Filtr_man: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
        end
        object Button1: TButton
          Left = 450
          Top = 11
          Width = 115
          Height = 21
          Caption = #1044#1086#1072#1073#1074#1080#1090#1100
          TabOrder = 3
        end
      end
    end
    object TabReq: TTabSheet
      Caption = #1047#1072#1082#1072#1079' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      ImageIndex = 1
      object Panel_request_sup: TPanel
        Left = 3
        Top = 50
        Width = 591
        Height = 506
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
      inline Navigator_Req: TFrame10
        Left = 232
        Top = 571
        Width = 220
        Height = 72
        TabOrder = 1
        ExplicitLeft = 232
        ExplicitTop = 571
        inherited Panel2: TPanel
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
            ExplicitWidth = 16
            ExplicitHeight = 13
          end
        end
      end
      object PanelUpReqSup: TPanel
        Left = 3
        Top = 3
        Width = 566
        Height = 41
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object Edit1: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
        end
        object ComboBox1: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
        end
        object ComboBox2: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
        end
        object ButtonAddRequest: TButton
          Left = 446
          Top = 11
          Width = 115
          Height = 21
          Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1082#1072#1079
          TabOrder = 3
          OnClick = ButtonAddRequestClick
        end
      end
    end
    object TabProd: TTabSheet
      Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      ImageIndex = 3
      inline Navigator_Production: TFrame10
        Left = 184
        Top = 568
        Width = 220
        Height = 72
        TabOrder = 0
        ExplicitLeft = 184
        ExplicitTop = 568
        inherited Panel2: TPanel
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
            ExplicitWidth = 16
            ExplicitHeight = 13
          end
        end
      end
      object Panel_production: TPanel
        Left = 0
        Top = 83
        Width = 568
        Height = 482
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
      object PanelUpProd: TPanel
        Left = 3
        Top = 0
        Width = 566
        Height = 41
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object Edit_Prod: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
        end
        object Sort_Prod: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
        end
        object Filter_prod: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
        end
      end
    end
    object TabMat: TTabSheet
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      ImageIndex = 2
      object Panel_MAterials: TPanel
        Left = 3
        Top = 55
        Width = 566
        Height = 466
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
      object PanelUpMat: TPanel
        Left = 11
        Top = 8
        Width = 566
        Height = 41
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object Edit2: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
        end
        object ComboBox3: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
        end
        object ComboBox4: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
        end
      end
      inline Navigator_Material: TFrame10
        Left = 192
        Top = 571
        Width = 220
        Height = 72
        TabOrder = 2
        ExplicitLeft = 192
        ExplicitTop = 571
        inherited Panel2: TPanel
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
            ExplicitWidth = 16
            ExplicitHeight = 13
          end
        end
      end
    end
  end
end
