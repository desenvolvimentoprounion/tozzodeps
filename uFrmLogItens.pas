unit uFrmLogItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit,
  cxGridBandedTableView, cxGridDBBandedTableView;

type
  TFrmLogItens = class(TForm)
    grdLogDBTableView1: TcxGridDBTableView;
    grdLogLevel1: TcxGridLevel;
    grdLog: TcxGrid;
    grdLogDBBandedTableView1: TcxGridDBBandedTableView;
    grdLogDBBandedTableView1NUMPED: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1CODPROD: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1PRODUT: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1QTPEDANTES: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1QTPEDDEPOIS: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1PVENDAPED: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1PTABELAPED: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1VLCUSTOREPPED: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1VLCUSTOREALPED: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1VLCUSTOFINPED: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1QTESTGER: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1QTRESERV: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1QTBLOQUEADA: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1QTPENDENTE: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1QTINDENIZ: TcxGridDBBandedColumn;
    grdLogDBBandedTableView1QTDISPONIVEL: TcxGridDBBandedColumn;
    styRepo: TcxStyleRepository;
    styCorte: TcxStyle;
    procedure grdLogDBBandedTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogItens: TFrmLogItens;

implementation

{$R *.dfm}

uses uDmdBD;

procedure TFrmLogItens.grdLogDBBandedTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  idx_qtd_original, idx_qtd_final : Integer;
begin

  idx_qtd_original := grdLogDBBandedTableView1QTPEDANTES.Index;
  idx_qtd_final := grdLogDBBandedTableView1QTPEDDEPOIS.Index;


  if (VarToStr(ARecord.Values[idx_qtd_original]) <> VarToStr(ARecord.Values[idx_qtd_final])) then
  begin

    AStyle := styCorte;
  end;


end;

end.
