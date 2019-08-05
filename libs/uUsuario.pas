unit uUsuario;

interface
uses Classes,DB, DBClient, SysUtils, Forms, Dialogs, cxButtonEdit, cxTextEdit,
FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type TUsuario = class
  private
    FMatricula : double;
    FNome : string;
    FLogin : string;
    FFiliais : TStringList;
    FFilial : string;

    class function SQLPesquisaComum() : string;
    class procedure CarregarFiliais(Usuario : TUsuario);

  published
    property Matricula : double read FMatricula;
    property Nome : string read FNome;
    property Login : string read FLogin;
    property Filiais : TStringList read FFiliais;
    property Filial : string read FFilial;

    function TemAcesso(CodigoRotina : double; CodigoSubRotina: double = 0) : boolean;

    class function PorLogin(Login : string) : TUsuario;
    class function PorMatricula(Matricula : double) : TUsuario;

    constructor Create();

end;

implementation

{ TUsuario }

uses uConexaoBD;

class procedure TUsuario.CarregarFiliais(Usuario: TUsuario);
var
  qry : TFDQuery;
begin

  qry := TFDQuery.Create(nil);
  qry.Connection := FDacDatabase;

  qry.SQL.Add(' select codigoa            ');
  qry.SQL.Add(' from pclib                ');
  qry.SQL.Add(' where codtabela = 1       ');
  qry.SQL.Add(' and codfunc = :MATRICULA  ');
  qry.SQL.Add(' order by codigoa          ');

  qry.ParamByName('MATRICULA').AsFloat := Usuario.Matricula;
  qry.Open;

  qry.First;

  while (not qry.Eof) do
  begin

    Usuario.Filiais.Add(qry.FieldByName('CODIGOA').AsString);
    qry.Next;
  end;


end;

constructor TUsuario.Create;
begin

  Self.FMatricula := 0;
  Self.FNome := '';
  Self.FLogin := '';
  Self.FFiliais := TStringList.Create;
  Self.FFilial := '';
end;

class function TUsuario.PorLogin(Login: string): TUsuario;
var
  qry : TFDQuery;
  usuario : TUsuario;
begin

  usuario := TUsuario.Create;

  qry := TFDQuery.Create(nil);
  qry.Connection := FDacDatabase;
  qry.SQL.Add(TUsuario.SQLPesquisaComum());
  qry.SQL.Add('AND NOME_GUERRA = :LOGIN ');

  qry.ParamByName('LOGIN').AsString := Login;
  qry.Open;

  if qry.RecordCount > 0 then
  begin

    usuario.FMatricula := qry.FieldByName('MATRICULA').AsFloat;
    usuario.FNome := qry.FieldByName('NOME').AsString;
    usuario.FLogin := qry.FieldByName('NOME_GUERRA').AsString;
    usuario.FFilial := qry.FieldByName('CODFILIAL').AsString;

    TUsuario.CarregarFiliais(usuario);
  end;

  Result := usuario;

end;

class function TUsuario.PorMatricula(Matricula: double): TUsuario;
var
  qry : TFDQuery;
  usuario : TUsuario;
begin

  usuario := TUsuario.Create;

  qry := TFDQuery.Create(nil);
  qry.Connection := FDacDatabase;
  qry.SQL.Add(TUsuario.SQLPesquisaComum());
  qry.SQL.Add('AND MATRICULA = :MATRICULA ');

  qry.ParamByName('MATRICULA').AsFloat := Matricula;
  qry.Open;

  if qry.RecordCount > 0 then
  begin

    usuario.FMatricula := qry.FieldByName('MATRICULA').AsFloat;
    usuario.FNome := qry.FieldByName('NOME').AsString;
    usuario.FLogin := qry.FieldByName('NOME_GUERRA').AsString;
    usuario.FFilial := qry.FieldByName('CODFILIAL').AsString;

    TUsuario.CarregarFiliais(usuario);
  end;

  Result := usuario;

end;

class function TUsuario.SQLPesquisaComum: string;
var
  sql : TStringList;

begin

  sql := TStringList.Create;

  sql.Add(' SELECT            ');
  sql.Add('     MATRICULA     ');
  sql.Add('     , NOME        ');
  sql.Add('     , NOME_GUERRA ');
  sql.Add('     , CODFILIAL   ');
  sql.Add(' FROM PCEMPR       ');
  sql.Add(' WHERE 1 = 1       ');

  Result := sql.Text;
end;

function TUsuario.TemAcesso(CodigoRotina : double; CodigoSubRotina: double = 0): boolean;
var
  qry : TFDQuery;
begin

  qry := TFDQuery.Create(nil);
  qry.Connection := FDacDatabase;

  qry.SQL.Add(' select 1                         ');
  qry.SQL.Add(' from pccontro                    ');
  qry.SQL.Add(' where codusuario = :MATRICULA    ');
  qry.SQL.Add(' and codrotina = :CODROTINA       ');
  qry.SQL.Add(' and acesso = ''S''               ');

  qry.ParamByName('MATRICULA').AsFloat := Self.Matricula;
  qry.ParamByName('CODROTINA').AsFloat := CodigoRotina;

  qry.Open;

  if qry.RecordCount = 0 then
  begin

    Result := False;
    Exit;
  end;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(' select 1                        ');
  qry.SQL.Add(' from pccontroi                  ');
  qry.SQL.Add(' where codusuario = :MATRICULA   ');
  qry.SQL.Add(' and codrotina = :CODROTINA      ');
  qry.SQL.Add(' and codcontrole = :CODCONTROLE  ');
  qry.SQL.Add(' and acesso = ''S''              ');

  qry.ParamByName('MATRICULA').AsFloat := Self.Matricula;
  qry.ParamByName('CODROTINA').AsFloat := CodigoRotina;
  qry.ParamByName('CODCONTROLE').AsFloat := CodigoSubRotina;

  qry.Open;

  Result := qry.RecordCount > 0;

end;

end.
