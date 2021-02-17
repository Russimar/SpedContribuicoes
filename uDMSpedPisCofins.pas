unit uDMSpedPisCofins;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrSpedPisCofins, uDMConnection,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uUtilPadrao;
type
  TEnumCOD_INC_TRIB = (tpEscrOpIncNaoCumulativo, tpEscrOpIncCumulativo, tpEscrOpIncAmbos);
  TEnumIND_APRO_CRED = (tpMetodoApropriacaoDireta,tpMetodoDeRateioProporcional);
  TEnumCOD_TIPO_CONT = (tpIndTipoConExclAliqBasica, tpIndTipoAliqEspecificas);
  TEnumIND_REG_CUM = (tpRegimeCaixa,tpRegimeCompetEscritConsolidada,tpRegimeCompetEscritDetalhada);

type
  tEvMensagem = procedure(Mensagem : String) of Object;
  tEvProgressao = procedure(Posicao : Integer) of Object;
  tEvMaxProgress = procedure(Max : Integer) of Object;

type
  TDMSpedPisCofins = class(TDataModule)
    ACBrSPEDPisCofins1: TACBrSPEDPisCofins;
    qryEmpresa: TFDQuery;
    qryEmpresaEMPRICOD: TIntegerField;
    qryEmpresaEMPRA60RAZAOSOC: TStringField;
    qryEmpresaEMPRA60NOMEFANT: TStringField;
    qryEmpresaEMPRA20FONE: TStringField;
    qryEmpresaEMPRA20FAX: TStringField;
    qryEmpresaEMPRA60END: TStringField;
    qryEmpresaEMPRA60BAI: TStringField;
    qryEmpresaEMPRA60CID: TStringField;
    qryEmpresaEMPRA2UF: TStringField;
    qryEmpresaEMPRA8CEP: TStringField;
    qryEmpresaEMPRCFISJURID: TStringField;
    qryEmpresaEMPRA14CGC: TStringField;
    qryEmpresaEMPRA20IE: TStringField;
    qryEmpresaEMPRA11CPF: TStringField;
    qryEmpresaEMPRA60EMAIL: TStringField;
    qryEmpresaEMPRA3CRT: TStringField;
    qryEmpresaEMPRA15CRCCONTADOR: TStringField;
    qryEmpresaEMPRA14CNPJCONTADOR: TStringField;
    qryEmpresaEMPRA8CEPCONTADOR: TStringField;
    qryEmpresaEMPRA60ENDCONTADOR: TStringField;
    qryEmpresaEMPRA60BAICONTADOR: TStringField;
    qryEmpresaEMPRA10FONECONTADOR: TStringField;
    qryEmpresaEMPRA10FAXCONTADOR: TStringField;
    qryEmpresaEMPRA7CODMUNCONTADOR: TStringField;
    qryEmpresaEMPRA150CONTADOREMAIL: TStringField;
    qryEmpresaCNAEFISCAL: TStringField;
    dsEmpresa: TDataSource;
    qryEmpresaEMPRIMUNICODFED: TIntegerField;
    qryEmpresaIND_NATUREZA_PJ: TStringField;
    qryEmpresaEMPRIATIVIDADE: TIntegerField;
    qryEmpresaEMPRA60CONTADOR: TStringField;
    qryEmpresaEMPRA20CPFCONTADOR: TStringField;
    sqlParticipantes: TFDQuery;
    sqlConsulta: TFDQuery;
    sqlParticipantesCOD_PART: TStringField;
    sqlParticipantesNOME: TStringField;
    sqlParticipantesCOD_PAIS: TStringField;
    sqlParticipantesCNPJ: TStringField;
    sqlParticipantesCPF: TStringField;
    sqlParticipantesIE: TStringField;
    sqlParticipantesCOD_MUN: TStringField;
    sqlParticipantesCOD_SUFRAMA: TStringField;
    sqlParticipantesENDERECO: TStringField;
    sqlParticipantesEND_NUM: TStringField;
    sqlParticipantesCOMPLEMENTO: TStringField;
    sqlParticipantesBAIRRO: TStringField;
    sqlParticipantesCOD_FORN: TIntegerField;
    sqlParticipantesCOD_TRANSP: TIntegerField;
    sqlUnidades: TFDQuery;
    sqlUnidadesUND_SIGLA: TStringField;
    sqlUnidadesUND_DESCR: TStringField;
    sqlProduto: TFDQuery;
    sqlProdutoCOD_ITEM: TIntegerField;
    sqlProdutoDESCRICAO: TStringField;
    sqlProdutoCODIGOBARRAS: TStringField;
    sqlProdutoUNIDADEINVENTARIO: TStringField;
    sqlProdutoTIPO_ITEM: TStringField;
    sqlProdutoCODIGONCM: TStringField;
    sqlProdutoCST_ICMS: TStringField;
    sqlProdutoPERCPIS: TCurrencyField;
    sqlProdutoPERCCOFINS: TCurrencyField;
    sqlProdutoALIQUOTAICM: TCurrencyField;
    sqlProdutoSELECIONADO: TStringField;
    sqlPlanoContas: TFDQuery;
    sqlPlanoContasPLCTA15COD: TStringField;
    sqlPlanoContasPLCTICODREDUZ: TIntegerField;
    sqlPlanoContasPLCTINIVEL: TIntegerField;
    sqlPlanoContasPLCTA15CODPAI: TStringField;
    sqlPlanoContasPLCTA30CODEDIT: TStringField;
    sqlPlanoContasPLCTA60DESCR: TStringField;
    sqlPlanoContasPLCTCANALSINT: TStringField;
    sqlPlanoContasPLCTCTIPOSALDO: TStringField;
    sqlPlanoContasPENDENTE: TStringField;
    sqlPlanoContasREGISTRO: TSQLTimeStampField;
    sqlOperacao: TFDQuery;
    sqlConsulta2: TFDQuery;
    sqlC175: TFDQuery;
    sqlC175CUPOA13ID: TStringField;
    sqlC175PRODA2CSTPIS: TStringField;
    sqlC175PRODA2CSTCOFINS: TStringField;
    sqlC175PRODN2ALIQPIS: TFloatField;
    sqlC175PRODN2ALIQCOFINS: TFloatField;
    sqlC175VALOR_PIS: TFloatField;
    sqlC175VALOR_COFINS: TFloatField;
    sqlC175TOTAL_ITEM: TFloatField;
    sqlC175VALOR_DESCONTO: TFloatField;
    sqlOperacaoCOD_OPE: TIntegerField;
    sqlOperacaoOPESA60DESCR: TStringField;
    sqlC175CFOP: TStringField;
    sqlSerie: TFDQuery;
    sqlSerieSERIA2TIPONOTA: TStringField;
    Mem100: TFDMemTable;
    Mem100CodigoCredito: TIntegerField;
    Mem100IndCredito: TStringField;
    Mem100VlrBasePis: TFloatField;
    Mem100AliqPis: TFloatField;
    Mem100VlrCredito: TFloatField;
    Mem100VlrCreditoDisponivel: TFloatField;
    Mem100IndUtilCredito: TStringField;
    Mem100VlrCreditoDescontado: TFloatField;
    Mem100SaldoCredito: TFloatField;
    Mem100CST_PIS: TStringField;
    Mem400: TFDMemTable;
    Mem400CST_Pis: TStringField;
    Mem400Valor: TFloatField;
    Mem400PlanoConta: TStringField;
    Mem500: TFDMemTable;
    Mem500CodigoCredito: TIntegerField;
    Mem500IndCredito: TStringField;
    Mem500VlrBaseCofins: TFloatField;
    Mem500AliqCofins: TFloatField;
    Mem500VlrCredito: TFloatField;
    Mem500VlrCreditoDisponivel: TFloatField;
    Mem500IndUtilCredito: TStringField;
    Mem500VlrCreditoDescontado: TFloatField;
    Mem500SaldoCredito: TFloatField;
    Mem500CST_COFINS: TStringField;
    Mem800: TFDMemTable;
    Mem800CST_Cofins: TStringField;
    Mem800Valor: TFloatField;
    Mem800PlanoConta: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FMsg: String;
    FevProgressao: tEvProgressao;
    FevMsg: tEvMensagem;
    FPosicao: Integer;
    FMax : Integer;
    FevMax : tEvMaxProgress;
    DataDocumento : String;
    NroDocumento : String;
    EntradaSaida : String;
    Chave : String;
    procedure Gravar_0150;
    procedure Gravar_0190;
    procedure Gravar_0200;
    procedure Gravar_C100;
    procedure SetMsg(const Value: String);
    procedure setPosicao(const Value: Integer);
    procedure setMax(const Value : Integer);
  public
    { Public declarations }
    fDMConnection : TDMConnection;
    DataInicial : TDate;
    DataFinal : TDate;
    Ind_Movimento : Boolean;
    Ind_Incidencia : TEnumCOD_INC_TRIB;
    Ind_Metodo : TEnumIND_APRO_CRED;
    Ind_Tipo : TEnumCOD_TIPO_CONT;
    Ind_Credito : TEnumIND_REG_CUM;
    CaminhoArquivo : String;
    NomeArquivo : String;

    procedure Gerar_Bloco_0;
    procedure Gerar_Bloco_0_Reg0000;
    procedure Gerar_Bloco_0_Reg0001;
    procedure Gerar_Bloco_0_Reg0100;
    procedure Gerar_Bloco_0_Reg0110;
    procedure Gerar_Bloco_0_Reg0140;
    procedure Gerar_Bloco_0_Reg0150;
    procedure Gerar_Bloco_0_Reg0190;
    procedure Gerar_Bloco_0_Reg0200;
    procedure Gerar_Bloco_0_Reg0400;
    procedure Gerar_Bloco_0_Reg0500;
    procedure Gerar_Bloco_A;

    procedure Gerar_Bloco_C;
    procedure Gerar_Bloco_C_Regc001;
    procedure Gerar_Bloco_C_RegC100;
    procedure Gerar_Bloco_C_RegC500;

    procedure Gerar_Bloco_M;
    procedure Gerar_Bloco_M_RegM001;
    procedure Gerar_Bloco_M_RegM100;
    procedure Gerar_Bloco_M_RegM200;
    procedure Gerar_Bloco_M_RegM400;
    procedure Gerar_Bloco_M_RegM500;
    procedure Gerar_Bloco_M_RegM600;
    procedure Gerar_Bloco_M_RegM800;
    procedure Gerar_Blcoo_M_RegM810;

    procedure GravarTxt;

    property evMsg : tEvMensagem read FevMsg write FevMsg;
    property evProgresso : tEvProgressao read FevProgressao write FevProgressao;
    property Msg : String read FMsg write SetMsg;
    property Posicao : Integer read FPosicao write setPosicao;
    property Max : Integer read FMax write setMax;
    property evMax : tEvMaxProgress read FevMax write FevMax;
  end;

var
  DMSpedPisCofins: TDMSpedPisCofins;

implementation

uses
  Vcl.Dialogs, ACBrEPCBlocos, System.StrUtils, Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMSpedPisCofins.DataModuleCreate(Sender: TObject);
begin
  fDMConnection := TDMConnection.Create(nil);
  fDMConnection.conectar;
  qryEmpresa.Close;
  qryEmpresa.open;
end;

procedure TDMSpedPisCofins.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(fDMConnection) then
    FreeAndNil(fDMConnection);
end;

procedure TDMSpedPisCofins.Gerar_Blcoo_M_RegM810;
begin

end;

procedure TDMSpedPisCofins.Gerar_Bloco_0;
begin
  Gerar_Bloco_0_Reg0000;
  Gerar_Bloco_0_Reg0001;
//  Gerar_Bloco_0_Reg0035;  //nao usado
  Gerar_Bloco_0_Reg0100;
  Gerar_Bloco_0_Reg0110;
//  Gerar_Bloco_0_Reg0111;  //nao usado
//  Gerar_Bloco_0_Reg0120;  //nao usado
  Gerar_Bloco_0_Reg0140;
  Gerar_Bloco_0_Reg0150;
  Gerar_Bloco_0_Reg0190;
  Gerar_Bloco_0_Reg0200;
  Gerar_Bloco_0_Reg0400;
  Gerar_Bloco_0_Reg0500;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0000;
begin

  with ACBrSPEDPisCofins1 do
  begin
    DT_INI := DataInicial;
    DT_FIN := DataFinal;
    Path := CaminhoArquivo;
    Arquivo := NomeArquivo;
    IniciaGeracao;
  end;

  with ACBrSPEDPisCofins1 do
  begin
    LinhasBuffer := 1000;
  end;

  with ACBrSPEDPisCofins1.Bloco_0.Registro0000New do
  begin
     Msg := 'Gerando registro 0000';
     COD_VER := vlVersao320;
     TIPO_ESCRIT := tpEscrOriginal;
     DT_INI := DataInicial;
     DT_FIN := DataFinal;
     IND_SIT_ESP := indNenhum;
     NOME := qryEmpresaEMPRA60RAZAOSOC.AsString;
     CNPJ := qryEmpresaEMPRA14CGC.AsString;
     UF := qryEmpresaEMPRA2UF.AsString;
     COD_MUN := qryEmpresaEMPRIMUNICODFED.AsInteger;
     SUFRAMA := '';
     case AnsiIndexStr(qryEmpresaIND_NATUREZA_PJ.AsString,['00','01','02','03','04','05']) of
      0 : IND_NAT_PJ := indNatPJSocEmpresariaGeral;
      1 : IND_NAT_PJ := indNatPJSocCooperativa;
      2 : IND_NAT_PJ := indNatPJEntExclusivaFolhaSal;
      3 : IND_NAT_PJ := indNatPJSocEmpresariaGeralSCP;
      4 : IND_NAT_PJ := indNatPJSocCooperativaSCP;
      5 : IND_NAT_PJ := indNatPJSocContaParticante;
      6 : IND_NAT_PJ := indNatPJNenhum;
     end;

     case qryEmpresaEMPRIATIVIDADE.AsInteger of
      0 : IND_ATIV := indAtivIndustrial;
      1 : IND_ATIV := indAtivPrestadorServico;
      2 : IND_ATIV := indAtivComercio;
      3 : IND_ATIV := indAtivoFincanceira;
      4 : IND_ATIV := indAtivoImobiliaria;
      9 : IND_ATIV := indAtivoOutros;
     end;
  end;

end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0001;
begin
  Msg := 'Gerando registro 0001';
  with ACBrSPEDPisCofins1.Bloco_0.Registro0001New do
  begin
    if Ind_Movimento then
      IND_MOV := imComDados
    else
      IND_MOV := imSemDados;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0100;
