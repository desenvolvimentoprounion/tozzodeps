unit uConexaoBD;

interface
uses DB, DBClient, SysUtils, Forms, StrUtils, Classes, DateUtils
     , Windows, IniFiles, dialogs,
       FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
       FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
       FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
       FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef,
       FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Midaslib,
       dxmdaset;

function  ConectarBD() : Boolean;

var
  FDacDatabase : TFDConnection;

implementation

uses UMensagem;

function ConectarBD() : Boolean;
var
  nome_servidor : String;
  usuario_banco : String;
  senha_banco   : String;

begin
  {
    Responsável por conectar ao banco de dados do WinThor
    com base nas informações passadas ao executável através
    do menu.

    A variável global FDacDatabase é instanciada conectada ao banco,
    e deve ser associada com os componentes FDQuery.
  }

  nome_servidor := ParamStr(3);
  usuario_banco := ParamStr(4);
  senha_banco   := ParamStr(2);

  if not Assigned(FDacDatabase) then
  begin
    FDacDatabase := TFDConnection.Create(nil);
  end;

  try

    FDacDatabase.Connected      := false;
    FDacDatabase.DriverName     := 'Ora';
    FDacDatabase.LoginPrompt    := false;
    FDacDatabase.Name           := 'BDWinthor';
    FDacDatabase.Params.Clear;
    FDacDatabase.Params.Add('DriverID=Ora'); // Driver de conexao
    FDacDatabase.Params.Add('Database='   + nome_servidor  ); // tela de Login do Winthor = Loja
    FDacDatabase.Params.Add('User_Name='  + usuario_banco  ); // tela de Login do Winthor = Empresa
    FDacDatabase.Params.Add('Password='   + senha_banco    ); // associado a chave do Winthor.ini
    FDacDatabase.Connected := true;


{    DmdBD.FDConnection1.Connected      := false;
    DmdBD.FDConnection1.DriverName     := 'Ora';
    DmdBD.FDConnection1.LoginPrompt    := false;
    DmdBD.FDConnection1.Name           := 'BDWinthor';
    DmdBD.FDConnection1.Params.Clear;
    DmdBD.FDConnection1.Params.Add('DriverID=Ora'); // Driver de conexao
    DmdBD.FDConnection1.Params.Add('Database='   + nome_servidor  ); // tela de Login do Winthor = Loja
    DmdBD.FDConnection1.Params.Add('User_Name='  + usuario_banco  ); // tela de Login do Winthor = Empresa
    DmdBD.FDConnection1.Params.Add('Password='   + senha_banco    ); // associado a chave do Winthor.ini
    DmdBD.FDConnection1.Connected := true;
 }

    //DmdBD.FDConnection1 := FDacDatabase;

    Result := True;
  except
    on E: Exception do
    begin

      FDacDatabase.Close;
      Result := False;

      TMsg.Erro('Falha ao conectar ao banco de dados'+#13+E.Message);
    end;
  end;

end;

end.
