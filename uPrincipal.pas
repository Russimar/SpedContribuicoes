unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, ACBrBase, ACBrSpedPisCofins, uDMSpedPisCofins,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Samples.Gauges, System.DateUtils;

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
    BitBtn1: TBitBtn;
    pnlProgress: TPanel;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    pnlRegistro: TPanel;
    pnlGauge: TPanel;
    Gauge1: TGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
      Arquivo : TextFile;
      TotalRegistros : integer;
    { Private declarations }
  public
    { Public declarations }
    fDMSpedPisCofins : TDMSpedPisCofins;
    procedure evMensagem(Msg : String);
    procedure evProgressao(Posicao : Integer);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin

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
    CaminhoArquivo := UpperCase(ExtractFilePath(Application.ExeName)) + 'SPED\';
    NomeArquivo := 'Sped_PisCofins_'+ fDMSpedPisCofins.qryEmpresaEMPRA60NOMEFANT.AsString +
                 '_' +FormatDateTime('ddmmyyyy',De.date)+
                 '_'+FormatDateTime('ddmmyyyy',Para.Date)+'.TXT';
    edtCaminho.Text := CaminhoArquivo + NomeArquivo;
    edtCaminho.Update;
  end;


//  try
//    AssignFile(Arquivo,edtCaminho.Text);
//    Rewrite(Arquivo);
//    CloseFile(Arquivo);
//  except
//    on E:Exception Do
//    begin
//      Showmessage('Falha ao Criar Arquivo: '+E.message);
//      Exit;
//    end;
//  end;

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
    Gauge1.MinValue := 0;
    Gauge1.MaxValue := 2;
    Gerar_Bloco_0;
    Gerar_Bloco_A;
    Gauge1.AddProgress(1);
    Gauge1.Update;
    Gerar_Bloco_C;
    Gauge1.AddProgress(1);
    Gauge1.Update;
    Gerar_Bloco_M;
    Gauge1.AddProgress(1);
    Gauge1.Update;
    GravarTxt;
  end;
  pnlRegistro.Caption := 'Arquivo Gerado!';
  pnlRegistro.Update;

end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
begin
  fDMSpedPisCofins.ACBrSPEDPisCofins1.LinhasBuffer := 1000;
  fDMSpedPisCofins.ACBrSPEDPisCofins1.Path := 'c:\temp';
  fDMSpedPisCofins.ACBrSPEDPisCofins1.Arquivo := 'SPED_Fiscal_.txt';
  fDMSpedPisCofins.ACBrSPEDPisCofins1.DT_INI := de.Date;
  fDMSpedPisCofins.ACBrSPEDPisCofins1.DT_FIN := para.Date;
  fDMSpedPisCofins.ACBrSPEDPisCofins1.IniciaGeracao;


  fDMSpedPisCofins.ACBrSPEDPisCofins1.SaveFileTXT;
  if FileExists(fDMSpedPisCofins.ACBrSPEDPisCofins1.Path + fDMSpedPisCofins.ACBrSPEDPisCofins1.Arquivo) then
    memo1.Lines.LoadFromFile(fDMSpedPisCofins.ACBrSPEDPisCofins1.Path + fDMSpedPisCofins.ACBrSPEDPisCofins1.Arquivo);
  ShowMessage('Arquivo Gerado!');

end;

procedure TfrmPrincipal.evMensagem(Msg: String);
begin
  pnlRegistro.Caption := Msg;
  pnlRegistro.Update;
end;

procedure TfrmPrincipal.evProgressao(Posicao: Integer);
begin
  ProgressBar1.Position := Posicao;
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
  para.Date := StartOfTheMonth(date()) - 1;
  de.Date := StartOfTheMonth(para.date);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if fDMSpedPisCofins.qryEmpresa.RecordCount = 1 then
    ComboEmpresa.KeyValue := fDMSpedPisCofins.qryEmpresaEMPRICOD.AsInteger;
end;

end.
