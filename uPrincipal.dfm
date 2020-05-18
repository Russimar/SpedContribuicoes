object frmPrincipal: TfrmPrincipal
  Left = 195
  Top = 110
  Caption = 'Gerar SPED - Contribui'#231#245'es'
  ClientHeight = 490
  ClientWidth = 1121
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1121
    Height = 161
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 32
      Width = 57
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 392
      Top = 32
      Width = 52
      Height = 13
      Caption = 'Data Final:'
    end
    object Label3: TLabel
      Left = 42
      Top = 59
      Width = 45
      Height = 13
      Caption = 'Empresa:'
    end
    object Label4: TLabel
      Left = 35
      Top = 86
      Width = 52
      Height = 13
      Caption = 'Finalidade:'
    end
    object Label5: TLabel
      Left = 8
      Top = 112
      Width = 79
      Height = 13
      Caption = 'Ind. Movimento:'
    end
    object Label6: TLabel
      Left = 46
      Top = 139
      Width = 41
      Height = 13
      Caption = 'Arquivo:'
    end
    object De: TDateTimePicker
      Left = 96
      Top = 24
      Width = 105
      Height = 21
      Date = 43891.000000000000000000
      Time = 0.572525659721577500
      TabOrder = 0
    end
    object Para: TDateTimePicker
      Left = 451
      Top = 24
      Width = 105
      Height = 21
      Date = 43921.000000000000000000
      Time = 0.572525659721577500
      TabOrder = 1
    end
    object ComboEmpresa: TDBLookupComboBox
      Left = 96
      Top = 51
      Width = 460
      Height = 21
      KeyField = 'EMPRICOD'
      ListField = 'EMPRA60NOMEFANT'
      ListSource = DMSpedPisCofins.dsEmpresa
      TabOrder = 2
    end
    object ComboFinalidade: TComboBox
      Left = 96
      Top = 79
      Width = 460
      Height = 21
      ItemIndex = 0
      TabOrder = 3
      Text = 'Remessa do arquivo original'
      Items.Strings = (
        'Remessa do arquivo original'
        'Remessa do arquivo substituto')
    end
    object ComboMovimento: TComboBox
      Left = 96
      Top = 107
      Width = 460
      Height = 21
      ItemIndex = 0
      TabOrder = 4
      Text = 'Com Movimento'
      Items.Strings = (
        'Com Movimento'
        'Sem Movimento')
    end
    object edtCaminho: TEdit
      Left = 96
      Top = 134
      Width = 460
      Height = 21
      TabStop = False
      Color = clMedGray
      ReadOnly = True
      TabOrder = 5
    end
    object pnlProgress: TPanel
      Left = 572
      Top = 1
      Width = 548
      Height = 159
      Align = alRight
      TabOrder = 6
      object pnlRegistro: TPanel
        Left = 1
        Top = 1
        Width = 546
        Height = 36
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object pnlGauge: TPanel
        Left = 1
        Top = 37
        Width = 546
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 30
        object Gauge1: TGauge
          Left = 0
          Top = 0
          Width = 546
          Height = 35
          Align = alClient
          Progress = 0
          ExplicitHeight = 40
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 1121
    Height = 151
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 1119
      Height = 149
      Align = alClient
      Caption = 'Registro 0110'
      TabOrder = 0
      object Label7: TLabel
        Left = 357
        Top = 40
        Width = 208
        Height = 13
        Caption = 'C'#243'd.indicador da incid'#234'ncia trib.no per'#237'odo:'
      end
      object Label8: TLabel
        Left = 126
        Top = 67
        Width = 439
        Height = 13
        Caption = 
          'C'#243'd.indicador de m'#233'todo de apropria'#231#227'o de cr'#233'd. comuns, no caso ' +
          'de incid'#234'ncia no regime:'
      end
      object Label9: TLabel
        Left = 268
        Top = 94
        Width = 297
        Height = 13
        Caption = 'C'#243'digo indicador do Tipo de Contribui'#231#227'o Apurada no per'#237'odo:'
      end
      object Label10: TLabel
        Left = 7
        Top = 121
        Width = 558
        Height = 13
        Caption = 
          'C'#243'd.indicador do crit'#233'rio de escrit. e apura'#231#227'o adotado, no caso' +
          ' de incid'#234'ncia exclusivamente no regime cumulativo:'
      end
      object comboIndIncidencia: TComboBox
        Left = 571
        Top = 32
        Width = 452
        Height = 21
        ItemIndex = 0
        TabOrder = 0
        Text = 
          '1 - Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia exclusivamente no r' +
          'egime n'#227'o-cumulativo'
        Items.Strings = (
          
            '1 - Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia exclusivamente no r' +
            'egime n'#227'o-cumulativo'
          
            '2 - Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia exclusivamente no r' +
            'egime cumulativo'
          
            '3 - Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia nos regimes n'#227'o-cum' +
            'ulativo e cumulativo')
      end
      object comboIndMetodo: TComboBox
        Left = 571
        Top = 59
        Width = 452
        Height = 21
        ItemIndex = 0
        TabOrder = 1
        Text = '1 - M'#233'todo de Apropria'#231#227'o Direta'
        Items.Strings = (
          '1 - M'#233'todo de Apropria'#231#227'o Direta'
          '2 - M'#233'todo de Rateio Proporcional (Receita Bruta)')
      end
      object ComboIndContribuicao: TComboBox
        Left = 571
        Top = 86
        Width = 452
        Height = 21
        ItemIndex = 0
        TabOrder = 2
        Text = '1 - Apura'#231#227'o da Contribui'#231#227'o Exclusivamente a Al'#237'quota B'#225'sica'
        Items.Strings = (
          '1 - Apura'#231#227'o da Contribui'#231#227'o Exclusivamente a Al'#237'quota B'#225'sica'
          
            '2 - Apura'#231#227'o da Contribui'#231#227'o a Al'#237'quotas Espec'#237'ficas (Diferencia' +
            'das e/ou por Unidade de Medida de Produto)')
      end
      object comboIndCriterio: TComboBox
        Left = 571
        Top = 113
        Width = 452
        Height = 21
        ItemIndex = 0
        TabOrder = 3
        Text = '1 - Regime de Caixa   Escritura'#231#227'o consolidada (Registro F500)'
        Items.Strings = (
          '1 - Regime de Caixa   Escritura'#231#227'o consolidada (Registro F500)'
          
            '2 - Regime de Compet'#234'ncia - Escritura'#231#227'o consolidada (Registro F' +
            '550)'
          '9 - Regime de compet'#234'ncia - Escritura'#231#227'o detalhada ')
      end
    end
  end
  object pnlBotton: TPanel
    Left = 0
    Top = 312
    Width = 1121
    Height = 161
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 8
      Top = 23
      Width = 97
      Height = 42
      Caption = 'Gerar Arquivo'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 8
      Top = 71
      Width = 97
      Height = 34
      Caption = 'Arquivo Teste'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object Memo1: TMemo
      Left = 471
      Top = 6
      Width = 381
      Height = 151
      TabOrder = 2
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 473
    Width = 1121
    Height = 17
    Align = alBottom
    TabOrder = 3
  end
end
