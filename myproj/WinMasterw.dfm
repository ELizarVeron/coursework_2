object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 572
  ClientWidth = 649
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
    Width = 633
    Height = 506
    ActivePage = Agents
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
        Left = 3
        Top = 53
        Width = 606
        Height = 605
        TabOrder = 0
        inline Frame71: TFrame7
          Left = 0
          Top = 0
          Width = 605
          Height = 50
          TabOrder = 0
          inherited Panel1: TPanel
            Left = -3
            Top = -47
            ExplicitLeft = -3
            ExplicitTop = -47
            inherited Sortirovka: TComboBox
              Left = 179
              OnChange = nil
              ExplicitLeft = 179
            end
            inherited Filtr: TComboBox
              OnChange = nil
            end
          end
        end
      end
      inline Frame72: TFrame7
        Left = 11
        Top = -3
        Width = 605
        Height = 50
        TabOrder = 1
        ExplicitLeft = 11
        ExplicitTop = -3
        inherited Panel1: TPanel
          Left = -24
          Top = 9
          Width = 609
          ExplicitLeft = -24
          ExplicitTop = 9
          ExplicitWidth = 609
          inherited Edit1: TEdit
            Left = 27
            ExplicitLeft = 27
          end
          inherited Sortirovka: TComboBox
            OnChange = nil
          end
          inherited Filtr: TComboBox
            Left = 386
            OnChange = nil
            ExplicitLeft = 386
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
        Top = 40
        Width = 625
        Height = 490
        TabOrder = 0
      end
    end
    object Requests: TTabSheet
      Caption = #1047#1072#1103#1074#1082#1080
      ImageIndex = 2
      object Panel6: TPanel
        Left = 0
        Top = 179
        Width = 625
        Height = 471
        TabOrder = 0
      end
    end
    object Productions: TTabSheet
      Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      ImageIndex = 3
      object Panel7: TPanel
        Left = -3
        Top = 48
        Width = 625
        Height = 434
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 152
    Top = 504
    Width = 193
    Height = 41
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 8
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
      Left = 45
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
      Left = 108
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
      Left = 125
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
