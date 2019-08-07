unit uApp;

interface

uses uUsuario;

function PesquisaPedidos(DataInicial, DataFinal: TDateTime;
  NumeroPedido, CodigoCliente, CodigoRCA: double): integer;
function ProcessarPedidos(Usuario: TUsuario; Rotina: double): integer;

var
  gUSUARIO: TUsuario;
  gCODIGO_ROTINA: double;

implementation

uses uDmdBD, DB, Classes, Forms, Windows, SysUtils, uConexaoBD, UMensagem,
  uFrmPrincipal;

function PesquisaPedidos(DataInicial, DataFinal: TDateTime;
  NumeroPedido, CodigoCliente, CodigoRCA: double): integer;
begin

  with DmdBD.qryPesquisaPedidos do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' WITH PEDIDOS AS (                                                                                          ');
    SQL.Add(' SELECT                                                                                                     ');
    SQL.Add(' 	PCPEDC.CODFILIAL                                                                                         ');
    SQL.Add(' 	, PCPEDC.DATA                                                                                            ');
    SQL.Add(' 	, NVL(PCPEDC.NUMCAR, 0) AS NUMCAR                                                                        ');
    SQL.Add(' 	, NVL(PCPEDC.CODEMITENTE, 0) AS CODEMITENTE                                                              ');
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
    SQL.Add
      (' 				AND PCEST.CODPROD = PCPEDI.CODPROD                                                                 ');

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
    SQL.Add(' 	, NUMCAR                                                                                                 ');
    SQL.Add(' 	, CODEMITENTE                                                                                            ');
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
    SQL.Add(' 	, NUMCAR                                                                                                 ');
    SQL.Add(' 	, CODEMITENTE                                                                                            ');
    SQL.Add(' ORDER BY                                                                                                   ');
    SQL.Add(' 	 DTLIBERADEPS                                                                                            ');
    SQL.Add(' 	, DATA                                                                                                   ');

    Open;
    First;

    Result := RecordCount;
  end;
end;

function PedidoPrecisaDeCorte(NumeroPedido: double): boolean;
begin

  with DmdBD.qryPedidoPrecisaCorte do
  begin

    Close;
    ParamByName('NUMPED').AsFloat := NumeroPedido;
    Open;

    Result := RecordCount > 0;
  end;
end;

procedure CorteParcial(NumeroPedido, CodigoProduto, QuantidadePedido,
  QuantidadeEstoque: double);
begin

end;

procedure CorteTotal(NumeroPedido, CodigoProduto, QuantidadePedido: double);
begin

end;

procedure LiberarPedido(Filial: string; NumeroPedido: double);
begin

  with DmdBD do
  begin

    qryItensPedido.Close;
    qryItensPedido.ParamByName('NUMPED').AsFloat := NumeroPedido;
    qryItensPedido.Open;

    qryItensPedido.First;

    while (not qryItensPedido.Eof) do
    begin

      qryReservarEstoqueItem.Close;
      qryReservarEstoqueItem.ParamByName('QT').AsFloat :=
        qryItensPedidoQT.AsFloat;
      qryReservarEstoqueItem.ParamByName('CODFILIAL').AsString := Filial;
      qryReservarEstoqueItem.ParamByName('CODPROD').AsFloat :=
        qryItensPedidoCODPROD.AsFloat;
      qryReservarEstoqueItem.ExecSQL;

      qryItensPedido.Next;
    end;

    qryLiberarPedido.Close;
    qryLiberarPedido.ParamByName('NUMPED').AsFloat := NumeroPedido;
    qryLiberarPedido.ExecSQL;

    qryLiberarItens.Close;
    qryLiberarItens.ParamByName('NUMPED').AsFloat := NumeroPedido;
    qryLiberarItens.ExecSQL;

    qryMarcarComoLiberado.Close;
    qryMarcarComoLiberado.ParamByName('NUMPED').AsFloat := NumeroPedido;
    qryMarcarComoLiberado.ExecSQL;
  end;
