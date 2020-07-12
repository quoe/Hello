object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Hello'
  ClientHeight = 345
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 7
    Top = 8
    Width = 553
    Height = 329
    ActivePage = Учение
    TabOrder = 0
    object Общение: TTabSheet
      Caption = #1054#1073#1097#1077#1085#1080#1077
      ExplicitLeft = 0
      ExplicitTop = 32
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Memo1: TMemo
        Left = 3
        Top = 3
        Width = 539
        Height = 264
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object User_Enter_Text: TEdit
        Left = 3
        Top = 274
        Width = 458
        Height = 24
        TabOrder = 1
        TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090
      end
      object Say: TButton
        Left = 467
        Top = 273
        Width = 75
        Height = 25
        Hint = #1057#1082#1072#1079#1072#1090#1100' '#1095#1090#1086'-'#1085#1080#1073#1091#1076#1100' '#1080#1085#1090#1077#1088#1077#1089#1085#1086#1077
        Caption = #1057#1082#1072#1079#1072#1090#1100
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = SayClick
      end
    end
    object Учение: TTabSheet
      Caption = #1059#1095#1077#1085#1080#1077
      ImageIndex = 1
      ExplicitWidth = 489
      object Teach_Words: TLabeledEdit
        Left = 3
        Top = 24
        Width = 539
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = #1053#1072' '#1089#1083#1086#1074#1072':'
        TabOrder = 0
        TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090#1086#1074#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      end
      object Teach_Answer: TLabeledEdit
        Left = 3
        Top = 64
        Width = 539
        Height = 21
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = #1054#1090#1074#1077#1090#1080#1090#1100' '#1090#1072#1082':'
        TabOrder = 1
        TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090', '#1082#1086#1090#1086#1088#1099#1081' '#1087#1086#1093#1086#1078' '#1085#1072' '#1086#1090#1074#1077#1090' '#1085#1072' '#1089#1090#1088#1086#1082#1091' '#1095#1091#1090#1100' '#1074#1099#1096#1077
      end
      object Memo2: TMemo
        Left = 3
        Top = 146
        Width = 539
        Height = 152
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object GroupBox3: TGroupBox
        Left = 338
        Top = 91
        Width = 204
        Height = 49
        Caption = #1054#1089#1086#1073#1099#1077' '#1074#1089#1090#1072#1074#1082#1080
        TabOrder = 3
        object Insert_User_Name_Code: TButton
          Left = 3
          Top = 16
          Width = 111
          Height = 25
          Hint = #1042#1089#1090#1072#1074#1082#1072' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1075#1086' '#1082#1086#1076#1072', '#1082#1086#1090#1086#1088#1099#1081' '#1089#1089#1099#1083#1072#1077#1090#1089#1103' '#1085#1072' '#1080#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = Insert_User_Name_CodeClick
        end
        object Insert_Robot_Name_Code: TButton
          Left = 120
          Top = 15
          Width = 75
          Height = 25
          Hint = #1042#1089#1090#1072#1074#1082#1072' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1075#1086' '#1082#1086#1076#1072', '#1082#1086#1090#1086#1088#1099#1081' '#1089#1089#1099#1083#1072#1077#1090#1089#1103' '#1085#1072' '#1080#1084#1103' '#1088#1086#1073#1086#1090#1072
          Caption = #1048#1084#1103' '#1088#1086#1073#1086#1090#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = Insert_Robot_Name_CodeClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 91
        Width = 329
        Height = 49
        Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080
        TabOrder = 4
        object Teach_check: TButton
          Left = 3
          Top = 16
          Width = 75
          Height = 25
          Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1082#1072#1082' '#1088#1072#1073#1086#1090' '#1086#1090#1074#1077#1090#1080#1090' '#1085#1072' '#1074#1072#1096#1080' '#1089#1083#1086#1074#1072
          Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = Teach_checkClick
        end
        object Teach_Add: TButton
          Left = 84
          Top = 16
          Width = 75
          Height = 25
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1087#1072#1084#1103#1090#1100' '#1088#1086#1073#1086#1090#1072' '#1074#1074#1077#1076#1105#1085#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          Default = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = Teach_AddClick
        end
        object Change_Words: TButton
          Left = 165
          Top = 16
          Width = 75
          Height = 25
          Hint = #1054#1090#1082#1088#1086#1077#1090#1089#1103' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1089' '#1086#1090#1074#1077#1090#1072#1084#1080' '#1088#1086#1073#1086#1090#1072' '#1087#1086' '#1082#1072#1078#1076#1086#1081' '#1090#1077#1084#1077
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = Change_WordsClick
        end
        object Clear_Memo2: TButton
          Left = 246
          Top = 16
          Width = 75
          Height = 25
          Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1089' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077#1084' '#1087#1088#1086#1074#1077#1088#1086#1095#1085#1099#1093' '#1076#1072#1085#1085#1099#1093
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = Clear_Memo2Click
        end
      end
    end
    object Настройки: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 28
      object GroupBox1: TGroupBox
        Left = 16
        Top = 16
        Width = 225
        Height = 121
        Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        TabOrder = 0
        object User_Name: TLabeledEdit
          Left = 3
          Top = 36
          Width = 198
          Height = 21
          Hint = 
            #1048#1084#1103', '#1082#1086#1090#1086#1088#1099#1084' '#1073#1091#1076#1077#1090' '#1082' '#1042#1072#1084' '#1086#1073#1088#1086#1097#1072#1090#1100#1089#1103' '#1088#1086#1073#1086#1090', '#1072' '#1090#1072#1082' '#1078#1077' '#1082#1086#1090#1086#1088#1086#1077' '#1073#1091#1076#1077 +
            #1090' '#1074#1099#1074#1086#1076#1080#1090#1089#1103' '#1087#1088#1080' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1080' '#1086#1089#1086#1073#1099#1093' '#1074#1089#1090#1072#1074#1086#1082
          EditLabel.Width = 93
          EditLabel.Height = 13
          EditLabel.Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1072#1096#1077' '#1080#1084#1103
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = #1061#1086#1079#1103#1080#1085
        end
      end
      object GroupBox2: TGroupBox
        Left = 280
        Top = 16
        Width = 241
        Height = 121
        Caption = #1044#1072#1085#1085#1099#1077' '#1088#1086#1073#1086#1090#1072' Hello'
        TabOrder = 1
        object Robot_Name: TLabeledEdit
          Left = 11
          Top = 36
          Width = 214
          Height = 21
          Hint = 
            #1048#1084#1103', '#1082#1086#1090#1086#1088#1099#1084' '#1088#1086#1073#1086#1090' '#1073#1091#1076#1077#1090' '#1085#1072#1079#1099#1074#1072#1090#1100' '#1089#1077#1073#1103', '#1072' '#1090#1072#1082' '#1078#1077' '#1082#1086#1090#1086#1088#1086#1077' '#1073#1091#1076#1077#1090' '#1074 +
            #1099#1074#1086#1076#1080#1090#1089#1103' '#1087#1088#1080' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1080' '#1086#1089#1086#1073#1099#1093' '#1074#1089#1090#1072#1074#1086#1082
          EditLabel.Width = 103
          EditLabel.Height = 13
          EditLabel.Caption = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103' '#1088#1086#1073#1086#1090#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = #1044#1078#1077#1082
        end
      end
      object Save_Options: TButton
        Left = 232
        Top = 264
        Width = 75
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Default = True
        TabOrder = 2
        OnClick = Save_OptionsClick
      end
      object GroupBox5: TGroupBox
        Left = 120
        Top = 143
        Width = 291
        Height = 98
        Caption = #1055#1088#1086#1095#1077#1077
        TabOrder = 3
        object CheckBox1: TCheckBox
          Left = 11
          Top = 24
          Width = 198
          Height = 17
          Hint = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1072#1095#1072#1083#1100#1085#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1086#1090' '#1088#1086#1073#1086#1090#1072
          Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100' '#1087#1088#1080#1074#1077#1090#1089#1090#1074#1080#1077' '#1088#1086#1073#1086#1090#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 11
          Top = 47
          Width = 254
          Height = 17
          Caption = 'C'#1090#1080#1088#1072#1090#1100' '#1087#1086#1083#1103' '#1074' '#1091#1095#1077#1085#1080#1080' '#1087#1086#1089#1083#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
          TabOrder = 1
        end
        object CheckBox3: TCheckBox
          Left = 11
          Top = 70
          Width = 277
          Height = 17
          Caption = #1057#1090#1080#1088#1072#1090#1100' '#1085#1080#1078#1085#1077#1077' '#1087#1086#1083#1077' '#1074' '#1091#1095#1077#1085#1080#1080' '#1087#1086#1089#1083#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
          TabOrder = 2
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      ImageIndex = 3
      object Label1: TLabel
        Left = 144
        Top = 80
        Width = 253
        Height = 13
        Caption = #1045#1089#1083#1080' '#1074#1099' '#1074#1099#1080#1076#1080#1090#1077' '#1101#1090#1086' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' - '#1090#1086' '#1101#1090#1086' '#1073#1077#1076#1072'....'
      end
    end
  end
  object Memo3: TMemo
    Left = 8
    Top = 391
    Width = 539
    Height = 162
    Lines.Strings = (
      'Memo3')
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
