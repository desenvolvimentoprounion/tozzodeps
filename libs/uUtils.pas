unit uUtils;

interface
uses Classes, DB, DBClient, SysUtils, Forms, Dialogs, cxButtonEdit, cxTextEdit, cxDateUtils, cxCalendar,
FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;


procedure DefinirConexao(DataModule : TDataModule);
function ObterProximaTransacaoEntrada() : double;
function ObterProximaTransacaoVenda() : double;
function ObterProximaTransacaoItem() : double;
function getDate(dateEdit : TcxDateEdit; ValorPadrao : TDateTime = 0) : TDateTime;

implementation

uses uConexaoBD;

procedure DefinirConexao(DataModule : TDataModule);
var
  i : integer;
begin

  for I := 0 to DataModule.ComponentCount - 1 do
  begin

    if (DataModule.Components[I] is TFDQuery) then
      (DataModule.Components[I] as TFDQuery).Connection := FDacDatabase;
  end;
end;


function ObterProximaTransacaoEntrada() : double;
var
  qrySelect,
  qryUpdate : TFDQuery;
  num_trans_ent : double;
begin

  num_trans_ent := 0;

  FDacDatabase.StartTransaction;

  try
    begin

      qrySelect := TFDQuery.Create(nil);
      qrySelect.Connection := FDacDatabase;

      qryUpdate := TFDQuery.Create(nil);
      qryUpdate.Connection := FDacDatabase;

      qrySelect.SQL.Add('SELECT NVL(PROXNUMTRANSENT,1) PROXNUMTRANSENT FROM PCCONSUM FOR UPDATE');
      qrySelect.Open;

      num_trans_ent := qrySelect.FieldByName('PROXNUMTRANSENT').AsFloat;

      qryUpdate.SQL.Add('UPDATE PCCONSUM SET PROXNUMTRANSENT = NVL(PROXNUMTRANSENT,1) + 1');
      qryUpdate.ExecSQL;

      qrySelect.Close;
      qryUpdate.Close;

      FDacDatabase.Commit;
    end;
  except on E: Exception do
    begin

      FDacDatabase.Rollback;
    end;
  end;

  Result := num_trans_ent;

end;

function ObterProximaTransacaoVenda() : double;
var
  qrySelect,
  qryUpdate : TFDQuery;
  num_trans_venda : double;
begin

  num_trans_venda := 0;

  FDacDatabase.StartTransaction;

  try
    begin

      qrySelect := TFDQuery.Create(nil);
      qrySelect.Connection := FDacDatabase;

      qryUpdate := TFDQuery.Create(nil);
      qryUpdate.Connection := FDacDatabase;

      qrySelect.SQL.Add('SELECT NVL(PROXNUMTRANSVENDA,1) PROXNUMTRANSVENDA FROM PCCONSUM FOR UPDATE');
      qrySelect.Open;

      num_trans_venda := qrySelect.FieldByName('PROXNUMTRANSVENDA').AsFloat;

      qryUpdate.SQL.Add('UPDATE PCCONSUM SET PROXNUMTRANSVENDA = NVL(PROXNUMTRANSVENDA,1) + 1');
      qryUpdate.ExecSQL;

      qrySelect.Close;
      qryUpdate.Close;

      FDacDatabase.Commit;
    end;
  except on E: Exception do
    begin

      FDacDatabase.Rollback;
    end;
  end;

  Result := num_trans_venda;

end;

function ObterProximaTransacaoItem() : double;
var
  qrySelect: TFDQuery;
  num_trans_item : double;
begin

  num_trans_item := 0;


  try
    begin

      qrySelect := TFDQuery.Create(nil);
      qrySelect.Connection := FDacDatabase;

      qrySelect.SQL.Add('    SELECT DFSEQ_PCMOVCOMPLE.NEXTVAL as PROXNUMTRANSITEM FROM DUAL');
      qrySelect.Open;

      num_trans_item := qrySelect.FieldByName('PROXNUMTRANSITEM').AsFloat;

      qrySelect.Close;

    end;
  except on E: Exception do
    begin

      num_trans_item := 0;
    end;
  end;

  Result := num_trans_item;
end;

function getDate(dateEdit : TcxDateEdit; ValorPadrao : TDateTime = 0) : TDateTime;
begin

  Result := ValorPadrao;

  if dateEdit.Text <> '' then
    Result := dateEdit.Date;
end;

end.