end;

procedure AtualizarPedido(Pedido, ValorCortado, Usuario: double);
begin

  with DmdBD do
  begin

    qryDeletarItensSemQuantidade.Close;
    qryDeletarItensSemQuantidade.ParamByName('NUMPED').AsFloat := Pedido;
    qryDeletarItensSemQuantidade.ExecSQL;

    qryAtualizarCabecalhoPedido.Close;
    qryAtualizarCabecalhoPedido.ParamByName('VLCORTE').AsFloat := ValorCortado;
    qryAtualizarCabecalhoPedido.ParamByName('NUMPED').AsFloat := Pedido;
    qryAtualizarCabecalhoPedido.ParamByName('CODUSUARIO').AsFloat := Usuario;
    qryAtualizarCabecalhoPedido.ExecSQL;

    qryCancelarPedidoSemItens.Close;
    qryCancelarPedidoSemItens.ParamByName('NUMPED').AsFloat := Pedido;
    qryCancelarPedidoSemItens.ParamByName('CODUSUARIO').AsFloat := Usuario;
    qryCancelarPedidoSemItens.ExecSQL;
  end;

end;

procedure CorteProduto(Filial: string; Produto, QuantidadeOriginal,
  QuantidadeSeparada, QuantidadeCortada, QuantidadeFalta, Carregamento, Usuario,
  Pedido, ValorUnitario, Cliente, RCA, Rotina, Emitente, Sequencia: double);
begin

  with DmdBD.qryInserePCCORTEI do
  begin

    Close;

    ParamByName('CODPROD').AsFloat := Produto;
    ParamByName('QTSEPARADA').AsFloat := QuantidadeSeparada;
    ParamByName('QTCORTADA').AsFloat := QuantidadeCortada;
    ParamByName('NUMCAR').AsFloat := Carregamento;
    ParamByName('CODFUNC').AsFloat := Usuario;
    ParamByName('NUMPED').AsFloat := Pedido;
    ParamByName('PVENDA').AsFloat := ValorUnitario;
    ParamByName('CODFILIAL').AsString := Filial;
    ParamByName('QTORIG').AsFloat := QuantidadeOriginal;
    ParamByName('QTFALTA').AsFloat := QuantidadeFalta;
    ParamByName('MOTIVO').AsString := 'FALTA DE MERCADORIA';
    ParamByName('CODCLI').AsFloat := Cliente;
    ParamByName('CODUSUR').AsFloat := RCA;
    ParamByName('CODROTINA').AsFloat := Rotina;
    ParamByName('CODEMITENTEPED').AsFloat := Emitente;
    ParamByName('NUMSEQ').AsFloat := Sequencia;
    ExecSQL;
  end;

  with DmdBD.qryCorteItemPedido do
  begin

    Close;
    ParamByName('QT_CORTE').AsFloat := QuantidadeCortada;
    ParamByName('NUMPED').AsFloat := Pedido;
    ParamByName('CODPROD').AsFloat := Produto;
    ExecSQL;
  end;

end;

function ProcessarPedidos(Usuario: TUsuario; Rotina: double): integer;
var
  numero_pedido: double;
  codigo_produto: double;
  Quantidade: double;
  valor_unitario: double;
  valor_total: double;
  quantidade_disponivel: double;
  quantidade_corte: double;
  quantidade_final: double;
  quantidade_falta: double;
  nova_quantidade: double;
  valor_corte_item: double;
  valor_corte_pedido: double;
  codigo_filial: string;
  numero_carregamento: double;
  codigo_cliente: double;
  codigo_rca: double;
  codigo_emitente: double;
  Sequencia: double;
