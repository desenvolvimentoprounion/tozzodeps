unit UFrmMsgPergunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, dxGDIPlusClasses, cxImage, StdCtrls, cxButtons,
  cxLabel, ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, dxSkinOffice2019Colorful, dxSkinTheBezier;

type
  TFrmMsgPergunta = class(TForm)
    Panel1: TPanel;
    lblTitulo: TcxLabel;
    Panel2: TPanel;
    btnSim: TcxButton;
    lblMensagem: TcxLabel;
    Panel3: TPanel;
    img: TcxImage;
    btnNao: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure _Sim(Sender: TObject);
    procedure _Nao(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Resposta    : Integer;
    BotaoPadrao : Integer;
    
  end;

var
  FrmMsgPergunta: TFrmMsgPergunta;

implementation

{$R *.dfm}

procedure TFrmMsgPergunta._Sim(Sender: TObject);
begin

  Resposta := IDYES;
  Close();
  
end;

procedure TFrmMsgPergunta.FormShow(Sender: TObject);
begin

  if (  BotaoPadrao = IDNO) then
  begin

    btnNao.SetFocus;
  end
  else
  begin

    btnSim.SetFocus;
  end;

end;

procedure TFrmMsgPergunta._Nao(Sender: TObject);
begin

  Resposta := IDNO;
  Close();

end;

end.
