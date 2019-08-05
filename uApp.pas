unit uApp;

interface

function PesquisaPedidos(DataInicial, DataFinal : TDateTime; NumeroPedido, CodigoCliente, CodigoRCA : double) : integer;

implementation

uses uDmdBD;

function PesquisaPedidos(DataInicial, DataFinal : TDateTime; NumeroPedido, CodigoCliente, CodigoRCA : double) : integer;
begin

  with DmdBD.qryPesquisaPedidos do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' WITH PEDIDOS AS (                                                                                          ');
    SQL.Add(' SELECT                                                                                                     ');
    SQL.Add(' 	PCPEDC.CODFILIAL                                                                                         ');
    SQL.Add(' 	, PCPEDC.DATA                                                                                            ');
	  SQL.Add(' 	, LIBERA.DTLIBERADEPS                                                                                    ');
    SQL.Add(' 	, PCPEDC.NUMPED                                                                                          ');
    SQL.Add(' 	, PCPEDC.VLTOTAL                                                                                         ');
    SQL.Add(' 	, PCPEDC.CODCLI                                                                                          ');
    SQL.Add(' 	, PCCLIENT.CLIENTE                                                                                       ');
    SQL.Add(' 	, PCPEDC.CODUSUR                                                                                         ');
    SQL.Add(' 	, PCUSUARI.NOME                                                                                          ');
    SQL.Add(' 	, PCPEDI.CODPROD                                                                                         ');
    SQL.Add(' 	, PCPEDI.QT                                                                                              ');
    SQL.Add(' 	, (PCEST.QTESTGER - NVL(PCEST.QTRESERV,0) - NVL(PCEST.QTBLOQUEADA,0) - NVL(PCEST.QTPENDENTE,0)) ESTDISP  ');
    SQL.Add(' FROM NTINTEGRACAODEPSLIBERAPEDIDO LIBERA                                                                   ');
    SQL.Add(' JOIN PCPEDC ON PCPEDC.NUMPED = LIBERA.NUMPED                                                               ');
    SQL.Add('             AND PCPEDC.POSICAO = ''B''                                                                     ');
    SQL.Add(' LEFT JOIN PCCLIENT ON PCCLIENT.CODCLI = PCPEDC.CODCLI                                                      ');
    SQL.Add(' LEFT JOIN PCUSUARI ON PCUSUARI.CODUSUR = PCPEDC.CODUSUR                                                    ');
    SQL.Add(' LEFT JOIN PCPEDI ON PCPEDI.NUMPED = PCPEDC.NUMPED                                                          ');
    SQL.Add(' LEFT JOIN PCEST ON PCEST.CODFILIAL = PCPEDC.CODFILIAL                                                      ');
    SQL.Add(' 				AND PCEST.CODPROD = PCPEDI.CODPROD                                                                 ');

    SQL.Add('WHERE TRUNC(LIBERA.DTLIBERADEPS) BETWEEN :DTINICIAL AND :DTFINAL   ');

    ParamByName('DTINICIAL').AsDate := DataInicial;
    ParamByName('DTFINAL').AsDate := DataFinal;

    SQL.Add('AND LIBERA.DTLIBERAWINTHOR IS NULL');


    if NumeroPedido > 0 then
    begin

      SQL.Add('AND LIBERA.NUMPED = :NUMPED ');
      ParamByName('NUMPED').AsFloat := NumeroPedido;
    end;

    if CodigoCliente > 0 then
    begin

      SQL.Add('AND PCPEDC.CODCLI = :CODCLI');
      ParamByName('CODCLI').AsFloat := CodigoCliente;
    end;

    if CodigoRCA > 0 then
    begin

      SQL.Add('AND PCPEDC.CODUSUR = :CODUSUR');
      ParamByName('CODUSUR').AsFloat := CodigoRCA;
    end;


    SQL.Add(' )                                                                                                          ');
    SQL.Add('                                                                                                            ');
    SQL.Add(' SELECT                                                                                                     ');
    SQL.Add(' 	CODFILIAL                                                                                                ');
    SQL.Add(' 	, NUMPED                                                                                                 ');
    SQL.Add(' 	, VLTOTAL                                                                                                ');
    SQL.Add(' 	, CODCLI                                                                                                 ');
    SQL.Add(' 	, CLIENTE                                                                                                ');
    SQL.Add(' 	, CODUSUR                                                                                                ');
    SQL.Add(' 	, NOME                                                                                                   ');
    SQL.Add(' 	, SUM(CASE WHEN QT > ESTDISP THEN 1 ELSE 0 END) AS SEM_ESTOQUE                                           ');
    SQL.Add(' 	, DATA                                                                                                   ');
	  SQL.Add(' 	, DTLIBERADEPS                                                                                           ');
    SQL.Add(' FROM PEDIDOS                                                                                               ');
    SQL.Add(' GROUP BY                                                                                                   ');
    SQL.Add(' 	CODFILIAL                                                                                                ');
    SQL.Add(' 	, NUMPED                                                                                                 ');
    SQL.Add(' 	, VLTOTAL                                                                                                ');
    SQL.Add(' 	, CODCLI                                                                                                 ');
    SQL.Add(' 	, CLIENTE                                                                                                ');
    SQL.Add(' 	, CODUSUR                                                                                                ');
    SQL.Add(' 	, NOME                                                                                                   ');
    SQL.Add(' 	, DATA                                                                                                   ');
	  SQL.Add(' 	, DTLIBERADEPS                                                                                           ');
    SQL.Add(' ORDER BY                                                                                                   ');
	  SQL.Add(' 	 DTLIBERADEPS                                                                                            ');
    SQL.Add(' 	, DATA                                                                                                   ');


    Open;
    First;

    Result := RecordCount;
  end;


end;

end.