begin

  if (DmdBD.qryPesquisaPedidos.State <> dsBrowse) or
    (DmdBD.qryPesquisaPedidos.RecordCount = 0) then
  begin

    Result := 0;
    Exit;
  end;

  FDacDatabase.StartTransaction;

  try
    begin

      with DmdBD do
      begin

        qryPesquisaPedidos.IndexFieldNames := 'SEM_ESTOQUE';
        qryPesquisaPedidos.First;

        FrmPrincipal.prgBar.Properties.Max := qryPesquisaPedidos.RecordCount;
        FrmPrincipal.prgBar.Position := 0;
        FrmPrincipal.prgBar.Visible := True;
        Application.ProcessMessages;

        while (not qryPesquisaPedidos.Eof) do
        begin

          valor_corte_pedido := 0;
          codigo_filial := qryPesquisaPedidosCODFILIAL.AsString;
          numero_pedido := qryPesquisaPedidosNUMPED.AsFloat;
          numero_carregamento := qryPesquisaPedidosNUMCAR.AsFloat;
          codigo_cliente := qryPesquisaPedidosCODCLI.AsFloat;
          codigo_rca := qryPesquisaPedidosCODUSUR.AsFloat;
          codigo_emitente := qryPesquisaPedidosCODEMITENTE.AsFloat;

          if not(PedidoPrecisaDeCorte(numero_pedido)) then
          begin

            LiberarPedido(codigo_filial, numero_pedido);
            qryPesquisaPedidos.Next;

            FrmPrincipal.prgBar.Position := FrmPrincipal.prgBar.Position + 1;
            Application.ProcessMessages;

            continue;
          end;

          qryItensPedido.Close;
          qryItensPedido.ParamByName('NUMPED').AsFloat := numero_pedido;
          qryItensPedido.Open;

          qryItensPedido.IndexFieldNames := 'QT';
          qryItensPedido.First;

          while (not qryItensPedido.Eof) do
          begin

            valor_corte_item := 0;
            codigo_produto := qryItensPedidoCODPROD.AsFloat;
            Quantidade := qryItensPedidoQT.AsFloat;
            valor_unitario := qryItensPedidoPVENDA.AsFloat;
            quantidade_disponivel := qryItensPedidoESTDISP.AsFloat;
            valor_total := Quantidade * valor_unitario;
            quantidade_final := Quantidade;
            Sequencia := qryItensPedidoNUMSEQ.AsFloat;

            if (quantidade_disponivel < Quantidade) and
              (quantidade_disponivel > 0) then
            begin

              quantidade_final := quantidade_disponivel;
            end;

            if (quantidade_disponivel <= 0) then
            begin

              quantidade_final := 0;
            end;

            quantidade_corte := Quantidade - quantidade_final;

            if quantidade_corte > 0 then
            begin

              CorteProduto(codigo_filial, codigo_produto, Quantidade,
                quantidade_final, quantidade_corte, 0, numero_carregamento,
                Usuario.Matricula, numero_pedido, valor_unitario,
                codigo_cliente, codigo_rca, Rotina, codigo_emitente, Sequencia);

            end;

            valor_corte_item := quantidade_corte * valor_unitario;
            valor_corte_pedido := valor_corte_pedido + valor_corte_item;

            qryItensPedido.Next;
          end;

          if valor_corte_pedido > 0 then
          begin

            AtualizarPedido(numero_pedido, valor_corte_pedido,
              Usuario.Matricula);
          end;

          LiberarPedido(codigo_filial, numero_pedido);

          FrmPrincipal.prgBar.Position := FrmPrincipal.prgBar.Position + 1;
          Application.ProcessMessages;

          qryPesquisaPedidos.Next;
        end;
      end;

      FDacDatabase.Commit;
      TMsg.Sucesso('Pedidos liberados com sucesso');

    end;
  except
    on E: Exception do
    begin

      FDacDatabase.Rollback;
      TMsg.Erro('Erro ao liberar pedidos' + #13 + #13 + E.Message);
    end;
  end;
end;

end.
