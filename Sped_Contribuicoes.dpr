program Sped_Contribuicoes;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDMSpedPisCofins in 'uDMSpedPisCofins.pas' {DMSpedPisCofins: TDataModule},
  uDMConnection in 'uDMConnection.pas' {DMConnection: TDataModule},
  uUtilPadrao in 'uUtilPadrao.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
