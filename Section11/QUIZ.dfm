object Form1: TForm1
  Left = 234
  Top = 251
  Width = 433
  Height = 308
  Caption = 'QUIZ'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 22
    Height = 13
    Caption = #47928#51228
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 226
    Width = 417
    Height = 23
    Panels = <>
    SimplePanel = True
  end
  object Memo1: TMemo
    Left = 40
    Top = 24
    Width = 313
    Height = 89
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 120
    Width = 75
    Height = 25
    Caption = #48372#44592'1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 152
    Width = 75
    Height = 25
    Caption = #48372#44592'2'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 40
    Top = 184
    Width = 75
    Height = 25
    Caption = #48372#44592'3'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 128
    Top = 120
    Width = 225
    Height = 25
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = 'Panel1'
    TabOrder = 5
  end
  object Panel2: TPanel
    Left = 128
    Top = 152
    Width = 225
    Height = 25
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = 'Panel2'
    TabOrder = 6
  end
  object Panel3: TPanel
    Left = 128
    Top = 184
    Width = 225
    Height = 25
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = 'Panel3'
    TabOrder = 7
  end
  object MainMenu1: TMainMenu
    Left = 368
    Top = 136
    object N1: TMenuItem
      Caption = #44172#51076
      object N2: TMenuItem
        Caption = #49884#51089
        ShortCut = 16465
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #45149
        ShortCut = 16472
        OnClick = N3Click
      end
    end
  end
end
