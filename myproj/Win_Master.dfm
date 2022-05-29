object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  ClientHeight = 634
  ClientWidth = 613
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
    Width = 613
    Height = 634
    ActivePage = TabProd
    Align = alClient
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    OnChange = PageControl1Change
    object TabMan: TTabSheet
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
      inline Navigator_Manufacture: TFrame10
        Left = 177
        Top = 550
        Width = 160
        Height = 42
        Color = clGray
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        ExplicitLeft = 177
        ExplicitTop = 550
        ExplicitWidth = 160
        ExplicitHeight = 42
        inherited Panel2: TPanel
          Left = 0
          Top = 0
          Width = 160
          Height = 42
          Align = alClient
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 160
          ExplicitHeight = 42
          inherited LeftLabel: TLabel
            Left = 16
            Width = 14
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLeftLabelClick
            ExplicitLeft = 16
            ExplicitWidth = 14
            ExplicitHeight = 23
          end
          inherited Label_1: TLabel
            Left = 40
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_1Click
            ExplicitLeft = 40
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_2: TLabel
            Left = 64
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_2Click
            ExplicitLeft = 64
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_3: TLabel
            Left = 88
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_3Click
            ExplicitLeft = 88
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_4: TLabel
            Left = 112
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_4Click
            ExplicitLeft = 112
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited RightLabel: TLabel
            Left = 132
            Width = 14
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameRightLabelClick
            ExplicitLeft = 132
            ExplicitWidth = 14
            ExplicitHeight = 23
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
        Left = 3
        Top = 38
        Width = 630
        Height = 514
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
      end
      object PanelUpMan: TPanel
        Left = 3
        Top = 0
        Width = 630
        Height = 41
        BevelOuter = bvNone
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 2
        object Edit_Man: TEdit
          Left = 4
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = EditsChange
        end
        object Sort_man: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = EditsChange
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
          OnChange = EditsChange
        end
        object Button1: TButton
          Left = 454
          Top = 11
          Width = 115
          Height = 21
          Caption = #1044#1086#1072#1073#1074#1080#1090#1100
          TabOrder = 3
          Visible = False
        end
      end
    end
    object TabReq: TTabSheet
      Caption = #1047#1072#1082#1072#1079' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Panel_request_sup: TPanel
        Left = 3
        Top = 41
        Width = 630
        Height = 511
        BevelOuter = bvNone
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      inline Navigator_Req: TFrame10
        Left = 177
        Top = 550
        Width = 161
        Height = 42
        Color = clAppWorkSpace
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        ExplicitLeft = 177
        ExplicitTop = 550
        ExplicitWidth = 161
        ExplicitHeight = 42
        inherited Panel2: TPanel
          Left = 0
          Top = 0
          Width = 161
          Height = 42
          Align = alClient
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 161
          ExplicitHeight = 42
          inherited LeftLabel: TLabel
            Left = 16
            Width = 14
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLeftLabelClick
            ExplicitLeft = 16
            ExplicitWidth = 14
            ExplicitHeight = 23
          end
          inherited Label_1: TLabel
            Left = 40
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_1Click
            ExplicitLeft = 40
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_2: TLabel
            Left = 64
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_2Click
            ExplicitLeft = 64
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_3: TLabel
            Left = 88
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_3Click
            ExplicitLeft = 88
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_4: TLabel
            Left = 112
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_4Click
            ExplicitLeft = 112
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited RightLabel: TLabel
            Left = 130
            Width = 14
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameRightLabelClick
            ExplicitLeft = 130
            ExplicitWidth = 14
            ExplicitHeight = 23
          end
          inherited line: TLabel
            Top = 27
            Width = 29
            Height = 23
            ExplicitTop = 27
            ExplicitWidth = 29
            ExplicitHeight = 23
          end
        end
      end
      object PanelUpReqSup: TPanel
        Left = 3
        Top = 3
        Width = 630
        Height = 41
        BevelOuter = bvNone
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 2
        object Edit_req: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = EditsChange
        end
        object Sort_req: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = EditsChange
        end
        object Filtr_req: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = EditsChange
        end
        object ButtonAddRequest: TButton
          Left = 446
          Top = 11
          Width = 115
          Height = 21
          Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1082#1072#1079
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = ButtonAddRequestClick
        end
      end
    end
    object TabProd: TTabSheet
      Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      ImageIndex = 3
      inline Navigator_Production: TFrame10
        Left = 177
        Top = 550
        Width = 161
        Height = 41
        Color = clActiveBorder
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        ExplicitLeft = 177
        ExplicitTop = 550
        ExplicitWidth = 161
        ExplicitHeight = 41
        inherited Panel2: TPanel
          Left = 0
          Top = 0
          Width = 161
          Align = alClient
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 161
          inherited LeftLabel: TLabel
            Left = 16
            Width = 14
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLeftLabelClick
            ExplicitLeft = 16
            ExplicitWidth = 14
            ExplicitHeight = 23
          end
          inherited Label_1: TLabel
            Left = 40
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_1Click
            ExplicitLeft = 40
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_2: TLabel
            Left = 64
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_2Click
            ExplicitLeft = 64
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_3: TLabel
            Left = 88
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_3Click
            ExplicitLeft = 88
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_4: TLabel
            Left = 112
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_4Click
            ExplicitLeft = 112
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited RightLabel: TLabel
            Left = 130
            Width = 14
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameRightLabelClick
            ExplicitLeft = 130
            ExplicitWidth = 14
            ExplicitHeight = 23
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
        Left = 1
        Top = 38
        Width = 630
        Height = 514
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
      end
      object PanelUpProd: TPanel
        Left = 3
        Top = 0
        Width = 630
        Height = 41
        BevelOuter = bvNone
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 2
        object Edit_Prod: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = EditsChange
        end
        object Sort_Prod: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = EditsChange
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
          Visible = False
          OnChange = EditsChange
        end
      end
    end
    object TabMat: TTabSheet
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      ImageIndex = 2
      object Panel_MAterials: TPanel
        Left = 3
        Top = 41
        Width = 630
        Height = 511
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
      end
      object PanelUpMat: TPanel
        Left = 3
        Top = 3
        Width = 630
        Height = 41
        BevelOuter = bvNone
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 1
        object Edit_mat: TEdit
          Left = 0
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = EditsChange
        end
        object Sort_mat: TComboBox
          Left = 150
          Top = 11
          Width = 140
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          Visible = False
          OnChange = EditsChange
        end
        object Filtr_mat: TComboBox
          Left = 300
          Top = 11
          Width = 140
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          Visible = False
          OnChange = EditsChange
        end
        object Button2: TButton
          Left = 446
          Top = 7
          Width = 131
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 3
          OnClick = Button2Click
        end
      end
      inline Navigator_Material: TFrame10
        Left = 177
        Top = 550
        Width = 161
        Height = 38
        Color = clActiveBorder
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        ExplicitLeft = 177
        ExplicitTop = 550
        ExplicitWidth = 161
        ExplicitHeight = 38
        inherited Panel2: TPanel
          Left = 0
          Top = 0
          Width = 161
          Height = 38
          Align = alClient
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 161
          ExplicitHeight = 38
          inherited LeftLabel: TLabel
            Left = 16
            Width = 14
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLeftLabelClick
            ExplicitLeft = 16
            ExplicitWidth = 14
            ExplicitHeight = 23
          end
          inherited Label_1: TLabel
            Left = 40
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_1Click
            ExplicitLeft = 40
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_2: TLabel
            Left = 64
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_2Click
            ExplicitLeft = 64
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_3: TLabel
            Left = 88
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_3Click
            ExplicitLeft = 88
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited Label_4: TLabel
            Left = 112
            Width = 10
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameLabel_4Click
            ExplicitLeft = 112
            ExplicitWidth = 10
            ExplicitHeight = 23
          end
          inherited RightLabel: TLabel
            Left = 130
            Width = 14
            Height = 23
            Font.Height = -19
            OnClick = NavigatorFrameRightLabelClick
            ExplicitLeft = 130
            ExplicitWidth = 14
            ExplicitHeight = 23
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