begin
  Msg := 'Gerando registro 0100';
  with ACBrSPEDPisCofins1.Bloco_0.Registro0100New do
  begin

    NOME := qryEmpresaEMPRA60CONTADOR.AsString;
    CPF := qryEmpresaEMPRA20CPFCONTADOR.AsString;
    CRC := qryEmpresaEMPRA15CRCCONTADOR.AsString;
    CNPJ := qryEmpresaEMPRA14CNPJCONTADOR.AsString;
    CEP := qryEmpresaEMPRA8CEPCONTADOR.AsString;
    ENDERECO := qryEmpresaEMPRA60ENDCONTADOR.AsString;
    NUM  := '';
    COMPL := '';
    BAIRRO := qryEmpresaEMPRA60BAICONTADOR.AsString;
    FONE := qryEmpresaEMPRA10FONECONTADOR.AsString;
    FAX := qryEmpresaEMPRA10FAXCONTADOR.AsString;
    EMAIL := qryEmpresaEMPRA150CONTADOREMAIL.AsString;
    COD_MUN := StrToIntDef(qryEmpresaEMPRA7CODMUNCONTADOR.AsString,0);
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0110;
begin
  Msg := 'Gerando registro 0110';
  with ACBrSPEDPisCofins1.Bloco_0.Registro0001New.Registro0110 do
  begin
    case Ind_Incidencia of
      tpEscrOpIncNaoCumulativo : COD_INC_TRIB := codEscrOpIncNaoCumulativo;
      tpEscrOpIncCumulativo    : COD_INC_TRIB := codEscrOpIncCumulativo;
      tpEscrOpIncAmbos         : COD_INC_TRIB := codEscrOpIncAmbos;
    end;

    case Ind_Metodo of
      tpMetodoApropriacaoDireta    : IND_APRO_CRED := indMetodoApropriacaoDireta;
      tpMetodoDeRateioProporcional : IND_APRO_CRED := indMetodoDeRateioProporcional;
    end;

    case Ind_Tipo of
      tpIndTipoConExclAliqBasica : COD_TIPO_CONT := codIndTipoConExclAliqBasica;
      tpIndTipoAliqEspecificas   : COD_TIPO_CONT := codIndTipoAliqEspecificas;
    end;

    case Ind_Credito of
      tpRegimeCaixa                   : IND_REG_CUM := codRegimeCaixa;
      tpRegimeCompetEscritConsolidada : IND_REG_CUM := codRegimeCompetEscritConsolidada;
      tpRegimeCompetEscritDetalhada   : IND_REG_CUM := codRegimeCompetEscritDetalhada;
    end;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0140;
begin
  Msg := 'Gerando registro 0140';
  with ACBrSPEDPisCofins1.Bloco_0 do
  begin
    with Registro0001New do
    begin
      with Registro0140New do
      begin
        COD_EST := qryEmpresaEMPRICOD.AsString;
        NOME := qryEmpresaEMPRA60RAZAOSOC.AsString;
        CNPJ := qryEmpresaEMPRA14CGC.AsString;
        UF := qryEmpresaEMPRA2UF.AsString;
        IE := qryEmpresaEMPRA20IE.AsString;
        COD_MUN := qryEmpresaEMPRIMUNICODFED.AsInteger;
        IM := '';
        SUFRAMA := '';
      end;
    end;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0150;
begin
  with ACBrSPEDPisCofins1.Bloco_0 do
  begin
    //Registros Participantes
    Msg := 'Aguarde...Verificando Participantes!';
    Gravar_0150;
    sqlParticipantes.First;
    Posicao := 0;
    sqlParticipantes.FetchAll;
    Max := sqlParticipantes.RecordCount;
    while not sqlParticipantes.Eof do
    begin
      Posicao := Posicao + 1;
      with Registro0150New do
      begin
        Msg := 'Gerando registro 0150';
        COD_PART := sqlParticipantesCOD_PART.AsString;
        NOME     := sqlParticipantesNOME.AsString;
        COD_PAIS := sqlParticipantesCOD_PAIS.AsString;
        CNPJ     := sqlParticipantesCNPJ.AsString;
        CPF      := sqlParticipantesCPF.AsString;
        IE       := sqlParticipantesIE.AsString;
        COD_MUN  := sqlParticipantesCOD_MUN.AsInteger;
        SUFRAMA  := '';
        ENDERECO := sqlParticipantesENDERECO.AsString;
        NUM      := sqlParticipantesEND_NUM.AsString;
        COMPL    := sqlParticipantesCOMPLEMENTO.AsString;
        BAIRRO   := sqlParticipantesBAIRRO.AsString;
        sqlParticipantes.Next;
      end;
    end;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0190;
begin
  with ACBrSPEDPisCofins1.Bloco_0 do
  begin
    //Registros Unidade de Medida
    Msg := 'Aguarde...Verificando Unidades!';
    Posicao := 0;
    Gravar_0190;
    sqlUnidades.First;
    Max := sqlUnidades.RecordCount;
    while not sqlUnidades.Eof do
    begin
      Posicao := Posicao + 1;
      with Registro0190New do
      begin
        Msg := 'Gerando registro 0190';
        UNID  := sqlUnidadesUND_SIGLA.AsString;
        DESCR := sqlUnidadesUND_DESCR.AsString;
      end;
      sqlUnidades.Next;
    end;
  end;

end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0200;
begin
  Msg := 'Aguarde...Verificando Produtos!';
  with ACBrSPEDPisCofins1.Bloco_0 do
  begin
    //Registros Produtos
    Gravar_0200;
    sqlProduto.First;
    Posicao := 0;
    sqlProduto.FetchAll;
    Max := sqlProduto.RecordCount;
    while not sqlProduto.Eof do
    begin
      with Registro0200New do
      begin
        Posicao := Posicao + 1;
        Msg := 'Gerando registro 0200 - ' + sqlProdutoDESCRICAO.AsString;
        COD_ITEM     := sqlProdutoCOD_ITEM.AsString;
        DESCR_ITEM   := sqlProdutoDESCRICAO.AsString;
        COD_BARRA    := sqlProdutoCODIGOBARRAS.AsString;
        COD_ANT_ITEM := '';
        UNID_INV     := sqlProdutoUNIDADEINVENTARIO.AsString;
        case AnsiIndexStr(sqlProdutoTIPO_ITEM.AsString,['00','01','02','03','04','05','06','07','08','09','10','99']) of
          0 : TIPO_ITEM := tiMercadoriaRevenda;    // 00 – Mercadoria para Revenda
          1 : TIPO_ITEM := tiMateriaPrima;         // 01 – Matéria-Prima;
          2 : TIPO_ITEM := tiEmbalagem;            // 02 – Embalagem;
          3 : TIPO_ITEM := tiProdutoProcesso;      // 03 – Produto em Processo;
          4 : TIPO_ITEM := tiProdutoAcabado;       // 04 – Produto Acabado;
          5 : TIPO_ITEM := tiSubproduto;           // 05 – Subproduto;
          6 : TIPO_ITEM := tiProdutoIntermediario; // 06 – Produto Intermediário;
          7 : TIPO_ITEM := tiMaterialConsumo;      // 07 – Material de Uso e Consumo;
          8 : TIPO_ITEM := tiAtivoImobilizado;     // 08 – Ativo Imobilizado;
          9 : TIPO_ITEM := tiServicos;             // 09 – Serviços;
          10: TIPO_ITEM := tiOutrosInsumos;        // 10 – Outros Insumos;
          11: TIPO_ITEM := tiOutras;                // 99 – Outras
        end;
        COD_NCM      := sqlProdutoCODIGONCM.AsString;
        EX_IPI       := '';
        COD_GEN      := '';
        COD_LST      := '';
        ALIQ_ICMS    := sqlProdutoALIQUOTAICM.AsFloat;
      end;
      Application.ProcessMessages;
      sqlProduto.Next;
    end;
  end;

end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0400;
begin
  Msg := 'Gerando registro 0400';
  sqlOperacao.Close;
  sqlOperacao.ParamByName('datainicial').AsDate := DataInicial;
  sqlOperacao.ParamByName('datafinal').AsDate := DataFinal;
  sqlOperacao.Open;
  Posicao := 0;
  sqlOperacao.FetchAll;
  Max := sqlOperacao.RecordCount;
  while not sqlOperacao.Eof do
  begin
    Posicao := Posicao + 1;
    with ACBrSPEDPisCofins1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0400New do
        begin
          COD_NAT   := sqlOperacaoCOD_OPE.AsString;
          DESCR_NAT := sqlOperacaoOPESA60DESCR.AsString;
        end;
      end;
    end;
    Application.ProcessMessages;
    sqlOperacao.Next;
  end;

end;

procedure TDMSpedPisCofins.Gerar_Bloco_0_Reg0500;
begin
      // REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS
  Msg := 'Gerando registro 0500';
  sqlPlanoContas.Close;
  sqlPlanoContas.Open;
  sqlPlanoContas.First;
  Posicao := 0;
  sqlPlanoContas.FetchAll;
  Max := sqlPlanoContas.RecordCount;
  while not sqlPlanoContas.Eof do
  begin
    Posicao := Posicao + 1;
    with ACBrSPEDPisCofins1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0500New do
        begin
          COD_CTA := sqlPlanoContasPLCTA15COD.AsString;
          DT_ALT := sqlPlanoContasREGISTRO.AsDateTime;
          if copy(sqlPlanoContasPLCTA15COD.AsString,1,1) = '1' then
            COD_NAT_CC := ncgAtivo
          else
            COD_NAT_CC := ncgPassivo;
          if sqlPlanoContasPLCTCANALSINT.AsString = 'S' then
            IND_CTA := indCTASintetica
          else
            IND_CTA := indCTAnalitica;
          NIVEL :=  IntToStr(sqlPlanoContasPLCTINIVEL.AsInteger);
          NOME_CTA := sqlPlanoContasPLCTA60DESCR.AsString;
          COD_CTA_REF := '';
          CNPJ_EST := qryEmpresaEMPRA14CGC.AsString;
        end;
      end;
    end;
    Application.ProcessMessages;
    sqlPlanoContas.Next;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_A;
begin
  with ACBrSPEDPisCofins1.Bloco_A do
  begin
    with RegistroA001New do
    begin
      IND_MOV := imSemDados;
    end;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_C;
begin
  Gerar_Bloco_C_Regc001;
  Gerar_Bloco_C_RegC100;
  Gerar_Bloco_C_RegC500;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_C_Regc001;
begin
  with ACBrSPEDPisCofins1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      if Ind_Movimento then
        IND_MOV := imComDados
      else
        IND_MOV := imSemDados;
    end;
  end;

end;

procedure TDMSpedPisCofins.Gerar_Bloco_C_RegC100;
var
  ordem : integer;
  OpEntraSai : String;
  CST : String;
  ValorBase : Real;
  Quantidade : Real;
