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
    Height = 174
    Align = alTop
    Color = clMedGray
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 32
      Width = 57
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 450
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
      Left = 509
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
      Width = 518
      Height = 21
      KeyField = 'EMPRICOD'
      ListField = 'EMPRA60NOMEFANT'
      ListSource = DMSpedPisCofins.dsEmpresa
      TabOrder = 2
    end
    object ComboFinalidade: TComboBox
      Left = 96
      Top = 79
      Width = 518
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
      Width = 518
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
      Width = 493
      Height = 21
      TabStop = False
      Color = clMedGray
      ReadOnly = True
      TabOrder = 5
    end
    object pnlProgress: TPanel
      Left = 648
      Top = 1
      Width = 472
      Height = 172
      Align = alRight
      BevelOuter = bvNone
      Color = clMedGray
      ParentBackground = False
      TabOrder = 6
      object pnlGauge: TPanel
        Left = 0
        Top = 0
        Width = 472
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 37
        ExplicitWidth = 546
      end
      object BitBtn1: TBitBtn
        Left = 8
        Top = 18
        Width = 129
        Height = 42
        Caption = 'Gerar Arquivo'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F5FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2DED7DBD6CEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EFEBC5BE
          B0C5BEB0E2DED7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE2DED7C5BEB0C5BEB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDAE9D98AC3A26DC2B398DAE0C5BEB0C5BEB0F4F3F0FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC3DCC17FC5AE9CE4F9E0EFE792B58F7CA570B8B9A4C6
          BFB2DCD8D0F1EFEBFAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98C3967EDFFFFFFFFFCCC6BAC5BE
          B0C0BCAC7DA471AFB69CC5BEB0C5BEB0D4CFC4FEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EC79C85E1FF
          FFFFFFC9C2B5C6BFB1BCB3A3ADA5907EA370AFB69DC5BEB0C5BEB0E5E2DCFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF9DC69B84E0FFFFFFFFD9D4CBF9F9F7EBE8E3F2F1EEB0A79478A36DBFBDAB
          C5BEB0CFC9BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF9CC59A92D7EBC5BEB0CCC5B9F9F8F7A89D88C3BBADBF
          B7A8AEAC9581A775C5BEB0C5BEB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F58CAD80B9BAA6C5BEB0C5BEB0F5F4
          F1FFFFFFFFFFFFFFFFFFB6AD9B8BAA7DB1B79EC5BEB0F8F7F5FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DCD5F8F7F5E2DED7B7B9A489A97B
          C5BEB0C5BEB0DCD7CFF3F1EEB0A693DCD8CFC8C1B4C1BDAD7DA571C5BEB0CCC6
          BAF8F7F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE9E4C6BFB1C5BEB0C5BEB0C5
          BEB0C5BEB081A674BEBBAAC5BEB0C5BEB0DFDBD3F8F7F5FCFBFBCEC9BDC5BEB0
          87A87AB7B9A4C5BEB0CCC6BAFFFFFFFFFFFFFFFFFFECEAE5DBD7CEDAD5CDB2AA
          97C4BEB0AFA693C4BDAFB6AE9CA9A48D8E9C77B9B1A0C5BEAFB8AF9DBDB5A5C5
          BEB0C5BEB0C5BEB0B9BAA688A97CC5BEB0C9C2B5FFFFFFFFFFFFFFFFFFF1EFEC
          B7AE9CEAE7E3BFB7A8D7D1C8CBC5B8D2CDC2F0EEEAEAE7E3E3E3DBB8B4A1CAC4
          B7D6D1C7AFA693C5BEB0C5BEB0C5BEB0C5BEB07EA672B8C4BFEEECE8FFFFFFFF
          FFFFFFFFFFF5F3F1BCB5A4EDEAE7E5E1DCBFB7A8DED9D2C0B9AAEAE7E2A69A85
          CEC9BDEAEAE4B8AE9EE4E1DAA29781AFA692B7AD9CCCC6BADCD7CF91B98B85E0
          FDFFFFFFFFFFFFFFFFFFFFFFFFF9F8F6D6D1C7E9E5E1E2DED7D3CEC4ECE9E5AD
          A38EEFEDEAA59B84C4BDAFE3E1DABDB9A8EFEEEAF1EFECECEAE5CFC9BEFDFCFC
          FFFFFF9FC89D82DFFDFFFFFFFFFFFFFFFFFFFFFFFFFCFBFBEBE8E4DEDAD2E2DE
          D7EBE8E4E9E6E2AFA491E7E5DFB9B19FB3A997E3DFD9BFB7A7DCE2D6AAA693B5
          BBB2CAC4B7F6F5F3FFFFFF9CC59A81DFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          F1EFEBE7E3DDF5F3F1F5F3F1F1EFECCAC3B7DEDAD2EFEDE9EBE9E4EAE6E1DFDB
          D5F0EFECF1EFECF1EFECB1CAC6CFE6E9C3DEC880C3A796E5FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCECE9E5
          FAFAF8FFFFFFFFFFFFFFFFFFFFFFFFF5F9F5B0D4B976C0A376CBC7BCEEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
    object btnDiretorio: TBitBtn
      Left = 590
      Top = 134
      Width = 24
      Height = 21
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F0F0F0E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7
        E7E7EDEDEDFAFAFAFFFFFFFFFFFFFCFCFCC9C9C9A1734CA87F5DA57D5AA57D5A
        A57D5AA57D5AA57D5AA57D5AA57D5AA57D5AA57D5AA57D5AA57D5AA67E5BB48E
        6FD0CECDF0F0F0FFFFFFFAFAFAA2A2A2917B69BF895ACC9663CC9563CB9563CB
        9563CB9563CB9563CB9562CB9562CB9562CB9562CB9462CB9461C38C5EBE9E87
        ECECECFFFFFFFFFFFFABABAB868686A67C57CD9C6DCD9B6BCD9B6BCD9A6BCD9A
        6BCD9A6BCD9A6ACD9A6ACD9A6ACD9A6ACD9A6ACD9969CE9A6BC29870FFFFFFFF
        FFFFFFFFFFA9A9A989898998775CD2A57CD1A378D0A174CF9F73CF9F72CF9F72
        CF9F72CF9F72CF9F72CF9F72CF9F72CF9F72CF9F71C7976CF3EAE2FFFFFFFFFF
        FFA7A7A78B8B8B887A6FCC9F77D3A77ED3A77ED3A77DD2A57BD1A479D1A479D1
        A378D1A276D0A174CF9F72CF9F72CF9F72D2A57CD5B59CFFFFFFFFFFFFA6A6A6
        8D8D8D878584BF9773D4A980D4A880D4A87FD3A87FD3A77ED3A77ED3A77DD3A7
        7DD3A67DD2A57AD0A175CF9F72D2A67CCBA686FFFFFFFFFFFFA7A7A79090908D
        8D8DBB9576D5AB83D4AA82D4AA81D4A981D4A980D4A880D4A880D4A87FD3A87F
        D3A77ED3A77ED1A378CFA073CCA482FEFDFCFFFFFFA6A6A6959595939393B491
        73D7B18BD5AB84D5AB84D5AB83D5AA83D5AA83D4AA82D4AA81D4A981D4A980D4
        A880D4A87FD1A479D0A683ECDED4F8F8F8ABABAB9C9C9C9B9B9BAC8A6EE0C2A5
        DCB998DCB998DCB998DCB998DCB998DCB998DCB998DCB997DCB997DCB897DBB8
        96DBB896E1C3A6D4B59BE8E8E8B0B0B0A2A2A2A2A2A2A49486A9876AA9866AA9
        866AA88668A78568A78568A78468A68467A68467A07E60D0AD91D0AD91D0AD91
        D0AD91E3D0BFD7D7D7B5B5B5A8A8A8A7A7A7A7A7A7A7A7A7A5A5A5A5A5A5A4A4
        A4A3A3A3A2A2A2A1A1A1A1A1A1A0A0A0959595FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC2C2C2C1C1C1A8A8A8A8A8A8A7A7A7A7A7A7A7A7A7A7A7A7A6A6A6A6A6A6
        A6A6A6A6A6A6A6A6A6A6A6A69E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1
        B1C4C4C4A8A8A8A8A8A8A8A8A8A8A8A8A7A7A7A6A6A6959595A9A9A9ABABABAB
        ABABACACACACACACB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFC0C0C0
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A5A5A5D2D2D2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6B0B0B0ACACACAC
        ACACACACACADADADB0B0B0A5A5A5FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      TabOrder = 7
      OnClick = btnDiretorioClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 174
    Width = 1121
    Height = 202
    Align = alClient
    TabOrder = 1
    ExplicitTop = 161
    ExplicitHeight = 151
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 1119
      Height = 200
      Align = alClient
      Caption = 'Registro 0110'
      TabOrder = 0
      ExplicitHeight = 184
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
    Top = 376
    Width = 1121
    Height = 97
    Align = alBottom
    TabOrder = 2
    object Gauge1: TGauge
      Left = 1
      Top = 49
      Width = 1119
      Height = 47
      Align = alClient
      Progress = 0
      ExplicitLeft = 0
      ExplicitTop = 5
      ExplicitHeight = 95
    end
    object pnlRegistro: TPanel
      Left = 1
      Top = 1
      Width = 1119
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
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
