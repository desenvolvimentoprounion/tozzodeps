unit uDmdBD;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

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
