program LiberaPedidoDEPS;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uDmdBD in 'uDmdBD.pas' {DmdBD: TDataModule},
  uApp in 'uApp.pas',
  uConexaoBD in 'libs\uConexaoBD.pas',
  uConfiguracao in 'libs\uConfiguracao.pas',
  uUsuario in 'libs\uUsuario.pas',
  uUtils in 'libs\uUtils.pas',
  UFrmMsgAlerta in 'libs\mensagens\UFrmMsgAlerta.pas' {FrmMsgAlerta},
  UFrmMsgErro in 'libs\mensagens\UFrmMsgErro.pas' {FrmMsgErro},
  UFrmMsgInformacao in 'libs\mensagens\UFrmMsgInformacao.pas' {FrmMsgInformacao},
  UFrmMsgPergunta in 'libs\mensagens\UFrmMsgPergunta.pas' {FrmMsgPergunta},
  UFrmMsgSucesso in 'libs\mensagens\UFrmMsgSucesso.pas' {FrmMsgSucesso},
  UMensagem in 'libs\mensagens\UMensagem.pas',
  UConsultasWinthor in 'libs\consultas\UConsultasWinthor.pas',
  UFrmConsultaWinthor in 'libs\consultas\UFrmConsultaWinthor.pas' {FrmConsultaWinthor},
  UFrmConsultaWinthorFornecedor in 'libs\consultas\UFrmConsultaWinthorFornecedor.pas' {FrmConsultaWinthorFornecedor},
  uFrmLogItens in 'uFrmLogItens.pas' {FrmLogItens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ConectarBD();

  Application.CreateForm(TDmdBD, DmdBD);
  DefinirConexao(DmdBD);

  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
