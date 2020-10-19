object DmdBD: TDmdBD
  OldCreateOrder = False
  Height = 1343
  Width = 763
  object qryPesquisaPedidos: TFDQuery
    Connection = conn
    SQL.Strings = (
      'WITH PEDIDOS AS ('
      'SELECT'
      #9'PCPEDC.CODFILIAL'
      #9', PCPEDC.NUMPED'
      #9', PCPEDC.DATA'
      #9', LIBERA.DTLIBERADEPS'
      #9', PCPEDC.VLTOTAL'
      #9', PCPEDC.CODCLI'
      #9', PCCLIENT.CLIENTE'
      #9', PCPEDC.CODUSUR'
      #9', PCUSUARI.NOME'
      #9', PCPEDI.CODPROD'
      #9', PCPEDI.QT'
      
        #9', (PCEST.QTESTGER - NVL(PCEST.QTRESERV,0) - NVL(PCEST.QTBLOQUEA' +
        'DA,0) - NVL(PCEST.QTPENDENTE,0)) ESTDISP'
      '    , NVL(PCPEDC.NUMCAR, 0) AS NUMCAR'
      '    , NVL(PCPEDC.CODEMITENTE, 0) AS CODEMITENTE'
      '    , PCPEDC.CODPLPAG'
      'FROM NTINTEGRACAODEPSLIBERAPEDIDO LIBERA'
      'JOIN PCPEDC ON PCPEDC.NUMPED = LIBERA.NUMPED'
      'LEFT JOIN PCCLIENT ON PCCLIENT.CODCLI = PCPEDC.CODCLI'
      'LEFT JOIN PCUSUARI ON PCUSUARI.CODUSUR = PCPEDC.CODUSUR'
      'LEFT JOIN PCPEDI ON PCPEDI.NUMPED = PCPEDC.NUMPED'
      
        'LEFT JOIN PCEST ON PCEST.CODFILIAL = nvl(PCPEDI.CODFILIALRETIRA,' +
        ' PCPEDC.CODFILIAL)'
      #9#9#9#9'AND PCEST.CODPROD = PCPEDI.CODPROD'
      ')'
      ''
      'SELECT'
      #9'CODFILIAL'
      #9', NUMPED'
      #9', VLTOTAL'
      #9', CODCLI'
      #9', CLIENTE'
      #9', CODUSUR'
      #9', NOME'
      #9', SUM(CASE WHEN QT > ESTDISP THEN 1 ELSE 0 END) AS SEM_ESTOQUE'
      #9', DATA'
      #9', DTLIBERADEPS'
      '        , NUMCAR'
      '        , CODEMITENTE'
      '        , CODPLPAG'
      'FROM PEDIDOS'
      'GROUP BY '
      #9'CODFILIAL'
      #9', NUMPED'
      #9', VLTOTAL'
      #9', CODCLI'
      #9', CLIENTE'
      #9', CODUSUR'
      #9', NOME'
      #9', DATA'
      #9', DTLIBERADEPS'
      '        , NUMCAR'
      '        , CODEMITENTE'
      '        , CODPLPAG'
      'ORDER BY '#9'CODFILIAL'
      #9', NUMPED'
      #9', VLTOTAL'
      #9', CODCLI'
      #9', CLIENTE'
      #9', CODUSUR'
      #9', NOME'#9)
    Left = 80
    Top = 96
    object qryPesquisaPedidosCODFILIAL: TStringField
      DisplayLabel = 'C'#211'D. FILIAL'
      FieldName = 'CODFILIAL'
      Origin = 'CODFILIAL'
      Required = True
      Size = 2
    end
    object qryPesquisaPedidosNUMPED: TBCDField
      DisplayLabel = 'N'#218'M. PEDIDO'
      FieldName = 'NUMPED'
      Origin = 'NUMPED'
      Required = True
      Precision = 10
      Size = 0
    end
    object qryPesquisaPedidosVLTOTAL: TBCDField
      DisplayLabel = 'VALOR TOTAL'
      FieldName = 'VLTOTAL'
      Origin = 'VLTOTAL'
      Precision = 16
      Size = 3
    end
    object qryPesquisaPedidosCODCLI: TBCDField
      DisplayLabel = 'C'#211'D. CLIENTE'
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      Required = True
      Precision = 6
      Size = 0
    end
    object qryPesquisaPedidosCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 60
    end
    object qryPesquisaPedidosCODUSUR: TBCDField
      DisplayLabel = 'C'#211'D. RCA'
      FieldName = 'CODUSUR'
      Origin = 'CODUSUR'
      Required = True
      Precision = 4
      Size = 0
    end
    object qryPesquisaPedidosNOME: TStringField
      DisplayLabel = 'RCA'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
    object qryPesquisaPedidosSEM_ESTOQUE: TFMTBCDField
      DisplayLabel = 'QTD. PRODUTOS SEM ESTOQUE'
      FieldName = 'SEM_ESTOQUE'
      Origin = 'SEM_ESTOQUE'
      Precision = 38
      Size = 38
    end
    object qryPesquisaPedidosDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object qryPesquisaPedidosDTLIBERADEPS: TDateTimeField
      FieldName = 'DTLIBERADEPS'
      Origin = 'DTLIBERADEPS'
      Required = True
    end
    object qryPesquisaPedidosNUMCAR: TFMTBCDField
      FieldName = 'NUMCAR'
      Origin = 'NUMCAR'
      Precision = 38
      Size = 38
    end
    object qryPesquisaPedidosCODEMITENTE: TFMTBCDField
      FieldName = 'CODEMITENTE'
      Origin = 'CODEMITENTE'
      Precision = 38
      Size = 38
    end
    object qryPesquisaPedidosCODPLPAG: TBCDField
      FieldName = 'CODPLPAG'
      Origin = 'CODPLPAG'
      Precision = 4
      Size = 0
    end
  end
  object conn: TFDConnection
    Params.Strings = (
      'Database=LOCAL'
      'User_Name=C##LOCAL'
      'Password=LOCAL'
      'DriverID=Ora')
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object dsrPesquisaPedidos: TDataSource
    DataSet = qryPesquisaPedidos
    Left = 80
    Top = 152
  end
  object qryPedidoPrecisaCorte: TFDQuery
    Connection = conn
    SQL.Strings = (
      'SELECT '
      #9'PCPEDI.CODPROD'
      #9', PCPEDI.QT'
      #9', PCPEDI.PVENDA'
      
        #9', (PCEST.QTESTGER - NVL(PCEST.QTRESERV,0) - NVL(PCEST.QTBLOQUEA' +
        'DA,0)) ESTDISP'
      'FROM PCPEDC'
      'JOIN PCPEDI ON PCPEDI.NUMPED = PCPEDC.NUMPED'
      
        'JOIN PCEST ON PCEST.CODFILIAL = NVL(PCPEDI.CODFILIALRETIRA, PCPE' +
        'DC.CODFILIAL)'
      #9#9'   AND PCEST.CODPROD = PCPEDI.CODPROD'
      'WHERE PCPEDC.NUMPED = :NUMPED'
      
        'AND PCPEDI.QT > (PCEST.QTESTGER - NVL(PCEST.QTRESERV,0) - NVL(PC' +
        'EST.QTBLOQUEADA,0))')
    Left = 256
    Top = 96
    ParamData = <
      item
        Name = 'NUMPED'
        DataType = ftString
        ParamType = ptInput
        Value = '1000011'
      end>
  end
  object qryItensPedido: TFDQuery
    Connection = conn
    SQL.Strings = (
      'SELECT '
      #9'PCPEDI.CODPROD'
      #9', PCPEDI.QT'
      #9', PCPEDI.PVENDA'
      #9', NVL(PCPEDI.PTABELA, 0) AS PTABELA'
      #9', NVL(PCPEDI.VLCUSTOREP, 0) AS VLCUSTOREP'
      #9', NVL(PCPEDI.VLCUSTOCONT, 0) AS VLCUSTOCONT'
      #9', NVL(PCPEDI.VLCUSTOREAL, 0) AS VLCUSTOREAL'
      #9', NVL(PCPEDI.VLCUSTOFIN, 0) AS VLCUSTOFIN'
      #9', NVL(PCEST.QTESTGER, 0) AS QTESTGER  '
      #9', NVL(PCEST.QTRESERV, 0) AS QTRESERV'
      #9', NVL(PCEST.QTBLOQUEADA, 0) AS QTBLOQUEADA'
      #9', NVL(PCEST.QTPENDENTE, 0) AS QTPENDENTE'
      #9', NVL(PCEST.QTINDENIZ, 0) AS QTINDENIZ'
      
        #9', (PCEST.QTESTGER - NVL(PCEST.QTRESERV,0) - NVL(PCEST.QTBLOQUEA' +
        'DA,0)) ESTDISP'
      '        , NVL(PCPEDI.NUMSEQ, 1) AS NUMSEQ'
      '  , NVL(PCPEDI.CODFILIALRETIRA, PCPEDC.CODFILIAL) as CODFILIAL'
      'FROM PCPEDC'
      'JOIN PCPEDI ON PCPEDI.NUMPED = PCPEDC.NUMPED'
      
        'JOIN PCEST ON PCEST.CODFILIAL = NVL(PCPEDI.CODFILIALRETIRA, PCPE' +
        'DC.CODFILIAL)'
      #9#9'   AND PCEST.CODPROD = PCPEDI.CODPROD'
      'WHERE PCPEDC.NUMPED = :NUMPED')
    Left = 256
    Top = 152
    ParamData = <
      item
        Name = 'NUMPED'
        DataType = ftString
        ParamType = ptInput
        Value = '6214'
      end>
    object qryItensPedidoCODPROD: TBCDField
      FieldName = 'CODPROD'
      Origin = 'CODPROD'
      Required = True
      Precision = 6
      Size = 0
    end
    object qryItensPedidoQT: TFMTBCDField
      FieldName = 'QT'
      Origin = 'QT'
      Required = True
      Precision = 20
      Size = 6
    end
    object qryItensPedidoPVENDA: TFMTBCDField
      FieldName = 'PVENDA'
      Origin = 'PVENDA'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensPedidoESTDISP: TFMTBCDField
      FieldName = 'ESTDISP'
      Origin = 'ESTDISP'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoNUMSEQ: TFMTBCDField
      FieldName = 'NUMSEQ'
      Origin = 'NUMSEQ'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoQTESTGER: TFMTBCDField
      FieldName = 'QTESTGER'
      Origin = 'QTESTGER'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoQTRESERV: TFMTBCDField
      FieldName = 'QTRESERV'
      Origin = 'QTRESERV'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoQTBLOQUEADA: TFMTBCDField
      FieldName = 'QTBLOQUEADA'
      Origin = 'QTBLOQUEADA'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoQTPENDENTE: TFMTBCDField
      FieldName = 'QTPENDENTE'
      Origin = 'QTPENDENTE'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoQTINDENIZ: TFMTBCDField
      FieldName = 'QTINDENIZ'
      Origin = 'QTINDENIZ'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoPTABELA: TFMTBCDField
      FieldName = 'PTABELA'
      Origin = 'PTABELA'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoVLCUSTOREP: TFMTBCDField
      FieldName = 'VLCUSTOREP'
      Origin = 'VLCUSTOREP'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoVLCUSTOCONT: TFMTBCDField
      FieldName = 'VLCUSTOCONT'
      Origin = 'VLCUSTOCONT'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoVLCUSTOREAL: TFMTBCDField
      FieldName = 'VLCUSTOREAL'
      Origin = 'VLCUSTOREAL'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoVLCUSTOFIN: TFMTBCDField
      FieldName = 'VLCUSTOFIN'
      Origin = 'VLCUSTOFIN'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoCODFILIAL: TStringField
      FieldName = 'CODFILIAL'
      Origin = 'CODFILIAL'
      Size = 2
    end
  end
  object qryInserePCCORTEI: TFDQuery
    Connection = conn
    SQL.Strings = (
      'INSERT INTO PCCORTEI ('
      'CODPROD'
      ', QTSEPARADA'
      ', QTCORTADA'
      ', DATA'
      ', NUMCAR'
      ', CODFUNC'
      ', NUMPED'
      ', PVENDA'
      ', CODFILIAL'
      ', QTORIG'
      ', QTFALTA'
      ', MOTIVO'
      ', HORA'
      ', MINUTO'
      ', CODCLI'
      ', CODUSUR'
      ', CODROTINA'
      ', CODEMITENTEPED'
      ', NUMSEQ '
      ' ) VALUES ('
      '  :CODPROD'
      ', :QTSEPARADA'
      ', :QTCORTADA'
      ', TRUNC(SYSDATE)'
      ', :NUMCAR'
      ', :CODFUNC'
      ', :NUMPED'
      ', :PVENDA'
      ', :CODFILIAL'
      ', :QTORIG'
      ', :QTFALTA'
      ', :MOTIVO'
      ', TO_NUMBER(TO_CHAR(SYSDATE, '#39'HH24'#39'))'
      ', TO_NUMBER(TO_CHAR(SYSDATE, '#39'MI'#39'))'
      ', :CODCLI'
      ', :CODUSUR'
      ', :CODROTINA'
      ', :CODEMITENTEPED'
      ', :NUMSEQ )')
    Left = 392
    Top = 96
    ParamData = <
      item
        Name = 'CODPROD'
        ParamType = ptInput
      end
      item
        Name = 'QTSEPARADA'
        ParamType = ptInput
      end
      item
        Name = 'QTCORTADA'
        ParamType = ptInput
      end
      item
        Name = 'NUMCAR'
        ParamType = ptInput
      end
      item
        Name = 'CODFUNC'
        ParamType = ptInput
      end
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end
      item
        Name = 'PVENDA'
        ParamType = ptInput
      end
      item
        Name = 'CODFILIAL'
        ParamType = ptInput
      end
      item
        Name = 'QTORIG'
        ParamType = ptInput
      end
      item
        Name = 'QTFALTA'
        ParamType = ptInput
      end
      item
        Name = 'MOTIVO'
        ParamType = ptInput
      end
      item
        Name = 'CODCLI'
        ParamType = ptInput
      end
      item
        Name = 'CODUSUR'
        ParamType = ptInput
      end
      item
        Name = 'CODROTINA'
        ParamType = ptInput
      end
      item
        Name = 'CODEMITENTEPED'
        ParamType = ptInput
      end
      item
        Name = 'NUMSEQ'
        ParamType = ptInput
      end>
  end
  object qryReservarEstoqueItem: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE PCEST SET'
      'QTRESERV = NVL(QTRESERV,0) + :QT'
      'WHERE CODFILIAL = :CODFILIAL'
      'AND CODPROD = :CODPROD')
    Left = 72
    Top = 256
    ParamData = <
      item
        Name = 'QT'
        ParamType = ptInput
      end
      item
        Name = 'CODFILIAL'
        ParamType = ptInput
      end
      item
        Name = 'CODPROD'
        ParamType = ptInput
      end>
  end
  object qryLiberarPedido: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE PCPEDC SET'
      'POSICAO = '#39'L'#39
      'WHERE NUMPED = :NUMPED'
      'AND POSICAO = '#39'B'#39)
    Left = 352
    Top = 256
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end>
  end
  object qryLiberarItens: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE PCPEDI SET'
      'POSICAO = '#39'L'#39
      'WHERE NUMPED = :NUMPED'
      'AND POSICAO = '#39'B'#39)
    Left = 208
    Top = 256
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end>
  end
  object qryCorteItemPedido: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE PCPEDI SET'
      'QT = QT - :QT_CORTE'
      'WHERE NUMPED = :NUMPED'
      'AND CODPROD = :CODPROD')
    Left = 392
    Top = 152
    ParamData = <
      item
        Name = 'QT_CORTE'
        ParamType = ptInput
      end
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end
      item
        Name = 'CODPROD'
        ParamType = ptInput
      end>
  end
  object qryAtualizarCabecalhoPedido: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE PCPEDC SET'
      '    VLTOTAL = NVL(VLTOTAL,0) - :VLCORTE'
      '    , VLATEND = NVL(VLATEND,0) - :VLCORTE'
      '    , DTLIBERA = SYSDATE'
      
        '    , VLCUSTOREP = ( SELECT SUM(PCPEDI.QT * NVL(PCPEDI.VLCUSTORE' +
        'P, 0)) FROM PCPEDI WHERE PCPEDI.NUMPED = :NUMPED )'
      
        '    , VLCUSTOCONT = ( SELECT SUM(PCPEDI.QT * NVL(PCPEDI.VLCUSTOC' +
        'ONT, 0)) FROM PCPEDI WHERE PCPEDI.NUMPED = :NUMPED )'
      
        '    , VLCUSTOREAL = ( SELECT SUM(PCPEDI.QT * NVL(PCPEDI.VLCUSTOR' +
        'EAL, 0)) FROM PCPEDI WHERE PCPEDI.NUMPED = :NUMPED )'
      
        '    , VLCUSTOFIN = ( SELECT SUM(PCPEDI.QT * NVL(PCPEDI.VLCUSTOFI' +
        'N, 0)) FROM PCPEDI WHERE PCPEDI.NUMPED = :NUMPED )'
      
        '    , NUMITENS = ( SELECT COUNT(PCPEDI.CODPROD) FROM PCPEDI WHER' +
        'E PCPEDI.NUMPED = :NUMPED )'
      '    , HORALIBERA = TO_NUMBER(TO_CHAR(SYSDATE, '#39'HH24'#39'))'
      '    , MINUTOLIBERA = TO_NUMBER(TO_CHAR(SYSDATE, '#39'MI'#39'))'
      '    , CODFUNCLIBERA = :CODUSUARIO'
      '    , TOTPESO = ('
      
        '                select sum(pcpedi.qt * nvl(pcprodut.pesobruto, 0' +
        '))'
      '                from pcpedi'
      
        '                join pcprodut on pcprodut.codprod = pcpedi.codpr' +
        'od'
      '                where pcpedi.numped = :NUMPED)'
      '    , TOTVOLUME = ('
      '                select sum(pcpedi.qt * nvl(pcprodut.volume, 0))'
      '                from pcpedi'
      
        '                join pcprodut on pcprodut.codprod = pcpedi.codpr' +
        'od'
      '                where pcpedi.numped = :NUMPED)'
      
        '    , VLTABELA = ( SELECT SUM(PCPEDI.QT * NVL(PCPEDI.PTABELA, 0)' +
        ') FROM PCPEDI WHERE PCPEDI.NUMPED = :NUMPED )'
      'WHERE NUMPED = :NUMPED')
    Left = 488
    Top = 288
    ParamData = <
      item
        Name = 'VLCORTE'
        ParamType = ptInput
      end
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end
      item
        Name = 'CODUSUARIO'
        ParamType = ptInput
      end>
  end
  object qryDeletarItensSemQuantidade: TFDQuery
    Connection = conn
    SQL.Strings = (
      'DELETE FROM PCPEDI'
      'WHERE NUMPED = :NUMPED'
      'AND QT = 0')
    Left = 72
    Top = 360
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end>
  end
  object qryCancelarPedidoSemItens: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE PCPEDC SET'
      'POSICAO = '#39'C'#39
      ', DTCANCEL = SYSDATE'
      ', CODFUNCCANCEL = :CODUSUARIO'
      'WHERE NUMPED = :NUMPED'
      'AND NUMITENS = 0')
    Left = 488
    Top = 352
    ParamData = <
      item
        Name = 'CODUSUARIO'
        ParamType = ptInput
      end
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end>
  end
  object qryMarcarComoLiberado: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE NTintegracaodepsliberapedido SET'
      'DTLIBERAWINTHOR = SYSDATE'
      'WHERE NUMPED = :NUMPED')
    Left = 488
    Top = 408
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end>
  end
  object qryTotaisPedido: TFDQuery
    Connection = conn
    SQL.Strings = (
      ' SELECT NVL(VLTOTAL, 0)       AS VLTOTAL'
      '       , NVL(VLTABELA, 0)     AS VLTABELA'
      '       , NVL(VLATEND, 0)     AS VLATEND'
      '       , NVL(VLCUSTOREP, 0)  AS VLCUSTOREP'
      '       , NVL(VLCUSTOCONT, 0) AS VLCUSTOCONT'
      '       , NVL(VLCUSTOREAL, 0) AS VLCUSTOREAL'
      '       , NVL(VLCUSTOFIN, 0)  AS VLCUSTOFIN'
      '       , NVL(NUMITENS, 0)    AS NUMITENS'
      '       , NVL(TOTPESO, 0)     AS TOTPESO'
      'FROM   PCPEDC'
      'WHERE  NUMPED = :NUMPED  ')
    Left = 56
    Top = 544
    ParamData = <
      item
        Name = 'NUMPED'
        DataType = ftString
        ParamType = ptInput
        Value = '6214'
      end>
    object qryTotaisPedidoVLTOTAL: TFMTBCDField
      FieldName = 'VLTOTAL'
      Origin = 'VLTOTAL'
      Precision = 38
      Size = 38
    end
    object qryTotaisPedidoVLATEND: TFMTBCDField
      FieldName = 'VLATEND'
      Origin = 'VLATEND'
      Precision = 38
      Size = 38
    end
    object qryTotaisPedidoVLCUSTOREP: TFMTBCDField
      FieldName = 'VLCUSTOREP'
      Origin = 'VLCUSTOREP'
      Precision = 38
      Size = 38
    end
    object qryTotaisPedidoVLCUSTOCONT: TFMTBCDField
      FieldName = 'VLCUSTOCONT'
      Origin = 'VLCUSTOCONT'
      Precision = 38
      Size = 38
    end
    object qryTotaisPedidoVLCUSTOREAL: TFMTBCDField
      FieldName = 'VLCUSTOREAL'
      Origin = 'VLCUSTOREAL'
      Precision = 38
      Size = 38
    end
    object qryTotaisPedidoVLCUSTOFIN: TFMTBCDField
      FieldName = 'VLCUSTOFIN'
      Origin = 'VLCUSTOFIN'
      Precision = 38
      Size = 38
    end
    object qryTotaisPedidoNUMITENS: TFMTBCDField
      FieldName = 'NUMITENS'
      Origin = 'NUMITENS'
      Precision = 38
      Size = 38
    end
    object qryTotaisPedidoTOTPESO: TFMTBCDField
      FieldName = 'TOTPESO'
      Origin = 'TOTPESO'
      Precision = 38
      Size = 38
    end
    object qryTotaisPedidoVLTABELA: TFMTBCDField
      FieldName = 'VLTABELA'
      Origin = 'VLTABELA'
      Precision = 38
      Size = 38
    end
  end
  object qryRegistraLogPedido: TFDQuery
    Connection = conn
    SQL.Strings = (
      'INSERT INTO NTINTEGRACAODEPSLOGC'
      '            (NUMPED'
      '             , DATA'
      '             , CODUSUARIO'
      '             , VLTOTALANTES'
      '             , VLTABELAANTES'
      '             , VLATENDANTES'
      '             , VLCUSTOREPANTES'
      '             , VLCUSTOCONTANTES'
      '             , VLCUSTOREALANTES'
      '             , VLCUSTOFINANTES'
      '             , NUMITENSANTES'
      '             , TOTPESOANTES)'
      'VALUES      (:NUMPED'
      '             , SYSDATE'
      '             , :CODUSUARIO'
      '             , :VLTOTALANTES'
      '             , :VLTABELAANTES'
      '             , :VLATENDANTES'
      '             , :VLCUSTOREPANTES'
      '             , :VLCUSTOCONTANTES'
      '             , :VLCUSTOREALANTES'
      '             , :VLCUSTOFINANTES'
      '             , :NUMITENSANTES'
      '             , :TOTPESOANTES)  ')
    Left = 56
    Top = 616
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end
      item
        Name = 'CODUSUARIO'
        ParamType = ptInput
      end
      item
        Name = 'VLTOTALANTES'
        ParamType = ptInput
      end
      item
        Name = 'VLTABELAANTES'
        ParamType = ptInput
      end
      item
        Name = 'VLATENDANTES'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOREPANTES'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOCONTANTES'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOREALANTES'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOFINANTES'
        ParamType = ptInput
      end
      item
        Name = 'NUMITENSANTES'
        ParamType = ptInput
      end
      item
        Name = 'TOTPESOANTES'
        ParamType = ptInput
      end>
  end
  object qryAtualizaLogPedido: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE NTINTEGRACAODEPSLOGC'
      'SET    VLTOTALDEPOIS = :VLTOTALDEPOIS'
      '       , VLATENDDEPOIS = :VLATENDDEPOIS'
      '       , VLTABELADEPOIS = :VLTABELADEPOIS'
      '       , VLCUSTOREPDEPOIS = :VLCUSTOREPDEPOIS'
      '       , VLCUSTOCONTDEPOIS = :VLCUSTOCONTDEPOIS'
      '       , VLCUSTOREALDEPOIS = :VLCUSTOREALDEPOIS'
      '       , VLCUSTOFINDEPOIS = :VLCUSTOFINDEPOIS'
      '       , NUMITENSDEPOIS = :NUMITENSDEPOIS'
      '       , TOTPESODEPOIS = :TOTPESODEPOIS'
      '       , CORTE = :CORTE'
      'WHERE  NUMPED = :NUMPED  ')
    Left = 56
    Top = 688
    ParamData = <
      item
        Name = 'VLTOTALDEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'VLATENDDEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'VLTABELADEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOREPDEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOCONTDEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOREALDEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOFINDEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'NUMITENSDEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'TOTPESODEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'CORTE'
        ParamType = ptInput
      end
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end>
  end
  object qryRegistraLogItem: TFDQuery
    Connection = conn
    SQL.Strings = (
      
        'INSERT INTO NTINTEGRACAODEPSLOGI (NUMPED, CODPROD, QTPEDANTES, Q' +
        'TPEDDEPOIS, PVENDAPED, PTABELAPED, VLCUSTOREPPED, VLCUSTOCONTPED' +
        ', VLCUSTOREALPED, QTESTGER, QTRESERV, QTBLOQUEADA, QTPENDENTE, Q' +
        'TINDENIZ, QTDISPONIVEL)'
      
        'VALUES (:NUMPED, :CODPROD, :QTPEDANTES, :QTPEDDEPOIS, :PVENDAPED' +
        ', :PTABELAPED, :VLCUSTOREPPED, :VLCUSTOCONTPED, :VLCUSTOREALPED,' +
        ' :QTESTGER, :QTRESERV, :QTBLOQUEADA, :QTPENDENTE, :QTINDENIZ, :Q' +
        'TDISPONIVEL)'
      '')
    Left = 208
    Top = 544
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end
      item
        Name = 'CODPROD'
        ParamType = ptInput
      end
      item
        Name = 'QTPEDANTES'
        ParamType = ptInput
      end
      item
        Name = 'QTPEDDEPOIS'
        ParamType = ptInput
      end
      item
        Name = 'PVENDAPED'
        ParamType = ptInput
      end
      item
        Name = 'PTABELAPED'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOREPPED'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOCONTPED'
        ParamType = ptInput
      end
      item
        Name = 'VLCUSTOREALPED'
        ParamType = ptInput
      end
      item
        Name = 'QTESTGER'
        ParamType = ptInput
      end
      item
        Name = 'QTRESERV'
        ParamType = ptInput
      end
      item
        Name = 'QTBLOQUEADA'
        ParamType = ptInput
      end
      item
        Name = 'QTPENDENTE'
        ParamType = ptInput
      end
      item
        Name = 'QTINDENIZ'
        ParamType = ptInput
      end
      item
        Name = 'QTDISPONIVEL'
        ParamType = ptInput
      end>
  end
  object qryConsultaLogCabecalho: TFDQuery
    Connection = conn
    SQL.Strings = (
      'SELECT  '
      '     LOG.NUMPED              '
      '     , LOG.DATA              '
      '     , LOG.CODUSUARIO        '
      '     , USUARIO.NOME AS USUARIO'
      '     , PCPEDC.CODCLI'
      '     , PCCLIENT.CLIENTE'
      '     , LOG.CORTE             '
      '     , LOG.VLTOTALANTES      '
      '     , LOG.VLTOTALDEPOIS     '
      '     , LOG.VLTABELAANTES      '
      '     , LOG.VLTABELADEPOIS '
      '     , LOG.VLATENDANTES      '
      '     , LOG.VLATENDDEPOIS     '
      '     , LOG.VLCUSTOREPANTES   '
      '     , LOG.VLCUSTOREPDEPOIS  '
      '     , LOG.VLCUSTOCONTANTES  '
      '     , LOG.VLCUSTOCONTDEPOIS '
      '     , LOG.VLCUSTOREALANTES  '
      '     , LOG.VLCUSTOREALDEPOIS '
      '     , LOG.VLCUSTOFINANTES   '
      '     , LOG.VLCUSTOFINDEPOIS  '
      '     , LOG.NUMITENSANTES     '
      '     , LOG.NUMITENSDEPOIS    '
      '     , LOG.TOTPESOANTES      '
      '     , LOG.TOTPESODEPOIS     '
      'FROM NTINTEGRACAODEPSLOGC LOG'
      'JOIN PCPEDC ON PCPEDC.NUMPED = LOG.NUMPED'
      'LEFT JOIN PCCLIENT ON PCCLIENT.CODCLI = PCPEDC.CODCLI'
      'LEFT JOIN PCEMPR USUARIO ON USUARIO.MATRICULA = LOG.CODUSUARIO'
      'ORDER BY LOG.DATA'
      '  ')
    Left = 464
    Top = 544
    object qryConsultaLogCabecalhoNUMPED: TFMTBCDField
      DisplayLabel = 'N'#218'M. PEDIDO'
      FieldName = 'NUMPED'
      Origin = 'NUMPED'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryConsultaLogCabecalhoDATA: TDateTimeField
      DisplayLabel = 'DATA LIBERA'#199#195'O'
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object qryConsultaLogCabecalhoCODUSUARIO: TFMTBCDField
      DisplayLabel = 'C'#211'D. USU'#193'RIO'
      FieldName = 'CODUSUARIO'
      Origin = 'CODUSUARIO'
      Precision = 18
      Size = 6
    end
    object qryConsultaLogCabecalhoUSUARIO: TStringField
      DisplayLabel = 'USU'#193'RIO'
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 40
    end
    object qryConsultaLogCabecalhoCODCLI: TBCDField
      DisplayLabel = 'C'#211'D. CLIENTE'
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      Precision = 6
      Size = 0
    end
    object qryConsultaLogCabecalhoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 60
    end
    object qryConsultaLogCabecalhoCORTE: TStringField
      DisplayLabel = 'TEVE CORTE'
      FieldName = 'CORTE'
      Origin = 'CORTE'
      Size = 1
    end
    object qryConsultaLogCabecalhoVLTOTALANTES: TBCDField
      DisplayLabel = 'VL. TOTAL ANTES'
      FieldName = 'VLTOTALANTES'
      Origin = 'VLTOTALANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLTOTALDEPOIS: TBCDField
      DisplayLabel = 'VL. TOTAL DEPOIS'
      FieldName = 'VLTOTALDEPOIS'
      Origin = 'VLTOTALDEPOIS'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLATENDANTES: TBCDField
      DisplayLabel = 'VL. ATEND. ANTES'
      FieldName = 'VLATENDANTES'
      Origin = 'VLATENDANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLATENDDEPOIS: TBCDField
      DisplayLabel = 'VL. ATEND, DEPOIS'
      FieldName = 'VLATENDDEPOIS'
      Origin = 'VLATENDDEPOIS'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLCUSTOREPANTES: TBCDField
      DisplayLabel = 'VL. CUSTO REP, ANTES'
      FieldName = 'VLCUSTOREPANTES'
      Origin = 'VLCUSTOREPANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLCUSTOREPDEPOIS: TBCDField
      DisplayLabel = 'VL. CUSTO REP, DEPOIS'
      FieldName = 'VLCUSTOREPDEPOIS'
      Origin = 'VLCUSTOREPDEPOIS'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLCUSTOCONTANTES: TBCDField
      DisplayLabel = 'VL. CUSTO CONT. ANTES'
      FieldName = 'VLCUSTOCONTANTES'
      Origin = 'VLCUSTOCONTANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLCUSTOCONTDEPOIS: TBCDField
      DisplayLabel = 'VL. CUSTO CONT. DEPOIS'
      FieldName = 'VLCUSTOCONTDEPOIS'
      Origin = 'VLCUSTOCONTDEPOIS'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLCUSTOREALANTES: TBCDField
      DisplayLabel = 'VL. CUSTO REAL ANTES'
      FieldName = 'VLCUSTOREALANTES'
      Origin = 'VLCUSTOREALANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLCUSTOREALDEPOIS: TBCDField
      DisplayLabel = 'VL. CUSTO REAL DEPOIS'
      FieldName = 'VLCUSTOREALDEPOIS'
      Origin = 'VLCUSTOREALDEPOIS'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLCUSTOFINANTES: TBCDField
      DisplayLabel = 'VL. CUSTO FIN. ANTES'
      FieldName = 'VLCUSTOFINANTES'
      Origin = 'VLCUSTOFINANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLCUSTOFINDEPOIS: TBCDField
      DisplayLabel = 'VL. CUSTO FIN. DEPOIS'
      FieldName = 'VLCUSTOFINDEPOIS'
      Origin = 'VLCUSTOFINDEPOIS'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoNUMITENSANTES: TBCDField
      DisplayLabel = 'N'#218'M. ITENS ANTES'
      FieldName = 'NUMITENSANTES'
      Origin = 'NUMITENSANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoNUMITENSDEPOIS: TBCDField
      DisplayLabel = 'N'#218'M. ITENS DEPOIS'
      FieldName = 'NUMITENSDEPOIS'
      Origin = 'NUMITENSDEPOIS'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoTOTPESOANTES: TBCDField
      DisplayLabel = 'TOT. PESO ANTES'
      FieldName = 'TOTPESOANTES'
      Origin = 'TOTPESOANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoTOTPESODEPOIS: TBCDField
      DisplayLabel = 'TOT. PESO DEPOIS'
      FieldName = 'TOTPESODEPOIS'
      Origin = 'TOTPESODEPOIS'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLTABELAANTES: TBCDField
      DisplayLabel = 'VL. TABELA ANTES'
      FieldName = 'VLTABELAANTES'
      Origin = 'VLTABELAANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogCabecalhoVLTABELADEPOIS: TBCDField
      DisplayLabel = 'VL. TABELA DEPOIS'
      FieldName = 'VLTABELADEPOIS'
      Origin = 'VLTABELADEPOIS'
      Precision = 16
      Size = 3
    end
  end
  object dsrConsultaLogCabecalho: TDataSource
    DataSet = qryConsultaLogCabecalho
    Left = 464
    Top = 592
  end
  object dsrConsultaLogItem: TDataSource
    DataSet = qryConsultaLogItem
    Left = 608
    Top = 616
  end
  object qryConsultaLogItem: TFDQuery
    Connection = conn
    SQL.Strings = (
      'SELECT '
      #9'LOG.NUMPED'
      #9', LOG.CODPROD'
      #9', PCPRODUT.DESCRICAO PRODUT'
      #9', LOG.QTPEDANTES'
      #9', LOG.QTPEDDEPOIS'
      #9', LOG.PVENDAPED'
      #9', LOG.PTABELAPED'
      #9', LOG.VLCUSTOREPPED'
      #9', LOG.VLCUSTOREALPED'
      #9', LOG.VLCUSTOFINPED'
      #9', LOG.QTESTGER'
      #9', LOG.QTRESERV'
      #9', LOG.QTBLOQUEADA'
      #9', LOG.QTPENDENTE'
      #9', LOG.QTINDENIZ'
      #9', LOG.QTDISPONIVEL'
      'FROM NTINTEGRACAODEPSLOGI LOG'
      'JOIN PCPRODUT ON PCPRODUT.CODPROD = LOG.CODPROD'
      'WHERE LOG.NUMPED = :NUMPED'
      'ORDER BY PCPRODUT.DESCRICAO')
    Left = 608
    Top = 560
    ParamData = <
      item
        Name = 'NUMPED'
        DataType = ftString
        ParamType = ptInput
        Value = '1264'
      end>
    object qryConsultaLogItemNUMPED: TFMTBCDField
      DisplayLabel = 'N'#218'M. PEDIDO'
      FieldName = 'NUMPED'
      Origin = 'NUMPED'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryConsultaLogItemCODPROD: TBCDField
      DisplayLabel = 'C'#211'D. PRODUTO'
      FieldName = 'CODPROD'
      Origin = 'CODPROD'
      Required = True
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemPRODUT: TStringField
      DisplayLabel = 'PRODUTO'
      FieldName = 'PRODUT'
      Origin = 'PRODUT'
      Size = 40
    end
    object qryConsultaLogItemQTPEDANTES: TBCDField
      DisplayLabel = 'QTD. ANTES'
      FieldName = 'QTPEDANTES'
      Origin = 'QTPEDANTES'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemQTPEDDEPOIS: TBCDField
      DisplayLabel = 'QTD. DEPOIS'
      FieldName = 'QTPEDDEPOIS'
      Origin = 'QTPEDDEPOIS'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemPVENDAPED: TBCDField
      DisplayLabel = 'P. VENDA'
      FieldName = 'PVENDAPED'
      Origin = 'PVENDAPED'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemPTABELAPED: TBCDField
      DisplayLabel = 'P. TABELA'
      FieldName = 'PTABELAPED'
      Origin = 'PTABELAPED'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemVLCUSTOREPPED: TBCDField
      DisplayLabel = 'VL. CUSTO REP.'
      FieldName = 'VLCUSTOREPPED'
      Origin = 'VLCUSTOREPPED'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemVLCUSTOREALPED: TBCDField
      DisplayLabel = 'VL. CUSTO REAL'
      FieldName = 'VLCUSTOREALPED'
      Origin = 'VLCUSTOREALPED'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemVLCUSTOFINPED: TBCDField
      DisplayLabel = 'VL CUSTO FIN.'
      FieldName = 'VLCUSTOFINPED'
      Origin = 'VLCUSTOFINPED'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemQTESTGER: TBCDField
      DisplayLabel = 'QTD. ESTOQUE GERENCIAL'
      FieldName = 'QTESTGER'
      Origin = 'QTESTGER'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemQTRESERV: TBCDField
      DisplayLabel = 'QTD. ESTOQUE RESERVADO'
      FieldName = 'QTRESERV'
      Origin = 'QTRESERV'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemQTBLOQUEADA: TBCDField
      DisplayLabel = 'QTD. ESTOQUE BLOQUEADO'
      FieldName = 'QTBLOQUEADA'
      Origin = 'QTBLOQUEADA'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemQTPENDENTE: TBCDField
      DisplayLabel = 'QTD. ESTOQUE PENDENTE'
      FieldName = 'QTPENDENTE'
      Origin = 'QTPENDENTE'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemQTINDENIZ: TBCDField
      DisplayLabel = 'QTD. ESTOQUE AVARIA'
      FieldName = 'QTINDENIZ'
      Origin = 'QTINDENIZ'
      Precision = 16
      Size = 3
    end
    object qryConsultaLogItemQTDISPONIVEL: TBCDField
      DisplayLabel = 'QTD. ESTOQUE DISPON'#205'VEL'
      FieldName = 'QTDISPONIVEL'
      Origin = 'QTDISPONIVEL'
      Precision = 16
      Size = 3
    end
  end
  object qryInserePCNFCANITEM: TFDQuery
    Connection = conn
    SQL.Strings = (
      'INSERT INTO PCNFCANITEM ('
      '    NUMPED'
      '    , CODPROD'
      '    , MOTIVO'
      '    , CODFUNCCANC'
      '    , QT'
      '    , PVENDA'
      '    , PTABELA'
      '    , NUMSEQ'
      '    , DATACANC )'
      'SELECT'
      '    NUMPED'
      '    , CODPROD'
      '    , TRIM(SUBSTR(MOTIVO, 1, 60)) AS MOTIVO'
      '    , CODFUNC AS CODFUNCCANC'
      '    , QTCORTADA AS QT'
      '    , PVENDA'
      '    , PVENDA AS PTABELA'
      '    , NUMSEQ'
      '    , TRUNC(DATA) AS DATACANC'
      'FROM PCCORTEI'
      'WHERE NUMPED = :NUMPED')
    Left = 56
    Top = 768
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end>
  end
  object StorProcDesmembraPedido: TFDStoredProc
    Connection = conn
    StoredProcName = 'PRC_MED_FINALIZACAO_PEDIDO_01'
    Left = 88
    Top = 864
  end
  object qryAtualizarPCPLPAG: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE PCPEDC SET'
      
        'CODPLPAG = ( SELECT MIN(CODPLPAG) FROM PCPEDI WHERE NUMPED = :NU' +
        'MPED)'
      'WHERE CODPLPAG = '#39'99'#39
      'AND NUMPED = :NUMPED'
      
        'AND (SELECT COUNT (DISTINCT CODPLPAG) FROM PCPEDI WHERE PCPEDI.N' +
        'UMPED = :NUMPED) = 1')
    Left = 312
    Top = 848
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end>
  end
  object qryInserePCFALTA: TFDQuery
    Connection = conn
    SQL.Strings = (
      
        'INSERT INTO PCFALTA (NUMPED, DATA, CODPROD, CODUSUR, CODCLI, QT,' +
        ' PVENDA, CODFILIAL, NUMSEQ)'
      
        'SELECT :NUMPED, TRUNC(SYSDATE), :CODPROD, :CODUSUR, :CODCLI, 0, ' +
        ':PVENDA, :CODFILIAL, :NUMSEQ'
      'FROM DUAL'
      
        'WHERE NOT EXISTS ( SELECT 1 FROM PCFALTA WHERE NUMPED = :NUMPED ' +
        'AND CODPROD = :CODPROD  )')
    Left = 528
    Top = 96
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end
      item
        Name = 'CODPROD'
        ParamType = ptInput
      end
      item
        Name = 'CODUSUR'
        ParamType = ptInput
      end
      item
        Name = 'CODCLI'
        ParamType = ptInput
      end
      item
        Name = 'PVENDA'
        ParamType = ptInput
      end
      item
        Name = 'CODFILIAL'
        ParamType = ptInput
      end
      item
        Name = 'NUMSEQ'
        ParamType = ptInput
      end>
  end
  object qryAtualizaDatasIntegracao: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE NTINTEGRACAODEPSLIBERAPEDIDO SET'
      'DTLIBERAWINTHOR = SYSDATE'
      'WHERE DTLIBERAWINTHOR IS NULL '
      'AND NUMPED IN ('
      '    SELECT DEPS.NUMPED'
      '    FROM NTINTEGRACAODEPSLIBERAPEDIDO DEPS'
      '    JOIN PCPEDC ON PCPEDC.NUMPED = DEPS.NUMPED'
      '            AND PCPEDC.POSICAO <> '#39'B'#39
      '    WHERE DEPS.DTLIBERAWINTHOR IS NULL            '
      ')   ')
    Left = 88
    Top = 928
  end
  object qryAtualizaPCFALTA: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE PCFALTA SET'
      'QT = NVL(QT, 0) + :QT'
      'WHERE NUMPED = :NUMPED'
      'AND CODPROD = :CODPROD')
    Left = 528
    Top = 144
    ParamData = <
      item
        Name = 'QT'
        ParamType = ptInput
      end
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end
      item
        Name = 'CODPROD'
        ParamType = ptInput
      end>
  end
  object qryConfigQtPendente: TFDQuery
    Connection = conn
    SQL.Strings = (
      'SELECT NVL(valor, '#39'1'#39') AS VALOR'
      'FROM NTINTEGRACAODEPSCONFIG'
      'WHERE CODCONFIG = 1')
    Left = 64
    Top = 1008
    object qryConfigQtPendenteVALOR: TStringField
      FieldName = 'VALOR'
      Size = 100
    end
  end
  object qryInsereConfigQtPendente: TFDQuery
    Connection = conn
    SQL.Strings = (
      'INSERT INTO NTINTEGRACAODEPSCONFIG (CODCONFIG, VALOR)'
      
        'SELECT 1, '#39'0'#39' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM NTINTEGR' +
        'ACAODEPSCONFIG WHERE CODCONFIG = 1)')
    Left = 64
    Top = 1080
  end
  object qryAtualizaConfigQtPendente: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE NTINTEGRACAODEPSCONFIG SET'
      'VALOR = :VALOR'
      'WHERE CODCONFIG = 1')
    Left = 208
    Top = 1000
    ParamData = <
      item
        Name = 'VALOR'
        ParamType = ptInput
      end>
  end
  object qryDeduzirQtPendente: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE PCEST SET'
      'QTPENDENTE = NVL(QTPENDENTE, 0) - :QTPENDENTE'
      'WHERE CODFILIAL = :CODFILIAL'
      'AND CODPROD = :CODPROD')
    Left = 408
    Top = 984
    ParamData = <
      item
        Name = 'QTPENDENTE'
        ParamType = ptInput
      end
      item
        Name = 'CODFILIAL'
        ParamType = ptInput
      end
      item
        Name = 'CODPROD'
        ParamType = ptInput
      end>
  end
  object qryConfigQtPendenteTratamento: TFDQuery
    Connection = conn
    SQL.Strings = (
      'SELECT NVL(valor, '#39'0'#39') AS VALOR'
      'FROM NTINTEGRACAODEPSCONFIG'
      'WHERE CODCONFIG = 2')
    Left = 72
    Top = 1192
    object qryConfigQtPendenteTratamentoVALOR: TStringField
      FieldName = 'VALOR'
      Size = 100
    end
  end
  object qryAtualizaConfigQtPendenteTratamento: TFDQuery
    Connection = conn
    SQL.Strings = (
      'UPDATE NTINTEGRACAODEPSCONFIG SET'
      'VALOR = :VALOR'
      'WHERE CODCONFIG = 2')
    Left = 272
    Top = 1192
    ParamData = <
      item
        Name = 'VALOR'
        ParamType = ptInput
      end>
  end
  object qryInsereConfigQtPendenteTratamento: TFDQuery
    Connection = conn
    SQL.Strings = (
      'INSERT INTO NTINTEGRACAODEPSCONFIG (CODCONFIG, VALOR)'
      
        'SELECT 2, '#39'0'#39' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM NTINTEGR' +
        'ACAODEPSCONFIG WHERE CODCONFIG = 2)')
    Left = 96
    Top = 1264
  end
end