begin
  Msg := 'Gerando registro C100';
  with ACBrSPEDPisCofins1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      with RegistroC010New do
      begin
        CNPJ := qryEmpresaEMPRA14CGC.AsString;
        IND_ESCRI := IndEscriIndividualizado;

        {$Region 'Cupom Fiscal'}
        //Gera cupom fiscal
        Msg := 'Abrindo cupom Fiscal';
        sqlConsulta.Close;
        sqlConsulta.SQL.Clear;
        sqlConsulta.SQL.Add( 'Select N.* from CUPOM N ' );
        sqlConsulta.SQL.Add('Where (N.CUPODEMIS>=''' + FormatDateTime('mm/dd/yyyy',DataInicial) + ''') ');
        sqlConsulta.SQL.Add('and (N.CUPODEMIS<=''' + FormatDateTime('mm/dd/yyyy',DataFinal) + ''') AND ');
        sqlConsulta.SQL.Add('N.EMPRICOD=' + qryEmpresaEMPRICOD.AsString + ' AND (N.CUPOCSTATUS = ''A'' or N.CUPOCSTATUS = ''C'') ');
        sqlConsulta.SQL.Add('AND N.CHAVEACESSO is not null AND COALESCE(N.STNFE,' + QuotedStr('') + ') <> ' + QuotedStr(''));
        sqlConsulta.Open;
        Posicao := 0;
        sqlConsulta.FetchAll;
        Max := sqlConsulta.RecordCount;
        while not sqlConsulta.Eof do
        begin
          Posicao := Posicao + 1;
          Msg := 'Gerando cupom nº: ' + sqlConsulta.FieldByName('CUPOINRO').AsString;
          with RegistroC100New do
          begin
            IND_OPER := tpSaidaPrestacao;
            IND_EMIT := edEmissaoPropria;
            COD_PART := '';
            COD_MOD  := '65';
            if sqlConsulta.FieldByName('CUPOCSTATUS').AsString = 'C' then
              COD_SIT  := sdCancelado
            else
              COD_SIT  := sdfRegular;
            SER := sqlConsulta.FieldByName('TERMICOD').AsString;
            NUM_DOC := sqlConsulta.FieldByName('CUPOINRO').AsString;
            DT_DOC  := sqlConsulta.FieldByName('CUPODEMIS').AsDateTime;
            CHV_NFE := sqlConsulta.FieldByName('CHAVEACESSO').AsString;
            VL_DOC  := sqlConsulta.FieldByName('CUPON2TOTITENS').AsFloat - sqlConsulta.FieldByName('CUPON2DESC').AsFloat;
            if sqlConsulta.FieldByName('CUPOCTIPOPADRAO').AsString = 'VISTA' then
              IND_PGTO := tpVista
            else
              IND_PGTO := tpPrazo;
            VL_DESC := sqlConsulta.FieldByName('CUPON2DESC').AsFloat;
            VL_ABAT_NT := 0;
            VL_MERC := sqlConsulta.FieldByName('CUPON2TOTITENS').AsFloat;
            IND_FRT := tfSemCobrancaFrete;
            VL_FRT  := 0;
            VL_SEG  := 0;
            VL_OUT_DA := 0;
            sqlConsulta2.Close;
            sqlConsulta2.SQL.Clear;

            sqlConsulta2.SQL.Add('select sum(CI.TOTAL_ITEM * (coalesce(P.PRODN2ALIQPIS, 0) / 100)) VALOR_PIS, ');
            sqlConsulta2.SQL.Add('sum(CI.TOTAL_ITEM * (coalesce(P.PRODN2ALIQCOFINS, 0) / 100)) VALOR_COFINS, ');
            sqlConsulta2.SQL.Add('sum(CI.TOTAL_ITEM) TOTAL_ITEM, sum(coalesce(CI.CPITN2DESC, 0) + ');
            sqlConsulta2.SQL.Add('coalesce(CI.VLR_DESCONTO_RATEIO, 0)) VALOR_DESCONTO, ');
            sqlConsulta2.SQL.Add('sum(coalesce(CI.CPITN2BASEICMS, 0)) CPITN2BASEICMS, ');
            sqlConsulta2.SQL.Add('sum(coalesce(CI.CPITN2VLRICMS, 0)) CPITN2VLRICMS from CUPOMITEM CI ');
            sqlConsulta2.SQL.Add('inner join PRODUTO P on CI.PRODICOD = P.PRODICOD ');
            sqlConsulta2.SQL.Add('where CI.CUPOA13ID = :ID_CUPOM ');
            sqlConsulta2.ParamByName('ID_CUPOM').AsString := sqlConsulta.FieldByName('CUPOA13ID').AsString;
            sqlConsulta2.Open;
            VL_BC_ICMS    := sqlConsulta2.FieldByName('CPITN2BASEICMS').AsFloat;
            VL_ICMS       := sqlConsulta2.FieldByName('CPITN2VLRICMS').AsFloat;
            VL_BC_ICMS_ST := 0;
            VL_ICMS_ST    := 0;
            VL_IPI        := 0;

            sqlC175.Close;
            sqlC175.ParamByName('ID_CUPOM').AsString := sqlConsulta.FieldByName('cupoa13id').AsString;
            sqlC175.Open;
            sqlC175.First;
            while not sqlC175.Eof do
            begin
              VL_PIS := VL_PIS + sqlC175VALOR_PIS.AsFloat;
              VL_COFINS := VL_COFINS + sqlC175VALOR_COFINS.AsFloat;
              sqlC175.Next;
            end;
            VL_PIS_ST     := 0;
            VL_COFINS_ST  := 0;

            //Registro C110 não foi gerado   Complemento do Documento - Informação Complementar da Nota Fiscal
            //Registro C111 não foi gerado   Processo Referenciado
            //Registro C120 não foi gerado   Complemento do Documento - Operações de Importação

            if COD_SIT  = sdCancelado then
            begin
              sqlConsulta.Next;
              Continue;
            end;
            sqlC175.First;
            while not sqlc175.Eof do
            begin
              with RegistroC175New do
              begin
                CFOP := sqlC175CFOP.AsString;
                VL_OPR := sqlC175TOTAL_ITEM.AsFloat;
                VL_DESC := sqlC175VALOR_DESCONTO.AsFloat;
                CST_PIS := StrToCstPis(sqlC175PRODA2CSTPIS.AsString);
                if sqlC175PRODA2CSTPIS.AsString <> '05' then
                begin
                  VL_BC_PIS := sqlC175TOTAL_ITEM.AsFloat;
                  VL_PIS := sqlC175VALOR_PIS.AsFloat;
                end
                else
                begin
                  VL_BC_PIS := 0;
                  VL_PIS := 0;
                end;

                ALIQ_PIS := sqlC175PRODN2ALIQPIS.AsFloat;
                CST_COFINS := StrToCstCofins(sqlC175PRODA2CSTCOFINS.AsString);
                if sqlC175PRODA2CSTCOFINS.AsString <> '05' then
                begin
                  VL_BC_COFINS := sqlC175TOTAL_ITEM.AsFloat;
                  VL_COFINS := sqlC175VALOR_COFINS.AsFloat;
                end
                else
                begin
                  VL_BC_COFINS := 0;
                  VL_COFINS := 0;
                end;

                ALIQ_COFINS := sqlC175PRODN2ALIQCOFINS.AsFloat;

                COD_CTA := SQLLocate('OPERACAOESTOQUE','OPESICOD','PLCTA15CODCRED',sqlConsulta.FieldByName('OPESICOD').AsString);
                INFO_COMPL := '';
              end;
              sqlC175.Next;
            end;
          end;
          Application.ProcessMessages;
          sqlConsulta.Next;
        end;
        {$EndRegion }

        {$Region 'Nota Fiscal'}
        Msg := 'Abrindo Notas Fiscais';
        sqlConsulta.Close;
        sqlConsulta.SQL.Clear;
        sqlConsulta.SQL.Add('Select N.*, C.CLIEA60CIDRES, F.FORNA60CID, E.EMPRA60CID from NOTAFISCAL N ');
        sqlConsulta.SQL.Add('lEFT JOIN CLIENTE C ON C.CLIEA13ID = N.CLIEA13ID  ' );
        sqlConsulta.SQL.Add('LEFT JOIN FORNECEDOR F ON F.FORNICOD = N.FORNICOD ' );
        sqlConsulta.SQL.Add('LEFT JOIN EMPRESA E ON E.EMPRICOD = N.EMPRICOD ');
        sqlConsulta.SQL.Add('where (N.NOFIDEMIS>='''+FormatDateTime('mm/dd/yyyy',DataInicial)+''') and ');
        sqlConsulta.SQL.Add('(N.NOFIDEMIS <= '''+FormatDateTime('mm/dd/yyyy',DataFinal)+''') AND ');
        sqlConsulta.SQL.Add('N.EMPRICOD='+qryEmpresaEMPRICOD.AsString+' AND N.NOFICSTATUS <> ''A'' and ');
        sqlConsulta.SQL.Add('COALESCE(N.NOFIA5CODRETORNO, ' + QuotedStr('') + ') <> ' + QuotedStr(''));
        sqlConsulta.Open;
        Posicao := 0;
        sqlConsulta.FetchAll;
        Max := sqlConsulta.RecordCount;
        while not sqlConsulta.Eof do
        begin
          Posicao := Posicao + 1;
          Msg := 'Gerando Nota nº: ' + sqlConsulta.FieldByName('NOFIINUMERO').AsString;
          with RegistroC100New do
          begin
            sqlConsulta2.Close;
            sqlConsulta2.SQL.Clear;
            sqlConsulta2.SQL.Add('Select * From CONTASRECEBER Where ');
            sqlConsulta2.SQL.Add('NOFIA13ID = ''' + sqlConsulta.FieldByName('NOFIA13ID').AsString + ''' order by CTRCICOD');
            sqlConsulta2.Open;
            NroDocumento   := sqlConsulta.FieldByName('NOFIINUMERO').AsString;
            DataDocumento := FormatDateTime('ddmmyyyy',sqlConsulta.FieldByName('NOFIDEMIS').AsDateTime);
            if sqlConsulta.FieldByName('NOFA1ENTRADASAIDA').AsString = '' then  // // 02 IND_OPER Indicador do tipo de operação: C 001* - S - 0- Entrada;  1- Saída
            begin
              if SQLLocate('OPERACAOESTOQUE','OPESICOD','OPESCENTRADASAIDA',sqlConsulta.FieldByName('OPESICOD').AsString) = 'E' Then
              begin
                EntradaSaida := '0';
              end else
              begin
                EntradaSaida := '1';
              end;
            end
            else
            if sqlConsulta.FieldByName('NOFA1ENTRADASAIDA').AsString = 'E' then
            begin
              EntradaSaida := '0';
            end
            else
            begin
              EntradaSaida := '1';
            end;
            if sqlConsulta.FieldByName('NOFIA44CHAVEACESSO').AsString <> '' then
              Chave := sqlConsulta.FieldByName('NOFIA44CHAVEACESSO').AsString
            else
              Chave := '';
            if EntradaSaida = '1' then
            begin
              IND_OPER := tpSaidaPrestacao;
              IND_EMIT := edEmissaoPropria;
            end
            else
            begin
              IND_OPER := tpEntradaAquisicao;
              IND_EMIT := edTerceiros;
            end;
            if sqlconsulta.FieldByName('CLIEA13ID').AsString = EmptyStr then
              COD_PART := 'F'+ sqlConsulta.FieldByName('FORNICOD').AsString
            else
              COD_PART := SQLLocate('SPED_150','CNPJ','COD_PART',SQLLocate('CLIENTE','CLIEA13ID','CLIEA14CGC',sqlConsulta.FieldByName('CLIEA13ID').AsString));
            COD_MOD  := '55';
            if sqlConsulta.FieldByName('NOFICSTATUS').AsString = 'C' then
              COD_SIT  := sdCancelado
            else
              COD_SIT  := sdfRegular;
            SER := sqlConsulta.FieldByName('SERIA5COD').AsString;
            NUM_DOC := sqlConsulta.FieldByName('NOFIINUMERO').AsString;
            CHV_NFE := sqlConsulta.FieldByName('NOFIA44CHAVEACESSO').AsString;
            DT_DOC  := sqlConsulta.FieldByName('NOFIDEMIS').AsDateTime;
            VL_DOC  := sqlConsulta.FieldByName('NOFIN2VLRNOTA').AsFloat - sqlConsulta.FieldByName('NOFIN2VLRDESC').AsFloat;
            if sqlConsulta.FieldByName('CUPOCTIPOPADRAO').AsString = 'VISTA' then
              IND_PGTO := tpVista
            else
              IND_PGTO := tpPrazo;
            VL_DESC := sqlConsulta.FieldByName('NOFIN2VLRDESC').AsFloat;
            VL_ABAT_NT := 0;
            VL_MERC := sqlConsulta.FieldByName('NOFIN2VLRPRODUTO').AsFloat;
            if sqlConsulta.FieldByName('NOFICFRETEPORCONTA').AsString = 'C' then
              IND_FRT := tfPorContaEmitente
            else
            if sqlConsulta.FieldByName('NOFICFRETEPORCONTA').AsString = 'F' then
              IND_FRT := tfPorContaDestinatario
            else
              IND_FRT := tfSemCobrancaFrete;
            VL_FRT  := 0;
            VL_SEG  := 0;
            VL_OUT_DA := 0;

            VL_BC_ICMS    := sqlConsulta.FieldByName('NOFIN2BASCALCICMS').AsFloat;
            VL_ICMS       := sqlConsulta.FieldByName('NOFIN2VLRICMS').AsFloat;
            VL_BC_ICMS_ST := sqlConsulta.FieldByName('NOFIN2BASCALCSUBS').AsFloat;
            VL_ICMS_ST    := sqlConsulta.FieldByName('NOFIN2VLRSUBS').AsFloat;
            VL_IPI        := sqlConsulta.FieldByName('NOFIN2VLRIPI').AsFloat;
            VL_PIS        := sqlConsulta.FieldByName('NOFIN3VLRPIS').AsFloat;
            VL_COFINS     := sqlConsulta.FieldByName('NOFIN3VLRCOFINS').AsFloat;
            VL_PIS_ST     := 0;
            VL_COFINS_ST  := 0;

            {$Region 'Item Nota Fiscal'}

            //Registro C110 não foi gerado   Complemento do Documento - Informação Complementar da Nota Fiscal
            //Registro C111 não foi gerado   Processo Referenciado
            //Registro C120 não foi gerado   Complemento do Documento - Operações de Importação
            sqlConsulta2.Close;
            sqlConsulta2.SQL.Clear;
            sqlConsulta2.SQL.Add('Select P.PRODA60DESCR, P.PRODA2CSTIPI, P.PRODA3CSTIPIENTRADA, ');
            sqlConsulta2.SQL.Add('P.PRODA2CSTPIS, P.PRODA3CSTPISENTRADA, P.PRODA2CSTCOFINS, ');
            sqlConsulta2.SQL.Add('P.PRODA3CSTCOFINSENTRADA, P.PRODN2ALIQCOFINS, P.PRODN2ALIQPIS, ');
            sqlConsulta2.SQL.Add('P.PRODN2ALIQCOFINS, P.PRODIORIGEM, U.UNIDA5DESCR, I.* ');
            sqlConsulta2.SQL.Add('From NotaFiscalItem I ');
            sqlConsulta2.SQL.Add('LEFT JOIN PRODUTO P ON P.PRODICOD = I.PRODICOD ');
            sqlConsulta2.SQL.Add('LEFT JOIN UNIDADE U ON U.UNIDICOD = P.UNIDICOD ');
            sqlConsulta2.SQL.Add('Where NOFIA13ID=''' + sqlConsulta.FieldByName('NOFIA13ID').AsString + '''');
            sqlConsulta2.Open;
            ordem := 1;
            while not sqlConsulta2.Eof do
            begin
              with RegistroC170New do   //Inicio Adicionar os Itens:
              begin
                NUM_ITEM := IntToStr(ordem);
                inc(ordem);
                ValorBase := sqlConsulta2.FieldByName('NFITN2VLRUNIT').AsFloat * sqlConsulta2.FieldByName('NFITN3QUANT').AsFloat;
                COD_ITEM := sqlConsulta2.FieldByName('PRODICOD').AsString;
                DESCR_COMPL := sqlConsulta2.FieldByName('PRODA60DESCR').AsString;
                QTD := sqlConsulta2.FieldByName('NFITN3QUANT').AsFloat;
                UNID := sqlConsulta2.FieldByName('UNIDA5DESCR').AsString;
                VL_ITEM := ValorBase;
                VL_DESC := sqlConsulta2.FieldByName('NFITN2VLRDESC').AsFloat;
                OpEntraSai := SQLLocate('OPERACAOESTOQUE','OPESICOD','OPERACAO_E_S',sqlConsulta.FieldByName('OPESICOD').AsString);
                if OpEntraSai = 'N' then
                  IND_MOV := mfNao
                else
                  IND_MOV := mfSim;
                if length(sqlConsulta2.FieldByName('NFITICST').Value) < 3 then
                  CST := sqlConsulta2.FieldByName('PRODIORIGEM').AsString + FormatFloat('00',sqlConsulta2.FieldByName('NFITICST').Value)
                else
                  CST := FormatFloat('000',sqlConsulta2.FieldByName('NFITICST').Value);
                CST_ICMS := StrToCstIcms(CST);
                if sqlConsulta2.FieldByName('CFOPA5CODAUX').AsString <> '' Then
                  CFOP := sqlConsulta2.FieldByName('CFOPA5CODAUX').AsString
                Else
                  CFOP := sqlConsulta.FieldByName('CFOPA5COD').AsString;
                COD_NAT := sqlConsulta.FieldByName('OPESICOD').AsString;

                if sqlConsulta2.FieldByName('NFITICST').AsInteger in ([30, 40, 41, 50, 60]) then
                begin
                  VL_BC_ICMS := 0;
                  ALIQ_ICMS := 0;
                  VL_ICMS := 0;
                end
                else
                begin
                  VL_BC_ICMS := sqlConsulta2.FieldByName('NFITN2BASEICMS').AsFloat;
                  ALIQ_ICMS := sqlConsulta2.FieldByName('NFITN2PERCICMS').AsFloat;
                  VL_ICMS := sqlConsulta2.FieldByName('NFITN2VLRICMS').AsFloat;
                end;

                if sqlConsulta2.FieldByName('NFITICST').AsInteger  in ([10,30,70]) then
                begin
                  VL_BC_ICMS_ST := 0;
                  ALIQ_ST := 0;
                  VL_ICMS_ST := 0;
                end
                else
                begin
                  VL_BC_ICMS_ST := sqlConsulta2.FieldByName('NFITN2BASESUBS').AsFloat;
                  ALIQ_ST := sqlConsulta2.FieldByName('NFITN2PERCSUBS').AsFloat;
                  VL_ICMS_ST := sqlConsulta2.FieldByName('NFITN2VLRSUBS').AsFloat;
                end;
                IND_APUR := iaMensal;

                if (OpEntraSai = 'S') or (sqlConsulta.FieldByName('NOFA1ENTRADASAIDA').AsString = 'S') then
                begin
                  if Copy(sqlConsulta2.FieldByName('PRODA2CSTIPI').Asstring,0,2) = '' then
                    CST_IPI := StrToCstIpi('99')
                  else
                    CST_IPI := StrToCstIpi(Copy(sqlConsulta2.FieldByName('PRODA2CSTIPI').Asstring,0,2));
                end
                else
                begin
                  if Copy(sqlConsulta2.FieldByName('PRODA3CSTIPIENTRADA').Asstring,0,2) = '' then
                    CST_IPI := StrToCstIpi('99')
                  else
                    CST_IPI := StrToCstIpi(Copy(sqlConsulta2.FieldByName('PRODA3CSTIPIENTRADA').Asstring,0,2));
                end;
                COD_ENQ := '999';

                VL_BC_IPI := ValorBase;
                ALIQ_IPI := sqlConsulta2.FieldByName('NFITN2PERCIPI').AsFloat;
                VL_IPI := sqlConsulta2.FieldByName('NFITN2VLRIPI').AsFloat;

                if (OpEntraSai = 'S') or (sqlConsulta.FieldByName('NOFA1ENTRADASAIDA').AsString = 'S') then // operacao de estoque de Saida
                begin
                  if Copy(sqlConsulta2.FieldByName('PRODA2CSTPIS').Asstring,0,2)='' then
                  begin
                    CST_PIS := StrToCstPis('99');
                    CST_COFINS := StrToCstCofins('99');
                  end
                  else
                  begin
                    CST_PIS := StrToCstPis(Copy(sqlConsulta2.FieldByName('PRODA2CSTPIS').Asstring,0,2));
                    CST_COFINS := StrToCstCofins(Copy(sqlConsulta2.FieldByName('PRODA2CSTCOFINS').Asstring,0,2));
                  end;
                end
                else
                begin
                  if Copy(sqlConsulta2.FieldByName('PRODA3CSTPISENTRADA').Asstring,0,2)='' then
                  begin
                    CST_PIS := StrToCstPis('99');
                    CST_COFINS := StrToCstCofins('99');
                  end
                  else
                  begin
                    CST_PIS := StrToCstPis(Copy(sqlConsulta2.FieldByName('PRODA3CSTPISENTRADA').Asstring,0,2));
                    CST_COFINS := StrToCstCofins(Copy(sqlConsulta2.FieldByName('PRODA3CSTCOFINSENTRADA').Asstring,0,2));
                  end;
                end;
                VL_BC_PIS := ValorBase;
                ALIQ_PIS_PERC := sqlConsulta2.FieldByName('PRODN2ALIQPIS').Value;
//                QUANT_BC_PIS := 0;
//                ALIQ_PIS_R := 0;
                VL_PIS := ValorBase * (sqlConsulta2.FieldByName('PRODN2ALIQPIS').Value / 100);

                VL_BC_COFINS := ValorBase;
                ALIQ_COFINS_PERC := sqlConsulta2.FieldByName('PRODN2ALIQCOFINS').Value;
//                QUANT_BC_COFINS := 0;
//                ALIQ_COFINS_R := 0;
                VL_COFINS := ValorBase * (sqlConsulta2.FieldByName('PRODN2ALIQCOFINS').Value / 100);
                COD_CTA := SQLLocate('OPERACAOESTOQUE','OPESICOD','PLCTA15CODCRED',sqlConsulta.FieldByName('OPESICOD').AsString);
              end; //Fim dos Itens;
              sqlConsulta2.Next;
            end; {$EndRegion}
          end;
          Application.ProcessMessages;
          sqlConsulta.Next;
        end; {$EndRegion}

        {$Region 'Nota Compra}
        Msg := 'Gerando Nota de Compra';
        sqlConsulta.Close;
        sqlConsulta.SQL.Clear;
        sqlConsulta.SQL.Add('select (select sum(I.NOCIN2VLRPIS) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('left join PRODUTO P on P.PRODICOD = I.PRODICOD ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as TOTAL_PIS, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN2VLRCOFINS) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('left join PRODUTO P on P.PRODICOD = I.PRODICOD ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as TOTAL_COFINS, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN3VLREMBAL * I.NOCIN3QTDEMBAL) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as TOTAL_MERC, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN2VBC) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as VL_BC_ICMS, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN3VLRICMS) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as VL_ICMS, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN2VBCST) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as VL_BC_ICMS_ST, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN3VLRSUBST) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as VL_ICMS_ST, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN3VLRIPI) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as VL_IPI, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN3VLRDESC) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as VL_DESC, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN2VLRDESPESAS) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as VL_OUTRAS, ');
        sqlConsulta.SQL.Add('(select sum(I.NOCIN3VLRFRETE) ');
        sqlConsulta.SQL.Add('from NOTACOMPRAITEM I ');
        sqlConsulta.SQL.Add('where I.NOCPA13ID = N.NOCPA13ID) as VL_FRETE, N.*, F.FORNA2UF ');
        sqlConsulta.SQL.Add('from NOTACOMPRA N ');
        sqlConsulta.SQL.Add('left join FORNECEDOR F on F.FORNICOD = N.FORNICOD ');
        sqlConsulta.SQL.Add('where N.NOCPDEMISSAO >= ''' + FormatDateTime('mm/dd/yyyy',DataInicial) + ''' AND ');
        sqlConsulta.SQL.Add('N.NOCPDEMISSAO <= ''' +FormatDateTime('mm/dd/yyyy',DataFinal) + ''' AND ');
        sqlConsulta.SQL.Add('(N.NOCPCSTATUS = ''E'' or N.NOCPCSTATUS = ''C'') AND ');
        sqlConsulta.SQL.Add('N.EMPRICOD = ' + QuotedStr(qryEmpresaEMPRICOD.AsString) + ' AND ');
        sqlConsulta.SQL.Add('N.CFOPA5COD <> 1253');
        sqlConsulta.SQL.Add('order by N.NOCPDEMISSAO');
        sqlConsulta.Open;
        Posicao := 0;
        sqlConsulta.FetchAll;
        Max := sqlConsulta.RecordCount;
        while not sqlConsulta.Eof do
        begin
          Posicao := Posicao + 1;
          Msg := 'Gerando notas de Compra do dia ' + FormatDateTime('dd.mm.yyyy', sqlConsulta.FieldByName('NOCPDEMISSAO').AsDateTime);
          with RegistroC100New do
          begin
            sqlConsulta2.Close;
            sqlConsulta2.SQL.Text := 'Select * From CONTASPAGAR Where NOCPA13ID = '''+sqlConsulta.FieldByName('NOCPA13ID').AsString+''' order by CTPGICOD';
            sqlConsulta2.Open;
            if sqlConsulta2.FieldByName('CTPGDVENC').isnull then
              IND_PGTO := tpVista
            else
              if  ( sqlConsulta2.FieldByName('CTPGDVENC').AsString = sqlConsulta.FieldByName('NOCPDEMISSAO').AsString) then
                IND_PGTO := tpVista
              else
                IND_PGTO := tpPrazo;
            sqlConsulta2.Next;
            if sqlConsulta2.RecordCount > 1 then
              IND_PGTO := tpPrazo;
            sqlConsulta2.Close;

            NroDocumento   := sqlConsulta.FieldByName('NOCPA30NRO').AsString;
            DataDocumento := FormatDateTime('ddmmyyyy',sqlConsulta.FieldByName('NOCPDEMISSAO').AsDateTime);
            if sqlConsulta.FieldByName('NOFIA44CHAVEACESSO').AsString <> '' then
              Chave := sqlConsulta.FieldByName('NOFIA44CHAVEACESSO').AsString
            else
              Chave := '';
            IND_OPER := tpEntradaAquisicao;
            IND_EMIT := edTerceiros;
            COD_PART := SQLLocate('SPED_0150','COD_FORN','COD_PART', sqlConsulta.FieldByName('FORNICOD').AsString);
            sqlConsulta.FieldByName('CLIEA13ID').AsString;
            sqlSerie.Close;
            sqlSerie.ParamByName('ID_NOTA').AsString := sqlConsulta.FieldByName('NOCPA13ID').AsString;
            sqlSerie.Open;
            if not sqlSerie.IsEmpty then
              COD_MOD  := sqlSerieSERIA2TIPONOTA.AsString
            else
              COD_MOD  := '55';

            SER := sqlConsulta.FieldByName('NOCPA5SERIE').AsString;
            if SER = '890' then
              COD_SIT := sdRegimeEspecNEsp
            else
              COD_SIT := sdRegular;

            NUM_DOC := sqlConsulta.FieldByName('NOCPA30NRO').AsString;
            CHV_NFE := Chave;
            DT_DOC  := sqlConsulta.FieldByName('NOCPDEMISSAO').AsDateTime;
            VL_DOC  := sqlConsulta.FieldByName('NOCPN3VLRTOTNOTA').AsFloat;
            VL_DESC := sqlConsulta.FieldByName('VL_DESC').AsFloat;
            VL_ABAT_NT := 0;
            VL_MERC := sqlConsulta.FieldByName('TOTAL_MERC').AsFloat + sqlConsulta.FieldByName('VL_ICMS_ST').AsFloat;
            if sqlConsulta.FieldByName('NOCPA5TIPOFRETE').AsString = 'C' then
              IND_FRT := tfPorContaEmitente
            else
            if sqlConsulta.FieldByName('NOCPA5TIPOFRETE').AsString = 'F' then
              IND_FRT := tfPorContaDestinatario
            else
              IND_FRT := tfSemCobrancaFrete;
            VL_FRT  := sqlConsulta.FieldByName('NOCPN3VLRFRETE').AsFloat;
            VL_SEG  := 0;
            VL_OUT_DA := sqlConsulta.FieldByName('VL_OUTRAS').AsFloat;
            VL_BC_ICMS    := sqlConsulta.FieldByName('VL_BC_ICMS').AsFloat;
            VL_ICMS       := sqlConsulta.FieldByName('VL_ICMS').AsFloat;
            VL_BC_ICMS_ST := sqlConsulta.FieldByName('VL_BC_ICMS_ST').AsFloat;
            VL_ICMS_ST    := sqlConsulta.FieldByName('VL_ICMS_ST').AsFloat;
            VL_IPI        := sqlConsulta.FieldByName('VL_IPI').AsFloat;
            VL_PIS        := sqlConsulta.FieldByName('TOTAL_PIS').AsFloat;
            VL_COFINS     := sqlConsulta.FieldByName('TOTAL_COFINS').AsFloat;
            VL_PIS_ST     := 0;
            VL_COFINS_ST  := 0;
            //Registro C110 não foi gerado   Complemento do Documento - Informação Complementar da Nota Fiscal
            //Registro C111 não foi gerado   Processo Referenciado
            //Registro C120 não foi gerado   Complemento do Documento - Operações de Importação

            {$Region 'Item Nota Compra'}
            sqlConsulta2.Close;
            sqlConsulta2.SQL.Clear;
            sqlConsulta2.SQL.Add('Select P.PRODA60DESCR, P.PRODA2CSTIPI, P.PRODA2CSTPIS, ');
            sqlConsulta2.SQL.Add('P.PRODN2ALIQCOFINS, P.PRODIORIGEM, P.PRODISITTRIB, ');
            sqlConsulta2.SQL.Add('P.PRODN2ALIQPIS, P.PRODN2ALIQCOFINS, P.PRODA2CSTCOFINS, ');
            sqlConsulta2.SQL.Add('P.PRODA2TIPOITEM , P.UNIDICOD, P.PRODA3CSTIPIENTRADA, ');
            sqlConsulta2.SQL.Add('P.PRODA3CSTPISENTRADA, P.PRODA3CSTCOFINSENTRADA, U.UNIDA5DESCR, ');
            sqlConsulta2.SQL.Add('I.* From NOTACOMPRAITEM I ');
            sqlConsulta2.SQL.Add('LEFT JOIN PRODUTO P ON P.PRODICOD = I.PRODICOD ');
            sqlConsulta2.SQL.Add('LEFT JOIN UNIDADE U ON U.UNIDICOD = I.UNIDICOD ');
            sqlConsulta2.SQL.Add('Where NOCPA13ID = ''' + sqlConsulta.FieldByName('NOCPA13ID').AsString + '''');
            sqlConsulta2.Open;
            ordem := 1;
            while not sqlConsulta2.Eof do
            begin
              with RegistroC170New do
              begin
                NUM_ITEM := IntToStr(ordem);
                inc(ordem);
                ValorBase := (sqlConsulta2.FieldByName('NOCIN3VLREMBAL').Value * sqlConsulta2.FieldByName('NOCIN3QTDEMBAL').Value) +
                              sqlConsulta2.FieldByName('NOCIN3VLRSUBST').Value ;
                Quantidade := sqlConsulta2.FieldByName('NOCIN3QTDEMBAL').Value;

                COD_ITEM := sqlConsulta2.FieldByName('PRODICOD').AsString;
                DESCR_COMPL := sqlConsulta2.FieldByName('PRODA60DESCR').AsString;
                QTD := Quantidade;
                UNID := sqlConsulta2.FieldByName('UNIDA5DESCR').AsString;
                VL_ITEM := ValorBase;
                VL_DESC := sqlConsulta2.FieldByName('NOCIN3VLRDESC').AsFloat;
                OpEntraSai := SQLLocate('OPERACAOESTOQUE','OPESICOD','OPERACAO_E_S',sqlConsulta.FieldByName('OPESICOD').AsString);
                if OpEntraSai = 'N' then
                  IND_MOV := mfNao
                else
                  IND_MOV := mfSim;
                if length(sqlConsulta2.FieldByName('NOCIA3CSTICMS').Value) < 3 then
                  CST := sqlConsulta2.FieldByName('PRODIORIGEM').AsString + FormatFloat('00',sqlConsulta2.FieldByName('NOCIA3CSTICMS').Value)
                else
                  CST := FormatFloat('000',sqlConsulta2.FieldByName('NOCIA3CSTICMS').Value);
                CST_ICMS := StrToCstIcms(CST);
                if sqlConsulta2.FieldByName('CFOPA5CODAUX').AsString <> '' Then
                  CFOP := sqlConsulta2.FieldByName('CFOPA5CODAUX').AsString
                Else
                  CFOP := sqlConsulta.FieldByName('CFOPA5COD').AsString;
                COD_NAT := sqlConsulta.FieldByName('OPESICOD').AsString;


                if (sqlConsulta2.FieldByName('NOCIA3CSTICMS').AsInteger in ([10, 30, 40, 41, 50, 51, 60, 70, 90]))
                or (sqlConsulta2.FieldByName('NOCIA3CSTICMS').AsInteger in ([130, 140, 141, 150, 151, 160]))
                or (sqlConsulta2.FieldByName('NOCIA3CSTICMS').AsInteger-200 in ([10, 30, 40, 41, 50, 51, 60, 70, 90])) then
                begin
                  VL_BC_ICMS := 0;
                  ALIQ_ICMS := 0;
                  VL_ICMS := 0;
                end
                else
                begin
                  VL_BC_ICMS := sqlConsulta2.FieldByName('NOCIN2VBC').AsFloat;
                  ALIQ_ICMS := sqlConsulta2.FieldByName('NOCIN3PERCICMS').AsFloat;
                  VL_ICMS := sqlConsulta2.FieldByName('NOCIN3VLRICMS').AsFloat;
                end;

                if (sqlConsulta2.FieldByName('NOCIA3CSTICMS').AsInteger in ([10, 30, 40, 41, 50, 51, 60, 70, 90])) or
                   (sqlConsulta2.FieldByName('NOCIA3CSTICMS').AsInteger in ([130, 140, 141, 150, 151, 160])) or
                   (sqlConsulta2.FieldByName('NOCIA3CSTICMS').AsInteger-200 in ([10, 30, 40, 41, 50, 51, 60, 70, 90])) then
                begin
                  VL_BC_ICMS_ST := 0;
                  ALIQ_ST := 0;
                  VL_ICMS_ST := 0;
                end
                else
                begin
                  VL_BC_ICMS_ST := sqlConsulta2.FieldByName('NOCIN2VBCST').AsFloat;
                  ALIQ_ST := sqlConsulta2.FieldByName('NOCIN2PERCSUBST').AsFloat;
                  VL_ICMS_ST := sqlConsulta2.FieldByName('NOCIN3VLRSUBST').AsFloat;
                end;
                IND_APUR := iaMensal;

                if sqlConsulta2.FieldByName('NOCA3CSTIPI').Asstring='' then
                  CST_IPI := StrToCstIpi('49')
                else
                  CST_IPI := StrToCstIpi(Copy(sqlConsulta2.FieldByName('NOCA3CSTIPI').Asstring,0,2));

                COD_ENQ := '999';

                VL_BC_IPI := sqlConsulta2.FieldByName('NOCIN2VBCIPI').AsFloat;
                ALIQ_IPI := sqlConsulta2.FieldByName('NOCIN3PERCIPI').AsFloat;
                VL_IPI := sqlConsulta2.FieldByName('NOCIN3VLRIPI').AsFloat;

                if sqlConsulta2.FieldByName('Noca3CSTPis').AsString <> '' then
                  CST_PIS := StrToCstPis(sqlConsulta2.FieldByName('Noca3CSTPis').AsString)
                else
                if sqlConsulta2.FieldByName('PRODA3CSTPISENTRADA').Asstring = '' then
                  CST_PIS := StrToCstPis('49')
                else
                  CST_PIS := StrToCstPis(Copy(sqlConsulta2.FieldByName('PRODA3CSTPISENTRADA').Asstring,0,2));

                if sqlConsulta2.FieldByName('Noca3CSTCOFINS').AsString <> '' then
                  CST_COFINS := StrToCstCofins(sqlConsulta2.FieldByName('Noca3CSTCOFINS').AsString)
                else
                if sqlConsulta2.FieldByName('PRODA3CSTCOFINSENTRADA').Asstring='' then
                  CST_COFINS := StrToCstCofins('49')
                else
                  CST_COFINS := StrToCstCofins(Copy(sqlConsulta2.FieldByName('PRODA3CSTCOFINSENTRADA').Asstring,0,2));

                VL_BC_PIS := sqlConsulta2.FieldByName('NOCIN2BASEPIS').Value;
                ALIQ_PIS_PERC := sqlConsulta2.FieldByName('NOCIN2PERCPIS').Value;;
                VL_PIS := sqlConsulta2.FieldByName('NOCIN2VLRPIS').AsFloat;
                VL_BC_COFINS := sqlConsulta2.FieldByName('NOCIN2BASECOFINS').Value;
                ALIQ_COFINS_PERC := sqlConsulta2.FieldByName('NOCIN2PERCCOFINS').Value;
                VL_COFINS := sqlConsulta2.FieldByName('NOCIN2VLRCOFINS').AsFloat;
                COD_CTA := sqlConsulta.FieldByName('PLCTA15COD').AsString;
              end; //Fim dos Itens;
              sqlConsulta2.Next;
            end; {$EndRegion}
          end;
          Application.ProcessMessages;
          sqlConsulta.Next;
        end; {$EndRegion}

      end;
    end;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_C_RegC500;
begin
  sqlConsulta.Close;
  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('Select ');
  sqlConsulta.SQL.Add('(Select Sum((I.NOCIN3VLREMBAL * I.NOCIN3QTDEMBAL) * (p.prodn2aliqpis / 100)) from notacompraitem i left join produto p ');
  sqlConsulta.SQL.Add('on p.prodicod = i.prodicod where i.nocpa13id = n.nocpa13id) as TOTAL_PIS, ');
  sqlConsulta.SQL.Add('(select Sum((I.NOCIN3VLREMBAL * I.NOCIN3QTDEMBAL) * (p.prodn2aliqCofins / 100)) from notacompraitem i left join produto p ');
  sqlConsulta.SQL.Add('on p.prodicod = i.prodicod where i.nocpa13id = n.nocpa13id) as TOTAL_COFINS, ');
  sqlConsulta.SQL.Add('(Select SUM(I.NOCIN3VLREMBAL*I.NOCIN3QTDEMBAL) from notacompraitem i where i.nocpa13id = n.nocpa13id) AS TOTAL_MERC, ');
  sqlConsulta.SQL.Add('(Select SUM(I.NOCIN2VBC) from notacompraitem i where i.nocpa13id = n.nocpa13id) AS VL_BC_ICMS, ');
  sqlConsulta.SQL.Add('(Select SUM(I.NOCIN3VLRICMS) from notacompraitem i where i.nocpa13id = n.nocpa13id) AS VL_ICMS, ');
  sqlConsulta.SQL.Add('(Select SUM(I.NOCIN2VBCST) from notacompraitem i where i.nocpa13id = n.nocpa13id) AS VL_BC_ICMS_ST, ');
  sqlConsulta.SQL.Add('(Select SUM(I.NOCIN3VLRSUBST) from notacompraitem i where i.nocpa13id = n.nocpa13id) AS VL_ICMS_ST, ');
  sqlConsulta.SQL.Add('(Select SUM(I.NOCIN3VLRIPI) from notacompraitem i where i.nocpa13id = n.nocpa13id) AS VL_IPI, ');
  sqlConsulta.SQL.Add('(Select SUM(I.NOCIN3VLRDESC) from notacompraitem i where i.nocpa13id = n.nocpa13id) AS VL_DESC, ');
  sqlConsulta.SQL.Add('(Select SUM(I.NOCIN2VLRDESPESAS) from notacompraitem i where i.nocpa13id = n.nocpa13id) AS VL_OUTRAS, ');
  sqlConsulta.SQL.Add('(Select SUM(I.NOCIN3VLRFRETE) from notacompraitem i where i.nocpa13id = n.nocpa13id) AS VL_FRETE, ');
  sqlConsulta.SQL.Add('(select sum(I.NOCIN2BASEPIS) from NOTACOMPRAITEM I where I.NOCPA13ID = N.NOCPA13ID) as VL_BC_PIS, ');
  sqlConsulta.SQL.Add('(select sum(I.NOCIN2BASECOFINS) from NOTACOMPRAITEM I where I.NOCPA13ID = N.NOCPA13ID) as VL_BC_COFINS, ');
  sqlConsulta.SQL.Add('N.*, F.FORNA2UF from NOTACOMPRA N ');
  sqlConsulta.SQL.Add('Left Join FORNECEDOR F ON F.FORNICOD = N.FORNICOD ');
  sqlConsulta.SQL.Add('where N.NOCPDEMISSAO >= ''' + FormatDateTime('mm/dd/yyyy',DataInicial) + ''' AND ');
  sqlConsulta.SQL.Add('N.NOCPDEMISSAO <= ''' +FormatDateTime('mm/dd/yyyy',DataFinal) + ''' AND ');
  sqlConsulta.SQL.Add('(N.NOCPCSTATUS = ''E'' or N.NOCPCSTATUS = ''C'') AND ');
  sqlConsulta.SQL.Add('N.EMPRICOD = ' + QuotedStr(qryEmpresaEMPRICOD.AsString) + ' AND ');
  sqlConsulta.SQL.Add('(N.CFOPA5COD = ' + QuotedStr('1253')  + ')');
  sqlConsulta.Open;
  while not sqlConsulta.Eof do
  begin
    with ACBrSPEDPisCofins1.Bloco_C.RegistroC500New do
    begin
      Msg := 'Gerando registro C001';
      COD_PART := SQLLocate('SPED_0150','COD_FORN','COD_PART', sqlConsulta.FieldByName('FORNICOD').AsString);
      COD_MOD := '06';
      COD_SIT := StrToCodSit('00');
      SER := Copy(sqlConsulta.FieldByName('NOCPA5SERIE').AsString,0,3);
      NUM_DOC := sqlConsulta.FieldByName('NOCPA30NRO').AsInteger;
      DT_DOC := sqlConsulta.FieldByName('NOCPDEMISSAO').AsDateTime;
      DT_ENT := sqlConsulta.FieldByName('NOCPDRECEBIMENTO').AsDateTime;
      VL_DOC := sqlConsulta.FieldByName('NOCPN3VLRBASCALICM').AsFloat;
      VL_ICMS := sqlConsulta.FieldByName('VL_ICMS').Value;
      VL_PIS := sqlConsulta.FieldByName('NOCPN3VLRPIS').AsFloat;
      VL_COFINS := sqlConsulta.FieldByName('NOCPN3VLRCOFINS').AsFloat;
      if sqlConsulta.FieldByName('NOFIA44CHAVEACESSO').AsString <> '' then
        CHV_DOCe := sqlConsulta.FieldByName('NOFIA44CHAVEACESSO').AsString
      else
        CHV_DOCe := '';
    end;


    sqlConsulta2.Close;
    sqlConsulta2.SQL.Clear;
    sqlConsulta2.SQL.Add('select (NOCIN3VLREMBAL * NOCIN3QTDEMBAL) VALOR_TOTAL, NOCA3CSTCOFINS, ');
    sqlConsulta2.SQL.Add('NOCA3CSTPIS, NOCIN2PERCCOFINS, NOCIN2PERCPIS, NOCIN2VLRCOFINS, NOCIN2VLRPIS, NOCIN2BASECOFINS, NOCIN2BASEPIS ');
    sqlConsulta2.SQL.Add('from NOTACOMPRAITEM where NOCPA13ID = ' + sqlConsulta.FieldByName('NOCPA13ID').AsString);
    sqlConsulta2.Open;
    while not sqlConsulta2.Eof do
    begin
      with ACBrSPEDPisCofins1.Bloco_C.RegistroC501New do
      begin
        CST_PIS := StrToCstPis(sqlConsulta2.FieldByName('NOCA3CSTPIS').AsString);
        VL_ITEM := sqlConsulta2.FieldByName('VALOR_TOTAL').AsFloat;
        NAT_BC_CRED := StrToNatBcCred('04');
        VL_BC_PIS := sqlConsulta2.FieldByName('NOCIN2BASEPIS').AsFloat;
        VL_PIS := sqlConsulta2.FieldByName('NOCIN2VLRPIS').AsFloat;
        ALIQ_PIS := sqlConsulta2.FieldByName('NOCIN2PERCPIS').AsFloat;
        COD_CTA := sqlConsulta.FieldByName('PLCTA15COD').AsString
      end;
      with ACBrSPEDPisCofins1.Bloco_C.RegistroC505New do
      begin
        CST_COFINS := StrToCstCofins(sqlConsulta2.FieldByName('NOCA3CSTCOFINS').AsString);
        VL_ITEM := sqlConsulta2.FieldByName('VALOR_TOTAL').AsFloat;
        NAT_BC_CRED := StrToNatBcCred('04');
        VL_BC_COFINS := sqlConsulta2.FieldByName('NOCIN2BASECOFINS').AsFloat;
        VL_COFINS := sqlConsulta2.FieldByName('NOCIN2VLRCOFINS').AsFloat;
        ALIQ_COFINS := sqlConsulta2.FieldByName('NOCIN2PERCCOFINS').AsFloat;
        COD_CTA := sqlConsulta.FieldByName('PLCTA15COD').AsString
      end;
      sqlConsulta2.Next;
    end;
    sqlConsulta.Next;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_M;
begin
  Gerar_Bloco_M_RegM001;
  Gerar_Bloco_M_RegM100;
  Gerar_Bloco_M_RegM200;
  Gerar_Bloco_M_RegM400;
  Gerar_Bloco_M_RegM500;
  Gerar_Bloco_M_RegM600;
  Gerar_Bloco_M_RegM800;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_M_RegM001;
begin
  with ACBrSPEDPisCofins1.Bloco_M.RegistroM001New do
  begin
    Msg := 'Gerando registro M001';
    if Ind_Movimento then
      IND_MOV := imComDados
    else
      IND_MOV := imSemDados;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_M_RegM100;
var
  Aliq_Pis_Empresa : Real;
  CodigoCredito : Integer;
begin
  Msg := 'Gerando registro M100';
  Aliq_Pis_Empresa := StrToFloat(SQLLocate('EMPRESA','EMPRICOD','PERC_PIS',qryEmpresaEMPRICOD.AsString));
  Aliq_Pis_Empresa := StrToFloatDef(FormatFloat('0.00',Aliq_Pis_Empresa),0);

  sqlConsulta.Close;
  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('Select sum(SP.VALOR_BASE_PIS) VALOR_BASE_PIS, ');
  sqlConsulta.SQL.Add('sum(SP.VALOR_PIS) VALOR_PIS, SP.CST_PIS, SP.PERC_PIS, SP.COD_BASE_CALCULO ');
  sqlConsulta.SQL.Add('from SPED_PISCOFINS_ENTRADA SP ');
  sqlConsulta.SQL.Add('WHERE SP.data_emissao between ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataInicial)) + ' AND ');
  sqlConsulta.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy',DataFinal)));
  sqlConsulta.SQL.Add('group by SP.CST_PIS, SP.PERC_PIS, SP.COD_BASE_CALCULO ');
  sqlConsulta.Open;

  sqlConsulta2.Close;
  sqlConsulta2.SQL.Clear;
  sqlConsulta2.SQL.Add(' select sum(SP.VALOR_PIS) VALOR_PIS, sum(SP.VALOR_BASE) VALOR_BASE, ');
  sqlConsulta2.SQL.Add(' iif (SP.CST_PIS = '+ QuotedStr('01')+', '+ QuotedStr('01')+', '+ QuotedStr('32')+') as CST_PIS, SP.ALIQ_PIS ');
  sqlConsulta2.SQL.Add('from SPED_PISCOFINS_SAIDA SP ');
  sqlConsulta2.SQL.Add('WHERE SP.data_emissao between ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataInicial)) + ' AND ');
  sqlConsulta2.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy',DataFinal)));
  sqlconsulta2.SQL.Add(' AND SP.ALIQ_PIS > 0 ');
  sqlConsulta2.SQL.Add('group by CST_PIS, SP.ALIQ_PIS');

  sqlConsulta2.Open;
  Posicao := 0;
  sqlConsulta.FetchAll;
  Max := sqlConsulta.RecordCount;

  Mem100.CreateDataSet;
  while not sqlConsulta.Eof do
  begin
    Posicao := Posicao + 1;
    if sqlConsulta.FieldByName('PERC_PIS').AsFloat = Aliq_Pis_Empresa then
      CodigoCredito := 101
    else
      CodigoCredito := 102;
    if Mem100.Locate('CodigoCredito',CodigoCredito) then
      Mem100.Edit
    else
      Mem100.Append;
    Mem100CodigoCredito.AsInteger := CodigoCredito;
    Mem100IndCredito.AsString := '0';
    Mem100VlrBasePis.AsFloat := Mem100VlrBasePis.AsFloat + sqlConsulta.FieldByName('VALOR_BASE_PIS').AsFloat;
    Mem100AliqPis.AsFloat := sqlConsulta.FieldByName('PERC_PIS').AsFloat;
    Mem100VlrCredito.AsFloat := Mem100VlrCredito.AsFloat + sqlConsulta.FieldByName('VALOR_PIS').AsFloat;
    Mem100VlrCreditoDisponivel.AsFloat  := Mem100VlrCreditoDisponivel.AsFloat + sqlConsulta.FieldByName('VALOR_PIS').AsFloat;
    Mem100CST_PIS.AsString := sqlConsulta.FieldByName('CST_PIS').AsString;
    if Mem100VlrBasePis.AsFloat > 0 then
    begin
      if sqlConsulta2.Locate('CST_PIS','01',[loCaseInsensitive]) then
        Mem100VlrCreditoDescontado.AsFloat := sqlConsulta2.FieldByName('VALOR_PIS').AsFloat
      else
        Mem100VlrCreditoDescontado.AsFloat := 0;
      Mem100SaldoCredito.AsFloat :=  Mem100VlrCredito.AsFloat - Mem100VlrCreditoDescontado.AsFloat;
      if Mem100SaldoCredito.AsFloat < 0 then
      begin
        Mem100SaldoCredito.AsFloat := 0;
        Mem100IndUtilCredito.AsString  := '0';
      end
      else
        Mem100IndUtilCredito.AsString  := '1';
    end;
    Mem100.Post;
    sqlConsulta.Next;
  end;

  Mem100.First;
  while not Mem100.Eof do
  begin
    with ACBrSPEDPisCofins1.Bloco_M.RegistroM100New do
    begin
      COD_CRED := IntToStr(Mem100CodigoCredito.AsInteger);
      IND_CRED_ORI := StrToIndCredOri('0');
      VL_BC_PIS := Mem100VlrBasePis.AsFloat;
      ALIQ_PIS := Mem100AliqPis.AsFloat;
      VL_CRED := Mem100VlrCredito.AsFloat;
      VL_CRED_DISP := Mem100VlrCreditoDisponivel.AsFloat;
      IND_DESC_CRED := StrToIndDescCred(Mem100IndUtilCredito.AsString);
      VL_CRED_DESC := Mem100VlrCreditoDescontado.AsFloat;
      SLD_CRED := Mem100SaldoCredito.AsFloat;
      sqlConsulta.Filtered := False;
      sqlConsulta.Filter := 'PERC_PIS = ' + StringReplace(FormatFloat('0.00', Mem100AliqPis.AsFloat),',','.',[rfReplaceAll]);
      sqlConsulta.Filtered := true;
      sqlConsulta.First;
      while not sqlConsulta.Eof do
      begin
        with RegistroM105.New do
        begin
          NAT_BC_CRED := StrToNatBcCred(sqlConsulta.FieldByName('COD_BASE_CALCULO').AsString);
          CST_PIS := StrToCstPis(Mem100CST_PIS.AsString);
          VL_BC_PIS_TOT := sqlConsulta.FieldByName('VALOR_BASE_PIS').AsFloat;
          VL_BC_PIS_NC :=  sqlConsulta.FieldByName('VALOR_BASE_PIS').AsFloat;
          VL_BC_PIS := sqlConsulta.FieldByName('VALOR_BASE_PIS').AsFloat;
        end;
        sqlConsulta.Next;
      end;
      Mem100.Next;
    end;
    sqlConsulta.Filtered := False;
  end;

end;

procedure TDMSpedPisCofins.Gerar_Bloco_M_RegM200;
begin
  sqlConsulta2.First;
  while not sqlConsulta2.Eof do
  begin
    if sqlConsulta2.FieldByName('CST_PIS').AsString = '01' then
    begin
      with ACBrSPEDPisCofins1.Bloco_M.RegistroM200New do
      begin
        VL_TOT_CONT_NC_PER := sqlConsulta2.FieldByName('VALOR_PIS').AsFloat;
        VL_TOT_CRED_DESC := sqlConsulta2.FieldByName('VALOR_PIS').AsFloat
      end;
    end;

    with ACBrSPEDPisCofins1.Bloco_M.RegistroM210New do
    begin
      if sqlConsulta2.FieldByName('CST_PIS').AsString = '01' then
      begin
        COD_CONT := StrToCodCont(sqlConsulta2.FieldByName('CST_PIS').AsString);
        VL_REC_BRT := sqlConsulta2.FieldByName('VALOR_BASE').AsFloat;
        VL_BC_CONT := sqlConsulta2.FieldByName('VALOR_BASE').AsFloat;
        ALIQ_PIS := sqlConsulta2.FieldByName('ALIQ_PIS').AsFloat;
        VL_CONT_APUR := sqlConsulta2.FieldByName('VALOR_PIS').AsFloat;
        VL_CONT_PER := sqlConsulta2.FieldByName('VALOR_PIS').AsFloat;
        VL_BC_CONT_AJUS := sqlConsulta2.FieldByName('VALOR_BASE').AsFloat;
      end
      else
      begin
        COD_CONT := StrToCodCont('32');
        VL_REC_BRT := sqlConsulta2.FieldByName('VALOR_BASE').AsFloat;
        VL_BC_CONT := 0;
        ALIQ_PIS := sqlConsulta2.FieldByName('ALIQ_PIS').AsFloat;
        VL_CONT_APUR := 0;
        VL_CONT_PER := 0;
        VL_BC_CONT_AJUS := 0;
      end;
    end;
    sqlConsulta2.Next;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_M_RegM400;
begin
  Msg := 'Gerando registro M400';
  sqlConsulta.Close;
  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('select sum(SP.VALOR_BASE) VALOR_BASE, sum(SP.valor_pis) VALOR_PIS, ');
  sqlConsulta.SQL.Add('SP.CST_PIS, SP.NATUREZA_RECEITA, SP.CONTA ');
  sqlConsulta.SQL.Add('from SPED_PISCOFINS_SAIDA SP ');
  sqlConsulta.SQL.Add('WHERE SP.data_emissao between ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataInicial)) + ' AND ');
  sqlConsulta.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy',DataFinal)));
  sqlConsulta.SQL.Add(' and SP.CST_PIS IN (');
  sqlConsulta.SQL.Add(QuotedStr('04') + ',' + QuotedStr('06') + ', ' + QuotedStr('07')+ ', ');
  sqlConsulta.SQL.Add(QuotedStr('08') + ', ' + QuotedStr('09') + ')' );
  sqlConsulta.SQL.Add('group by SP.CST_PIS, SP.NATUREZA_RECEITA, SP.CONTA');
  sqlConsulta.Open;
  Mem400.CreateDataSet;
  sqlConsulta.First;

  Posicao := 0;
  sqlConsulta.FetchAll;
  Max := sqlConsulta.RecordCount;

  while not sqlConsulta.Eof do
  begin
    Posicao := Posicao + 1;
    if Mem400.Locate('CST_PIS', sqlConsulta.FieldByName('CST_PIS').AsString,[loCaseInsensitive]) then
      Mem400.Edit
    else
      Mem400.Append;
    Mem400CST_Pis.AsString := sqlConsulta.FieldByName('CST_PIS').AsString;
    Mem400Valor.AsFloat := Mem400Valor.AsFloat + sqlConsulta.FieldByName('VALOR_BASE').AsFloat;
    Mem400PlanoConta.AsString := sqlConsulta.FieldByName('CONTA').AsString;
    Mem400.Post;
    sqlConsulta.Next;
  end;

  Mem400.First;
  while not Mem400.Eof do
  begin
    with ACBrSPEDPisCofins1.Bloco_M.RegistroM400New do
    begin
      CST_PIS := StrToCstPis(Mem400CST_Pis.AsString);
      VL_TOT_REC := Mem400Valor.AsFloat;
      COD_CTA := Mem400PlanoConta.AsString;
    end;

    sqlConsulta.Filtered := False;
    sqlConsulta.Filter := 'CST_PIS = ' + Mem400CST_Pis.AsString;
    sqlConsulta.Filtered := True;
    sqlConsulta.First;
    while not sqlConsulta.Eof do
    begin
      with ACBrSPEDPisCofins1.Bloco_M.RegistroM410New do
      begin
       NAT_REC :=  FormatFloat('000', sqlConsulta.FieldByName('NATUREZA_RECEITA').AsInteger);
       VL_REC := sqlConsulta.FieldByName('VALOR_BASE').AsFloat;
       COD_CTA := Mem400PlanoConta.AsString;
      end;
      sqlConsulta.Next;
    end;
    sqlConsulta.Filter := '';
    sqlConsulta.Filtered := False;
    Mem400.Next;
  end;
end;


procedure TDMSpedPisCofins.Gerar_Bloco_M_RegM500;
var
  Aliq_Cofins_Empresa : Real;
  CodigoCredito : Integer;
begin

  Msg := 'Gerando registro M500';
  Aliq_Cofins_Empresa := StrToFloat(SQLLocate('EMPRESA','EMPRICOD','PERC_COFINS',qryEmpresaEMPRICOD.AsString));
  Aliq_Cofins_Empresa := StrToFloatDef(FormatFloat('0.00',Aliq_Cofins_Empresa),0);

  Msg := 'Gerando registro M100';
  sqlConsulta.Close;
  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('Select sum(SP.VALOR_BASE_COFINS) VALOR_BASE_COFINS, ');
  sqlConsulta.SQL.Add('sum(SP.VALOR_COFINS) VALOR_COFINS, SP.CST_COFINS, SP.PERC_COFINS, SP.COD_BASE_CALCULO ');
  sqlConsulta.SQL.Add('from SPED_PISCOFINS_ENTRADA SP ');
  sqlConsulta.SQL.Add('WHERE SP.data_emissao between ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataInicial)) + ' AND ');
  sqlConsulta.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy',DataFinal)));
  sqlConsulta.SQL.Add('group by SP.CST_COFINS, SP.PERC_COFINS, SP.COD_BASE_CALCULO ');
  sqlConsulta.Open;

  sqlConsulta2.Close;
  sqlConsulta2.SQL.Clear;
  sqlConsulta2.SQL.Add(' select sum(SP.VALOR_COFINS) VALOR_COFINS, sum(SP.VALOR_BASE) VALOR_BASE, ');
  sqlConsulta2.SQL.Add(' iif (SP.CST_COFINS =  '+ QuotedStr('01')+', '+ QuotedStr('01')+', '+ QuotedStr('32')+') as CST_COFINS, SP.ALIQ_COFINS ');
  sqlConsulta2.SQL.Add('from SPED_PISCOFINS_SAIDA SP ');
  sqlConsulta2.SQL.Add('WHERE SP.data_emissao between ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataInicial)) + ' AND ');
  sqlConsulta2.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy',DataFinal)));
  sqlconsulta2.SQL.Add(' AND SP.ALIQ_COFINS > 0 ');
  sqlConsulta2.SQL.Add('group by CST_COFINS, SP.ALIQ_COFINS');
  sqlConsulta2.Open;

  Posicao := 0;
  sqlConsulta.FetchAll;
  Max := sqlConsulta.RecordCount;

  Mem500.CreateDataSet;
  while not sqlConsulta.Eof do
  begin
    Posicao := Posicao + 1;
    if sqlConsulta.FieldByName('PERC_COFINS').AsFloat = Aliq_Cofins_Empresa then
      CodigoCredito := 101
    else
      CodigoCredito := 102;

    if Mem500.Locate('CodigoCredito',CodigoCredito) then
      Mem500.Edit
    else
      Mem500.Append;
    Mem500CodigoCredito.AsInteger := CodigoCredito;
    Mem500IndCredito.AsString := '0';
    Mem500VlrBaseCofins.AsFloat := Mem500VlrBaseCofins.AsFloat + sqlConsulta.FieldByName('VALOR_BASE_COFINS').AsFloat;
    Mem500AliqCofins.AsFloat := sqlConsulta.FieldByName('PERC_COFINS').AsFloat;
    Mem500VlrCredito.AsFloat := Mem500VlrCredito.AsFloat + sqlConsulta.FieldByName('VALOR_COFINS').AsFloat;
    Mem500VlrCreditoDisponivel.AsFloat  := Mem500VlrCreditoDisponivel.AsFloat + sqlConsulta.FieldByName('VALOR_COFINS').AsFloat;
    Mem500CST_COFINS.AsString := sqlConsulta.FieldByName('CST_COFINS').AsString;
    if Mem500VlrBaseCofins.AsFloat > 0 then
    begin
      if sqlConsulta2.Locate('CST_COFINS','01',[loCaseInsensitive]) then
        Mem500VlrCreditoDescontado.AsFloat := sqlConsulta2.FieldByName('VALOR_COFINS').AsFloat
      else
        Mem500VlrCreditoDescontado.AsFloat := 0;
      Mem500SaldoCredito.AsFloat :=  Mem500VlrCredito.AsFloat - Mem500VlrCreditoDescontado.AsFloat;
      if Mem500SaldoCredito.AsFloat < 0 then
      begin
        Mem500SaldoCredito.AsFloat := 0;
        Mem500IndUtilCredito.AsString  := '0';
      end
      else
        Mem500IndUtilCredito.AsString  := '1';
    end;
    Mem500.Post;
    sqlConsulta.Next;
  end;

  Mem500.First;
  while not Mem500.Eof do
  begin
    with ACBrSPEDPisCofins1.Bloco_M.RegistroM500New do
    begin
      COD_CRED := IntToStr(Mem500CodigoCredito.AsInteger);
      IND_CRED_ORI := StrToIndCredOri('0');
      VL_BC_COFINS := Mem500VlrBaseCofins.AsFloat;
      ALIQ_COFINS := Mem500AliqCofins.AsFloat;
      VL_CRED := Mem500VlrCredito.AsFloat;
      VL_CRED_DISP := Mem500VlrCreditoDisponivel.AsFloat;
      IND_DESC_CRED := StrToIndDescCred(Mem500IndUtilCredito.AsString);
      VL_CRED_DESC := Mem500VlrCreditoDescontado.AsFloat;
      SLD_CRED := Mem500SaldoCredito.AsFloat;
      sqlConsulta.Filtered := False;
      sqlConsulta.Filter := 'PERC_COFINS = ' + StringReplace(FormatFloat('0.00', Mem500AliqCofins.AsFloat),',','.',[rfReplaceAll]);
      sqlConsulta.Filtered := true;
      sqlConsulta.First;
      while not sqlConsulta.Eof do
      begin
        with RegistroM505.New do
        begin
          NAT_BC_CRED := StrToNatBcCred(sqlConsulta.FieldByName('COD_BASE_CALCULO').AsString);
          CST_COFINS := StrToCstCofins(Mem500CST_COFINS.AsString);
          VL_BC_COFINS_TOT := sqlConsulta.FieldByName('VALOR_BASE_COFINS').AsFloat;
          VL_BC_COFINS_NC :=  sqlConsulta.FieldByName('VALOR_BASE_COFINS').AsFloat;
          VL_BC_COFINS := sqlConsulta.FieldByName('VALOR_BASE_COFINS').AsFloat;
        end;
        sqlConsulta.Next;
      end;
      Mem500.Next;
    end;
    sqlConsulta.Filtered := False;
  end;
end;

procedure TDMSpedPisCofins.Gerar_Bloco_M_RegM600;
begin
  sqlConsulta2.First;
  while not sqlConsulta2.Eof do
  begin
    if sqlConsulta2.FieldByName('CST_COFINS').AsString = '01' then
    begin
      with ACBrSPEDPisCofins1.Bloco_M.RegistroM600New do
      begin
        VL_TOT_CONT_NC_PER := sqlConsulta2.FieldByName('VALOR_COFINS').AsFloat;
        VL_TOT_CRED_DESC := sqlConsulta2.FieldByName('VALOR_COFINS').AsFloat;
      end;
    end;

    with ACBrSPEDPisCofins1.Bloco_M.RegistroM610New do
    begin
      if sqlConsulta2.FieldByName('CST_COFINS').AsString = '01' then
      begin
        COD_CONT := StrToCodCont(sqlConsulta2.FieldByName('CST_COFINS').AsString);
        VL_REC_BRT := sqlConsulta2.FieldByName('VALOR_BASE').AsFloat;
        VL_BC_CONT := sqlConsulta2.FieldByName('VALOR_BASE').AsFloat;
        ALIQ_COFINS := sqlConsulta2.FieldByName('ALIQ_COFINS').AsFloat;
        VL_CONT_APUR := sqlConsulta2.FieldByName('VALOR_COFINS').AsFloat;
        VL_CONT_PER := sqlConsulta2.FieldByName('VALOR_COFINS').AsFloat;
        VL_BC_CONT_AJUS := sqlConsulta2.FieldByName('VALOR_BASE').AsFloat;
      end
      else
      begin
        COD_CONT := StrToCodCont('32');
        VL_REC_BRT := sqlConsulta2.FieldByName('VALOR_BASE').AsFloat;
        VL_BC_CONT := 0;
        ALIQ_COFINS := sqlConsulta2.FieldByName('ALIQ_COFINS').AsFloat;
        VL_CONT_APUR := 0;
        VL_CONT_PER := 0;
        VL_BC_CONT_AJUS := 0;
      end;
    end;
    sqlConsulta2.Next;
  end;
end;


procedure TDMSpedPisCofins.Gerar_Bloco_M_RegM800;
begin
  Msg := 'Gerando registro M500';
  sqlConsulta.Close;
  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('select sum(SP.VALOR_BASE) VALOR_BASE, sum(SP.valor_cofins) VALOR_COFINS, ');
  sqlConsulta.SQL.Add('SP.CST_COFINS, SP.NATUREZA_RECEITA, SP.CONTA ');
  sqlConsulta.SQL.Add('from SPED_PISCOFINS_SAIDA SP ');
  sqlConsulta.SQL.Add('WHERE SP.data_emissao between ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataInicial)) + ' AND ');
  sqlConsulta.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy',DataFinal)));
  sqlConsulta.SQL.Add(' and SP.CST_COFINS in (');
  sqlConsulta.SQL.Add(QuotedStr('04') + ',' + QuotedStr('06') + ', ' + QuotedStr('07')+ ', ');
  sqlConsulta.SQL.Add(QuotedStr('08') + ', ' + QuotedStr('09') + ')');
  sqlConsulta.SQL.Add('group by SP.CST_COFINS, SP.NATUREZA_RECEITA, SP.CONTA');
  sqlConsulta.Open;
  Mem800.CreateDataSet;
  sqlConsulta.First;
  Posicao := 0;
  sqlConsulta.FetchAll;
  Max := sqlConsulta.RecordCount;
  while not sqlConsulta.Eof do
  begin
    Posicao := Posicao + 1;
    if Mem800.Locate('CST_COFINS', sqlConsulta.FieldByName('CST_COFINS').AsString,[loCaseInsensitive]) then
      Mem800.Edit
    else
      Mem800.Append;
    Mem800CST_Cofins.AsString := sqlConsulta.FieldByName('CST_COFINS').AsString;
    Mem800Valor.AsFloat := Mem800Valor.AsFloat + sqlConsulta.FieldByName('VALOR_BASE').AsFloat;
    Mem800PlanoConta.AsString := sqlConsulta.FieldByName('CONTA').AsString;
    Mem800.Post;
    sqlConsulta.Next;
  end;

  Mem800.First;
  while not Mem800.Eof do
  begin
    with ACBrSPEDPisCofins1.Bloco_M.RegistroM800New do
    begin
      CST_COFINS := StrToCstCofins(Mem800CST_Cofins.AsString);
      VL_TOT_REC := Mem800Valor.AsFloat;
      COD_CTA := Mem800PlanoConta.AsString;
    end;

    sqlConsulta.Filtered := False;
    sqlConsulta.Filter := 'CST_COFINS = ' + Mem800CST_Cofins.AsString;
    sqlConsulta.Filtered := True;
    sqlConsulta.First;
    while not sqlConsulta.Eof do
    begin
      with ACBrSPEDPisCofins1.Bloco_M.RegistroM810New do
      begin
       NAT_REC :=  FormatFloat('000', sqlConsulta.FieldByName('NATUREZA_RECEITA').AsInteger);
       VL_REC := sqlConsulta.FieldByName('VALOR_BASE').AsFloat;
       COD_CTA := Mem800PlanoConta.AsString;
      end;
      sqlConsulta.Next;
    end;
    sqlConsulta.Filter := '';
    sqlConsulta.Filtered := False;
    Mem800.Next;
  end;
end;

procedure TDMSpedPisCofins.GravarTxt;
begin
  ACBrSPEDPisCofins1.SaveFileTXT;
end;

procedure TDMSpedPisCofins.Gravar_0150;
var
  Achou, IE: String;
begin
  //Zera tabela SPED_0150
  fDMConnection.FDConnection.ExecSQL('delete from SPED_0150');
  sqlParticipantes.Open;

  //Incluir participantes das Notas Fiscais no SPED_0150
  Msg := 'Verificando Participantes';
  sqlParticipantes.Close;
  sqlParticipantes.Open;

  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('SELECT DISTINCT C.* FROM NOTAFISCAL N ');
  sqlConsulta.SQL.Add('inner join CLIENTE C ON N.CLIEA13ID = C.CLIEA13ID ');
  sqlConsulta.SQL.Add('WHERE (N.NOFIDEMIS >=''' + FormatDateTime('mm/dd/yyyy',DataInicial)+''') ');
  sqlConsulta.SQL.Add('and (N.NOFIDEMIS <='''+FormatDateTime('mm/dd/yyyy',DataFinal)+''') ');
  sqlConsulta.sql.Add('and (N.CLIEA13ID  IS NOT NULL) and ');
  sqlConsulta.sql.Add('(N.EMPRICOD=' + qryEmpresaEMPRICOD.AsString +') and (N.NOFICSTATUS = ''E'')');
  sqlConsulta.Open;
  while not sqlConsulta.Eof do
  begin
    try
      sqlParticipantes.Insert;
      sqlParticipantesCOD_PART.AsString := sqlConsulta.FieldByName('CLIEA13ID').AsString;
      sqlParticipantesNOME.AsString     := sqlConsulta.FieldByName('NOME').AsString;
      sqlParticipantesCOD_PAIS.AsString := sqlConsulta.FieldByName('CLIEICODPAIS').AsString;
      if length(sqlConsulta.FieldByName('CLIEA14CGC').AsString) = 14 then
      begin
        sqlParticipantesCNPJ.AsString  := SQLConsulta.FieldByName('CLIEA14CGC').AsString;
        // verifica se o cliente tem inscriçao de produtor
        If ((SQLConsulta.FieldByName('CLIEA20IE').isnull) or (SQLConsulta.FieldByName('CLIEA20IE').AsString = '')) and (SQLConsulta.FieldByName('CLIEA30OUTROSDOC').AsString <> '') then
          sqlParticipantesIE.AsString  := COPY(SQLConsulta.FieldByName('CLIEA30OUTROSDOC').AsString,0,14)
        else
          sqlParticipantesIE.AsString  :=  COPY(SQLConsulta.FieldByName('CLIEA20IE').AsString,0,14) ;
        while pos('/',IE) > 0 do
          delete(IE,pos('/',IE),1);
        while pos('.',IE) > 0 do
          delete(IE,pos('.',IE),1);
        while pos('-',IE) > 0 do
          delete(IE,pos('-',IE),1);
        if IE = 'ISENTO' then IE := '';
        sqlParticipantesIE.AsString  := Trim(IE);
      end
      else
      begin
        if length(SQLConsulta.FieldByName('CLIEA11CPF').AsString) = 11 then
          sqlParticipantesCPF.AsString := SQLConsulta.FieldByName('CLIEA11CPF').AsString;
      end;
      sqlParticipantesCOD_MUN.AsString       := SQLConsulta.FieldByName('CLIEIMUNICODFED').AsString;
      sqlParticipantesENDERECO.AsString      := Trim(SQLConsulta.FieldByName('CLIEA60ENDRES').AsString);
      sqlParticipantesEND_NUM.AsString       := Trim(SQLConsulta.FieldByName('CLIEA5NROENDRES').AsString);
      sqlParticipantesBAIRRO.AsString        := Trim(SQLConsulta.FieldByName('CLIEA60BAIRES').AsString);
      sqlParticipantesCOD_SUFRAMA.AsString   := '';
      sqlParticipantesCOMPLEMENTO.AsString   := '';
      if (sqlParticipantesCPF.AsString = '') and (sqlParticipantes.FieldByName('CNPJ').AsString = '') then
        begin
          if SQLConsulta.FieldByName('NOFIA13ID').AsString = '' then exit;
          sqlParticipantes.Cancel;
          Showmessage('Falha ao Criar Tabela de Participantes! Falta CNPJ ou CPF!'+#13+#10+'Cliente: '+SQLConsulta.FieldByName('CLIEA13ID').AsString);
        end;
      // Codigo Cidade IBGE
      if (length(sqlParticipantes.FieldByName('COD_MUN').Value) <> 7) then
        begin
          sqlParticipantes.Cancel;
          Showmessage('Falha ao Criar Tabela de Participantes! Codigo IBGE do Participante!'+#13+#10+'Cliente: '+SQLConsulta.FieldByName('CLIEA13ID').AsString);
        end;
      sqlParticipantes.Post;
    except
      on E : Exception do
      begin
        ShowMessage('Erro ao criar Participante Nota Fiscal' + e.Message);
      end;
    end;
    Application.ProcessMessages;
    sqlConsulta.Next;
  end;
  sqlConsulta.Close;

  // Informa a PROPRIA EMPRESA caso existam notas emitidas para si proprio
  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('SELECT DISTINCT E.* FROM NOTAFISCAL N ');
  sqlConsulta.SQL.Add('inner join EMPRESA E ON N.EMPRICODDEST = E.EMPRICOD ');
  sqlConsulta.SQL.Add('WHERE (N.NOFIDEMIS >=''' + FormatDateTime('mm/dd/yyyy', DataInicial) + ''') ');
  sqlConsulta.SQL.Add('AND (N.NOFIDEMIS <=''' + FormatDateTime('mm/dd/yyyy', DataFinal) + ''') and ');
  sqlConsulta.SQL.Add('(N.EMPRICODDEST IS NOT NULL) and (N.Empricod = ' + qryEmpresaEMPRICOD.AsString + ') and (N.NOFICSTATUS = ''E'')');
  sqlConsulta.Open;
  while not sqlConsulta.Eof do
  begin
    //Registro 0150 - ABERTURA DO REGISTRO 0150 - DADOS DOS PARTICIPANTES (EMPRESAS)
    try
      sqlParticipantes.Append;
      sqlParticipantesCOD_PART.AsString      := 'E'+sqlConsulta.FieldByName('EMPRICOD').AsString;
      sqlParticipantesNOME.AsString          := Trim(sqlConsulta.FieldByName('EMPRA60RAZAOSOC').AsString) ;
      sqlParticipantesCOD_PAIS.AsString      := '1058';
      sqlParticipantesCNPJ.AsString          := sqlConsulta.FieldByName('EMPRA14CGC').AsString;
      sqlParticipantesCPF.AsString           := sqlConsulta.FieldByName('EMPRA11CPF').AsString;
      IE                                     := COPY(sqlConsulta.FieldByName('EMPRA20IE').AsString,0,14);
      while pos('/',IE) > 0 do
        delete(IE,pos('/',IE),1);
      while pos('.',IE) > 0 do
        delete(IE,pos('.',IE),1);
      while pos('-',IE) > 0 do
        delete(IE,pos('-',IE),1);
      if IE = 'ISENTO' then IE := '';
      sqlParticipantes.FieldByName('IE').AsString  := Trim(IE);

      sqlParticipantes.FieldByName('COD_MUN').AsString       := sqlConsulta.FieldByName('EMPRIMUNICODFED').AsString;
      sqlParticipantes.FieldByName('ENDERECO').AsString      := Trim(sqlConsulta.FieldByName('EMPRA60END').AsString);
      sqlParticipantes.FieldByName('END_NUM').AsString       := Trim(sqlConsulta.FieldByName('EMPRIENDNRO').AsString);
      sqlParticipantes.FieldByName('BAIRRO').AsString        := Trim(sqlConsulta.FieldByName('EMPRA60BAI').AsString);
      sqlParticipantes.FieldByName('COD_SUFRAMA').AsString   := Trim(sqlConsulta.FieldByName('EMPRA9SUFRAMA').AsString);
      sqlParticipantes.FieldByName('COMPLEMENTO').AsString   := '';
      sqlParticipantes.Post;
    Except on E:Exception do
      begin
        Showmessage('Falha ao Criar Tabela de Participantes (Empresa):'+#13+#10+E.Message+#13+#10+'Empresa: '+sqlConsulta.FieldByName('EMPRICOD').AsString);
        Exit;
      end;
    end;
    Application.ProcessMessages;
    sqlConsulta.Next;
  end;
  sqlConsulta.Close;

  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('SELECT DISTINCT F.* FROM NOTACOMPRA N ');
  sqlConsulta.SQL.Add('Left Join FORNECEDOR F ON F.FORNICOD = N.FORNICOD ');
  sqlConsulta.SQL.Add('Where N.NOCPDEMISSAO >= ''' + FormatDateTime('mm/dd/yyyy',DataInicial) + ''' and ');
  sqlConsulta.SQL.Add('N.NOCPDEMISSAO <= ''' + FormatDateTime('mm/dd/yyyy',DataFinal) + ''' AND ');
  sqlConsulta.SQL.Add('N.EMPRICODDESTCOMPRA = ' + qryEmpresaEMPRICOD.AsString + ' AND ');
  sqlConsulta.SQL.Add('(N.FORNICOD IS NOT NULL) and (N.NOCPCSTATUS = ''E'') ');
  sqlConsulta.Open;
  while not sqlConsulta.Eof do
  begin
    //Registro 0150 - ABERTURA DO REGISTRO 0150 - DADOS DOS PARTICIPANTES (CLIENTES E FORNECEDORES)
    try
      Achou := 'N';
      if sqlConsulta.FieldByName('FORNA14CGC').AsString <> '' then
        if sqlParticipantes.Locate('CNPJ',sqlConsulta.FieldByName('FORNA14CGC').AsString,[]) then
        Begin
          sqlParticipantes.Edit;
          sqlParticipantes.FieldByName('COD_FORN').AsInteger := sqlConsulta.FieldByName('FORNICOD').AsInteger;
          sqlParticipantes.Post;
          Achou := 'S';
        End;

      if sqlConsulta.FieldByName('FORNA11CPF').AsString <> '' then
        if sqlParticipantes.Locate('CPF',sqlConsulta.FieldByName('FORNA11CPF').AsString,[]) then
        begin
          sqlParticipantes.Edit;
          sqlParticipantes.FieldByName('COD_FORN').AsInteger := sqlConsulta.FieldByName('FORNICOD').AsInteger;
          sqlParticipantes.Post;
          Achou := 'S';
        end;

      If Achou = 'N' then
      Begin
        sqlParticipantes.Append;
        sqlParticipantes.FieldByName('COD_PART').AsString      := 'F' + sqlConsulta.FieldByName('FORNICOD').AsString;
        sqlParticipantes.FieldByName('COD_FORN').AsString      := sqlConsulta.Fieldbyname('FORNICOD').AsString;
        sqlParticipantes.FieldByName('NOME').AsString          := Trim(sqlConsulta.FieldByName('FORNA60RAZAOSOC').AsString);
        sqlParticipantes.FieldByName('COD_PAIS').AsString      := sqlConsulta.FieldByName('FORNICODPAIS').AsString;
        sqlParticipantes.FieldByName('CNPJ').AsString          := sqlConsulta.FieldByName('FORNA14CGC').AsString;
        sqlParticipantes.FieldByName('CPF').AsString           := sqlConsulta.FieldByName('FORNA11CPF').AsString;
        IE                                          := COPY(sqlConsulta.FieldByName('FORNA20IE').AsString,0,14);
        while pos('/',IE) > 0 do
          delete(IE,pos('/',IE),1);
        while pos('.',IE) > 0 do
          delete(IE,pos('.',IE),1);
        if IE = 'ISENTO' then IE := '';
        sqlParticipantes.FieldByName('IE').AsString  := IE;

        sqlParticipantes.FieldByName('COD_MUN').AsString       := sqlConsulta.FieldByName('FORNIMUNICODFED').AsString;
        sqlParticipantes.FieldByName('ENDERECO').AsString      := Trim(sqlConsulta.FieldByName('FORNA60END').AsString);
        sqlParticipantes.FieldByName('END_NUM').AsString       := Trim(sqlConsulta.FieldByName('FORNA5NROEND').AsString);
        sqlParticipantes.FieldByName('BAIRRO').AsString        := Trim(sqlConsulta.FieldByName('FORNA60BAI').AsString);
        sqlParticipantes.FieldByName('COD_SUFRAMA').AsString   := '';
        sqlParticipantes.FieldByName('COMPLEMENTO').AsString   := '';

        // Codigo Cidade IBGE
        if (length(sqlParticipantes.FieldByName('COD_MUN').Value) <> 7) then
          begin
            sqlParticipantes.Cancel;
            Showmessage('Falha ao Criar Tabela de Participantes! Codigo IBGE do Participante!'+#13+#10+'Fornecedor: '+sqlConsulta.FieldByName('FORNICOD').AsString);
          end;
        // Endereco Vazio
        if (sqlParticipantes.FieldByName('ENDERECO').AsString = '') then
          begin
            sqlParticipantes.Cancel;
            Showmessage('Falha ao Criar Tabela de Participantes! Endereço do Participante!'+#13+#10+'Fornecedor: '+sqlConsulta.FieldByName('FORNICOD').AsString);
          end;
        // Endereco Numero Vazio
        if (sqlParticipantes.FieldByName('END_NUM').AsString = '') then
          begin
            sqlParticipantes.Cancel;
            Showmessage('Falha ao Criar Tabela de Participantes! Numero do Endereço do Participante!'+#13+#10+'Fornecedor: '+sqlConsulta.FieldByName('FORNICOD').AsString);
          end;
        // Bairro Vazio
        if (sqlParticipantes.FieldByName('BAIRRO').AsString = '') then
          begin
            sqlParticipantes.Cancel;
            Showmessage('Falha ao Criar Tabela de Participantes! Bairro do Participante!'+#13+#10+'Fornecedor: '+sqlConsulta.FieldByName('FORNICOD').AsString);
          end;
        sqlParticipantes.Post;
      End;
    except
      on E : Exception do
      begin
        Showmessage('Falha ao Criar Tabela de Participantes (Fornecedores Nota Compra):'+#13+#10+
        E.Message+#13+#10+'Fornecedor: ' + sqlConsulta.FieldByName('FORNICOD').AsString);
        Exit;
      end;
    end;
    Application.ProcessMessages;
    sqlConsulta.Next;
  end;

  sqlConsulta.Close;
  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('SELECT DISTINCT T.* FROM CONHECIMENTOS C ');
  sqlConsulta.SQL.Add('LEFT join TRANSPORTADORA T ON T.TRANICOD = C.COD_PART ');
  sqlConsulta.SQL.Add('WHERE (C.DT_AQUIS >='''+FormatDateTime('dd/dd/yyyy',DataInicial)+''') AND ');
  sqlConsulta.SQL.Add('(C.DT_AQUIS <='''+FormatDateTime('dd/dd/yyyy',DataFinal)+''')');
  sqlConsulta.Open;
  while not sqlConsulta.Eof do
  begin
    try
      Achou:= 'N';
      if sqlConsulta.FieldByName('TRANA14CGC').AsString <> '' then
        if sqlParticipantes.Locate('CNPJ',sqlConsulta.FieldByName('TRANA14CGC').AsString,[]) then
        begin
          sqlParticipantes.Edit;
          sqlParticipantes.FieldByName('COD_TRANSP').AsInteger := sqlConsulta.FieldByName('TRANICOD').AsInteger;
          sqlParticipantes.Post;
          Achou := 'S';
        end;

      if sqlConsulta.FieldByName('TRANA11CPF').AsString <> '' then
        if sqlParticipantes.Locate('CPF',sqlConsulta.FieldByName('TRANA11CPF').AsString,[]) then
        begin
          sqlParticipantes.Edit;
          sqlParticipantes.FieldByName('COD_TRANSP').AsInteger := sqlConsulta.FieldByName('TRANICOD').AsInteger;
          sqlParticipantes.Post;
          Achou := 'S';
        end;

      if sqlParticipantes.Locate('COD_PART',sqlConsulta.FieldByName('TRANICOD').AsString,[]) then
        Achou := 'S';

      if ( sqlConsulta.FieldByName('TRANA60RAZAOSOC').AsString = 'O EMITENTE' ) or ( sqlConsulta.FieldByName('TRANA60RAZAOSOC').AsString = 'O DESTINATARIO' ) then
          Achou := 'S';

      if Achou = 'N' then
      begin
        if not sqlConsulta.FieldByName('TRANICOD').IsNull then
        begin
          sqlParticipantes.Append;
          sqlParticipantes.FieldByName('COD_PART').AsString    := 'T' + sqlConsulta.FieldByName('TRANICOD').AsString;
          sqlParticipantes.FieldByName('COD_TRANSP').AsString  := sqlConsulta.Fieldbyname('TRANICOD').AsString;
          sqlParticipantes.FieldByName('NOME').AsString        := Trim(sqlConsulta.FieldByName('TRANA60RAZAOSOC').AsString) ;
          sqlParticipantes.FieldByName('COD_PAIS').AsString    := '1058';
          sqlParticipantes.FieldByName('CNPJ').AsString        := sqlConsulta.FieldByName('TRANA14CGC').AsString;
          sqlParticipantes.FieldByName('CPF').AsString         := sqlConsulta.FieldByName('TRANA11CPF').AsString;
          IE                                                   := COPY(sqlConsulta.FieldByName('TRANA15IE').AsString,0,14);
          while pos('/',IE) > 0 do
            delete(IE,pos('/',IE),1);
          while pos('.',IE) > 0 do
            delete(IE,pos('.',IE),1);
          sqlParticipantes.FieldByName('IE').AsString  := IE;

          sqlParticipantes.FieldByName('COD_MUN').AsString     := sqlConsulta.FieldByName('TRANICODMUNICIPIO').AsString;
          sqlParticipantes.FieldByName('ENDERECO').AsString    := Trim(sqlConsulta.FieldByName('TRANA60END').AsString);
          sqlParticipantes.FieldByName('END_NUM').AsString     := Trim(sqlConsulta.FieldByName('TRANA5NROEND').AsString);
          sqlParticipantes.FieldByName('BAIRRO').AsString      := Trim(sqlConsulta.FieldByName('TRANA60BAI').AsString);
          sqlParticipantes.FieldByName('COD_SUFRAMA').AsString := '';
          sqlParticipantes.FieldByName('COMPLEMENTO').AsString := '';

          // Codigo Cidade IBGE
          if (length(sqlParticipantes.FieldByName('COD_MUN').Value) <> 7) then
           begin
             sqlParticipantes.Cancel;
             Showmessage('Falha ao Criar Tabela de Participantes! Codigo IBGE do Participante!'+#13+#10+'Transportadora: '+sqlConsulta.FieldByName('TRANICODMUNICIPIO').AsString);
             Exit;
           end;
          sqlParticipantes.Post;
        end;
      end;
    except
      on E : Exception do
      begin
        Showmessage('Falha ao Criar Tabela de Participantes (Fornecedores Nota Compra):'+#13+#10+
        E.Message+#13+#10+'Transportador CONHECIMENTOS: ' + sqlConsulta.FieldByName('TRANICOD').AsString);
        Exit;
      end;
    end;
    Application.ProcessMessages;
    sqlConsulta.Next;
  end;


  sqlParticipantes.ApplyUpdates(0);
end;

procedure TDMSpedPisCofins.Gravar_0190;
begin
  Msg := 'Verificando Unidades de Medida';
  fDMConnection.FDConnection.ExecSQL('DELETE FROM SPED_0190');
  sqlConsulta.Close;
  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('with UNIDADE_SPED ');
  sqlConsulta.SQL.Add('as (select U.UNIDA5DESCR, U.UNIDA15DESCR ');
  sqlConsulta.SQL.Add('from CUPOM C ');
  sqlConsulta.SQL.Add('inner join CUPOMITEM CI on C.CUPOA13ID = CI.CUPOA13ID ');
  sqlConsulta.SQL.Add('inner join PRODUTO P on P.PRODICOD = CI.PRODICOD ');
  sqlConsulta.SQL.Add('inner join UNIDADE U on P.UNIDICOD = U.UNIDICOD ');
  sqlConsulta.SQL.Add('where C.CUPODEMIS between ''' + FormatDateTime('dd.mm.yyyy',DataInicial)+'''');
  sqlConsulta.SQL.Add(' AND ''' + FormatDateTime('dd.mm.yyyy',DataFinal)+ '''');
  sqlConsulta.SQL.Add(' union all ');
  sqlConsulta.SQL.Add('select U.UNIDA5DESCR, U.UNIDA15DESCR');
  sqlConsulta.SQL.Add('from NOTAFISCAL NF');
  sqlConsulta.SQL.Add('inner join NOTAFISCALITEM NFI on NF.CUPOA13ID = NFI.CUPOA13ID ');
  sqlConsulta.SQL.Add('inner join PRODUTO P on P.PRODICOD = NFI.PRODICOD ');
  sqlConsulta.SQL.Add('inner join UNIDADE U on P.UNIDICOD = U.UNIDICOD ');
  sqlConsulta.SQL.Add('where NF.NOFIDEMIS between ''' + FormatDateTime('dd.mm.yyyy',DataInicial)+''''); 
  sqlConsulta.SQL.Add(' AND ''' + FormatDateTime('dd.mm.yyyy',DataFinal)+ '''');
  sqlConsulta.SQL.Add(' union all ');
  sqlConsulta.SQL.Add('select U.UNIDA5DESCR, U.UNIDA15DESCR');
  sqlConsulta.SQL.Add('from NOTACOMPRA NC ');
  sqlConsulta.SQL.Add('inner join NOTACOMPRAITEM NCI on NC.NOCPA13ID = NCI.NOCPA13ID ');
  sqlConsulta.SQL.Add('inner join PRODUTO P on P.PRODICOD = NCI.PRODICOD ');
  sqlConsulta.SQL.Add('inner join UNIDADE U on P.UNIDICOD = U.UNIDICOD ');
  sqlConsulta.SQL.Add('where NC.NOCPDEMISSAO between ''' + FormatDateTime('dd.mm.yyyy',DataInicial)+''' '); 
  sqlConsulta.SQL.Add('AND ''' + FormatDateTime('dd.mm.yyyy',DataFinal)+ ''')');
  sqlConsulta.SQL.Add('select distinct(UNIDA5DESCR), UNIDA15DESCR from UNIDADE_SPED ');
  sqlConsulta.Open;

  sqlUnidades.Close;
  sqlUnidades.Open;
  while not sqlConsulta.Eof do
  begin
    sqlUnidades.Insert;
    sqlUnidadesUND_SIGLA.AsString := sqlConsulta.FieldByName('UNIDA5DESCR').AsString;
    sqlUnidadesUND_DESCR.AsString := sqlConsulta.FieldByName('UNIDA15DESCR').AsString;
    sqlUnidades.Post;
    sqlConsulta.Next;
  end;
  try
    sqlUnidades.ApplyUpdates(0);
  except
    on E : Exception do 
    begin
      ShowMessage('Erro ao gravar Unidade ' + E.Message);
    end;
  end;
end;

procedure TDMSpedPisCofins.Gravar_0200;
begin
  Msg := 'Verificando Produtos';
  fDMConnection.FDConnection.ExecSQL('delete from SPED_0200');
  sqlProduto.Close;
  sqlProduto.Open;
  sqlConsulta.Close;
  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('with PRODUTO_SPED ');
  sqlConsulta.SQL.Add('as (select P.PRODICOD, P.PRODA60DESCR, P.PRODA60CODBAR, P.PRODIORIGEM, P.PRODISITTRIB, P.PRODA2CSTPIS, P.PRODA3CSTPISENTRADA, ');
  sqlConsulta.SQL.Add('N.NCMA30CODIGO, P.UNIDICOD, P.ICMSICOD, U.UNIDA5DESCR, P.PRODA2TIPOITEM ');
  sqlConsulta.SQL.Add('from CUPOM C ');
  sqlConsulta.SQL.Add('inner join CUPOMITEM CI on C.CUPOA13ID = CI.CUPOA13ID ');
  sqlConsulta.SQL.Add('inner join PRODUTO P on P.PRODICOD = CI.PRODICOD ');
  sqlConsulta.SQL.Add('inner join NCM N on P.NCMICOD = N.NCMICOD ');
  sqlConsulta.SQL.Add('inner join UNIDADE U on P.UNIDICOD = U.UNIDICOD ');
  sqlConsulta.SQL.Add('where C.CUPODEMIS between ''' + FormatDateTime('dd.mm.yyyy',DataInicial)+'''');
  sqlConsulta.SQL.Add(' AND ''' + FormatDateTime('dd.mm.yyyy',DataFinal)+ '''');
  sqlConsulta.SQL.Add(' union all ');
  sqlConsulta.SQL.Add('select P.PRODICOD, P.PRODA60DESCR, P.PRODA60CODBAR, P.PRODIORIGEM, P.PRODISITTRIB, P.PRODA2CSTPIS, P.PRODA3CSTPISENTRADA, ');
  sqlConsulta.SQL.Add('N.NCMA30CODIGO, P.UNIDICOD, P.ICMSICOD, U.UNIDA5DESCR, P.PRODA2TIPOITEM ');
  sqlConsulta.SQL.Add('from NOTAFISCAL NF');
  sqlConsulta.SQL.Add('inner join NOTAFISCALITEM NFI on NF.NOFIA13ID = NFI.NOFIA13ID ');
  sqlConsulta.SQL.Add('inner join PRODUTO P on P.PRODICOD = NFI.PRODICOD ');
  sqlConsulta.SQL.Add('inner join NCM N on P.NCMICOD = N.NCMICOD ');
  sqlConsulta.SQL.Add('inner join UNIDADE U on P.UNIDICOD = U.UNIDICOD ');
  sqlConsulta.SQL.Add('where NF.NOFIDEMIS between ''' + FormatDateTime('dd.mm.yyyy',DataInicial)+''''); 
  sqlConsulta.SQL.Add(' AND ''' + FormatDateTime('dd.mm.yyyy',DataFinal)+ '''');
  sqlConsulta.SQL.Add(' union all ');
  sqlConsulta.SQL.Add('select P.PRODICOD, P.PRODA60DESCR, P.PRODA60CODBAR, P.PRODIORIGEM, P.PRODISITTRIB, P.PRODA2CSTPIS, P.PRODA3CSTPISENTRADA, ');
  sqlConsulta.SQL.Add('N.NCMA30CODIGO, P.UNIDICOD, P.ICMSICOD, U.UNIDA5DESCR, P.PRODA2TIPOITEM ');
  sqlConsulta.SQL.Add('from NOTACOMPRA NC ');
  sqlConsulta.SQL.Add('inner join NOTACOMPRAITEM NCI on NC.NOCPA13ID = NCI.NOCPA13ID ');
  sqlConsulta.SQL.Add('inner join PRODUTO P on P.PRODICOD = NCI.PRODICOD ');
  sqlConsulta.SQL.Add('inner join NCM N on P.NCMICOD = N.NCMICOD ');
  sqlConsulta.SQL.Add('inner join UNIDADE U on P.UNIDICOD = U.UNIDICOD ');
  sqlConsulta.SQL.Add('where NC.NOCPDEMISSAO between ''' + FormatDateTime('dd.mm.yyyy',DataInicial)+''' '); 
  sqlConsulta.SQL.Add('AND ''' + FormatDateTime('dd.mm.yyyy',DataFinal)+ ''')');
  sqlConsulta.SQL.Add('select distinct(PRODICOD), PRODA60DESCR, PRODA60CODBAR, PRODIORIGEM, PRODISITTRIB,PRODA2CSTPIS, ');
  sqlConsulta.SQL.Add('PRODA3CSTPISENTRADA, NCMA30CODIGO, UNIDICOD, ICMSICOD, UNIDA5DESCR, PRODA2TIPOITEM ');
  sqlConsulta.SQL.Add('from PRODUTO_SPED order by PRODICOD');
  sqlConsulta.Open;
  sqlConsulta.FetchAll;
  Msg := 'Classificando Produtos';
  while not sqlConsulta.Eof do
  begin
    sqlProduto.Insert;
    sqlProdutoCOD_ITEM.AsInteger := sqlConsulta.FieldByName('PRODICOD').AsInteger;
    sqlProdutoDESCRICAO.AsString := sqlConsulta.FieldByName('PRODA60DESCR').AsString;
    sqlProdutoCODIGOBARRAS.AsString := sqlConsulta.FieldByName('PRODA60CODBAR').AsString;
    sqlProdutoUNIDADEINVENTARIO.AsString := sqlConsulta.FieldByName('UNIDA5DESCR').AsString;
    sqlProdutoTIPO_ITEM.AsString := sqlConsulta.FieldByName('PRODA2TIPOITEM').AsString;
    sqlProdutoCODIGONCM.AsString := sqlConsulta.FieldByName('NCMA30CODIGO').AsString;
    sqlProduto.Post;
    sqlConsulta.Next;
  end;
  try
    sqlProduto.ApplyUpdates(0);
  except
    on E : Exception do 
    begin
      ShowMessage('Erro ao gravar Produto ' + E.Message);
    end;
  end;
  
  

end;

procedure TDMSpedPisCofins.Gravar_C100;
begin


end;

procedure TDMSpedPisCofins.setMax(const Value: Integer);
begin
  if Assigned(FevMax) then
    FevMax(Value);
end;

procedure TDMSpedPisCofins.SetMsg(const Value: String);
begin
  if Assigned(FevMsg) then
    FevMsg(Value);
end;

procedure TDMSpedPisCofins.setPosicao(const Value: Integer);
begin
  if Assigned(FevProgressao) then
    FevProgressao(Value);
end;

end.
