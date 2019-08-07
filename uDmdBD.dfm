object DmdBD: TDmdBD
  OldCreateOrder = False
  Height = 644
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
      'FROM NTINTEGRACAODEPSLIBERAPEDIDO LIBERA'
      'JOIN PCPEDC ON PCPEDC.NUMPED = LIBERA.NUMPED'
      'LEFT JOIN PCCLIENT ON PCCLIENT.CODCLI = PCPEDC.CODCLI'
      'LEFT JOIN PCUSUARI ON PCUSUARI.CODUSUR = PCPEDC.CODUSUR'
      'LEFT JOIN PCPEDI ON PCPEDI.NUMPED = PCPEDC.NUMPED'
      'LEFT JOIN PCEST ON PCEST.CODFILIAL = PCPEDC.CODFILIAL'
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
  end
  object conn: TFDConnection
    Params.Strings = (
      'Database=LOCAL'
      'User_Name=LOCAL'
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
        'DA,0) - NVL(PCEST.QTPENDENTE,0)) ESTDISP'
      'FROM PCPEDC'
      'JOIN PCPEDI ON PCPEDI.NUMPED = PCPEDC.NUMPED'
      'JOIN PCEST ON PCEST.CODFILIAL = PCPEDC.CODFILIAL'
      #9#9'   AND PCEST.CODPROD = PCPEDI.CODPROD'
      'WHERE PCPEDC.NUMPED = :NUMPED'
      
        'AND PCPEDI.QT > (PCEST.QTESTGER - NVL(PCEST.QTRESERV,0) - NVL(PC' +
        'EST.QTBLOQUEADA,0) - NVL(PCEST.QTPENDENTE,0))')
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
      
        #9', (PCEST.QTESTGER - NVL(PCEST.QTRESERV,0) - NVL(PCEST.QTBLOQUEA' +
        'DA,0) - NVL(PCEST.QTPENDENTE,0)) ESTDISP'
      '        , NVL(PCPEDI.NUMSEQ, 1) AS NUMSEQ'
      'FROM PCPEDC'
      'JOIN PCPEDI ON PCPEDI.NUMPED = PCPEDC.NUMPED'
      'JOIN PCEST ON PCEST.CODFILIAL = PCPEDC.CODFILIAL'
      #9#9'   AND PCEST.CODPROD = PCPEDI.CODPROD'
      'WHERE PCPEDC.NUMPED = :NUMPED')
    Left = 256
    Top = 152
    ParamData = <
      item
        Name = 'NUMPED'
        DataType = ftString
        ParamType = ptInput
        Value = '1000011'
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
      ', SYSDATE'
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
    Top = 88
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
    Left = 232
    Top = 264
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
    Left = 336
    Top = 264
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
    Top = 144
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
      'WHERE NUMPED = :NUMPED')
    Left = 496
    Top = 256
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
    Left = 464
    Top = 336
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
      'UPDATE ntintegracaodepsliberapedido SET'
      'DTLIBERAWINTHOR = SYSDATE'
      'WHERE NUMPED = :NUMPED')
    Left = 496
    Top = 416
    ParamData = <
      item
        Name = 'NUMPED'
        ParamType = ptInput
      end>
  end
end
