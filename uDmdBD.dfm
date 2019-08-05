object DmdBD: TDmdBD
  OldCreateOrder = False
  Height = 395
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
  end
  object conn: TFDConnection
    Params.Strings = (
      'Database=LOCAL'
      'User_Name=LOCAL'
      'Password=LOCAL'
      'DriverID=Ora')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object dsrPesquisaPedidos: TDataSource
    DataSet = qryPesquisaPedidos
    Left = 80
    Top = 152
  end
end