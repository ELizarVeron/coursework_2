object Form4: TForm4
  Left = 0
  Top = 0
  Caption = '\'
  ClientHeight = 672
  ClientWidth = 905
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
    Top = 0
    Width = 889
    Height = 574
    ActivePage = Productions
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = PageControl1Change
    object Agents: TTabSheet
      Caption = #1040#1075#1077#1085#1090#1099
      object Panel1: TPanel
        Left = 0
        Top = 49
        Width = 550
        Height = 501
        TabOrder = 0
        inline Frame71: TFrame7
          Left = 3
          Top = 0
          Width = 605
          Height = 50
          TabOrder = 0
          ExplicitLeft = 3
          inherited Panel1: TPanel
            Left = -3
            Top = -47
            ExplicitLeft = -3
            ExplicitTop = -47
            inherited Sortirovka: TComboBox
              Left = 179
              ExplicitLeft = 179
            end
          end
        end
      end
      object Panel9: TPanel
        Left = 3
        Top = -3
        Width = 542
        Height = 41
        TabOrder = 1
        object Edit_Agent: TEdit
          Left = 0
          Top = 11
          Width = 142
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = Edit1Change
        end
        object Sort_Agent: TComboBox
          Left = 148
          Top = 11
          Width = 185
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filtr_Agent: TComboBox
          Left = 339
          Top = 14
          Width = 169
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
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
        Top = 47
        Width = 542
        Height = 483
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 3
        Top = 0
        Width = 542
        Height = 41
        TabOrder = 1
        object Edit_Sup: TEdit
          Left = 0
          Top = 11
          Width = 142
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = Edit1Change
        end
        object Sort_Sup: TComboBox
          Left = 148
          Top = 11
          Width = 185
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filter_Sup: TComboBox
          Left = 346
          Top = 11
          Width = 169
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
        end
      end
    end
    object Requests: TTabSheet
      Caption = #1047#1072#1103#1074#1082#1080
      ImageIndex = 2
      object Panel6: TPanel
        Left = 0
        Top = 50
        Width = 537
        Height = 600
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 3
        Top = 3
        Width = 534
        Height = 41
        TabOrder = 1
        object Edit_Req: TEdit
          Left = 0
          Top = 11
          Width = 142
          Height = 21
          TabOrder = 0
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = Edit1Change
        end
        object Sort_Req: TComboBox
          Left = 148
          Top = 11
          Width = 185
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filter_Req: TComboBox
          Left = 355
          Top = 11
          Width = 169
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
        end
      end
    end
    object Productions: TTabSheet
      Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      ImageIndex = 3
      object Panel7: TPanel
        Left = 3
        Top = 50
        Width = 532
        Height = 434
        TabOrder = 0
      end
      object Panel8: TPanel
        Left = 3
        Top = 3
        Width = 526
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
          Width = 185
          Height = 21
          TabOrder = 1
          TextHint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'...'
          OnChange = Edit1Change
        end
        object Filter_Prod: TComboBox
          Left = 347
          Top = 11
          Width = 169
          Height = 21
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TextHint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103'...'
          OnChange = Edit1Change
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 136
    Top = 572
    Width = 193
    Height = 41
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 4
      Width = 15
      Height = 25
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Label1Click
      OnMouseEnter = Label1MouseEnter
      OnMouseLeave = Label1MouseLeave
    end
    object Label2: TLabel
      Left = 53
      Top = 8
      Width = 11
      Height = 25
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label2Click
      OnMouseEnter = Label2MouseEnter
      OnMouseLeave = Label2MouseLeave
    end
    object Label3: TLabel
      Left = 70
      Top = 8
      Width = 11
      Height = 25
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Label3Click
      OnMouseEnter = Label3MouseEnter
      OnMouseLeave = Label3MouseLeave
    end
    object Label4: TLabel
      Left = 87
      Top = 8
      Width = 11
      Height = 25
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Label4Click
      OnMouseEnter = Label4MouseEnter
      OnMouseLeave = Label4MouseLeave
    end
    object Label5: TLabel
      Left = 104
      Top = 8
      Width = 11
      Height = 25
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Label5Click
      OnMouseEnter = Label5MouseEnter
      OnMouseLeave = Label5MouseLeave
    end
    object Label6: TLabel
      Left = 121
      Top = 8
      Width = 15
      Height = 25
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Label6Click
      OnMouseEnter = Label6MouseEnter
      OnMouseLeave = Label6MouseLeave
    end
    object no_line: TLabel
      Left = 160
      Top = 8
      Width = 34
      Height = 13
      Caption = 'no_line'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object line: TLabel
      Left = 160
      Top = 32
      Width = 16
      Height = 13
      Caption = 'line'
      Visible = False
    end
  end
end
