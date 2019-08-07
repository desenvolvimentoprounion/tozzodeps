object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Integra'#231#227'o WinThor x DEPS'
  ClientHeight = 483
  ClientWidth = 973
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pgcPrincipal: TcxPageControl
    Left = 0
    Top = 0
    Width = 973
    Height = 483
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabExecucaoManual
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 480
    ClientRectLeft = 2
    ClientRectRight = 970
    ClientRectTop = 30
    object tabMenu: TcxTabSheet
      Caption = 'tabMenu'
      ImageIndex = 0
      object cxLabel1: TcxLabel
        Left = 16
        Top = 10
        Caption = 
          'Este programa realiza a an'#225'lise de estoque dos produtos dos pedi' +
          'dos liberados pelo sistema DEPS, mas com status bloqueado no Win' +
          'Thor.'
        Style.TextColor = clNavy
        Properties.WordWrap = True
        Transparent = True
        Width = 923
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 47
        Caption = 
          'Caso n'#227'o haja estoque suficiente para atender o pedido, os itens' +
          ' sofrer'#227'o cortes, o pedido ser'#225' recalculado e liberado.'
        Style.TextColor = clNavy
        Properties.WordWrap = True
        Transparent = True
        Width = 797
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 89
        Caption = 'No caso de corte total dos itens o pedido ser'#225' cancelado.'
        Style.TextColor = clNavy
        Transparent = True
      end
      object btnExcucaoManual: TcxButton
        Left = 16
        Top = 189
        Width = 80
        Height = 80
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000002C744558745469746C65004E6578743B446F75626C653B
          4172726F773B466173743B526577696E643B496E637265617365C977401F0000
          008F49444154785EEDD7B10D803010435116F43A0CC0128C404FC57621DD952E
          BEACA013852B17F7849470D9C6184BF34D808E67CCA83AD3270085307D0C5091
          EB73808A5C9F0354E4FA30A010B3BB0D2200A868C62338802338802338802338
          8023388023F6EBA4008E008000A2D917F0C31B9E023E3C7F1336FC17F0E1F97D
          A0ED4624D7B7DD8AE5FA162FA3A5F9012F487E01380E8892490000000049454E
          44AE426082}
        TabOrder = 3
        OnClick = _irParaExecuaoManual
      end
      object btnExcucaoAutomatica: TcxButton
        Left = 16
        Top = 317
        Width = 80
        Height = 80
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D22D0
          A1D0BBD0BED0B95F312220786D6C6E733D22687474703A2F2F7777772E77332E
          6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A
          2F2F7777772E77332E6F72672F313939392F786C696E6B2220783D2230707822
          20793D22307078222076696577426F783D223020302033322033322220737479
          6C653D22656E61626C652D6261636B67726F756E643A6E657720302030203332
          2033323B2220786D6C3A73706163653D227072657365727665223E262331333B
          262331303B3C7374796C6520747970653D22746578742F6373732220786D6C3A
          73706163653D227072657365727665223E2E57686974657B66696C6C3A234646
          464646463B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
          233732373237323B7D262331333B262331303B2623393B2E5265647B66696C6C
          3A234431314331433B7D262331333B262331303B2623393B2E7374307B6F7061
          636974793A302E363B7D3C2F7374796C653E3C706F6C79676F6E20636C617373
          3D22426C61636B2220706F696E74733D2232342C342032342C382031382C3820
          31382C3420382C3420382C3820322C3820322C3420302C3420302C3238203236
          2C32382032362C3420222F3E3C7061746820636C6173733D2257686974652220
          643D224D322C313268323276313448325631327A222F3E3C7061746820636C61
          73733D22426C61636B2220643D224D342C3668325632483456367A204D32302C
          327634683256324832307A222F3E3C7061746820636C6173733D225265642220
          643D224D32332C313863332E392C302C372C332E312C372C37732D332E312C37
          2D372C37732D372D332E312D372D375331392E312C31382C32332C31387A222F
          3E3C7061746820636C6173733D2257686974652220643D224D32332C32306332
          2E382C302C352C322E322C352C35732D322E322C352D352C35732D352D322E32
          2D352D355332302E322C32302C32332C32307A222F3E3C706F6C79676F6E2063
          6C6173733D225265642220706F696E74733D2233312C31392032392C31372032
          382C31382032382E352C31382E352032372C32302032382C32312032392E352C
          31392E352033302C323020222F3E3C7061746820636C6173733D225265642220
          643D224D32312C32352E3263302C312C302E382C312E382C312E382C312E3863
          302E392C302C312E372D302E372C312E382D312E374C32362C32326C2D332E33
          2C312E344332312E372C32332E352C32312C32342E332C32312C32352E327A22
          2F3E3C7061746820636C6173733D225265642220643D224D382C3230762D3668
          36763648387A204D31302C313676326832762D324831307A222F3E3C67206964
          3D22D0A1D0BBD0BED0B95F322220636C6173733D22737430223E3C7061746820
          636C6173733D22426C61636B2220643D224D342C32346832762D324834563234
          7A204D342C32306832762D3248345632307A204D342C31366832762D32483456
          31367A204D382C32346832762D3248385632347A204D31322C32346832762D32
          682D325632347A204D31362C32306832762D32682D3256323020202623393B26
          23393B7A204D31362C31366832762D32682D325631367A204D32302C31347632
          6832762D324832307A222F3E3C2F673E3C2F7376673E}
        TabOrder = 4
        OnClick = _irParaExecucaoAutomatica
      end
      object cxLabel4: TcxLabel
        Left = 102
        Top = 196
        Caption = 'Execu'#231#227'o manual'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -24
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.TextColor = clNavy
        Style.IsFontAssigned = True
        Transparent = True
        OnClick = _irParaExecuaoManual
      end
      object cxLabel5: TcxLabel
        Left = 105
        Top = 229
        Caption = 
          'Permite a an'#225'lise dos pedidos liberados pelo sistema de DEPS de ' +
          'acordo com os filtros definidos pelo usu'#225'rio.'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Arial'
        Style.Font.Style = []
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        Properties.WordWrap = True
        Transparent = True
        Width = 393
      end
      object cxLabel6: TcxLabel
        Left = 102
        Top = 325
        Caption = 'Execu'#231#227'o autom'#225'tica'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -24
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.TextColor = clNavy
        Style.IsFontAssigned = True
        Transparent = True
        OnClick = _irParaExecucaoAutomatica
      end
      object cxLabel7: TcxLabel
        Left = 105
        Top = 358
        Caption = 
          'Define o per'#237'odo retroativo e frequ'#234'ncia de execu'#231#227'o de an'#225'lise ' +
          'autom'#225'tica da rotina.'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Arial'
        Style.Font.Style = []
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        Properties.WordWrap = True
        Transparent = True
        Width = 372
      end
    end
    object tabExecucaoManual: TcxTabSheet
      Caption = 'tabExecucaoManual'
      ImageIndex = 1
      DesignSize = (
        968
        450)
      object Shape1: TShape
        Left = 7
        Top = 389
        Width = 10
        Height = 10
        Anchors = [akLeft, akBottom]
        Brush.Color = clRed
        Pen.Color = clRed
        ExplicitTop = 336
      end
      object Shape2: TShape
        Left = 207
        Top = 389
        Width = 10
        Height = 10
        Anchors = [akLeft, akBottom]
        Brush.Color = clBlue
        Pen.Color = clBlue
        ExplicitTop = 336
      end
      object btnVoltarMenu1: TcxButton
        Left = 7
        Top = 417
        Width = 130
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Voltar'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000F744558745469746C65004261636B3B507265763D5C97
          C9000000E349444154785EA5D33F0AC2301406F0EC3A751114244B076F205DE2
          D4CD2B0882F72838B77B77472FE0DAA974F2066E0A2ED2B14EF12B7C42782482
          64F80DEDFB43F292A8EDF122E550410B3DB5FC97CB7CF74343090D14602021C3
          7F0D73B46CA0E10435A4D65AE533C6A066AE761B940C4C981C34E630B7FC36C8
          B9B45424CEA0030B03ECC54A1AC815875388E215DC587C87B5672505548A1336
          4E60032FB08CCD035B31D02A1E53C2E21DBCC186380D12E87D0D867F1BC82D64
          F06441078B5F5B080D710957367940161E62F818A770768EF1E03BC6C88B147F
          95E31F53F473FE00C527425349ACC3430000000049454E44AE426082}
        TabOrder = 7
        OnClick = _irParaMenu
      end
      object mskNumeroPedido: TcxMaskEdit
        Left = 374
        Top = 24
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        StyleFocused.BorderColor = 33023
        TabOrder = 2
        Width = 121
      end
      object cxLabel10: TcxLabel
        Left = 374
        Top = 4
        Caption = 'N'#250'mero do pedido'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object btnEdtCodCliente: TcxButtonEdit
        Left = 7
        Top = 79
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        Properties.OnButtonClick = btnEdtCodClientePropertiesButtonClick
        StyleFocused.BorderColor = 33023
        TabOrder = 3
        OnExit = btnEdtCodClienteExit
        Width = 100
      end
      object btnEdtCodRCA: TcxButtonEdit
        Left = 374
        Top = 79
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        Properties.OnButtonClick = btnEdtCodRCAPropertiesButtonClick
        StyleFocused.BorderColor = 33023
        TabOrder = 4
        OnExit = btnEdtCodRCAExit
        Width = 100
      end
      object edtDescricaoCliente: TcxTextEdit
        Left = 108
        Top = 79
        Enabled = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Width = 225
      end
      object edtDescricaoRCA: TcxTextEdit
        Left = 475
        Top = 79
        Enabled = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Width = 225
      end
      object cxLabel11: TcxLabel
        Left = 7
        Top = 59
        Caption = 'Cliente'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 374
        Top = 59
        Caption = 'RCA'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object btnPesquisar: TcxButton
        Left = 833
        Top = 108
        Width = 130
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Pesquisar'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000B744558745469746C65005A6F6F6D3BCF09FEBC0000035A49444154
          785E7D936B4C1C7514C57F33BBB0BBBC7641046A2AD0D242B616ABB605D41462
          7996F8819268254693A6311AF41BA6180214A4055A959AC6588DB18FB0049342
          237DA821585B405AB1A948080F53A3B5B42C9447175876766699BF5308899F3C
          C9B92737B9E7E4DE0F1721C40A01D3C79F77EC38F54D5FFBD9B6FEFB67DB6F8A
          33E7FA27BF6AE9B950FB514B26100C486BF3D547DB015869720BF759BE7475D7
          B67D37A88EFE392516BD7E616045476E4F0AD7F9FEC0E1A6F39FEEC8C87500B2
          E1E1FDDA16D660FAA2F9DAE1CEEE31A16ACBE287BE7F44F5C95FC581DAABA2CA
          D04BBD7F0BEF922A5ABFFD4594D7B95A011B2095967F0D80FCC9C94BDBA31CF6
          83BBD236D2E41AA4F3C63D0AD2E229CE4B25608DA2A3D7CDF1D62172B2B6E270
          D85F2B39F0E11EC0E4F3F901904342EC155B926383AEDE9A60CAE3A766FF76E2
          9F70101F63E3796734492949B83D1A3FDD9CE099D44482ADF652204851140064
          1D9196B83E8A1F6F8DB3775722F37EC1AC6F9939839884618064E77A6E0C4FB2
          31218E40403C07981545E5C25BE9C89AA6AFB35ACD3C58505892830C73803925
          C0BCA61B5C263C44223A3204AFAA116C09C6AF6A9180E1D3305BACC88AE29F5A
          F269C6908D2BB73D8CCDAA3C547566D4004B0822224CE8928AC36165EEA11763
          F579004D0BA0EB3AF2C282B767E48F09763A63989D79C0A8C7CFC8829F2509C2
          C34D58424CDC754FB32DE9318686FFC2E75B1C00960D1845204FBAC74F5DECFC
          8DF4CD51C44698718FDFC32C544243C1A72A0C8EDE415AD6D8141B46C7C51E3C
          3313CD802684BE1220019637DEFDECF453290925050569FC7EDF38C3ED61DAD8
          22CE6E2525CEC106870D97EB32E18B6344DEF9BEFE83CBC34781C573FB5FD065
          40FDB9ABB9B4EFFAC089A6136D3AD3D3BCEC5CC77BBB9DE427C7B078779C63C7
          CE10ED1DA2B67433D9D9CF561CC9771E04425F39DD27AFFD810C583372DECECB
          2EAAE8CA2D3EA4E4141F12D945556A6661D9B56D19FB4A2AB3363474D7BF2AC4
          40A3B85EBF5754BF94DC08D8FFFB4C1260066C4038605F2561800588284B7FB2
          BEABB25088DE32D1539927EAF2B71E917617D5201020745851C12A044820B1DA
          5FE9689081B0779E8EAB28CCDA549E9F9380CB35E6E5FFD0F2FA4E1A3213A87B
          319E9A8CF8B55323DE4C7EBCEE78EE16AD714F6ACBBF059CA12764F2DBD90000
          000049454E44AE426082}
        TabOrder = 5
        OnClick = _PesquisarManual
      end
      object cxLabel8: TcxLabel
        Left = 7
        Top = 25
        Caption = 'De'
        Transparent = True
      end
      object dtLiberaPedidoInicial: TcxDateEdit
        Left = 28
        Top = 24
        StyleFocused.BorderColor = 33023
        TabOrder = 0
        Width = 121
      end
      object cxLabel9: TcxLabel
        Left = 159
        Top = 28
        Caption = 'at'#233
        Transparent = True
      end
      object dtLiberaPedidoFinal: TcxDateEdit
        Left = 189
        Top = 24
        StyleFocused.BorderColor = 33023
        TabOrder = 1
        Width = 121
      end
      object cxLabel13: TcxLabel
        Left = 7
        Top = 4
        Caption = 'Libera'#231#227'o do pedido pelo sistema DEPS'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object grdPedidos: TcxGrid
        Left = 7
        Top = 139
        Width = 958
        Height = 222
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 16
        object grdPedidosDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DmdBD.dsrPesquisaPedidos
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = grdPedidosDBTableView1NUMPED
            end
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Kind = skSum
              Column = grdPedidosDBTableView1VLTOTAL
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideSelection = True
          OptionsView.FocusRect = False
          OptionsView.NoDataToDisplayInfoText = 'Sem dados a serem exibidos'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.OnGetContentStyle = grdPedidosDBTableView1StylesGetContentStyle
          object grdPedidosDBTableView1CODFILIAL: TcxGridDBColumn
            DataBinding.FieldName = 'CODFILIAL'
            Width = 85
          end
          object grdPedidosDBTableView1DATA: TcxGridDBColumn
            Caption = 'DT. PEDIDO'
            DataBinding.FieldName = 'DATA'
          end
          object grdPedidosDBTableView1DTLIBERADEPS: TcxGridDBColumn
            Caption = 'DT. LIBERA DEPS'
            DataBinding.FieldName = 'DTLIBERADEPS'
          end
          object grdPedidosDBTableView1NUMPED: TcxGridDBColumn
            DataBinding.FieldName = 'NUMPED'
            Width = 104
          end
          object grdPedidosDBTableView1VLTOTAL: TcxGridDBColumn
            DataBinding.FieldName = 'VLTOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 102
          end
          object grdPedidosDBTableView1CODCLI: TcxGridDBColumn
            DataBinding.FieldName = 'CODCLI'
            Width = 98
          end
          object grdPedidosDBTableView1CLIENTE: TcxGridDBColumn
            DataBinding.FieldName = 'CLIENTE'
          end
          object grdPedidosDBTableView1CODUSUR: TcxGridDBColumn
            DataBinding.FieldName = 'CODUSUR'
            Width = 69
          end
          object grdPedidosDBTableView1NOME: TcxGridDBColumn
            DataBinding.FieldName = 'NOME'
          end
          object grdPedidosDBTableView1SEM_ESTOQUE: TcxGridDBColumn
            DataBinding.FieldName = 'SEM_ESTOQUE'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object grdPedidosLevel1: TcxGridLevel
          GridView = grdPedidosDBTableView1
        end
      end
      object btnLiberarPedidosManual: TcxButton
        Left = 833
        Top = 417
        Width = 130
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Liberar pedidos'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000F744558745469746C6500436865636B426F783B9B171E
          3B0000024749444154785E8D93CF4B545114C73FE7CD9BE764560445454591F6
          63D47E6960BF1C5D48D8A2454114812DDAD4AAFFA15DCB5A44D4AAA0B05611B4
          283221A3C4323550432A24C4C97E204E924D33EFDD9373EFA30171D1810BE75C
          CEF7C3F79E7BAF0002240097FF7F1820F281C4B5CEFE67092F9141416384CD55
          1D535C8D2A26CE4D54ECB9D8D1D4E6039EE065CE9DD845DCC9C250C043898C01
          71466FDC1FCA009E0F486414C035006A9DE83F96A0E40B050AF32B190404C900
          E3346201AE501C27B6AE20AA88C0F7E91C371F8EA05E92D6BA2A1AEA371345A6
          0C2815C6360B188331C6E68A323935C3F507C3B4B5A449ADACE26E671FE9EAB5
          846108205E0C009CB8BB7F9CCBB7FA78DAFB81B14F592B3E767437F9600977EE
          BDA6355D491054101F1B1FB07654959E81CFBCFD38C381A66A0686B33CEA9DE4
          F4F1BD647F43EFCB51B6AE8C3872B8968A8A547906CE81DA8D1555015FA77F91
          23A039B39DF6C0E7FDD41C23A313E88F2F749C6F2648A51084794DF908A131A8
          08B55B5673F2D07A9E3C1E64686296BEF11CD96F39C6DE8C70E154039595CB09
          2330501E2240142A1A29A1F1D893DEC0994281DB5DEF6868D9C9ABAE41CEB6D7
          B06ECD2A42671B83730CE0AED14E1E3B1823C2BEFA4D148A45AE743E67FF8E65
          1C6CACC1888FD5286074C135960018544B4BF048CC8BB6D158B7918424F04A53
          8F4051E227EE6031000B50F044E2572816E4074B01271011448801609C03F581
          E26CEE67CFA5ABDD195501EB82381435A0314401412DE04F7EEE05100AE00129
          20B9C87716160F050A40FE2F0C443CDF350F545E0000000049454E44AE426082}
        TabOrder = 6
        OnClick = btnLiberarPedidosManualClick
      end
      object cxLabel14: TcxLabel
        Left = 23
        Top = 384
        Anchors = [akLeft, akBottom]
        Caption = 'Sem estoque suficiente'
        ParentColor = False
        ParentFont = False
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
      end
      object cxLabel15: TcxLabel
        Left = 223
        Top = 384
        Anchors = [akLeft, akBottom]
        Caption = 'Com estoque suficiente'
        ParentColor = False
        ParentFont = False
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
      end
      object prgBar: TcxProgressBar
        Left = 7
        Top = 364
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 19
        Visible = False
        Width = 958
      end
    end
    object tabExecucaoAutomatica: TcxTabSheet
      Caption = 'tabExecucaoAutomatica'
      ImageIndex = 2
      DesignSize = (
        968
        450)
      object btnVoltarMenu2: TcxButton
        Left = 7
        Top = 417
        Width = 130
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Voltar'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000F744558745469746C65004261636B3B507265763D5C97
          C9000000E349444154785EA5D33F0AC2301406F0EC3A751114244B076F205DE2
          D4CD2B0882F72838B77B77472FE0DAA974F2066E0A2ED2B14EF12B7C42782482
          64F80DEDFB43F292A8EDF122E550410B3DB5FC97CB7CF74343090D14602021C3
          7F0D73B46CA0E10435A4D65AE533C6A066AE761B940C4C981C34E630B7FC36C8
          B9B45424CEA0030B03ECC54A1AC815875388E215DC587C87B5672505548A1336
          4E60032FB08CCD035B31D02A1E53C2E21DBCC186380D12E87D0D867F1BC82D64
          F06441078B5F5B080D710957367940161E62F818A770768EF1E03BC6C88B147F
          95E31F53F473FE00C527425349ACC3430000000049454E44AE426082}
        TabOrder = 0
        OnClick = _irParaMenu
      end
      object cxLabel16: TcxLabel
        Left = 7
        Top = 3
        Caption = 'Usu'#225'rio para registro de libera'#231#227'o dos pedidos'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxButtonEdit1: TcxButtonEdit
        Left = 7
        Top = 23
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        TabOrder = 2
        Width = 100
      end
      object cxTextEdit3: TcxTextEdit
        Left = 108
        Top = 23
        Enabled = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Width = 225
      end
      object cxLabel17: TcxLabel
        Left = 7
        Top = 58
        Caption = 'Motivo do corte'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxButtonEdit2: TcxButtonEdit
        Left = 7
        Top = 77
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        TabOrder = 5
        Width = 100
      end
      object cxTextEdit4: TcxTextEdit
        Left = 108
        Top = 77
        Enabled = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Width = 225
      end
      object spnQtdDias: TcxSpinEdit
        Left = 7
        Top = 135
        Properties.MinValue = 1.000000000000000000
        TabOrder = 7
        Value = 1
        Width = 100
      end
      object spnIntervaloMinutos: TcxSpinEdit
        Left = 7
        Top = 189
        Properties.MinValue = 1.000000000000000000
        TabOrder = 8
        Value = 1
        Width = 100
      end
      object spnQtdLinhas: TcxSpinEdit
        Left = 7
        Top = 244
        Properties.MinValue = 1.000000000000000000
        TabOrder = 9
        Value = 1
        Width = 100
      end
      object cxLabel18: TcxLabel
        Left = 7
        Top = 116
        Caption = 'Qtd. dias retroativos para pesquisa dos pedidos'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel19: TcxLabel
        Left = 7
        Top = 171
        Caption = 'Qtd. de minutos de intervalo entre cada execu'#231#227'o'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel20: TcxLabel
        Left = 7
        Top = 225
        Caption = 'Qtd. m'#225'xima de linhas de log de execu'#231#227'o'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object memoLog: TcxMemo
        Left = 380
        Top = 23
        Anchors = [akLeft, akTop, akRight, akBottom]
        Properties.ReadOnly = True
        Style.Color = clWhite
        StyleDisabled.Color = clWhite
        TabOrder = 13
        Height = 375
        Width = 585
      end
      object cxLabel21: TcxLabel
        Left = 380
        Top = 3
        Caption = 'Log de execu'#231#227'o'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object edtProximaExecucao: TcxTextEdit
        Left = 7
        Top = 300
        Properties.ReadOnly = True
        TabOrder = 15
        Width = 100
      end
      object cxLabel22: TcxLabel
        Left = 7
        Top = 280
        Caption = 'Pr'#243'xima execu'#231#227'o'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxButton1: TcxButton
        Left = 835
        Top = 417
        Width = 130
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Parar'
        Enabled = False
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000023744558745469746C650043616E63656C3B53746F703B457869743B
          426172733B526962626F6E3B4C9696B20000038849444154785E1D906B4C5367
          18C7FF3DBD40CB1A2E32B55C9D598B4CA675D8D13836652E9B0359B67D589665
          3259E644A52571644474CB4CB6ECC23770C4449DD38D2885005E4683AB69C616
          8DA12384264EC8AAAC0C9149A1175ACEE9E939CFDE9EE7E477F2CBFFB924E720
          E6E943CC3B8895D12B00A0FEE3D08167A75A5BBAEEB71D9D081E6B4DA549FBDD
          A3CEEFDD1F3658016818AA98A71FD1915E202DE980A19D741E3EF6E0F8A7FC7F
          673B6979E002C5BC43B4C2581EB8480BE7BA68E6441BEF3B72F03300990C8E1D
          5016554E7B55D6C1ED9543C6C2B5BB739FDF025988838424E4240F10A0D2EAA0
          D26540AD37203CFE17C2C187A3EDBFDE7CF3DAD4748403A06EA8A8E830AC5FB3
          3B7BAB1901B717AE23DFE1CEC5EBEC90A0E0EB71A3CFD981C0B017C6F252180B
          D6BD74BCFA856E003A0CBDFD966DF250532AD4FF038DB734D18557DF21CFB08F
          2E37B5D370ED5E72D7D52BEEF9654CE9F91C1FD392EB0C4D3A0E4BE7F6ECD909
          CFDEFAD381AF4ED0A3D35FD399E272BA3F3D478F971234FD2044BDCE930AF798
          CF2FAED0DF5373CACCFCA92F2970B29DDCAFD7F56B48945E918201C41738945A
          2D581C7461ADA3192AB50AD64F9A010272730CC8D4AA313BE44289D58CF85D3F
          2411504BB28D93845489145E041F9CC1863C09A11BD7E1EFEA86240339463DB2
          B3F59025C0DFD98DD0C83594E6886C360831F408523265D208BC0021B20A35A7
          82B8BC0429C2239A10D812417988007088B14C8A8421EA75A094044A8A48F200
          17E78587629220B370E69F2884EA3750F07E23245946868E43A64EA3B8695F23
          F8EA7A046763EC780AC9640AF155FEB1269AE0BD91AC8CFDF910108E26F15A5B
          33788D1E860CF6CDE7CF225D45FB3F02A0C7CE36076E5CBD84825C3562A20E4B
          097E0CAD051B5FFCA97C9BE4ABAEA05B2FDBE9E6BE0F880F8568FCDB0E1AA9AA
          646C579C654AEF564D15FDB96333FDBCC94A8E751B6A0140DF5168B9E42A7B86
          266AB6D2ED1A1BF559CAC853B58DFCB576F2D7D9D3AE64B777D96862D716EA2F
          2BA76F4CE62B008C1A00C2F9C57F9D8DA2C99212C5E72C85323699F320A77FD2
          72040021DF9885F56BF2204457706F9EC74C4CF2F744169A012430DBF21E00A8
          2B754F98BEC82EEEED7AF2291A306FA451EBD3346633938FF13BF341969D62BD
          CF738AAF6ED6EA4B006882CE77A14ABFD255D2799903606830E4EF28E274070C
          1C67D74255041044C25C9CE43B4149F8B16735F41B8038DB9300E07F6924ECFB
          01D589CC0000000049454E44AE426082}
        TabOrder = 17
      end
      object cxButton2: TcxButton
        Left = 699
        Top = 417
        Width = 130
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Iniciar'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000011744558745469746C6500506C61793B53746172743B5D
          61407A000001F049444154785EAD904B6B13511886DF938C4E5A31C560A5174C
          68E3056C91D07A5D98B6D616BC54105CC4DB527F801050BA511411A550D14271
          2314ACC5955D14A90B770A820B15A9422B0DB69149C64E9C2493CB3973267E84
          5884566DC0071E38B3380FEF1CFC3746A74FAA2353273A50252E54D035AB160C
          6F1F4C1D7F32FCEC58A0EA407231EB9692B160735784B9F07978F2E8D0ED89FE
          4D6B0E64CCA28B0B81B6C03E74EF8978B636745E56143677F7697FF4EAC821F5
          9F01291D0821912E7C43412CC1DF588F03A1015F53C3EE3B5E9F3A736BBCF7EC
          91D3ADAE3F066CDB814D811C37A0673EA168E7A0281C417F13426D875B37FB82
          8FC30381D7D71F75F7ACBE409420B8036E5BC88B3434F3030C2B46A13C366E50
          B06BFB36ECDC71707F9DB7F9E5E068F81C2A28CB0B245D1692E667E82C40C0CC
          C7CBAE73D7C0343D48680652BAF62A9DE2EF0030B2A4FCFE0B8253C0CE4250E0
          17564E85AE99588ACF7E492C583726EE7D9C0460AD5820CB6FE0A0C0CB0BE8DB
          83F822C7F785989ED20B43CFC7E6C68C643E0D809336595A1110E547CC607E5E
          428F7DCD657FF0876F5EC4EFCFBE3792008AA4241DAC465FA465CBA59B1DA58B
          D742F6F968FBF8DEDEC610002FB9BEF2D80C7FA3EF4C4BFD852BEDD35DA7FC3D
          00EA489574930C6B44216BC99ACA99A14AD8F2D42AF809500AE0796F04355100
          00000049454E44AE426082}
        TabOrder = 18
      end
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = False
    SkinName = 'SevenClassic'
    Left = 664
    Top = 8
  end
  object styRepo: TcxStyleRepository
    Left = 658
    Top = 54
    PixelsPerInch = 96
    object styComEstoque: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlue
    end
    object stySemEstoque: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clRed
      TextColor = clYellow
    end
  end
end
