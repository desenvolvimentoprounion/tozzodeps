unit uApp;

interface

uses uUsuario, StrUtils, FireDAC.Comp.Client, FireDAC.Stan.Option;

function PesquisaPedidos(DataInicial, DataFinal: TDateTime;
  NumeroPedido, CodigoCliente, CodigoRCA: double): integer;

function ProcessarPedidos(Usuario: TUsuario; Rotina: double;
  RegistrarTextoLog: boolean = false): boolean;

function PesquisaLog(DataInicial, DataFinal: TDateTime;
  NumeroPedido, CodigoCliente, CodigoRCA: double): integer;

procedure VerItensLog(Pedido: double);

procedure RegistrarLog(Texto: string);

procedure DesmembrarPedido(aNumeroPedido: double; aMatriculaUsuario: double);

var
  gUSUARIO: TUsuario;
  gCODIGO_ROTINA: double;

implementation

uses uDmdBD, DB, Classes, Forms, Windows, SysUtils, uConexaoBD, UMensagem,
  uFrmPrincipal, uFrmLogItens;

procedure RegistrarLog(Texto: string);
begin

  FrmPrincipal.memoLog.Lines.Add(DateTimeToStr(Now) + ': ' + Texto);
  Application.ProcessMessages;
end;

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
    SQL.Add(' 	, PCPEDC.CODPLPAG                                                                                        ');
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
    SQL.Add(' LEFT JOIN PCEST ON PCEST.CODFILIAL = nvl(PCPEDI.CODFILIALRETIRA, PCPEDC.CODFILIAL)                         ');
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
    SQL.Add(' 	, CODPLPAG                                                                                               ');
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
    SQL.Add(' 	, CODPLPAG                                                                                               ');
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

procedure InserePCNFCANITEM(NumeroPedido: double);
begin

  with DmdBD.qryInserePCNFCANITEM do
  begin

    Close;
    ParamByName('NUMPED').AsFloat := NumeroPedido;
    ExecSQL;
  end;
end;

procedure LiberarPedido(Filial: string; NumeroPedido: double);
var
  filial_item: string;
begin

  with DmdBD do
  begin

    qryItensPedido.Close;
    qryItensPedido.ParamByName('NUMPED').AsFloat := NumeroPedido;
    qryItensPedido.Open;

    qryItensPedido.First;

    while (not qryItensPedido.Eof) do
    begin

      filial_item := qryItensPedidoCODFILIAL.AsString;

      qryReservarEstoqueItem.Close;
      qryReservarEstoqueItem.ParamByName('QT').AsFloat := qryItensPedidoQT.AsFloat;
      qryReservarEstoqueItem.ParamByName('CODFILIAL').AsString := filial_item;
      qryReservarEstoqueItem.ParamByName('CODPROD').AsFloat := qryItensPedidoCODPROD.AsFloat;
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

procedure RegistraLogPedido(Pedido, Usuario: double);
begin

  with DmdBD do
  begin

    qryTotaisPedido.Close;
    qryTotaisPedido.ParamByName('NUMPED').AsFloat := Pedido;
    qryTotaisPedido.Open;

    with qryRegistraLogPedido do
    begin

      Close;
      ParamByName('NUMPED').AsFloat := Pedido;
      ParamByName('CODUSUARIO').AsFloat := Usuario;
      ParamByName('VLTOTALANTES').AsFloat := qryTotaisPedidoVLTOTAL.AsFloat;
      ParamByName('VLTABELAANTES').AsFloat := qryTotaisPedidoVLTABELA.AsFloat;
      ParamByName('VLATENDANTES').AsFloat := qryTotaisPedidoVLATEND.AsFloat;
      ParamByName('VLCUSTOREPANTES').AsFloat :=
        qryTotaisPedidoVLCUSTOREP.AsFloat;
      ParamByName('VLCUSTOCONTANTES').AsFloat :=
        qryTotaisPedidoVLCUSTOCONT.AsFloat;
      ParamByName('VLCUSTOREALANTES').AsFloat :=
        qryTotaisPedidoVLCUSTOREAL.AsFloat;
      ParamByName('VLCUSTOFINANTES').AsFloat :=
        qryTotaisPedidoVLCUSTOFIN.AsFloat;
      ParamByName('NUMITENSANTES').AsFloat := qryTotaisPedidoNUMITENS.AsFloat;
      ParamByName('TOTPESOANTES').AsFloat := qryTotaisPedidoTOTPESO.AsFloat;
      ExecSQL;
    end;
  end;

