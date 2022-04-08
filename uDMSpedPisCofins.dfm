object DMSpedPisCofins: TDMSpedPisCofins
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 265
  Width = 567
  object ACBrSPEDPisCofins1: TACBrSPEDPisCofins
    Path = 'C:\Program Files (x86)\Embarcadero\Studio\20.0\bin\'
    Delimitador = '|'
    ReplaceDelimitador = False
    TrimString = True
    CurMascara = '#0.00'
    Left = 475
    Top = 24
  end
  object qryEmpresa: TFDQuery
    Connection = DMConnection.FDConnection
    SQL.Strings = (
      
        'select EMPRICOD, EMPRA60RAZAOSOC, EMPRA60NOMEFANT, EMPRA20FONE, ' +
        'EMPRA20FAX, EMPRA60END, EMPRA60BAI, EMPRA60CID,'
      
        '       EMPRA2UF, EMPRA8CEP, EMPRCFISJURID, EMPRA14CGC, EMPRA20IE' +
        ', EMPRA11CPF, EMPRA10RG EMPRA60EMAIL, EMPRA3CRT,'
      
        '       EMPRA15CRCCONTADOR, EMPRA14CNPJCONTADOR, EMPRA8CEPCONTADO' +
        'R, EMPRA60ENDCONTADOR, EMPRA60BAICONTADOR,'
      
        '       EMPRA10FONECONTADOR, EMPRA10FAXCONTADOR, EMPRA7CODMUNCONT' +
        'ADOR, EMPRA150CONTADOREMAIL, CNAEFISCAL,'
      
        '      EMPRIMUNICODFED, IND_NATUREZA_PJ, EMPRIATIVIDADE, EMPRA60C' +
        'ONTADOR, EMPRA20CPFCONTADOR'
      'from EMPRESA')
    Left = 24
    Top = 16
    object qryEmpresaEMPRICOD: TIntegerField
      FieldName = 'EMPRICOD'
      Origin = 'EMPRICOD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEmpresaEMPRA60RAZAOSOC: TStringField
      FieldName = 'EMPRA60RAZAOSOC'
      Origin = 'EMPRA60RAZAOSOC'
      FixedChar = True
      Size = 60
    end
    object qryEmpresaEMPRA60NOMEFANT: TStringField
      FieldName = 'EMPRA60NOMEFANT'
      Origin = 'EMPRA60NOMEFANT'
      FixedChar = True
      Size = 60
    end
    object qryEmpresaEMPRA20FONE: TStringField
      FieldName = 'EMPRA20FONE'
      Origin = 'EMPRA20FONE'
      FixedChar = True
    end
    object qryEmpresaEMPRA20FAX: TStringField
      FieldName = 'EMPRA20FAX'
      Origin = 'EMPRA20FAX'
      FixedChar = True
    end
    object qryEmpresaEMPRA60END: TStringField
      FieldName = 'EMPRA60END'
      Origin = 'EMPRA60END'
      FixedChar = True
      Size = 60
    end
    object qryEmpresaEMPRA60BAI: TStringField
      FieldName = 'EMPRA60BAI'
      Origin = 'EMPRA60BAI'
      FixedChar = True
      Size = 60
    end
    object qryEmpresaEMPRA60CID: TStringField
      FieldName = 'EMPRA60CID'
      Origin = 'EMPRA60CID'
      FixedChar = True
      Size = 60
    end
    object qryEmpresaEMPRA2UF: TStringField
      FieldName = 'EMPRA2UF'
      Origin = 'EMPRA2UF'
      FixedChar = True
      Size = 2
    end
    object qryEmpresaEMPRA8CEP: TStringField
      FieldName = 'EMPRA8CEP'
      Origin = 'EMPRA8CEP'
      FixedChar = True
      Size = 8
    end
    object qryEmpresaEMPRCFISJURID: TStringField
      FieldName = 'EMPRCFISJURID'
      Origin = 'EMPRCFISJURID'
      FixedChar = True
      Size = 1
    end
    object qryEmpresaEMPRA14CGC: TStringField
      FieldName = 'EMPRA14CGC'
      Origin = 'EMPRA14CGC'
      FixedChar = True
      Size = 14
    end
    object qryEmpresaEMPRA20IE: TStringField
      FieldName = 'EMPRA20IE'
      Origin = 'EMPRA20IE'
      FixedChar = True
    end
    object qryEmpresaEMPRA11CPF: TStringField
      FieldName = 'EMPRA11CPF'
      Origin = 'EMPRA11CPF'
      FixedChar = True
      Size = 11
    end
    object qryEmpresaEMPRA60EMAIL: TStringField
      FieldName = 'EMPRA60EMAIL'
      Origin = 'EMPRA10RG'
      FixedChar = True
      Size = 10
    end
    object qryEmpresaEMPRA3CRT: TStringField
      FieldName = 'EMPRA3CRT'
      Origin = 'EMPRA3CRT'
      Size = 3
    end
    object qryEmpresaEMPRA15CRCCONTADOR: TStringField
      FieldName = 'EMPRA15CRCCONTADOR'
      Origin = 'EMPRA15CRCCONTADOR'
      Size = 15
    end
    object qryEmpresaEMPRA14CNPJCONTADOR: TStringField
      FieldName = 'EMPRA14CNPJCONTADOR'
      Origin = 'EMPRA14CNPJCONTADOR'
      Size = 14
    end
    object qryEmpresaEMPRA8CEPCONTADOR: TStringField
      FieldName = 'EMPRA8CEPCONTADOR'
      Origin = 'EMPRA8CEPCONTADOR'
      Size = 8
    end
    object qryEmpresaEMPRA60ENDCONTADOR: TStringField
      FieldName = 'EMPRA60ENDCONTADOR'
      Origin = 'EMPRA60ENDCONTADOR'
      Size = 60
    end
    object qryEmpresaEMPRA60BAICONTADOR: TStringField
      FieldName = 'EMPRA60BAICONTADOR'
      Origin = 'EMPRA60BAICONTADOR'
      Size = 60
    end
    object qryEmpresaEMPRA10FONECONTADOR: TStringField
      FieldName = 'EMPRA10FONECONTADOR'
      Origin = 'EMPRA10FONECONTADOR'
      Size = 10
    end
    object qryEmpresaEMPRA10FAXCONTADOR: TStringField
      FieldName = 'EMPRA10FAXCONTADOR'
      Origin = 'EMPRA10FAXCONTADOR'
      Size = 10
    end
    object qryEmpresaEMPRA7CODMUNCONTADOR: TStringField
      FieldName = 'EMPRA7CODMUNCONTADOR'
      Origin = 'EMPRA7CODMUNCONTADOR'
      Size = 7
    end
    object qryEmpresaEMPRA150CONTADOREMAIL: TStringField
      FieldName = 'EMPRA150CONTADOREMAIL'
      Origin = 'EMPRA150CONTADOREMAIL'
      Size = 150
    end
    object qryEmpresaCNAEFISCAL: TStringField
      FieldName = 'CNAEFISCAL'
      Origin = 'CNAEFISCAL'
      Size = 15
    end
    object qryEmpresaEMPRIMUNICODFED: TIntegerField
      FieldName = 'EMPRIMUNICODFED'
      Origin = 'EMPRIMUNICODFED'
    end
    object qryEmpresaIND_NATUREZA_PJ: TStringField
      FieldName = 'IND_NATUREZA_PJ'
      Origin = 'IND_NATUREZA_PJ'
      FixedChar = True
      Size = 2
    end
    object qryEmpresaEMPRIATIVIDADE: TIntegerField
      FieldName = 'EMPRIATIVIDADE'
      Origin = 'EMPRIATIVIDADE'
    end
    object qryEmpresaEMPRA60CONTADOR: TStringField
      FieldName = 'EMPRA60CONTADOR'
      Origin = 'EMPRA60CONTADOR'
      Size = 60
    end
    object qryEmpresaEMPRA20CPFCONTADOR: TStringField
      FieldName = 'EMPRA20CPFCONTADOR'
      Origin = 'EMPRA20CPFCONTADOR'
    end
  end
  object dsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 80
    Top = 16
  end
  object sqlParticipantes: TFDQuery
    CachedUpdates = True
    Connection = DMConnection.FDConnection
    SQL.Strings = (
      'SELECT * FROM SPED_0150'
      'WHERE COD_EMPRESA = :EMPRESA')
    Left = 176
    Top = 16
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object sqlParticipantesCOD_PART: TStringField
      FieldName = 'COD_PART'
      Origin = 'COD_PART'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object sqlParticipantesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object sqlParticipantesCOD_PAIS: TStringField
      FieldName = 'COD_PAIS'
      Origin = 'COD_PAIS'
      Size = 4
    end
    object sqlParticipantesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object sqlParticipantesCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 11
    end
    object sqlParticipantesIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object sqlParticipantesCOD_MUN: TStringField
      FieldName = 'COD_MUN'
      Origin = 'COD_MUN'
      Size = 7
    end
    object sqlParticipantesCOD_SUFRAMA: TStringField
      FieldName = 'COD_SUFRAMA'
      Origin = 'COD_SUFRAMA'
      Size = 9
    end
    object sqlParticipantesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object sqlParticipantesEND_NUM: TStringField
      FieldName = 'END_NUM'
      Origin = 'END_NUM'
      Size = 10
    end
    object sqlParticipantesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 60
    end
    object sqlParticipantesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 60
    end
    object sqlParticipantesCOD_FORN: TIntegerField
      FieldName = 'COD_FORN'
      Origin = 'COD_FORN'
    end
    object sqlParticipantesCOD_TRANSP: TIntegerField
      FieldName = 'COD_TRANSP'
      Origin = 'COD_TRANSP'
    end
    object sqlParticipantesCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object sqlConsulta: TFDQuery
    Connection = DMConnection.FDConnection
    Left = 32
    Top = 160
  end
  object sqlUnidades: TFDQuery
    CachedUpdates = True
    Connection = DMConnection.FDConnection
    SQL.Strings = (
      'SELECT * FROM SPED_0190')
    Left = 208
    Top = 16
    object sqlUnidadesUND_SIGLA: TStringField
      FieldName = 'UND_SIGLA'
      Origin = 'UND_SIGLA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object sqlUnidadesUND_DESCR: TStringField
      FieldName = 'UND_DESCR'
      Origin = 'UND_DESCR'
      Required = True
      Size = 60
    end
  end
  object sqlProduto: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'COD_ITEM'
    Connection = DMConnection.FDConnection
    SQL.Strings = (
      'SELECT * FROM SPED_0200')
    Left = 240
    Top = 15
    object sqlProdutoCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = 'COD_ITEM'
      Required = True
    end
    object sqlProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object sqlProdutoCODIGOBARRAS: TStringField
      FieldName = 'CODIGOBARRAS'
      Origin = 'CODIGOBARRAS'
      Size = 60
    end
    object sqlProdutoUNIDADEINVENTARIO: TStringField
      FieldName = 'UNIDADEINVENTARIO'
      Origin = 'UNIDADEINVENTARIO'
      Size = 6
    end
    object sqlProdutoTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO_ITEM'
      Size = 2
    end
    object sqlProdutoCODIGONCM: TStringField
      FieldName = 'CODIGONCM'
      Origin = 'CODIGONCM'
      Size = 8
    end
    object sqlProdutoCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
      Size = 3
    end
    object sqlProdutoPERCPIS: TCurrencyField
      FieldName = 'PERCPIS'
      Origin = 'PERCPIS'
    end
    object sqlProdutoPERCCOFINS: TCurrencyField
      FieldName = 'PERCCOFINS'
      Origin = 'PERCCOFINS'
    end
    object sqlProdutoALIQUOTAICM: TCurrencyField
      FieldName = 'ALIQUOTAICM'
      Origin = 'ALIQUOTAICM'
    end
    object sqlProdutoSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Origin = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
  end
  object sqlPlanoContas: TFDQuery
    CachedUpdates = True
    Connection = DMConnection.FDConnection
    SQL.Strings = (
      'SELECT * FROM PLANODECONTAS')
    Left = 272
    Top = 15
    object sqlPlanoContasPLCTA15COD: TStringField
      FieldName = 'PLCTA15COD'
      Origin = 'PLCTA15COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 15
    end
    object sqlPlanoContasPLCTICODREDUZ: TIntegerField
      FieldName = 'PLCTICODREDUZ'
      Origin = 'PLCTICODREDUZ'
    end
    object sqlPlanoContasPLCTINIVEL: TIntegerField
      FieldName = 'PLCTINIVEL'
      Origin = 'PLCTINIVEL'
    end
    object sqlPlanoContasPLCTA15CODPAI: TStringField
      FieldName = 'PLCTA15CODPAI'
      Origin = 'PLCTA15CODPAI'
      FixedChar = True
      Size = 15
    end
    object sqlPlanoContasPLCTA30CODEDIT: TStringField
      FieldName = 'PLCTA30CODEDIT'
      Origin = 'PLCTA30CODEDIT'
      FixedChar = True
      Size = 30
    end
    object sqlPlanoContasPLCTA60DESCR: TStringField
      FieldName = 'PLCTA60DESCR'
      Origin = 'PLCTA60DESCR'
      FixedChar = True
      Size = 60
    end
    object sqlPlanoContasPLCTCANALSINT: TStringField
      FieldName = 'PLCTCANALSINT'
      Origin = 'PLCTCANALSINT'
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasPLCTCTIPOSALDO: TStringField
      FieldName = 'PLCTCTIPOSALDO'
      Origin = 'PLCTCTIPOSALDO'
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasPENDENTE: TStringField
      FieldName = 'PENDENTE'
      Origin = 'PENDENTE'
      FixedChar = True
      Size = 1
    end
    object sqlPlanoContasREGISTRO: TSQLTimeStampField
      FieldName = 'REGISTRO'
      Origin = 'REGISTRO'
    end
  end
  object sqlOperacao: TFDQuery
    CachedUpdates = True
    Connection = DMConnection.FDConnection
    SQL.Strings = (
      'with OPERACAO_SPED'
      'as (select CF.OPESICOD as COD_OPE, OE.OPESA60DESCR'
      '    from CUPOM CF'
      '    left join OPERACAOESTOQUE OE on CF.OPESICOD = OE.OPESICOD'
      '    where CF.CUPODEMIS between :DATAINICIAL and :DATAFINAL and'
      '          CF.EMPRICOD = :EMPRESA'
      '    union all'
      '    select NF.OPESICOD as COD_OPE, OE.OPESA60DESCR'
      '    from NOTAFISCAL NF'
      '    left join OPERACAOESTOQUE OE on NF.OPESICOD = OE.OPESICOD'
      '    where NF.NOFIDEMIS between :DATAINICIAL and :DATAFINAL and'
      '          NF.EMPRICOD = :EMPRESA'
      '    union all'
      '    select NC.OPESICOD as OPE, OE.OPESA60DESCR'
      '    from NOTACOMPRA NC'
      '    left join OPERACAOESTOQUE OE on NC.OPESICOD = OE.OPESICOD'
      
        '    where NC.NOCPDEMISSAO between :DATAINICIAL and :DATAFINAL an' +
        'd'
      '          NC.EMPRICOD = :EMPRESA)'
      'select distinct(COD_OPE), OPESA60DESCR'
      'from OPERACAO_SPED   ')
    Left = 304
    Top = 15
    ParamData = <
      item
        Name = 'DATAINICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object sqlOperacaoCOD_OPE: TIntegerField
      FieldName = 'COD_OPE'
      Origin = 'COD_OPE'
    end
    object sqlOperacaoOPESA60DESCR: TStringField
      FieldName = 'OPESA60DESCR'
      Origin = 'OPESA60DESCR'
      FixedChar = True
      Size = 60
    end
  end
  object sqlConsulta2: TFDQuery
    Connection = DMConnection.FDConnection
    Left = 72
    Top = 160
  end
  object sqlC175: TFDQuery
    CachedUpdates = True
    Connection = DMConnection.FDConnection
    SQL.Strings = (
      
        'select CI.CUPOA13ID, P.PRODA2CSTPIS, P.PRODA2CSTCOFINS,coalesce(' +
        'p.prodn2aliqpis,0) ALIQUOTA_PIS,'
      '       coalesce(p.prodn2aliqcofins,0) ALIQUOTA_COFINS, CI.CFOP,'
      
        '       sum(round(CI.TOTAL_ITEM * (coalesce(CI.ALIQUOTA_PIS, 0) /' +
        ' 100), 2)) VALOR_PIS,'
      
        '       sum(round(CI.TOTAL_ITEM * (coalesce(CI.ALIQUOTA_COFINS, 0' +
        ') / 100), 2)) VALOR_COFINS,'
      '       sum(CI.TOTAL_ITEM) TOTAL_ITEM,'
      
        '       sum(coalesce(CI.CPITN2DESC, 0) + coalesce(CI.VLR_DESCONTO' +
        '_RATEIO, 0)) VALOR_DESCONTO'
      'from CUPOMITEM CI'
      'inner join PRODUTO P on CI.PRODICOD = P.PRODICOD'
      'where CI.CUPOA13ID = :ID_CUPOM'
      'and CI.CPITCSTATUS <> '#39'C'#39
      
        'group by CI.CUPOA13ID, P.PRODA2CSTPIS, P.PRODA2CSTCOFINS, ALIQUO' +
        'TA_PIS, ALIQUOTA_COFINS, CI.CFOP')
    Left = 248
    Top = 136
    ParamData = <
      item
        Name = 'ID_CUPOM'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 13
      end>
    object sqlC175CUPOA13ID: TStringField
      FieldName = 'CUPOA13ID'
      Origin = 'CUPOA13ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object sqlC175PRODA2CSTPIS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODA2CSTPIS'
      Origin = 'PRODA2CSTPIS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object sqlC175PRODA2CSTCOFINS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODA2CSTCOFINS'
      Origin = 'PRODA2CSTCOFINS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object sqlC175VALOR_PIS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      ProviderFlags = []
      ReadOnly = True
    end
    object sqlC175VALOR_COFINS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      ProviderFlags = []
      ReadOnly = True
    end
    object sqlC175TOTAL_ITEM: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_ITEM'
      Origin = 'TOTAL_ITEM'
      ProviderFlags = []
      ReadOnly = True
    end
    object sqlC175VALOR_DESCONTO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object sqlC175CFOP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP'
      Origin = 'CFOP'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object sqlC175ALIQUOTA_PIS: TFloatField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
    end
    object sqlC175ALIQUOTA_COFINS: TFloatField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
    end
  end
  object sqlSerie: TFDQuery
    CachedUpdates = True
    Connection = DMConnection.FDConnection
    SQL.Strings = (
      'select S.SERIA2TIPONOTA'
      'from NOTACOMPRA NC'
      'inner join OPERACAOESTOQUE OE on NC.OPESICOD = OE.OPESICOD'
      
        'inner join SERIE S on OE.SERIA5COD = S.SERIA5COD and NC.EMPRICOD' +
        ' = S.EMPRICOD'
      'where NC.NOCPA13ID = :ID_NOTA')
    Left = 312
    Top = 136
    ParamData = <
      item
        Name = 'ID_NOTA'
        DataType = ftString
        ParamType = ptInput
      end>
    object sqlSerieSERIA2TIPONOTA: TStringField
      FieldName = 'SERIA2TIPONOTA'
      Origin = 'SERIA2TIPONOTA'
      FixedChar = True
      Size = 2
    end
  end
  object Mem100: TFDMemTable
    IndexFieldNames = 'CodigoCredito'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 400
    Top = 144
    object Mem100CodigoCredito: TIntegerField
      FieldName = 'CodigoCredito'
    end
    object Mem100IndCredito: TStringField
      FieldName = 'IndCredito'
      Size = 1
    end
    object Mem100VlrBasePis: TFloatField
      FieldName = 'VlrBasePis'
    end
    object Mem100AliqPis: TFloatField
      FieldName = 'AliqPis'
    end
    object Mem100VlrCredito: TFloatField
      FieldName = 'VlrCredito'
    end
    object Mem100VlrCreditoDisponivel: TFloatField
      FieldName = 'VlrCreditoDisponivel'
    end
    object Mem100IndUtilCredito: TStringField
      FieldName = 'IndUtilCredito'
      Size = 1
    end
    object Mem100VlrCreditoDescontado: TFloatField
      FieldName = 'VlrCreditoDescontado'
    end
    object Mem100SaldoCredito: TFloatField
      FieldName = 'SaldoCredito'
    end
    object Mem100CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
  end
  object Mem400: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 464
    Top = 144
    object Mem400CST_Pis: TStringField
      FieldName = 'CST_Pis'
    end
    object Mem400Valor: TFloatField
      FieldName = 'Valor'
    end
    object Mem400PlanoConta: TStringField
      FieldName = 'PlanoConta'
    end
  end
  object Mem500: TFDMemTable
    IndexFieldNames = 'CodigoCredito'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 400
    Top = 200
    object Mem500CodigoCredito: TIntegerField
      FieldName = 'CodigoCredito'
    end
    object Mem500IndCredito: TStringField
      FieldName = 'IndCredito'
      Size = 1
    end
    object Mem500VlrBaseCofins: TFloatField
      FieldName = 'VlrBaseCofins'
    end
    object Mem500AliqCofins: TFloatField
      FieldName = 'AliqCofins'
    end
    object Mem500VlrCredito: TFloatField
      FieldName = 'VlrCredito'
    end
    object Mem500VlrCreditoDisponivel: TFloatField
      FieldName = 'VlrCreditoDisponivel'
    end
    object Mem500IndUtilCredito: TStringField
      FieldName = 'IndUtilCredito'
      Size = 1
    end
    object Mem500VlrCreditoDescontado: TFloatField
      FieldName = 'VlrCreditoDescontado'
    end
    object Mem500SaldoCredito: TFloatField
      FieldName = 'SaldoCredito'
    end
    object Mem500CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
  end
  object Mem800: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 464
    Top = 200
    object Mem800CST_Cofins: TStringField
      FieldName = 'CST_Cofins'
    end
    object Mem800Valor: TFloatField
      FieldName = 'Valor'
    end
    object Mem800PlanoConta: TStringField
      FieldName = 'PlanoConta'
    end
  end
end
