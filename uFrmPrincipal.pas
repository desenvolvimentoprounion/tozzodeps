unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
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
  cxGrid, Vcl.ExtCtrls, cxSpinEdit, cxMemo, cxCurrencyEdit, cxProgressBar,
  DateUtils, uUsuario, dxSkinOffice2019Colorful, dxSkinTheBezier, dxDateRanges;

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
    btnEdtUsuarioAuto: TcxButtonEdit;
    edtDescricaoUsuarioAuto: TcxTextEdit;
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
    btnPararAuto: TcxButton;
    btnPlayAuto: TcxButton;
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
    prgBar: TcxProgressBar;
    timer: TTimer;
    tabLog: TcxTabSheet;
    btnConsultarLog: TcxButton;
    cxLabel17: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    dtLogInicial: TcxDateEdit;
    cxLabel26: TcxLabel;
    dtLogFinal: TcxDateEdit;
    cxLabel27: TcxLabel;
    mskNumeroLog: TcxMaskEdit;
    cxLabel28: TcxLabel;
    btnEdtCodClienteLog: TcxButtonEdit;
    edtDescricaoLog: TcxTextEdit;
    cxLabel29: TcxLabel;
    btnEdtCodRCALog: TcxButtonEdit;
    edtDescricaoRCALog: TcxTextEdit;
    btnVoltarMenu3: TcxButton;
    Shape3: TShape;
    cxLabel30: TcxLabel;
    Shape4: TShape;
    cxLabel31: TcxLabel;
    btnPesquisarLog: TcxButton;
    btnVerItensLog: TcxButton;
    grdLogPedidos: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    grdLogPedidosNUMPED: TcxGridDBColumn;
    grdLogPedidosDATA: TcxGridDBColumn;
    grdLogPedidosCODUSUARIO: TcxGridDBColumn;
    grdLogPedidosUSUARIO: TcxGridDBColumn;
    grdLogPedidosCODCLI: TcxGridDBColumn;
    grdLogPedidosCLIENTE: TcxGridDBColumn;
    grdLogPedidosCORTE: TcxGridDBColumn;
    grdLogPedidosVLTOTALANTES: TcxGridDBColumn;
    grdLogPedidosVLTOTALDEPOIS: TcxGridDBColumn;
    grdLogPedidosVLATENDANTES: TcxGridDBColumn;
    grdLogPedidosVLATENDDEPOIS: TcxGridDBColumn;
    grdLogPedidosVLCUSTOREPANTES: TcxGridDBColumn;
    grdLogPedidosVLCUSTOREPDEPOIS: TcxGridDBColumn;
    grdLogPedidosVLCUSTOCONTANTES: TcxGridDBColumn;
    grdLogPedidosVLCUSTOCONTDEPOIS: TcxGridDBColumn;
    grdLogPedidosVLCUSTOREALANTES: TcxGridDBColumn;
    grdLogPedidosVLCUSTOREALDEPOIS: TcxGridDBColumn;
    grdLogPedidosVLCUSTOFINANTES: TcxGridDBColumn;
    grdLogPedidosVLCUSTOFINDEPOIS: TcxGridDBColumn;
    grdLogPedidosNUMITENSANTES: TcxGridDBColumn;
    grdLogPedidosNUMITENSDEPOIS: TcxGridDBColumn;
    grdLogPedidosTOTPESOANTES: TcxGridDBColumn;
    grdLogPedidosTOTPESODEPOIS: TcxGridDBColumn;
    stySemCorte: TcxStyle;
    styComCorte: TcxStyle;
    grdLogPedidosVLTABELAANTES: TcxGridDBColumn;
    grdLogPedidosVLTABELADEPOIS: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure _irParaExecuaoManual(Sender: TObject);
    procedure _irParaExecucaoAutomatica(Sender: TObject);
    procedure _irParaMenu(Sender: TObject);
    procedure _PesquisarManual(Sender: TObject);
    procedure grdPedidosDBTableView1StylesGetContentStyle
      (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure btnEdtCodClientePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnEdtCodClienteExit(Sender: TObject);
    procedure btnEdtCodRCAPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnEdtCodRCAExit(Sender: TObject);
    procedure btnLiberarPedidosManualClick(Sender: TObject);
    procedure btnPlayAutoClick(Sender: TObject);
    procedure btnEdtUsuarioAutoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnEdtUsuarioAutoExit(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure btnPararAutoClick(Sender: TObject);
    procedure tabExecucaoManualShow(Sender: TObject);
    procedure _irParaLog(Sender: TObject);
    procedure btnEdtCodClienteLogExit(Sender: TObject);
    procedure btnEdtCodClienteLogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnEdtCodRCALogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnEdtCodRCALogExit(Sender: TObject);
    procedure grdLogPedidosStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure btnPesquisarLogClick(Sender: TObject);
    procedure _VerLogItens(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  gPROXIMA_EXECUCAO: TDateTime;
  gAUTOMATICO_HABILITADO: boolean;
  gUSUARIO_AUTOMATICO: TUsuario;

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

procedure TFrmPrincipal._irParaLog(Sender: TObject);
begin


  tabLog.Show;
end;

procedure TFrmPrincipal.btnEdtCodClienteExit(Sender: TObject);
begin

  BotaoPesquisaOnExit(cliente, btnEdtCodCliente, edtDescricaoCliente,
    'Cliente não encontrado');

end;

procedure TFrmPrincipal.btnEdtCodClienteLogExit(Sender: TObject);
begin

  BotaoPesquisaOnExit(cliente, btnEdtCodClienteLog, edtDescricaoLog, 'Cliente não encontrado');
end;

procedure TFrmPrincipal.btnEdtCodClienteLogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin


  BotaoPesquisaOnButtonClick(cliente, btnEdtCodClienteLog, Self);
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

procedure TFrmPrincipal.btnEdtCodRCALogExit(Sender: TObject);
begin

  BotaoPesquisaOnExit(rca, btnEdtCodRCALog, edtDescricaoRCALog, 'RCA não encontrado');

end;

procedure TFrmPrincipal.btnEdtCodRCALogPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin


  BotaoPesquisaOnButtonClick(rca, btnEdtCodRCALog, Self);
end;

procedure TFrmPrincipal.btnEdtCodRCAPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin

  BotaoPesquisaOnButtonClick(rca, btnEdtCodRCA, Self);
end;

procedure TFrmPrincipal.btnEdtUsuarioAutoExit(Sender: TObject);
begin

  BotaoPesquisaOnExit(usuario, btnEdtUsuarioAuto, edtDescricaoUsuarioAuto,
    'Usuário não encontrado');
end;

procedure TFrmPrincipal.btnEdtUsuarioAutoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin

  BotaoPesquisaOnButtonClick(usuario, btnEdtUsuarioAuto, Self);
end;

procedure TFrmPrincipal.btnLiberarPedidosManualClick(Sender: TObject);
var
  data_maxima: TDateTime;
begin

  data_maxima := EncodeDate(2019, 8, 30);

  if (Date > data_maxima) then
  begin

    TMsg.Alerta('O período de homologação expirou');
    Exit;
  end;

  FrmPrincipal.prgBar.Visible := True;
  Application.ProcessMessages;

  btnPesquisar.Enabled := False;
  btnVoltarMenu1.Enabled := False;
  btnLiberarPedidosManual.Enabled := False;

  if ProcessarPedidos(gUSUARIO, gCODIGO_ROTINA) then
  begin

    TMsg.Sucesso('Pedidos liberados com sucesso');
  end;

  FrmPrincipal.prgBar.Visible := False;
  Application.ProcessMessages;

  _PesquisarManual(Sender);

  btnPesquisar.Enabled := True;
  btnVoltarMenu1.Enabled := True;
  btnLiberarPedidosManual.Enabled := True;
end;

procedure TFrmPrincipal.btnPararAutoClick(Sender: TObject);
begin

  edtProximaExecucao.Text := '';
  gAUTOMATICO_HABILITADO := False;

  btnEdtUsuarioAuto.Enabled := True;
  spnQtdDias.Enabled := True;
  spnQtdLinhas.Enabled := True;
  spnIntervaloMinutos.Enabled := True;

  btnPlayAuto.Enabled := True;
  btnPararAuto.Enabled := False;
  btnVoltarMenu2.Enabled := True;
end;

procedure TFrmPrincipal.btnPesquisarLogClick(Sender: TObject);
var
  data_inicial,
  data_final : TDateTime;

  numero_pedido,
  codigo_cliente,
  codigo_rca : double;

  registros_encontrados : integer;
begin

  if (dtLogInicial.Text = '') then
  begin

    TMsg.Alerta('Informe a data inicial');
    dtLogInicial.SetFocus;
    Exit;
  end;

  if (dtLogFinal.Text = '') then
  begin

    TMsg.Alerta('Informe a data final');
    dtLogFinal.SetFocus;
    Exit;
  end;

  data_inicial := dtLogInicial.Date;
  data_final := dtLogFinal.Date;
  numero_pedido := 0;
  codigo_cliente := 0;
  codigo_rca := 0;

  if mskNumeroLog.Text <> '' then
    numero_pedido := mskNumeroLog.EditValue;

  if btnEdtCodClienteLog.Text <> '' then
    codigo_cliente := btnEdtCodClienteLog.EditValue;

  if btnEdtCodRCALog.Text <> '' then
    codigo_rca := btnEdtCodRCALog.EditValue;


  registros_encontrados := PesquisaLog(data_inicial, data_final, numero_pedido, codigo_cliente, codigo_rca);

  if registros_encontrados = 0 then
  begin

    TMsg.Alerta('Nenhum registro encontrado');
  end;

end;

procedure TFrmPrincipal.btnPlayAutoClick(Sender: TObject);
var
  data_maxima: TDateTime;
  minutos: double;
begin

  data_maxima := EncodeDate(2019, 8, 30);

  if (Date > data_maxima) then
  begin

    TMsg.Alerta('O período de homologação expirou');
    Exit;
  end;

  if btnEdtUsuarioAuto.Text = '' then
  begin

    TMsg.Alerta('Informe o usuário');
    btnEdtUsuarioAuto.SetFocus;
    Exit;
  end;

  if spnIntervaloMinutos.Text = '' then
  begin

    minutos := 1;
  end
  else
  begin

    minutos := spnIntervaloMinutos.EditValue;
  end;

  gPROXIMA_EXECUCAO := IncMinute(Now, Trunc(minutos));
  edtProximaExecucao.Text := DateTimeToStr(gPROXIMA_EXECUCAO);
  gAUTOMATICO_HABILITADO := True;
  gUSUARIO_AUTOMATICO := TUsuario.PorMatricula(btnEdtUsuarioAuto.EditValue);

  btnEdtUsuarioAuto.Enabled := False;
  spnQtdDias.Enabled := False;
  spnQtdLinhas.Enabled := False;
  spnIntervaloMinutos.Enabled := False;

  btnPlayAuto.Enabled := False;
  btnPararAuto.Enabled := True;
  btnVoltarMenu2.Enabled := False;

end;

procedure TFrmPrincipal._VerLogItens(Sender: TObject);
var
  numero_pedido : double;
begin

  if (DmdBD.qryConsultaLogCabecalho.State <> dsBrowse)
    or (DmdBD.qryConsultaLogCabecalho.RecordCount = 0)
   then
  begin

    Exit;
  end;


  numero_pedido := DmdBD.qryConsultaLogCabecalhoNUMPED.AsFloat;
  VerItensLog(numero_pedido);

end;

procedure TFrmPrincipal._PesquisarManual(Sender: TObject);
var
  dt_inicial, dt_final: TDateTime;
  numero_pedido, codigo_cliente, codigo_rca: double;

  registros_encontrados: Integer;
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

  registros_encontrados := PesquisaPedidos(dt_inicial, dt_final, numero_pedido,
    codigo_cliente, codigo_rca);

//  if registros_encontrados = 0 then
//  begin
//
//    TMsg.Alerta('Nenhum registro encontrado');
//  end;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin

  pgcPrincipal.ActivePageIndex := 0;
  pgcPrincipal.HideTabs := True;

  dtLiberaPedidoInicial.Date := Date;
  dtLiberaPedidoFinal.Date := Date;

  dtLogInicial.Date := Date;
  dtLogFinal.Date := Date;

  gUSUARIO := TUsuario.PorLogin(ParamStr(1));
  gCODIGO_ROTINA := StrToFloat(ParamStr(5));

  Caption := ParamStr(5) +
    ' - Integração WinThor x DEPS - versão: 1.2.0.0 [VERSÃO DE HOMOLOGAÇÃO]';
  Application.Title := Caption;

  btnEdtUsuarioAuto.EditValue := gUSUARIO.Matricula;
  edtDescricaoUsuarioAuto.Text := gUSUARIO.Nome;

  gAUTOMATICO_HABILITADO := False;

end;

procedure TFrmPrincipal.grdLogPedidosStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  idx_corte : integer;
begin

  idx_corte := grdLogPedidosCORTE.Index;

  if ARecord.Values[idx_corte] = 'S' then
  begin

    AStyle := styComCorte;
  end
  else
  begin

    AStyle := stySemCorte;
  end;


end;

procedure TFrmPrincipal.grdPedidosDBTableView1StylesGetContentStyle
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  sem_estoque_idx: Integer;
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

procedure TFrmPrincipal.tabExecucaoManualShow(Sender: TObject);
begin

  if (DmdBD.qryPesquisaPedidos.State = dsBrowse) then
  begin

    DmdBD.qryPesquisaPedidos.Close;
  end;

  prgBar.Visible := False;
end;

procedure TFrmPrincipal.timerTimer(Sender: TObject);
var
  data_inicial: TDateTime;
  registros_encontrados: Integer;
begin

  if (gAUTOMATICO_HABILITADO) and (Now >= gPROXIMA_EXECUCAO) then
  begin

    gAUTOMATICO_HABILITADO := False;

    if memoLog.Lines.Count >= spnQtdLinhas.EditValue then
    begin

      memoLog.Clear;
    end;

    RegistrarLog('Iniciando processamento automático');

    data_inicial := IncDay(Date, spnQtdDias.EditValue * -1);
    registros_encontrados := PesquisaPedidos(data_inicial, Date, 0, 0, 0);

    RegistrarLog(IntToStr(registros_encontrados) + ' registros encontrados');

    if registros_encontrados > 0 then
    begin

      ProcessarPedidos(gUSUARIO_AUTOMATICO, gCODIGO_ROTINA, True);
      RegistrarLog(IntToStr(registros_encontrados) + ' registros processados');
    end;

    RegistrarLog('Finalizando processamento automático');

    gPROXIMA_EXECUCAO := IncMinute(Now, spnIntervaloMinutos.EditingValue);
    edtProximaExecucao.Text := DateTimeToStr(gPROXIMA_EXECUCAO);

    gAUTOMATICO_HABILITADO := True;
  end;

end;

end.
