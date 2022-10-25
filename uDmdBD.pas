unit uDmdBD;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, MemDS, DBAccess, Ora;

type
  TDmdBD = class(TDataModule)
    qryPesquisaPedidos: TFDQuery;
    conn: TFDConnection;
    qryPesquisaPedidosCODFILIAL: TStringField;
    qryPesquisaPedidosNUMPED: TBCDField;
    qryPesquisaPedidosVLTOTAL: TBCDField;
    qryPesquisaPedidosCODCLI: TBCDField;
    qryPesquisaPedidosCLIENTE: TStringField;
    qryPesquisaPedidosCODUSUR: TBCDField;
    qryPesquisaPedidosNOME: TStringField;
    qryPesquisaPedidosSEM_ESTOQUE: TFMTBCDField;
    dsrPesquisaPedidos: TDataSource;
    qryPesquisaPedidosDATA: TDateTimeField;
    qryPesquisaPedidosDTLIBERADEPS: TDateTimeField;
    qryPedidoPrecisaCorte: TFDQuery;
    qryItensPedido: TFDQuery;
    qryItensPedidoCODPROD: TBCDField;
    qryItensPedidoQT: TFMTBCDField;
    qryItensPedidoPVENDA: TFMTBCDField;
    qryItensPedidoESTDISP: TFMTBCDField;
    qryInserePCCORTEI: TFDQuery;
    qryReservarEstoqueItem: TFDQuery;
    qryLiberarPedido: TFDQuery;
    qryLiberarItens: TFDQuery;
    qryPesquisaPedidosNUMCAR: TFMTBCDField;
    qryPesquisaPedidosCODEMITENTE: TFMTBCDField;
    qryItensPedidoNUMSEQ: TFMTBCDField;
    qryCorteItemPedido: TFDQuery;
    qryAtualizarCabecalhoPedido: TFDQuery;
    qryDeletarItensSemQuantidade: TFDQuery;
    qryCancelarPedidoSemItens: TFDQuery;
    qryMarcarComoLiberado: TFDQuery;
    qryTotaisPedido: TFDQuery;
    qryTotaisPedidoVLTOTAL: TFMTBCDField;
    qryTotaisPedidoVLATEND: TFMTBCDField;
    qryTotaisPedidoVLCUSTOREP: TFMTBCDField;
    qryTotaisPedidoVLCUSTOCONT: TFMTBCDField;
    qryTotaisPedidoVLCUSTOREAL: TFMTBCDField;
    qryTotaisPedidoVLCUSTOFIN: TFMTBCDField;
    qryTotaisPedidoNUMITENS: TFMTBCDField;
    qryTotaisPedidoTOTPESO: TFMTBCDField;
    qryRegistraLogPedido: TFDQuery;
    qryAtualizaLogPedido: TFDQuery;
    qryItensPedidoQTESTGER: TFMTBCDField;
    qryItensPedidoQTRESERV: TFMTBCDField;
    qryItensPedidoQTBLOQUEADA: TFMTBCDField;
    qryItensPedidoQTPENDENTE: TFMTBCDField;
    qryItensPedidoQTINDENIZ: TFMTBCDField;
    qryItensPedidoPTABELA: TFMTBCDField;
    qryItensPedidoVLCUSTOREP: TFMTBCDField;
    qryItensPedidoVLCUSTOCONT: TFMTBCDField;
    qryItensPedidoVLCUSTOREAL: TFMTBCDField;
    qryItensPedidoVLCUSTOFIN: TFMTBCDField;
    qryRegistraLogItem: TFDQuery;
    qryConsultaLogCabecalho: TFDQuery;
    qryConsultaLogCabecalhoNUMPED: TFMTBCDField;
    qryConsultaLogCabecalhoDATA: TDateTimeField;
    qryConsultaLogCabecalhoCODUSUARIO: TFMTBCDField;
    qryConsultaLogCabecalhoUSUARIO: TStringField;
    qryConsultaLogCabecalhoCODCLI: TBCDField;
    qryConsultaLogCabecalhoCLIENTE: TStringField;
    qryConsultaLogCabecalhoCORTE: TStringField;
    qryConsultaLogCabecalhoVLTOTALANTES: TBCDField;
    qryConsultaLogCabecalhoVLTOTALDEPOIS: TBCDField;
    qryConsultaLogCabecalhoVLATENDANTES: TBCDField;
    qryConsultaLogCabecalhoVLATENDDEPOIS: TBCDField;
    qryConsultaLogCabecalhoVLCUSTOREPANTES: TBCDField;
    qryConsultaLogCabecalhoVLCUSTOREPDEPOIS: TBCDField;
    qryConsultaLogCabecalhoVLCUSTOCONTANTES: TBCDField;
    qryConsultaLogCabecalhoVLCUSTOCONTDEPOIS: TBCDField;
    qryConsultaLogCabecalhoVLCUSTOREALANTES: TBCDField;
    qryConsultaLogCabecalhoVLCUSTOREALDEPOIS: TBCDField;
    qryConsultaLogCabecalhoVLCUSTOFINANTES: TBCDField;
    qryConsultaLogCabecalhoVLCUSTOFINDEPOIS: TBCDField;
    qryConsultaLogCabecalhoNUMITENSANTES: TBCDField;
    qryConsultaLogCabecalhoNUMITENSDEPOIS: TBCDField;
    qryConsultaLogCabecalhoTOTPESOANTES: TBCDField;
    qryConsultaLogCabecalhoTOTPESODEPOIS: TBCDField;
    dsrConsultaLogCabecalho: TDataSource;
    dsrConsultaLogItem: TDataSource;
    qryConsultaLogItem: TFDQuery;
    qryConsultaLogItemNUMPED: TFMTBCDField;
    qryConsultaLogItemCODPROD: TBCDField;
    qryConsultaLogItemPRODUT: TStringField;
    qryConsultaLogItemQTPEDANTES: TBCDField;
    qryConsultaLogItemQTPEDDEPOIS: TBCDField;
    qryConsultaLogItemPVENDAPED: TBCDField;
    qryConsultaLogItemPTABELAPED: TBCDField;
    qryConsultaLogItemVLCUSTOREPPED: TBCDField;
    qryConsultaLogItemVLCUSTOREALPED: TBCDField;
    qryConsultaLogItemVLCUSTOFINPED: TBCDField;
    qryConsultaLogItemQTESTGER: TBCDField;
    qryConsultaLogItemQTRESERV: TBCDField;
    qryConsultaLogItemQTBLOQUEADA: TBCDField;
    qryConsultaLogItemQTPENDENTE: TBCDField;
    qryConsultaLogItemQTINDENIZ: TBCDField;
    qryConsultaLogItemQTDISPONIVEL: TBCDField;
    qryTotaisPedidoVLTABELA: TFMTBCDField;
    qryConsultaLogCabecalhoVLTABELAANTES: TBCDField;
    qryConsultaLogCabecalhoVLTABELADEPOIS: TBCDField;
    qryItensPedidoCODFILIAL: TStringField;
    qryInserePCNFCANITEM: TFDQuery;
    StorProcDesmembraPedido: TFDStoredProc;
    qryPesquisaPedidosCODPLPAG: TBCDField;
    qryAtualizarPCPLPAG: TFDQuery;
    qryInserePCFALTA: TFDQuery;
    qryAtualizaDatasIntegracao: TFDQuery;
    qryAtualizaPCFALTA: TFDQuery;
    qryConfigQtPendente: TFDQuery;
    qryConfigQtPendenteVALOR: TStringField;
    qryInsereConfigQtPendente: TFDQuery;
    qryAtualizaConfigQtPendente: TFDQuery;
    qryDeduzirQtPendente: TFDQuery;
    qryConfigQtPendenteTratamento: TFDQuery;
    qryAtualizaConfigQtPendenteTratamento: TFDQuery;
    qryInsereConfigQtPendenteTratamento: TFDQuery;
    qryConfigQtPendenteTratamentoVALOR: TStringField;
    qryStoreProc: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmdBD: TDmdBD;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
