unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, ACBrBase, ACBrSpedPisCofins, uDMSpedPisCofins,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Samples.Gauges, System.DateUtils, FileCtrl;

type
  TfrmPrincipal = class(TForm)
    pnlTop: TPanel;
    Panel2: TPanel;
    pnlBotton: TPanel;
    De: TDateTimePicker;
    Para: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboEmpresa: TDBLookupComboBox;
    Label6: TLabel;
    ComboFinalidade: TComboBox;
    ComboMovimento: TComboBox;
    ProgressBar1: TProgressBar;
    edtCaminho: TEdit;
    GroupBox1: TGroupBox;
    comboIndIncidencia: TComboBox;
    comboIndMetodo: TComboBox;
    ComboIndContribuicao: TComboBox;
    comboIndCriterio: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    pnlProgress: TPanel;
    pnlGauge: TPanel;
    BitBtn1: TBitBtn;
    Gauge1: TGauge;
    pnlRegistro: TPanel;
    btnDiretorio: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDiretorioClick(Sender: TObject);
  private
      Arquivo : TextFile;
      TotalRegistros : integer;
    { Private declarations }
  public
    { Public declarations }
    fDMSpedPisCofins : TDMSpedPisCofins;
    procedure evMensagem(Msg : String);
    procedure evProgressao(Posicao : Integer);
    procedure evMaxProgress(Max : Integer);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
var
  Mes, Ano : String;
begin
  pnlRegistro.Font.Color := clGreen;

  TotalRegistros  := 0;
  if (De.Date = null) or (Para.Date = null) then
    begin
      ShowMessage('Informe as datas antes de tentar executar a rotina!');
      Exit;
    end;

  if (De.Date > Para.Date) then
  begin
    ShowMessage('Data de Inicio MAIOR que Data Termino! Verifique!');
    Exit;
  end;

  if (ComboEmpresa.KeyValue = 0) or (ComboEmpresa.KeyValue = null) then
  begin
    ShowMessage('Informe a Empresa antes de tentar executar a rotina!');
    Exit;
  end;

  with fDMSpedPisCofins do
  begin
    if CaminhoArquivo = EmptyStr then
    begin
      Mes := FormatFloat('00', MonthOf(De.DateTime));
      Ano := FormatFloat('0000', YearOf(De.DateTime));
      CaminhoArquivo := UpperCase(ExtractFilePath(Application.ExeName)) + 'SPED\'+ Mes + '_'+ Ano + '\';
      if not FileExists(CaminhoArquivo) then
        CreateDir(CaminhoArquivo);
    end;
    NomeArquivo := 'Sped_PisCofins_'+ fDMSpedPisCofins.qryEmpresaEMPRA60NOMEFANT.AsString +
                   '_' +FormatDateTime('ddmmyyyy',De.date)+
                   '_'+FormatDateTime('ddmmyyyy',Para.Date)+'.TXT';
    edtCaminho.Text := CaminhoArquivo + NomeArquivo;
    edtCaminho.Update;
  end;

  with fDMSpedPisCofins do
  begin
    DataInicial := De.Date;
    DataFinal := Para.Date;
    Ind_Movimento := ComboMovimento.ItemIndex = 0;
  end;

  case comboIndIncidencia.ItemIndex of
   0 : fDMSpedPisCofins.Ind_Incidencia := tpEscrOpIncNaoCumulativo;
   1 : fDMSpedPisCofins.Ind_Incidencia := tpEscrOpIncCumulativo;
   2 : fDMSpedPisCofins.Ind_Incidencia := tpEscrOpIncAmbos;
  end;

  case comboIndMetodo.ItemIndex of
   0 : fDMSpedPisCofins.Ind_Metodo := tpMetodoApropriacaoDireta;
   1 : fDMSpedPisCofins.Ind_Metodo := tpMetodoDeRateioProporcional;
  end;

  case ComboIndContribuicao.ItemIndex of
   0 : fDMSpedPisCofins.Ind_Tipo := tpIndTipoConExclAliqBasica;
   1 : fDMSpedPisCofins.Ind_Tipo := tpIndTipoAliqEspecificas;
  end;

  case comboIndCriterio.ItemIndex of
   0 : fDMSpedPisCofins.Ind_Credito := tpRegimeCaixa;
   1 : fDMSpedPisCofins.Ind_Credito := tpRegimeCompetEscritConsolidada;
   2 : fDMSpedPisCofins.Ind_Credito := tpRegimeCompetEscritDetalhada;
  end;
  with fDMSpedPisCofins do
  begin
    Gerar_Bloco_0;
    Gerar_Bloco_A;
    Gerar_Bloco_C;
    Gerar_Bloco_M;
    GravarTxt;
  end;
  pnlRegistro.Caption := 'Arquivo Gerado!';
  pnlRegistro.Font.Color := clRed;
  pnlRegistro.Update;
end;

procedure TfrmPrincipal.btnDiretorioClick(Sender: TObject);
const
  SELDIRHELP = 1000;
var
  Dir : String;
begin
  Dir := fDMSpedPisCofins.CaminhoArquivo;
  if FileCtrl.SelectDirectory(Dir,[sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
  begin
    fDMSpedPisCofins.CaminhoArquivo := Dir + '\';
    edtCaminho.Text := fDMSpedPisCofins.CaminhoArquivo;
  end;
end;

procedure TfrmPrincipal.evMaxProgress(Max: Integer);
begin
  Gauge1.MinValue := 0;
  Gauge1.MaxValue := Max;
  Gauge1.Update;
end;

procedure TfrmPrincipal.evMensagem(Msg: String);
begin
  pnlRegistro.Caption := Msg;
  pnlRegistro.Update;
end;

procedure TfrmPrincipal.evProgressao(Posicao: Integer);
begin
  Gauge1.AddProgress(Posicao);
  Gauge1.Update;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(fDMSpedPisCofins) then
    FreeAndNil(fDMSpedPisCofins);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  fDMSpedPisCofins := TDMSpedPisCofins.Create(nil);
  fDMSpedPisCofins.evMsg := evMensagem;
  fDMSpedPisCofins.evProgresso := evProgressao;
  fDMSpedPisCofins.evMax := evMaxProgress;
  para.Date := StartOfTheMonth(date()) - 1;
  de.Date := StartOfTheMonth(para.date);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if fDMSpedPisCofins.qryEmpresa.RecordCount = 1 then
    ComboEmpresa.KeyValue := fDMSpedPisCofins.qryEmpresaEMPRICOD.AsInteger;
end;

end.
