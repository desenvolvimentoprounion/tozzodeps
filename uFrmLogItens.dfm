object FrmLogItens: TFrmLogItens
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = 'Log'
  ClientHeight = 539
  ClientWidth = 942
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 16
  object grdLog: TcxGrid
    Left = 0
    Top = 0
    Width = 942
    Height = 539
    Align = alClient
    TabOrder = 0
    object grdLogDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DmdBD.dsrConsultaLogItem
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = 'Sem dados a serem exibidos'
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
    end
    object grdLogDBBandedTableView1: TcxGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DmdBD.dsrConsultaLogItem
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = grdLogDBBandedTableView1CODPROD
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = 'Sem dados a serem exibidos'
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.OnGetContentStyle = grdLogDBBandedTableView1StylesGetContentStyle
      Bands = <
        item
          Caption = 'Dados b'#225'sicos'
        end
        item
          Caption = 'Informa'#231#245'es do item no pedido'
        end
        item
          Caption = 'Informa'#231#245'es do estoque do item no momento da avalia'#231#227'o'
        end>
      object grdLogDBBandedTableView1NUMPED: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NUMPED'
        Visible = False
        VisibleForCustomization = False
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1CODPROD: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CODPROD'
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1PRODUT: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PRODUT'
        Width = 180
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1QTPEDANTES: TcxGridDBBandedColumn
        DataBinding.FieldName = 'QTPEDANTES'
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1QTPEDDEPOIS: TcxGridDBBandedColumn
        DataBinding.FieldName = 'QTPEDDEPOIS'
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1PVENDAPED: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PVENDAPED'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1PTABELAPED: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PTABELAPED'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1VLCUSTOREPPED: TcxGridDBBandedColumn
        DataBinding.FieldName = 'VLCUSTOREPPED'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1VLCUSTOREALPED: TcxGridDBBandedColumn
        DataBinding.FieldName = 'VLCUSTOREALPED'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1VLCUSTOFINPED: TcxGridDBBandedColumn
        DataBinding.FieldName = 'VLCUSTOFINPED'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1QTDISPONIVEL: TcxGridDBBandedColumn
        DataBinding.FieldName = 'QTDISPONIVEL'
        Width = 200
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1QTESTGER: TcxGridDBBandedColumn
        DataBinding.FieldName = 'QTESTGER'
        Width = 200
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1QTRESERV: TcxGridDBBandedColumn
        DataBinding.FieldName = 'QTRESERV'
        Width = 200
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1QTBLOQUEADA: TcxGridDBBandedColumn
        DataBinding.FieldName = 'QTBLOQUEADA'
        Width = 200
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1QTPENDENTE: TcxGridDBBandedColumn
        DataBinding.FieldName = 'QTPENDENTE'
        Width = 200
        Position.BandIndex = 2
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object grdLogDBBandedTableView1QTINDENIZ: TcxGridDBBandedColumn
        DataBinding.FieldName = 'QTINDENIZ'
        Width = 200
        Position.BandIndex = 2
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
    end
    object grdLogLevel1: TcxGridLevel
      GridView = grdLogDBBandedTableView1
    end
  end
  object styRepo: TcxStyleRepository
    Left = 648
    Top = 200
    PixelsPerInch = 96
    object styCorte: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
  end
end
