object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 513
  ClientWidth = 633
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
    Height = 454
    ActivePage = Productions
    TabOrder = 0
    OnChange = PageControl1Change
    object Agents: TTabSheet
      Caption = #1040#1075#1077#1085#1090#1099
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 606
        Height = 329
        TabOrder = 0
      end
    end
    object Suppliers: TTabSheet
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 1
        Width = 625
        Height = 366
        TabOrder = 0
      end
    end
    object Requests: TTabSheet
      Caption = #1047#1072#1103#1074#1082#1080
      ImageIndex = 2
      object Panel6: TPanel
        Left = 0
        Top = 3
        Width = 625
        Height = 366
        TabOrder = 0
      end
    end
    object Productions: TTabSheet
      Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      ImageIndex = 3
      object Panel7: TPanel
        Left = -4
        Top = 0
        Width = 625
        Height = 382
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 224
    Top = 448
    Width = 193
    Height = 57
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 24
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
      Top = 24
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
      Top = 24
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
      Top = 24
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
      Top = 24
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
      Top = 24
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