end;

procedure AtualizarLogPedido(Pedido: double; TeveCorte: boolean);
begin

  with DmdBD do
  begin

    qryTotaisPedido.Close;
    qryTotaisPedido.ParamByName('NUMPED').AsFloat := Pedido;
    qryTotaisPedido.Open;

    with qryAtualizaLogPedido do
    begin

      Close;
      ParamByName('VLTOTALDEPOIS').AsFloat := qryTotaisPedidoVLTOTAL.AsFloat;
      ParamByName('VLTABELADEPOIS').AsFloat := qryTotaisPedidoVLTABELA.AsFloat;
      ParamByName('VLATENDDEPOIS').AsFloat := qryTotaisPedidoVLATEND.AsFloat;
      ParamByName('VLCUSTOREPDEPOIS').AsFloat :=
        qryTotaisPedidoVLCUSTOREP.AsFloat;
      ParamByName('VLCUSTOCONTDEPOIS').AsFloat :=
        qryTotaisPedidoVLCUSTOCONT.AsFloat;
      ParamByName('VLCUSTOREALDEPOIS').AsFloat :=
        qryTotaisPedidoVLCUSTOREAL.AsFloat;
      ParamByName('VLCUSTOFINDEPOIS').AsFloat :=
        qryTotaisPedidoVLCUSTOFIN.AsFloat;
      ParamByName('NUMITENSDEPOIS').AsFloat := qryTotaisPedidoNUMITENS.AsFloat;
      ParamByName('TOTPESODEPOIS').AsFloat := qryTotaisPedidoTOTPESO.AsFloat;
      ParamByName('CORTE').AsString := IfThen(TeveCorte, 'S', 'N');
      ParamByName('NUMPED').AsFloat := Pedido;
      ExecSQL;
    end;

    { Quando o pedido não tem corte, a pesquisa dos itens não é realizada.
      Dessa forma os logs dos itens não são registrados.

      Mas para facilitar futuros relátórios, aqui pesquisamos
      e registramos os logs dos itens.
    }
    if not TeveCorte then
    begin

      qryItensPedido.Close;
      qryItensPedido.ParamByName('NUMPED').AsFloat := Pedido;
      qryItensPedido.Open;

      qryItensPedido.IndexFieldNames := 'QT';
      qryItensPedido.First;

      while (not qryItensPedido.Eof) do
      begin

        with qryRegistraLogItem do
        begin

          Close;
          ParamByName('NUMPED').AsFloat := Pedido;
          ParamByName('CODPROD').AsFloat := qryItensPedidoCODPROD.AsFloat;
          ParamByName('QTPEDANTES').AsFloat := qryItensPedidoQT.AsFloat;
          ParamByName('QTPEDDEPOIS').AsFloat := qryItensPedidoQT.AsFloat;
          ParamByName('PVENDAPED').AsFloat := qryItensPedidoPVENDA.AsFloat;
          ParamByName('PTABELAPED').AsFloat := qryItensPedidoPTABELA.AsFloat;
          ParamByName('VLCUSTOREPPED').AsFloat :=
            qryItensPedidoVLCUSTOREP.AsFloat;
          ParamByName('VLCUSTOCONTPED').AsFloat :=
            qryItensPedidoVLCUSTOCONT.AsFloat;
          ParamByName('VLCUSTOREALPED').AsFloat :=
            qryItensPedidoVLCUSTOREAL.AsFloat;
          ParamByName('QTESTGER').AsFloat := qryItensPedidoQTESTGER.AsFloat;
          ParamByName('QTRESERV').AsFloat := qryItensPedidoQTRESERV.AsFloat;
          ParamByName('QTBLOQUEADA').AsFloat :=
            qryItensPedidoQTBLOQUEADA.AsFloat;
          ParamByName('QTPENDENTE').AsFloat := qryItensPedidoQTPENDENTE.AsFloat;
          ParamByName('QTINDENIZ').AsFloat := qryItensPedidoQTINDENIZ.AsFloat;
          ParamByName('QTDISPONIVEL').AsFloat := qryItensPedidoESTDISP.AsFloat;
          ExecSQL;
        end;

        qryItensPedido.Next;
      end;

    end;

  end;

