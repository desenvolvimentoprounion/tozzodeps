unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxClasses, cxLookAndFeels, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeelPainters, cxPC,
  cxContainer, cxEdit, cxLabel, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxGroupBox, cxButtonEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, cxSpinEdit, cxMemo, cxCurrencyEdit;

type
  TFrmPrincipal = class(TForm)
    LookAndFeelController: TcxLookAndFeelController;
    pgcPrincipal: TcxPageControl;
    tabMenu: TcxTabSheet;
    tabExecucaoManual: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    btnExcucaoManual: TcxButton;
    tabExecucaoAutomatica: TcxTabSheet;
    btnExcucaoAutomatica: TcxButton;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    btnVoltarMenu1: TcxButton;
    btnVoltarMenu2: TcxButton;
    mskNumeroPedido: TcxMaskEdit;
    cxLabel10: TcxLabel;
    btnEdtCodCliente: TcxButtonEdit;
    btnEdtCodRCA: TcxButtonEdit;
    edtDescricaoCliente: TcxTextEdit;
    edtDescricaoRCA: TcxTextEdit;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    btnPesquisar: TcxButton;
    cxLabel8: TcxLabel;
    dtLiberaPedidoInicial: TcxDateEdit;
    cxLabel9: TcxLabel;
    dtLiberaPedidoFinal: TcxDateEdit;
    cxLabel13: TcxLabel;
    grdPedidosDBTableView1: TcxGridDBTableView;
    grdPedidosLevel1: TcxGridLevel;
    grdPedidos: TcxGrid;
    btnLiberarPedidosManual: TcxButton;
    Shape1: TShape;
    cxLabel14: TcxLabel;
    Shape2: TShape;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxTextEdit3: TcxTextEdit;
    cxLabel17: TcxLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxTextEdit4: TcxTextEdit;
    spnQtdDias: TcxSpinEdit;
    spnIntervaloMinutos: TcxSpinEdit;
    spnQtdLinhas: TcxSpinEdit;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    memoLog: TcxMemo;
    cxLabel21: TcxLabel;
    edtProximaExecucao: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    grdPedidosDBTableView1CODFILIAL: TcxGridDBColumn;
    grdPedidosDBTableView1NUMPED: TcxGridDBColumn;
    grdPedidosDBTableView1VLTOTAL: TcxGridDBColumn;
    grdPedidosDBTableView1CODCLI: TcxGridDBColumn;
    grdPedidosDBTableView1CLIENTE: TcxGridDBColumn;
    grdPedidosDBTableView1CODUSUR: TcxGridDBColumn;
    grdPedidosDBTableView1NOME: TcxGridDBColumn;
    grdPedidosDBTableView1SEM_ESTOQUE: TcxGridDBColumn;
    styRepo: TcxStyleRepository;
    styComEstoque: TcxStyle;
    stySemEstoque: TcxStyle;
    grdPedidosDBTableView1DATA: TcxGridDBColumn;
    grdPedidosDBTableView1DTLIBERADEPS: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure _irParaExecuaoManual(Sender: TObject);
    procedure _irParaExecucaoAutomatica(Sender: TObject);
    procedure _irParaMenu(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grdPedidosDBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure btnEdtCodClientePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnEdtCodClienteExit(Sender: TObject);
    procedure btnEdtCodRCAPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnEdtCodRCAExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uDmdBD, uApp, UMensagem, uConexaoBD, uUtils, UConsultasWinthor;

procedure TFrmPrincipal._irParaExecuaoManual(Sender: TObject);
begin

  tabExecucaoManual.Show;
end;

procedure TFrmPrincipal._irParaExecucaoAutomatica(Sender: TObject);
begin

  tabExecucaoAutomatica.Show;
end;

procedure TFrmPrincipal._irParaMenu(Sender: TObject);
begin

  tabMenu.Show;
end;

procedure TFrmPrincipal.btnEdtCodClienteExit(Sender: TObject);
begin

  BotaoPesquisaOnExit(cliente, btnEdtCodCliente, edtDescricaoCliente, 'Cliente não encontrado');

end;

procedure TFrmPrincipal.btnEdtCodClientePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin

  BotaoPesquisaOnButtonClick(cliente, btnEdtCodCliente, Self);
end;

procedure TFrmPrincipal.btnEdtCodRCAExit(Sender: TObject);
begin
                                                                                
  BotaoPesquisaOnExit(rca, btnEdtCodRCA, edtDescricaoRCA, 'RCA não encontrado');
end;

procedure TFrmPrincipal.btnEdtCodRCAPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin

  BotaoPesquisaOnButtonClick(rca, btnEdtCodRCA, Self);

end;

procedure TFrmPrincipal.btnPesquisarClick(Sender: TObject);
var
  dt_inicial,
  dt_final : TDateTime;
  numero_pedido,
  codigo_cliente,
  codigo_rca : double;

  registros_encontrados : integer;
begin

  if dtLiberaPedidoInicial.Text = '' then
  begin
  
    TMsg.Alerta('Informe a data inicial');
    dtLiberaPedidoInicial.SetFocus;
    Exit;
  end;

  if dtLiberaPedidoFinal.Text = '' then
  begin
  
    TMsg.Alerta('Informe a data final');
    dtLiberaPedidoFinal.SetFocus;
    Exit;
  end;

  dt_inicial := dtLiberaPedidoInicial.Date;
  dt_final := dtLiberaPedidoFinal.Date;
  codigo_cliente := 0;
  codigo_rca := 0;
  numero_pedido := 0;
  
  if btnEdtCodCliente.Text <> '' then
    codigo_cliente := btnEdtCodCliente.EditValue;

  if btnEdtCodRCA.Text <> '' then
    codigo_rca := btnEdtCodRCA.EditValue;

  if mskNumeroPedido.Text <> '' then
    numero_pedido := mskNumeroPedido.EditValue;

  registros_encontrados := PesquisaPedidos(dt_inicial, dt_final, numero_pedido, codigo_cliente, codigo_rca);

  if registros_encontrados = 0 then
  begin
  
    TMsg.Alerta('Nenhum registro encontrado');
  end;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin

  pgcPrincipal.ActivePageIndex := 0;
  pgcPrincipal.HideTabs := True;

  dtLiberaPedidoInicial.Date := Date;
  dtLiberaPedidoFinal.Date := Date;


end;

procedure TFrmPrincipal.grdPedidosDBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  sem_estoque_idx : integer;
begin

  sem_estoque_idx := grdPedidosDBTableView1SEM_ESTOQUE.Index;

  if ARecord.Values[sem_estoque_idx] > 0 then
  begin
  
    AStyle := stySemEstoque;
  end
  else
  begin
  
    AStyle := styComEstoque;
  end;

end;

end.
