unit UMensagem;

interface
uses SysUtils, Dialogs, Forms, Windows, StrUtils, VarUtils;


type
  TMsg = class

    type
      TipoMsg = ( tmAlerta, tmErro, tmPergunta, tmInformacao, tmSucesso );

    private
      class var tipo   : TipoMsg;
      class var texto  : String;
      class var titulo : String;
      class var formulario   : TForm;

    published
      class function Alerta(Texto     : String; Titulo : String = 'Atenção') : Integer;
      class function Erro(Texto       : String; Titulo : String = 'Erro') : Integer;
      class function Pergunta(Texto   : String; Titulo : String = '?'; BotaoNAOPadrao : Boolean = False) : Integer;
      class function Informacao(Texto : String; Titulo : String = '!') : Integer;
      class function Sucesso(Texto    : String; Titulo : String = 'Sucesso') : Integer;

      class function Show() : Integer;

  end;

implementation

uses UFrmMsgAlerta, UFrmMsgErro, UFrmMsgSucesso, UFrmMsgInformacao,
  UFrmMsgPergunta;

{ Msg }

class function TMsg.Alerta(Texto, Titulo: String) : Integer;
var
 form : TFrmMsgAlerta;

begin

  if ( not Assigned(FrmMsgAlerta) ) then
  begin

    Application.CreateForm(TFrmMsgAlerta, FrmMsgAlerta);
  end;

  form := FrmMsgAlerta;
  form.lblTitulo.Caption    := Titulo;
  form.lblMensagem.Caption  := Texto;

  self.formulario := form;
  Self.tipo   := tmAlerta;
  Self.titulo := Titulo;
  Self.texto  := Texto;

  Self.Show();

  Result := form.Resposta;

end;

class function TMsg.Erro(Texto, Titulo: String) : Integer;
var
  form : TFrmMsgErro;
  
begin

  if ( not Assigned(FrmMsgErro) ) then
  begin

    Application.CreateForm(TFrmMsgErro, FrmMsgErro);
  end;

  form := FrmMsgErro;
  form.lblTitulo.Caption    := Titulo;
  form.lblMensagem.Caption  := Texto;

  self.formulario := form;

  Self.tipo   := tmErro;
  Self.titulo := Titulo;
  Self.texto  := Texto;

  Self.Show();

  Result := form.Resposta;  
end;

class function TMsg.Informacao(Texto, Titulo: String) : Integer;
var
  form : TFrmMsgInformacao;
  
begin

  if ( not Assigned(FrmMsgInformacao) ) then
  begin

    Application.CreateForm(TFrmMsgInformacao, FrmMsgInformacao);
  end;

  form := FrmMsgInformacao;
  form.lblTitulo.Caption    := Titulo;
  form.lblMensagem.Caption  := Texto;

  self.formulario := form;

  Self.tipo   := tmErro;
  Self.titulo := Titulo;
  Self.texto  := Texto;

  Self.Show();

  Result := form.Resposta;  
end;

class function TMsg.Pergunta(Texto   : String; Titulo : String = '?'; BotaoNAOPadrao : Boolean = False) : Integer;
var
  form : TFrmMsgPergunta;
  
begin

  if ( not Assigned(FrmMsgPergunta) ) then
  begin

    Application.CreateForm(TFrmMsgPergunta, FrmMsgPergunta);
  end;

  form := FrmMsgPergunta;
  form.lblTitulo.Caption    := Titulo;
  form.lblMensagem.Caption  := Texto;

  self.formulario := form;

  Self.tipo   := tmErro;
  Self.titulo := Titulo;
  Self.texto  := Texto;


  form.BotaoPadrao := IDYES;

  if ( BotaoNAOPadrao ) then
  begin

    form.BotaoPadrao := IDNO;
  end;

  Self.Show();

  Result := form.Resposta;  
end;

class function TMsg.Show: Integer;
begin

  if (Assigned(self.formulario)) then
  begin

    self.formulario.ShowModal();
  end
  else
  begin
                
    ShowMessage(Self.texto);
  end;          

  Result := 1;    

end;

class function TMsg.Sucesso(Texto, Titulo: String) : Integer;
var
  form : TFrmMsgSucesso;
  
begin

           
  if ( not Assigned(FrmMsgSucesso) ) then
  begin

    Application.CreateForm(TFrmMsgSucesso, FrmMsgSucesso);
  end;

  form := FrmMsgSucesso;
  form.lblTitulo.Caption    := Titulo;
  form.lblMensagem.Caption  := Texto;

  self.formulario := form;

  Self.tipo   := tmErro;
  Self.titulo := Titulo;
  Self.texto  := Texto;

  Self.Show();

  Result := form.Resposta;

end;

end.
