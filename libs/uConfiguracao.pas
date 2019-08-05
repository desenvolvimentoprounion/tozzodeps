unit uConfiguracao;

interface

uses DB, DBClient, SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uConexaoBD;

function ObterConfiguracao(Configuracao : double; Filial : string; Chave : string = '') : string;

implementation

function ObterConfiguracao(Configuracao : double; Filial : string; Chave : string = '') : string;
var
  qry : TFDQuery;
begin

  Result := '';

  qry := TFDQuery.Create(nil);
  qry.Connection := FDacDatabase;
  qry.Close;
  qry.SQL.Add(' SELECT                       ');
  qry.SQL.Add(' 	VALOR                      ');
  qry.SQL.Add(' FROM JCCONFIGI               ');
  qry.SQL.Add(' WHERE CODCONFIG = :CODCONFIG ');
  qry.SQL.Add(' AND CODFILIAL = :CODFILIAL   ');

  if Chave <> '' then
  begin

    qry.SQL.Add(' AND CHAVE = :CHAVE           ');
    qry.ParamByName('CHAVE').AsString := Chave;
  end;

  qry.ParamByName('CODCONFIG').AsFloat := Configuracao;
  qry.ParamByName('CODFILIAL').AsString := Filial;

  qry.Open();

  if qry.RecordCount > 0 then
  begin

    Result := qry.FieldByName('VALOR').AsString;
    qry.Close;
    Exit;
  end;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT                       ');
  qry.SQL.Add(' 	VALOR                      ');
  qry.SQL.Add(' FROM JCCONFIGC               ');
  qry.SQL.Add(' WHERE CODCONFIG = :CODCONFIG ');

  qry.ParamByName('CODCONFIG').AsFloat := Configuracao;

  qry.Open();

  if qry.RecordCount > 0 then
  begin

    Result := qry.FieldByName('VALOR').AsString;
  end;


  qry.Close;
end;

end.