end;

function ProcessarPedidos(Usuario: TUsuario; Rotina: double;
  RegistrarTextoLog: boolean = false): boolean;
var
  numero_pedido: double;
  codigo_produto: double;
  quantidade_original: double;
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
  filial_item: string;
begin

  if (DmdBD.qryPesquisaPedidos.State <> dsBrowse) or
    (DmdBD.qryPesquisaPedidos.RecordCount = 0) then
  begin

    Result := false;
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

          RegistraLogPedido(numero_pedido, Usuario.Matricula);

          if not(PedidoPrecisaDeCorte(numero_pedido)) then
          begin

            RegistrarLog('Pedido: ' + FloatToStr(numero_pedido) +
              '. Não necessita de corte. Liberando pedido.');
            LiberarPedido(codigo_filial, numero_pedido);

            AtualizarLogPedido(numero_pedido, false);

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
            quantidade_original := qryItensPedidoQT.AsFloat;
            valor_unitario := qryItensPedidoPVENDA.AsFloat;
            quantidade_disponivel := qryItensPedidoESTDISP.AsFloat;
            valor_total := quantidade_original * valor_unitario;
            quantidade_final := quantidade_original;
            Sequencia := qryItensPedidoNUMSEQ.AsFloat;
            filial_item := qryItensPedidoCODFILIAL.AsString;

            if (quantidade_disponivel < quantidade_original) and
              (quantidade_disponivel > 0) then
            begin

              quantidade_final := quantidade_disponivel;
            end;

            if (quantidade_disponivel <= 0) then
            begin

              quantidade_final := 0;
            end;

            quantidade_corte := quantidade_original - quantidade_final;

            if quantidade_corte > 0 then
            begin

              RegistrarLog('Pedido: ' + FloatToStr(numero_pedido) +
                '. Cortando produto ' + FloatToStr(codigo_produto));

              CorteProduto(filial_item, codigo_produto, quantidade_original,
                quantidade_final, quantidade_corte, 0, numero_carregamento,
                Usuario.Matricula, numero_pedido, valor_unitario,
                codigo_cliente, codigo_rca, Rotina, codigo_emitente, Sequencia);

            end;

            valor_corte_item := quantidade_corte * valor_unitario;
            valor_corte_pedido := valor_corte_pedido + valor_corte_item;

            with qryRegistraLogItem do
            begin

              Close;
              ParamByName('NUMPED').AsFloat := numero_pedido;
              ParamByName('CODPROD').AsFloat := codigo_produto;
              ParamByName('QTPEDANTES').AsFloat := quantidade_original;
              ParamByName('QTPEDDEPOIS').AsFloat := quantidade_final;
              ParamByName('PVENDAPED').AsFloat := qryItensPedidoPVENDA.AsFloat;
              ParamByName('PTABELAPED').AsFloat :=
                qryItensPedidoPTABELA.AsFloat;
              ParamByName('VLCUSTOREPPED').AsFloat :=
                qryItensPedidoVLCUSTOREP.AsFloat;
              ParamByName('VLCUSTOCONTPED').AsFloat :=
                qryItensPedidoVLCUSTOCONT.AsFloat;
              ParamByName('VLCUSTOREALPED').AsFloat :=
                qryItensPedidoVLCUSTOREAL.AsFloat;
              ParamByName('QTESTGER').AsFloat := qryItensPedidoQTESTGER.AsFloat;
              ParamByName('QTRESERV').AsFloat := qryItensPedidoQTRESERV.AsFloat;
              ParamByName('QTBLOQUEADA').AsFloat :=
                qryItensPedidoQTBLOQUEADA.AsFloat;
              ParamByName('QTPENDENTE').AsFloat :=
                qryItensPedidoQTPENDENTE.AsFloat;
              ParamByName('QTINDENIZ').AsFloat :=
                qryItensPedidoQTINDENIZ.AsFloat;
              ParamByName('QTDISPONIVEL').AsFloat :=
                qryItensPedidoESTDISP.AsFloat;
              ExecSQL;
            end;

            qryItensPedido.Next;
          end;

          if valor_corte_pedido > 0 then
          begin

            RegistrarLog('Pedido: ' + FloatToStr(numero_pedido) +
              '. Atualizando cabeçalho.');

            AtualizarPedido(numero_pedido, valor_corte_pedido,
              Usuario.Matricula);
          end;

          RegistrarLog('Pedido: ' + FloatToStr(numero_pedido) +
            '. Liberando pedido.');
          LiberarPedido(codigo_filial, numero_pedido);
          InserePCNFCANITEM(numero_pedido);


          if (qryPesquisaPedidosCODPLPAG.AsString = '99') then
          begin


            DesmembrarPedido(numero_pedido, Usuario.Matricula);
          end;

          AtualizarLogPedido(numero_pedido, True);

          FrmPrincipal.prgBar.Position := FrmPrincipal.prgBar.Position + 1;
          Application.ProcessMessages;

          qryPesquisaPedidos.Next;
        end;
      end;

      FDacDatabase.Commit;
      Result := True;

    end;
  except
    on E: Exception do
    begin

      FDacDatabase.Rollback;

      if not RegistrarTextoLog then
      begin

        TMsg.Erro('Erro ao liberar pedidos' + #13 + #13 + E.Message);
      end
      else
      begin

        RegistrarLog('ERRO: ' + E.Message);
      end;
    end;
  end;
end;

function PesquisaLog(DataInicial, DataFinal: TDateTime;
  NumeroPedido, CodigoCliente, CodigoRCA: double): integer;
begin

  with DmdBD.qryConsultaLogCabecalho do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' SELECT                                                              ');
    SQL.Add('      LOG.NUMPED                                                     ');
    SQL.Add('      , LOG.DATA                                                     ');
    SQL.Add('      , LOG.CODUSUARIO                                               ');
    SQL.Add('      , USUARIO.NOME AS USUARIO                                      ');
    SQL.Add('      , PCPEDC.CODCLI                                                ');
    SQL.Add('      , PCCLIENT.CLIENTE                                             ');
    SQL.Add('      , LOG.CORTE                                                    ');
    SQL.Add('      , LOG.VLTOTALANTES                                             ');
    SQL.Add('      , LOG.VLTOTALDEPOIS                                            ');
    SQL.Add('      , LOG.VLTABELAANTES                                             ');
    SQL.Add('      , LOG.VLTABELADEPOIS                                            ');
    SQL.Add('      , LOG.VLATENDANTES                                             ');
    SQL.Add('      , LOG.VLATENDDEPOIS                                            ');
    SQL.Add('      , LOG.VLCUSTOREPANTES                                          ');
    SQL.Add('      , LOG.VLCUSTOREPDEPOIS                                         ');
    SQL.Add('      , LOG.VLCUSTOCONTANTES                                         ');
    SQL.Add('      , LOG.VLCUSTOCONTDEPOIS                                        ');
    SQL.Add('      , LOG.VLCUSTOREALANTES                                         ');
    SQL.Add('      , LOG.VLCUSTOREALDEPOIS                                        ');
    SQL.Add('      , LOG.VLCUSTOFINANTES                                          ');
    SQL.Add('      , LOG.VLCUSTOFINDEPOIS                                         ');
    SQL.Add('      , LOG.NUMITENSANTES                                            ');
    SQL.Add('      , LOG.NUMITENSDEPOIS                                           ');
    SQL.Add('      , LOG.TOTPESOANTES                                             ');
    SQL.Add('      , LOG.TOTPESODEPOIS                                            ');
    SQL.Add(' FROM NTINTEGRACAODEPSLOGC LOG                                       ');
    SQL.Add(' JOIN PCPEDC ON PCPEDC.NUMPED = LOG.NUMPED                           ');
    SQL.Add(' LEFT JOIN PCCLIENT ON PCCLIENT.CODCLI = PCPEDC.CODCLI               ');
    SQL.Add(' LEFT JOIN PCEMPR USUARIO ON USUARIO.MATRICULA = LOG.CODUSUARIO      ');

    SQL.Add('WHERE 1 = 1');

    if DataInicial > 0 then
    begin

      SQL.Add('AND TRUNC(LOG.DATA) >= :DTINICIAL ');
      ParamByName('DTINICIAL').AsDate := DataInicial;
    end;

    if DataFinal > 0 then
    begin

      SQL.Add('AND TRUNC(LOG.DATA) <= :DTFINAL');
      ParamByName('DTFINAL').AsDate := DataFinal;
    end;

    if NumeroPedido > 0 then
    begin

      SQL.Add('AND LOG.NUMPED = :NUMPED ');
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

    SQL.Add(' ORDER BY LOG.DATA  ');

    Open;

    Result := RecordCount;
  end;

