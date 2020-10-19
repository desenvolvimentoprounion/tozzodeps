object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Integra'#231#227'o WinThor x DEPS'
  ClientHeight = 597
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
    Height = 597
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabMenu
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 594
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
        Width = 864
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
        Top = 135
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
        Top = 244
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
          636974793A302E363B7D3C2F7374796C653E0D0A3C706F6C79676F6E20636C61
          73733D22426C61636B2220706F696E74733D2232342C342032342C382031382C
          382031382C3420382C3420382C3820322C3820322C3420302C3420302C323820
          32362C32382032362C3420222F3E0D0A3C7061746820636C6173733D22576869
          74652220643D224D322C313268323276313448325631327A222F3E0D0A3C7061
          746820636C6173733D22426C61636B2220643D224D342C366832563248345636
          7A204D32302C327634683256324832307A222F3E0D0A3C7061746820636C6173
          733D225265642220643D224D32332C313863332E392C302C372C332E312C372C
          37732D332E312C372D372C37732D372D332E312D372D375331392E312C31382C
          32332C31387A222F3E0D0A3C7061746820636C6173733D225768697465222064
          3D224D32332C323063322E382C302C352C322E322C352C35732D322E322C352D
          352C35732D352D322E322D352D355332302E322C32302C32332C32307A222F3E
          0D0A3C706F6C79676F6E20636C6173733D225265642220706F696E74733D2233
          312C31392032392C31372032382C31382032382E352C31382E352032372C3230
          2032382C32312032392E352C31392E352033302C323020222F3E0D0A3C706174
          6820636C6173733D225265642220643D224D32312C32352E3263302C312C302E
          382C312E382C312E382C312E3863302E392C302C312E372D302E372C312E382D
          312E374C32362C32326C2D332E332C312E344332312E372C32332E352C32312C
          32342E332C32312C32352E327A222F3E0D0A3C7061746820636C6173733D2252
          65642220643D224D382C3230762D366836763648387A204D31302C3136763268
          32762D324831307A222F3E0D0A3C672069643D22D0A1D0BBD0BED0B95F322220
          636C6173733D22737430223E0D0A09093C7061746820636C6173733D22426C61
          636B2220643D224D342C32346832762D3248345632347A204D342C3230683276
          2D3248345632307A204D342C31366832762D3248345631367A204D382C323468
          32762D3248385632347A204D31322C32346832762D32682D325632347A204D31
          362C32306832762D32682D3256323020202623393B2623393B7A204D31362C31
          366832762D32682D325631367A204D32302C313476326832762D324832307A22
          2F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
        TabOrder = 4
        OnClick = _irParaExecucaoAutomatica
      end
      object cxLabel4: TcxLabel
        Left = 102
        Top = 142
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
        Top = 175
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
        Top = 249
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
        Top = 282
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
      object btnConsultarLog: TcxButton
        Left = 16
        Top = 353
        Width = 80
        Height = 80
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000008C649444154785E9D970B7054D5FDC73FE7DEBBBB61034930212F4248
          20E151081040500C8262C24B505A41FF4E6BA75070CAB4F5D5A98A456DABD3D6
          07C8D84E6D7DCC5094BF08A8BC54248409F23024A824819020CF3C681262DED9
          C7DD7B4EB777F60E994C8C63BFB3BF397BEFEE9EEFE7F73BBF73E6AE504AE148
          08C1F750DF2F2BFE0719F42307AAAF44588018004001A87E26F8FB96A3AC7D20
          EF3B0106347E7EE37B49C3125357084D5F2484480531514A5925A56A0899C14F
          9B9BEAFEFFF78FFFB8410861C3F406095921F8B66C9DE87B6FE1AAAD00E2AEE5
          ABDDAFBD7DE4E9CD3BCABA8E965D54571A5A5567B7DF36E8ECF2AB2BF5ADEAC8
          890BEAF5ADC77B36BD59F4E765F7AE8D06744038736D7CE3D0F70700B475CFBD
          15FFDADBC70E7D7AF8ACEAF6059523D394AAC71F541DDD01D5D6E957ED5D01F5
          4D9B4F7D5C745A6D78FD60E9434FFE75786F8897FE7180FEA40D54F6DBE62F77
          A5A567EF983221756EFEECB178A35C545FB8C6BA970BB9EFA16D2C59BD95354F
          ED61D3E612AE34B48310CC9C3E9A293F489B3E7C44D6AEB905F77A2353899069
          F5EF3340876B9BDE3CF8CCB8ACD4F505B78EC30C4936EFFC82773E3A436C4A3A
          83E387E1898A02D324D0D946B0BD99A57347317F76269A263874F42C676BEA5E
          5DFFC8D2C700EBB957F6CABCD697FAAF8063D82BF4DF3EFBFA70B7DBFDD8ACE9
          99006C78F3086F7F728E82C573F8E3AA1BD9F0D32CD6DC96C8D8F418E2929349
          1E3B9183279BD8FE493552C1CDD346E1F6B81FFCC5631BB300F1BB87EF145913
          749C70E4181A9170011EC0131B37EC9E319989DEC15E0F272BEBD97DA886FC3B
          66F2AB82E1A40E7511B214C3620C164D89657462142E43272D3B8BE3E58D9CAF
          6DC370B918332AC91D139BB862A0A53600FDA917F61ED085360740A198317904
          F58D6D8C1E198F52F061E159E2D3B3587E4B32819024602AFCE1F005EDF78C4D
          8DA2B1DD0404A3B2D3397AB29E8CD418D2D3122829D597017F012C40F507A009
          B4394FFCB2A0D72164F1AF1D2524DC3098403044E5B9268664E410E7D523E612
          5F38FC21658F6E43E0766B6842909C12CFA99206A454C4C478B1A44A737AADA2
          339F9C2107FAF6009AB44D2118B2F09B16A190A4ABCB4794C7853F68D1D91DC4
          15EDA1BECDB40D7B7A99072C49BBDFC2E512783C8241D1063DA6690344B95D58
          96151F0110273A736D0880AFBC2B9C0A20A4B222D9030A10A01B1A3EBF49D0B4
          88BB61104A9A149EED60E184D8B0B90D609B072CA8EF0C627820DAAD03126F18
          C202FCBE008140B0935E0A4300D066A4533EF85E3400251570DD5C01D15106CD
          2D9D84A464D2F81402DD6D9C6FF5F371751BF51DA6BD0CCD3E8BEA6F02745912
          DDAD11176BD0F24D5BB8F9E25116345DEB20180A5CC116AA2F8454A001424A45
          59451D1F7C52CEFB1F9DE264791D1E8F8B53A72F6349C89F954DC7D55AC0A236
          6C5E7CA99383173B39732D40B715427709E2635DE886A2FCCC25F272472095A4
          E6EB7AFC3DDD4580A48FBCBE0B4CE9DE1601B014D3728673F78249FC70E164A6
          E68CE0F65BC6F145C545FCFE0023936298377314ADB55F1315A57047817081DB
          0383BC3A49F1EE3030947E51CD8C094924C679E9EA09507AF2ACACBD58F52EA0
          7A577AC6E053CC30DF777A009B56393B4080A560C8102F13C6A450545C41C11D
          B9FCDF821CE28ED7B0EFF353648DCF203E712871B18308FAFD5C6D68E56CD565
          E64DCDB0A3ABDB4F615119CD8D4DC1E6A6660BD081D0B38F2E10FBFEF9279513
          53C8E541D1A8EB4B20412A8400941D2825B82D6F22B5758D7C76EC34BE9E008B
          668DE50FABE71223FD949756B0FBC3624A8F954377178FDF7F3377FCD7BCCBCF
          9123E5545456B3F281FCA89CA973F6DE74FBAAF1800BD016AF79520058216987
          0D10921210D8030221045269B85D6E6E9D3581F3E76BD9BDF7184DCDED441B3A
          6B964CE3D58717F1CED33FE2955F2F60E5A2C9B885A0E95A3BEFEF2A66CFBE43
          4C1C97C1FCB9D37978EDDD09E999130FDFB960F944C00D68692B0E8A504812B2
          2C0410B3F6C977DB97CE9FCA852B2D2889230C1D468DBC014D5894945571E94A
          233993B2199D994A6A6A4218D0B00FAAFA8626BE3E5F4F59E919DA3B3A484BCF
          A0B9B985C5F933888E763139B989DA5D2F371F2AFFF7E2E7F75457024140EE5F
          374F0920F6C1C7B7B6BDF8F43D0482122140291CB16D7719F72D9D024A72F56A
          0B255FD6507DAE9EBA8616FB8CD034416AF250B23393B93137DBEEA797FEF611
          E91999549DAEE299D559DC34671EED5FBEC5F19D7BAE1585215EDC7FDE81B08C
          EB3D00A05036930225402894A5904A474941724A2277252720E7876CCACAEAAB
          E1464D46080DC2A1944008C9BA8796F0C473DBF9D91C83940B6FE04BBD466CEE
          4A662A95103477ED0B83DFB9A9E85205103000A49438BE080081422114589172
          084D8FEC160D850B047C59D5C8F8B1E90821EC4060F74EC6C854962D9C847E62
          7D0BF939F18D877792A41443A7AE62B6500966F0C3BD9AEE9ABFF1C0B9330620
          2CA95091A47BD75F39970E1B1A42387B07043ABA6120FA3CE2094DC33B78285B
          8FD4DF1FF09BEFCC5E3C2DE16AF10E5280A1B93F27B7A92DA1B3AB7003B0C406
          505252F85935E1874DE7B0708400B6EC38E120392FE7922DEF95A022780E7F4A
          720CC7CA2EB2EB4C4BB55BB0CCD753F241FE3D3726341DDD43A2106416FC86C3
          DBF64F01741B405A92797963089A1201BD97832DDB4FF093E533AEBB0A074284
          3FFB9C0756DC041163E7671E97E0E3C29300C1EDA75B2AA5692DEDF11DDB9DB7
          706A82ABE62BBA2FFBE8F1995F01D200B09CAC9D1DA07026051931743A43F52E
          B7637CDD1C402A81B4148004823B6BDA2A4C532EACAB3FFCC2F061DEBC80B9BF
          B8A2D57C14081ACEBAD167728742460A8C632E009C6B090A24BD4E51E1402867
          120B30775FECA804EE06F4C8BD20601A80B27701E076698E372A927672622C2E
          2392631FBEA48418FB33DB5D010822A9A0A40380042C07C42996130218B26CE5
          A6DD2EC333B7F7F3004A0211202440E45A0E3C2A8912600503C51F6C7EE42EA0
          1BB0E8470E801BF044461D107CBB04DF2D873800F82359CB6FFBC36B00A108A1
          7F4083EF2F1909C500FA0FBD1999BC1D57AE6C0000000049454E44AE426082}
        TabOrder = 9
        OnClick = _irParaLog
      end
      object cxLabel17: TcxLabel
        Left = 102
        Top = 358
        Caption = 'Consultar log'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -24
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.TextColor = clNavy
        Style.IsFontAssigned = True
        Transparent = True
        OnClick = _irParaLog
      end
      object cxLabel23: TcxLabel
        Left = 105
        Top = 391
        Caption = 
          'Permite a consulta dos logs de avalia'#231#227'o de pedidos e altera'#231#227'o ' +
          'feitas pela rotina.'
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
        Width = 380
      end
      object btnConfiguracoes: TcxButton
        Left = 16
        Top = 462
        Width = 80
        Height = 80
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000016744558745469746C650053686F77416C6C3B4F707469
          6F6E733B88C98C0E0000085149444154785EAD560B5055C719FECEE3BEB87841
          63A2A2D82201A2E3AB89234DA8821A1F8836468962A73569C7B434339954AB9D
          B44E489B99C6769C69DAC6EA643A16B524D1511345020828082A81E20B545434
          2AA012B8DC0BDC07F775CEED7F76CE43066AA69DEEB97BF6ECEEBFFBFFFFB7FF
          F7EFE5002895FFC7A1A62A9EE7B3305289AA2F8EDEEC9B53078D7936F7685F17
          8B4296E49A8D7973170390D848D4582B6AA28AF21FAD9A8DFF4F89D2C3E966EE
          3D7241718C6706A8659801B26A156B1F5B98BB431DA58F287B291D0D0A99C9F1
          3C756515B661D001BCBEC710C5C31136E0E5A0C8D2A34D18DFA0396DD8382F6A
          64D580E185D762201296D942B6017B00A7DB87F29A2BF8E0A3726CFAEDA7F813
          B5E5A75BD04BE34C8E5E4A95D93743CF18532AA82F03A1B0F4A8B31809017D21
          7BA220255E94545D82D3E5C5B20533F1875FBF82A50B6752DF87929397D9BCBA
          C630DA0085BD64B52FCB0C811151E08D185085546F2EB4DC8359143123752C8E
          1D3F81DC1F6E41F1B10A4CA7BE491070BEB95D81995530E59CB15875442BB24E
          9DE145D485E4A8860493BD7EFB6BBC386F2A8E1E2BC389AA7AB66959651D2459
          C2CBAB96A3AAEE1A16CD9B3684A6D48C404D7A2463E63FB34096151DBA475DDD
          1E24258E45ED9926489108D846245353D7884D6F6EC0C3AF07A0F179DFE126C0
          809F95D772E7A8487064F4E311E0341AEA7E509D386134EE74BAF07CFA2C949F
          A865E3CA3E19E93371B7B3179312C64023CE8635CF216A704C47922120EB31C0
          3D3E08194C2C6AD979A6258FC795EB0F90B36C3E5E5CF402AC163396529BB37C
          211B4FA5F9A8F6E874D44340DF0B46103EFE082412524D605C9F313501A7CEDE
          C457F703589F978B5F6DD988F64E37AEDC78C0209DF1CC44A6C8386F5533C791
          62AA00A0B2C462111FA53C897023B040D6F9CC163946D9B0E085148C89B7E374
          C32DECD8750AB50DB731262E96C6D310E7B032399E032C261E7652C249126C26
          41E933AF2D661EA200BCBAFA3B00206846FCF2DD5DD85CF0376C7E67273875C2
          FEFECEAAFE5FBC9E857058529D1A9A7687C5B9CA2C9B5980B3D785B30D5771EB
          DE7DA44D998497B233100849CC90A36567D0DAD601A7D379D0EB1DF873E1CEDF
          350204924A3B1EFF73319257C3F956244E7A125BDE580B411050F76533044EC6
          196A95FEDB6FAEC7FAD54BD6C5D81D3F5375EAF1C26B2C6054613FA3BAFA7D38
          75E61A76155662DBF643D85D5885EAB3D7E072FB5872A187E5058E0742A10822
          B447F6E274DCB8D5816DEFEFC1756A572EC9A071C03F1884140EF9B5A310789E
          13049ED38290719C514DB5C24DCA2B4F5F010962D1FCE9F876E293B8DBDE83BB
          1D3DE8EFF7222ED64C676C224F0151E0D1D7EF0147ECF17882F8C90F72209A04
          48C42C7F20089EE3D037E041281C92019854A765A50E6101D32CB3AB15CDD73A
          58CACD59FA2CB52CAA913C651CA6A54E80DFEB25782F226E941D3E5F00179ADB
          F06A5E36C21109CA3EEE013FC9EB883203E6A5CF46CBD5B6FC0DF90583022F8C
          03C7C9FD7DCE9D462664FC878E40DB9D6E643E9F069167CA755A59441E65E72E
          213ECE41D9D2CD66F25F5B85D8583BBC640C19A02BD6DE1235B22421FFC76BC4
          8AEA86AD89094FB199C2A2A3BC7E046A2AD6B9DDDDE345E2C427D4746B503D18
          0CE1524B1B7EB36903045164600E06C3E8F7F8690F2D93E894662548F3C15018
          A2C8518C64B04447002846E7EAA9981419198D34258C8B47C77D1792268F5506
          D46D019194A610D52A6A1AB128732EFA3C834C13D38D2851D28D83078AD1D1F9
          1013274EC0EA35CB60B3C7B27DC3E128DA075D183D3A16151575E875BA0A8D44
          2431F0F53F11C9494FE17A5B17221199A1A05616E9EB5E5E48DE4AD8F749096C
          56338D49AC2FD11E870F9762F68C14FC65C756CC9A9E8CD292934C794492484E
          A6A38BC1BEFD9FA3B4ACB2E0D0FE1DDB78E3CE6641A8E7F1A9291358CAADAC6D
          C59D0E271922110B9C385AD98CD6DB3D5890311B575A6FC1C483457B5892994C
          5F5F3FB232E720446399DF7B164EF70031C606891C91A92A817DA3ED2B1C3FB4
          7B0F80083F3408B504C1512AB62263EED38877C4A0BEE90EE5823A345D6EC7BC
          39C9484B7A02A5555F62FAB4A7C10B02792713BC54A94D499982FA8616F05109
          0D4D5791969204516094644879BC83782635094B5FDAF83A0033A7F2327EF37B
          9F75BFB32907817064D8D54A1F3A3AA32C51EC25E813C68F433625991E9787E2
          C0AF53189070AEFE22DA3B1E22E95B93B0306B2E22A4BCCB39A0533389B26669
          7935BE28ABDEFB482232AED6E177018DAB6D381241EBCD7BC8CBCDA6E4E363B0
          133B685C9993185516647D17A31D76B6C6DDE743B7DBC3E8C9F3408CCD8CCE6E
          173233D3515DDBB85643C0F156C11167C1D6E50038D5134DB7A15E22EBEC245D
          74F00B982D36CA961E46D3F4E76641B458E00F86A92F6B31A52347BE91720EB2
          14417DFD79381CB1B090FCE79F957CACDF863F7FBBA8D864B266AA600FBB7438
          325FE481EF2F998EC9E36D38D7781916B319031E2F9A2EDDC0DA5756928C8890
          1451F3C9D04C18090571E04071B0FDDEEDBF0B8268E6057194BBF7E15F39655E
          45C1C2AA76418D5C347941AD2200EBFCC579F9392BB2DFC8CACA402F411E1B6B
          854914100884E1F1FB61B75A71B2EA34EA6A6A3FAC3B79E08F00060144008444
          F5A0C32C7A8000BEA9188668E8D94C664B28DE318A5D4E36AB09470E95E02651
          2D9518B162C51204C361067B94D29FAADCA71A1015A3545423E46FD44A50AE5C
          F7168AF66C276EC7686880B0370BE4F1602080B367FF858B17CEEFAEADF8E403
          EFE2F55B26278EFF69726A0A3B065A6F5114AB55EE72F64779FC9745962496F3
          E9BF826678C4DDDBBDBFE8E3237B7FBFFD436F55E5A9E3A4FC3D00CEBACA4FDF
          2D2E2E3FFED1EE42DFB1E2D2FDEEDEAE7F020829EB1EF4F411F1A2F8378483D6
          24C4E982C70000000049454E44AE426082}
        TabOrder = 12
        OnClick = _irParaConfig
      end
      object cxLabel32: TcxLabel
        Left = 102
        Top = 470
        Caption = 'Configura'#231#245'es'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -24
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.TextColor = clNavy
        Style.IsFontAssigned = True
        Transparent = True
        OnClick = _irParaConfig
      end
      object cxLabel33: TcxLabel
        Left = 105
        Top = 503
        Caption = 'Defini'#231#227'o das configura'#231#245'es da rotina'
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
        Width = 220
      end
    end
    object tabExecucaoManual: TcxTabSheet
      Caption = 'tabExecucaoManual'
      ImageIndex = 1
      OnShow = tabExecucaoManualShow
      DesignSize = (
        968
        564)
      object Shape1: TShape
        Left = 7
        Top = 503
        Width = 10
        Height = 10
        Anchors = [akLeft, akBottom]
        Brush.Color = clRed
        Pen.Color = clRed
        ExplicitTop = 336
      end
      object Shape2: TShape
        Left = 207
        Top = 503
        Width = 10
        Height = 10
        Anchors = [akLeft, akBottom]
        Brush.Color = clBlue
        Pen.Color = clBlue
        ExplicitTop = 336
      end
      object btnVoltarMenu1: TcxButton
        Left = 7
        Top = 531
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
        Height = 336
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
        Top = 531
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
        Top = 498
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
        Top = 498
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
        Top = 478
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
        564)
      object btnVoltarMenu2: TcxButton
        Left = 7
        Top = 531
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
      object btnEdtUsuarioAuto: TcxButtonEdit
        Left = 7
        Top = 23
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        Properties.OnButtonClick = btnEdtUsuarioAutoPropertiesButtonClick
        StyleFocused.BorderColor = 33023
        TabOrder = 2
        OnExit = btnEdtUsuarioAutoExit
        Width = 100
      end
      object edtDescricaoUsuarioAuto: TcxTextEdit
        Left = 108
        Top = 23
        Enabled = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Width = 225
      end
      object spnQtdDias: TcxSpinEdit
        Left = 7
        Top = 79
        Properties.MinValue = 1.000000000000000000
        StyleFocused.BorderColor = 33023
        TabOrder = 4
        Value = 1
        Width = 100
      end
      object spnIntervaloMinutos: TcxSpinEdit
        Left = 7
        Top = 133
        Properties.MinValue = 1.000000000000000000
        StyleFocused.BorderColor = 33023
        TabOrder = 5
        Value = 1
        Width = 100
      end
      object spnQtdLinhas: TcxSpinEdit
        Left = 7
        Top = 188
        Properties.MinValue = 100.000000000000000000
        StyleFocused.BorderColor = 33023
        TabOrder = 6
        Value = 100
        Width = 100
      end
      object cxLabel18: TcxLabel
        Left = 7
        Top = 60
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
        Top = 115
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
        Top = 169
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
        TabOrder = 10
        Height = 489
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
        Top = 244
        Properties.ReadOnly = True
        TabOrder = 12
        Width = 154
      end
      object cxLabel22: TcxLabel
        Left = 7
        Top = 224
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
      object btnPararAuto: TcxButton
        Left = 835
        Top = 531
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
        TabOrder = 14
        OnClick = btnPararAutoClick
      end
      object btnPlayAuto: TcxButton
        Left = 699
        Top = 531
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
        TabOrder = 15
        OnClick = btnPlayAutoClick
      end
    end
    object tabLog: TcxTabSheet
      Caption = 'tabLog'
      ImageIndex = 3
      DesignSize = (
        968
        564)
      object Shape3: TShape
        Left = 7
        Top = 503
        Width = 10
        Height = 10
        Anchors = [akLeft, akBottom]
        Brush.Color = clRed
        Pen.Color = clRed
        ExplicitTop = 389
      end
      object Shape4: TShape
        Left = 207
        Top = 503
        Width = 10
        Height = 10
        Anchors = [akLeft, akBottom]
        Brush.Color = clBlue
        Pen.Color = clBlue
        ExplicitTop = 389
      end
      object cxLabel24: TcxLabel
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
      object cxLabel25: TcxLabel
        Left = 7
        Top = 25
        Caption = 'De'
        Transparent = True
      end
      object dtLogInicial: TcxDateEdit
        Left = 28
        Top = 24
        StyleFocused.BorderColor = 33023
        TabOrder = 2
        Width = 121
      end
      object cxLabel26: TcxLabel
        Left = 159
        Top = 28
        Caption = 'at'#233
        Transparent = True
      end
      object dtLogFinal: TcxDateEdit
        Left = 189
        Top = 24
        StyleFocused.BorderColor = 33023
        TabOrder = 4
        Width = 121
      end
      object cxLabel27: TcxLabel
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
      object mskNumeroLog: TcxMaskEdit
        Left = 374
        Top = 24
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        StyleFocused.BorderColor = 33023
        TabOrder = 6
        Width = 121
      end
      object cxLabel28: TcxLabel
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
      object btnEdtCodClienteLog: TcxButtonEdit
        Left = 7
        Top = 79
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        Properties.OnButtonClick = btnEdtCodClienteLogPropertiesButtonClick
        StyleFocused.BorderColor = 33023
        TabOrder = 8
        OnExit = btnEdtCodClienteLogExit
        Width = 100
      end
      object edtDescricaoLog: TcxTextEdit
        Left = 108
        Top = 79
        Enabled = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Width = 225
      end
      object cxLabel29: TcxLabel
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
      object btnEdtCodRCALog: TcxButtonEdit
        Left = 374
        Top = 79
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        Properties.OnButtonClick = btnEdtCodRCALogPropertiesButtonClick
        StyleFocused.BorderColor = 33023
        TabOrder = 11
        OnExit = btnEdtCodRCALogExit
        Width = 100
      end
      object edtDescricaoRCALog: TcxTextEdit
        Left = 475
        Top = 79
        Enabled = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Width = 225
      end
      object btnVoltarMenu3: TcxButton
        Left = 7
        Top = 531
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
        TabOrder = 13
        OnClick = _irParaMenu
      end
      object cxLabel30: TcxLabel
        Left = 23
        Top = 498
        Anchors = [akLeft, akBottom]
        Caption = 'Pedido que teve corte'
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
      object cxLabel31: TcxLabel
        Left = 223
        Top = 498
        Anchors = [akLeft, akBottom]
        Caption = 'Pedido que n'#227'o teve corte'
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
      object btnPesquisarLog: TcxButton
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
        TabOrder = 16
        OnClick = btnPesquisarLogClick
      end
      object btnVerItensLog: TcxButton
        Left = 833
        Top = 531
        Width = 130
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Ver itens'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001E744558745469746C6500426F726465724C696E655374796C653B42
          6F72646572733BAD5F115B0000013A49444154785EA553C14A03410C4DEA5041
          FF42BC8B7AD1DADA9B78F60FC49BE807D47A120F22887F207E8A68110F6E15EF
          FA0BEDBAAD8B48374E2633A4EC0A037698CCBE37C9262F61178908665918B98B
          19E1DEE59B6A20DECC10CA77281048DC900D73B8BBD8A899D402725128F12132
          BCA6581CB2219CA8F6AF45B87CD0ABDE12494AAF0A8382D2F97ED372A8F6B702
          6939A2B0C0DDF357E9D285EB0C46690E8F579BF33B672FDFCEE7AB86418EADFF
          E9BA61CCE7200F85A6A5FB50C094FD0C358714F3DDF163AE2431606289911627
          B8B47F2FB0EA2F41B49BCB6BBA8FDBB683C65729422FC22B0A946BFC04DAA77D
          DAB6B67EDCE3808556B74FCD6E426B470FCC179B2709B1AD1E0ADFEA3C53A393
          D08AF0BAC9866320558CA381E568A91F7D6639A00E354BBF64C8A45F625D25A9
          C42897923F33FFCEBFE620B4ADEBA2E1D80000000049454E44AE426082}
        TabOrder = 17
        OnClick = _VerLogItens
      end
      object cxGrid1: TcxGrid
        Left = 7
        Top = 139
        Width = 958
        Height = 336
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 18
        object grdLogPedidos: TcxGridDBTableView
          OnDblClick = _VerLogItens
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DmdBD.dsrConsultaLogCabecalho
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = grdLogPedidosNUMPED
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = 'Sem dados a serem exibidos'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.OnGetContentStyle = grdLogPedidosStylesGetContentStyle
          object grdLogPedidosNUMPED: TcxGridDBColumn
            DataBinding.FieldName = 'NUMPED'
          end
          object grdLogPedidosDATA: TcxGridDBColumn
            DataBinding.FieldName = 'DATA'
          end
          object grdLogPedidosCODUSUARIO: TcxGridDBColumn
            DataBinding.FieldName = 'CODUSUARIO'
          end
          object grdLogPedidosUSUARIO: TcxGridDBColumn
            DataBinding.FieldName = 'USUARIO'
          end
          object grdLogPedidosCODCLI: TcxGridDBColumn
            DataBinding.FieldName = 'CODCLI'
          end
          object grdLogPedidosCLIENTE: TcxGridDBColumn
            DataBinding.FieldName = 'CLIENTE'
          end
          object grdLogPedidosCORTE: TcxGridDBColumn
            DataBinding.FieldName = 'CORTE'
          end
          object grdLogPedidosVLTOTALANTES: TcxGridDBColumn
            DataBinding.FieldName = 'VLTOTALANTES'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLTOTALDEPOIS: TcxGridDBColumn
            DataBinding.FieldName = 'VLTOTALDEPOIS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLTABELAANTES: TcxGridDBColumn
            DataBinding.FieldName = 'VLTABELAANTES'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLTABELADEPOIS: TcxGridDBColumn
            DataBinding.FieldName = 'VLTABELADEPOIS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLATENDANTES: TcxGridDBColumn
            DataBinding.FieldName = 'VLATENDANTES'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLATENDDEPOIS: TcxGridDBColumn
            Caption = 'VL. ATEND. DEPOIS'
            DataBinding.FieldName = 'VLATENDDEPOIS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLCUSTOREPANTES: TcxGridDBColumn
            Caption = 'VL. CUSTO REP. ANTES'
            DataBinding.FieldName = 'VLCUSTOREPANTES'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLCUSTOREPDEPOIS: TcxGridDBColumn
            DataBinding.FieldName = 'VLCUSTOREPDEPOIS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLCUSTOCONTANTES: TcxGridDBColumn
            DataBinding.FieldName = 'VLCUSTOCONTANTES'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLCUSTOCONTDEPOIS: TcxGridDBColumn
            DataBinding.FieldName = 'VLCUSTOCONTDEPOIS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLCUSTOREALANTES: TcxGridDBColumn
            DataBinding.FieldName = 'VLCUSTOREALANTES'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLCUSTOREALDEPOIS: TcxGridDBColumn
            DataBinding.FieldName = 'VLCUSTOREALDEPOIS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLCUSTOFINANTES: TcxGridDBColumn
            DataBinding.FieldName = 'VLCUSTOFINANTES'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosVLCUSTOFINDEPOIS: TcxGridDBColumn
            DataBinding.FieldName = 'VLCUSTOFINDEPOIS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object grdLogPedidosNUMITENSANTES: TcxGridDBColumn
            DataBinding.FieldName = 'NUMITENSANTES'
          end
          object grdLogPedidosNUMITENSDEPOIS: TcxGridDBColumn
            DataBinding.FieldName = 'NUMITENSDEPOIS'
          end
          object grdLogPedidosTOTPESOANTES: TcxGridDBColumn
            DataBinding.FieldName = 'TOTPESOANTES'
          end
          object grdLogPedidosTOTPESODEPOIS: TcxGridDBColumn
            DataBinding.FieldName = 'TOTPESODEPOIS'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = grdLogPedidos
        end
      end
    end
    object tabConfig: TcxTabSheet
      Caption = 'tabConfig'
      ImageIndex = 4
      OnShow = tabConfigShow
      DesignSize = (
        968
        564)
      object grdConfigQtPendente: TcxGroupBox
        Left = 16
        Top = 24
        Caption = 'QT. PENDENTE: Tratamento do campo qt. pendente'
        TabOrder = 0
        Height = 97
        Width = 857
        object radNaoFazerNadaQtPendente: TcxRadioButton
          Left = 16
          Top = 59
          Width = 265
          Height = 17
          Caption = 'N'#227'o alterar o campo QT. PENDENTE'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = radNaoFazerNadaQtPendenteClick
          Transparent = True
        end
        object radDeduzirQtPendente: TcxRadioButton
          Left = 328
          Top = 59
          Width = 393
          Height = 17
          Caption = 'Deduzir quantidade do campo QT. PENDENTE'
          TabOrder = 1
          OnClick = radDeduzirQtPendenteClick
          Transparent = True
        end
        object cxLabel34: TcxLabel
          Left = 16
          Top = 22
          Caption = 'O que deve ser feito em rela'#231#227'o ao campo QT. PENDENTE?'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
      object btnSalvarConfiguracoes: TcxButton
        Left = 754
        Top = 531
        Width = 211
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Salvar configura'#231#245'es'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000B744558745469746C6500536176653BF9E8F9090000020349444154
          785E7D52316B145110FEDEE6EE9A03EF2E57284A6C6DAC42C0262185829D0A36
          16820AFE010BADC47F60AB2022585A588875B01041822158D858081204956872
          DC5DD6DD3733CF99D93DD713CCC0F7BEF776E7FB66E6ED0654912982633EFCFC
          9F67A2603B2CAC9DBFB2810CEB4B274EE1E4D271B0303832A24450A94C113112
          2846ECED8F301A7DB59CD76F379E9F6D9901425A5F3DB38C4F9FC7B87BE70690
          60E1E49C80BC886049B87EF33656964F6373EBFD1A8096190466017352B0ABA6
          BF22C4D5C9C5972E5CD632010F1F3F0553C4CECE17088B8F9ED99292B898884C
          EFE2548B270711D942867E7F114717BB9E0308582A83962D2C6EE0EE2925EFA6
          245671899205ED561B9D4EA77EC7CA6D887063904CCCE29735C923BEEF4F91C4
          A771DC7FF008C7865DEF88896B23FA6310BC03226FEFEAB55B9A203E63823143
          5490445C3883D05F23F8FCC228F26F180C06B3CB730059BD57866F20229EDF18
          D42358BC78F60487C5EAB98B5A6408E63903B1F6BD358B9FE302F06D729610BC
          B2AE20B63CF9D780602072579FB9F98B6082E6DF8D044932FF156CA648EC89F7
          5E7E844802299851B3C26667F30BCAF31D043B3091DFC3917E0F5C895C1C4D3C
          03E095C79303A4CA20984111CBFCDDE6D6F6CA70D0C39B571F2A7164AF129589
          14C65E59B0FB631765596C03C8030033E929BA8A0C4D8443F6A2982AF67E037E
          F6AC9379188DF20000000049454E44AE426082}
        TabOrder = 1
        OnClick = btnSalvarConfiguracoesClick
      end
      object cxButton1: TcxButton
        Left = 8
        Top = 531
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
        TabOrder = 2
        OnClick = _irParaMenu
      end
      object grpConfigQtPendente2: TcxGroupBox
        Left = 16
        Top = 143
        Caption = 
          'QT. PENDENTE EM PEDIDOS CORTADOS: Tratamento do campo qt. penden' +
          'te quando houver corte dos pedidos'
        TabOrder = 3
        Height = 105
        Width = 857
        object cxLabel35: TcxLabel
          Left = 16
          Top = 22
          Caption = 
            'Quando houver cortes de itens no pedido, a quantidade deduzida d' +
            'o campo QT. PENDENTE deve ser:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object radQtdOriginalQtCorte: TcxRadioButton
          Left = 16
          Top = 59
          Width = 297
          Height = 17
          Caption = 'A quantidade original do item no pedido'
          Checked = True
          TabOrder = 1
          TabStop = True
          Transparent = True
        end
        object radQtdAposCorteQtCorte: TcxRadioButton
          Left = 328
          Top = 59
          Width = 449
          Height = 17
          Caption = 'A quantidade do item no pedido ap'#243's a realiza'#231#227'o do corte'
          TabOrder = 2
          Transparent = True
        end
      end
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = False
    SkinName = 'SevenClassic'
    Left = 864
    Top = 80
  end
  object styRepo: TcxStyleRepository
    Left = 922
    Top = 30
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
    object stySemCorte: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlue
    end
    object styComCorte: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
  end
  object timer: TTimer
    Interval = 10000
    OnTimer = timerTimer
    Left = 882
    Top = 166
  end
end