end;

procedure VerItensLog(Pedido: double);
begin

  DmdBD.qryConsultaLogItem.Close;
  DmdBD.qryConsultaLogItem.ParamByName('NUMPED').AsFloat := Pedido;
  DmdBD.qryConsultaLogItem.Open;

  if not Assigned(FrmLogItens) then
  begin

    Application.CreateForm(TFrmLogItens, FrmLogItens);
  end;

  FrmLogItens.ShowModal;
end;

procedure DesmembrarPedido(aNumeroPedido: double; aMatriculaUsuario: double);
begin

  with DmdBD.StorProcDesmembraPedido do
  begin

    Close;
    FetchOptions.Items := FetchOptions.Items - [fiMeta];

    with Params do
    begin
      Clear;
      with Add do
      begin

        Name := 'pi_nCodRotina';
        ParamType := ptInput;
        DataType := ftFloat;
      end;

      with Add do
      begin

        Name := 'pi_nNumPed';
        ParamType := ptInput;
        DataType := ftFloat;
      end;

      with Add do
      begin

        Name := 'pi_nMatricula';
        ParamType := ptInput;
        DataType := ftFloat;
      end;

      with Add do
      begin

        Name := 'pi_vPosicaoPedido';
        ParamType := ptInput;
        DataType := ftString;
        Size := 1;
      end;

      with Add do
      begin

        Name := 'pi_nProxNumCar';
        ParamType := ptInput;
        DataType := ftFloat;
      end;

      with Add do
      begin

        Name := 'po_vOcorreramErros';
        ParamType := ptOutput;
        DataType := ftString;
        Size := 100;
      end;

      with Add do
      begin

        Name := 'po_vMsgErros';
        ParamType := ptOutput;
        DataType := ftString;
        Size := 100;
      end;
    end;

    Prepare;
    Params[0].Value := 2336;
    Params[1].Value := aNumeroPedido;
    Params[2].Value := aMatriculaUsuario;
    Params[3].Value := 'L';
    Params[4].Value := '';
    Params[5].Value := '';
    Params[5].Value := '';
    ExecProc;
  end;

end;

end.
