unit UConsultasWinthor;
interface

uses DB, DBClient, SysUtils, Forms, Dialogs, cxButtonEdit, cxTextEdit, Messages, UMensagem,
FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TTipoConsulta = ( cliente, produto, cobranca, fornecedor, departamento,
                    secao, categoria, subcategoria, praca, distribuidora,
                    regiao, rota, motorista, veiculo, centroCusto, setor,
                    conta, grupoConta, banco, moeda, equipe, comprador,
                    usuario, rca, supervisor, transbordo, filial, transportadora,
                    motivoReentrega, ncm, grupoBem, produtoCiap, ramoAtividade );

type
  TTipoPesquisa = ( porCodigo, porDescricao, porCrachaFuncionario, porCNPJ, porCPF, porCodigoFormulario );

type
  TOpcaoPesquisa = ( nenhuma, incluirInativos, apenasAtivos, apenasInativos );

type
  TConsulta = Class

    private

      class var opcaoPesquisa : TOpcaoPesquisa;


      class function GetSQLTextPorCodigo(tipoConsulta : TTipoConsulta) : String;
      class function GetSQLTextPorDescricao(tipoConsulta : TTipoConsulta) : String;
      class function GetSQLTextPorCrachaFuncionario(tipoConsulta : TTipoConsulta) : String;
      class function GetSQLTextPorCNPJ(tipoConsulta : TTipoConsulta) : string;
      class function GetSQLTextPorCPF(tipoConsulta : TTipoConsulta) : string;
      class function GetSQLTextPorCodigoFormulario(tipoConsulta : TTipoConsulta) : string;
      class function GetQuery(tipoConsulta : TTipoConsulta; tipoPesquisa : TTipoPesquisa) : TFDQuery;
      class function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;

    published
      class function Opcao( opcaoPesquisa : TOpcaoPesquisa ) : TConsulta;
      class function PesquisarPorCodigo( tipoConsulta : TTipoConsulta; codigoPesquisa : Variant; tipoPesquisa : TTipoPesquisa = porCodigo) : String;
      class function PesquisarPorDescricao( tipoConsulta : TTipoConsulta; descricaoPesquisa : String; dataSource : TDataSource ) : Integer;
      class function PesquisarPorCNPJ(tipoConsulta : TTipoConsulta; cnpj : string; dataSource : TDataSource ) : integer;
      class function PesquisarPorCPF(tipoConsulta : TTipoConsulta; cpf : string; dataSource : TDataSource ) : integer;
      class function PesquisarPorCodigoFormulario(tipoConsulta : TTipoConsulta; codigoPesquisa : string; dataSource : TDataSource ) : integer;
      class function Pesquisar( tipoConsulta : TTipoConsulta ) : String;

  end;



// Utilidades
function BotaoPesquisaOnExit(  TipoConsulta : TTipoConsulta; ButtonEdit : TcxButtonEdit; TextEdit : TcxTextEdit; MensagemDeErro : String ) : Boolean;
function BotaoPesquisaOnButtonClick( TipoConsulta : TTipoConsulta; ButtonEdit : TcxButtonEdit; Formulario : TForm ) : Boolean;



implementation

uses UFrmConsultaWinthor, UFrmConsultaWinthorFornecedor, uConexaoBD;

{ TConsulta }

class function TConsulta.GetQuery(tipoConsulta: TTipoConsulta;
  tipoPesquisa: TTipoPesquisa): TFDQuery;
var
  query : TFDQuery;
  sql_text : String;
begin

  sql_text := '';


  { Obtendo o SQL Text correnspondente à pesquisa }

  if ( tipoPesquisa = porCodigo ) then
  begin

    sql_text := TConsulta.GetSQLTextPorCodigo(tipoConsulta);
  end

  else if ( tipoPesquisa = porDescricao ) then
  begin

    sql_text := TConsulta.GetSQLTextPorDescricao(tipoConsulta);
    sql_text := sql_text + ' ORDER BY DESCRICAO ';
  end

  else if ( tipoPesquisa = porCrachaFuncionario ) then
  begin

    sql_text := TConsulta.GetSQLTextPorCrachaFuncionario(tipoConsulta);
  end

  else if (tipoPesquisa = porCNPJ) then
  begin

    sql_text := TConsulta.GetSQLTextPorCNPJ(tipoConsulta);
  end

  else if (tipoPesquisa = porCPF) then
  begin

    sql_text := TConsulta.GetSQLTextPorCPF(tipoConsulta);
  end

  else if (tipoPesquisa = porCodigoFormulario) then
  begin

    sql_text := TConsulta.GetSQLTextPorCodigoFormulario(tipoConsulta);
  end;


  { Se o SQL Text foi definido }

  query := nil;

  if ( sql_text <> '') then
  begin

    query := TFDQuery.Create(nil);
    query.Connection  := FDacDatabase;
    query.SQL.Text := sql_text;

  end;

  Result := query;

end;

class function TConsulta.IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
begin

  if Expressao then

     Result := ParteTRUE

  else

     Result := ParteFALSE;

end;

class function TConsulta.GetSQLTextPorCNPJ(tipoConsulta: TTipoConsulta): string;
var
  sql : String;
begin

  if tipoConsulta <> fornecedor then
  begin

    Result := '';
    Exit;
  end;


  sql := ' select TO_CHAR(CODFORNEC) AS CODIGO, FORNECEDOR AS DESCRICAO, regexp_replace(cgc, ''[^0-9]'', '''') cgc ';
  sql := sql + 'from pcfornec where regexp_replace(cgc, ''[^0-9]'', '''') like regexp_replace(:BUSCA, ''[^0-9]'', '''') || ''%'' ';
  sql := sql + ' and tipopessoa = ''J'' ';

  Result := sql;

end;

class function TConsulta.GetSQLTextPorCodigo(
  tipoConsulta: TTipoConsulta): String;
begin


  Result := '';


  { É imprescindível que a consulta retorne os campos CODIGO e DESCRICAO,
    e os campos devem ser retornados como texto }

  case tipoConsulta of
    cliente:
      result := ' SELECT TO_CHAR(CODCLI) AS CODIGO, CLIENTE AS DESCRICAO FROM PCCLIENT WHERE CODCLI = :BUSCA ' +
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND DTBLOQ IS NULL ','') +
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND DTBLOQ IS NOT NULL ','');

    produto:
      result := ' SELECT TO_CHAR(CODPROD) AS CODIGO, DESCRICAO FROM PCPRODUT WHERE CODPROD = :BUSCA ';

    cobranca:
      result := ' SELECT TO_CHAR(CODCOB) AS CODIGO, COBRANCA AS DESCRICAO FROM PCCOB WHERE CODCOB = :BUSCA';

    fornecedor:
      result := ' SELECT TO_CHAR(CODFORNEC) AS CODIGO, FORNECEDOR AS DESCRICAO FROM PCFORNEC WHERE CODFORNEC = :BUSCA ';

    departamento:
      result := ' SELECT TO_CHAR(CODEPTO) AS CODIGO, DESCRICAO FROM PCDEPTO WHERE CODEPTO = :BUSCA ';

    secao:
      result := ' SELECT TO_CHAR(CODSEC) AS CODIGO, DESCRICAO FROM PCSECAO WHERE CODSEC = :BUSCA ';

    categoria:
      result := ' SELECT TO_CHAR(CODCATEGORIA) AS CODIGO, CATEGORIA AS DESCRICAO FROM PCCATEGORIA WHERE CODCATEGORIA = :BUSCA ';

    subcategoria:
      result := ' SELECT TO_CHAR(CODSUBCATEGORIA) AS CODIGO, SUBCATEGORIA AS DESCRICAO FROM PCSUBCATEGORIA WHERE CODSUBCATEGORIA = :BUSCA ';

    praca:
      result := ' SELECT TO_CHAR(CODPRACA) AS CODIGO, PRACA AS DESCRICAO FROM PCPRACA WHERE CODPRACA = :BUSCA ';

    distribuidora:
      result := ' SELECT TO_CHAR(CODDISTRIB) AS CODIGO, DESCRICAO FROM PCDISTRIB WHERE CODDISTRIB = :BUSCA ';

    regiao:
      result := ' SELECT TO_CHAR(NUMREGIAO) AS CODIGO, REGIAO AS DESCRICAO FROM PCREGIAO WHERE NUMREGIAO = :BUSCA ';

    rota:
      result := ' SELECT TO_CHAR(CODROTA) AS CODIGO, DESCRICAO FROM PCROTAEXP WHERE CODROTA = :BUSCA';

    motorista:
      result := ' SELECT TO_CHAR(MATRICULA) AS CODIGO, NOME AS DESCRICAO FROM PCEMPR WHERE TIPO = ''M'' AND MATRICULA = :BUSCA '+
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND SITUACAO = ''A'' ','') +
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND SITUACAO <> ''A'' ','');

    veiculo:
      result := ' SELECT TO_CHAR(CODVEICULO) AS CODIGO, DESCRICAO FROM PCVEICUL WHERE CODVEICULO = :BUSCA ';

    centroCusto:
      result := ' SELECT CODIGOCENTROCUSTO AS CODIGO, DESCRICAO FROM PCCENTROCUSTO WHERE CODIGOCENTROCUSTO = :BUSCA ';

    setor:
      result := ' SELECT TO_CHAR(CODSETOR) AS CODIGO, DESCRICAO FROM PCSETOR WHERE CODSETOR = :BUSCA ';

    conta:
      result := ' SELECT TO_CHAR(CODCONTA) AS CODIGO, CONTA AS DESCRICAO FROM PCCONTA WHERE CODCONTA = :BUSCA ' +
                    iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND TIPO <> ''I'' ','') +
                    iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND TIPO = ''I'' ','');

    grupoConta:
      result := ' SELECT TO_CHAR(CODGRUPO) AS CODIGO, GRUPO AS DESCRICAO FROM PCGRUPO WHERE CODGRUPO = :BUSCA ';

    banco:
      result := ' SELECT TO_CHAR(CODBANCO) AS CODIGO, NOME AS DESCRICAO FROM PCBANCO WHERE CODBANCO = :BUSCA ';

    moeda:
      result := ' SELECT CODMOEDA AS CODIGO, MOEDA AS DESCRICAO FROM PCMOEDA WHERE CODMOEDA = :BUSCA ';

    equipe:
      result := ' SELECT TO_CHAR(CODEQUIPE) AS CODIGO, DESCRICAO FROM BOEQUIPE WHERE CODEQUIPE = :BUSCA' ;

    comprador:
      result := ' SELECT TO_CHAR(MATRICULA) AS CODIGO, NOME AS DESCRICAO FROM PCEMPR WHERE CODSETOR = 2 AND MATRICULA = :BUSCA '+
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND SITUACAO = ''A'' ','')+
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND SITUACAO <> ''A'' ','');

    usuario:
      result := ' SELECT TO_CHAR(MATRICULA) AS CODIGO, NOME AS DESCRICAO FROM PCEMPR WHERE MATRICULA = :BUSCA '+
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND SITUACAO = ''A'' ','')+
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND SITUACAO <> ''A'' ','');

    rca:
      result := ' SELECT TO_CHAR(CODUSUR) AS CODIGO, NOME AS DESCRICAO FROM PCUSUARI WHERE CODUSUR = :BUSCA ';

    supervisor:
      result := ' SELECT TO_CHAR(CODSUPERVISOR) AS CODIGO, NOME AS DESCRICAO FROM PCSUPERV WHERE CODSUPERVISOR = :BUSCA ';

    transbordo:
      result := ' SELECT TO_CHAR(CODBASE) AS CODIGO, DESCRICAO FROM BOTRANSBORDO WHERE TO_NUMBER(CODBASE) = :BUSCA ' +
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND DTEXCLUSAO IS NULL ','') +
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND DTEXCLUSAO IS NOT NULL ','');

    filial:
      result := ' SELECT TO_CHAR(CODIGO) AS CODIGO, FANTASIA AS DESCRICAO FROM PCFILIAL WHERE TO_NUMBER(CODIGO) = :BUSCA ';

    transportadora:
      result := ' SELECT TO_CHAR(CODFORNEC) AS CODIGO, FORNECEDOR AS DESCRICAO FROM PCFORNEC WHERE REVENDA = ''T'' AND CODFORNEC = :BUSCA ';

    motivoReentrega:
      Result := ' SELECT to_char(CODDEVOL) AS CODIGO, MOTIVO AS DESCRICAO FROM PCTABDEV WHERE NVL(MOTIVOREENTREGA, ''N'') = ''S'' AND CODDEVOL = :BUSCA ';

    ncm:
      Result := ' SELECT to_char(CODNCM) as CODIGO , SUBSTR(descricao,1,100) as DESCRICAO FROM PCNCM where codncm = :BUSCA ';

    grupoBem:
      Result := 'select to_char(codgrupo) as codigo, descgrupo as descricao from pcbensgrupo where codgrupo = :BUSCA ';

    produtoCiap:
      Result := ' select to_char(codprod) as codigo, descricao from pcprodciap where codprod = :BUSCA ';

    ramoAtividade:
      Result := ' select to_char(codativ) as codigo, ramo as descricao from pcativi where codativ = :BUSCA ';
  end;


end;

class function TConsulta.GetSQLTextPorCodigoFormulario(
  tipoConsulta: TTipoConsulta): string;
begin

  if tipoConsulta <> fornecedor then
  begin

    Result := '';
    Exit;
  end;

  Result := 'SELECT TO_CHAR(CODFORNEC) AS CODIGO, FORNECEDOR AS DESCRICAO FROM PCFORNEC WHERE CODFORNEC = :BUSCA';
end;

class function TConsulta.GetSQLTextPorCPF(tipoConsulta: TTipoConsulta): string;
var
  sql : String;
begin

  if tipoConsulta <> fornecedor then
  begin

    Result := '';
    Exit;
  end;


  sql := ' select TO_CHAR(CODFORNEC) AS CODIGO, FORNECEDOR AS DESCRICAO, regexp_replace(cgc, ''[^0-9]'', '''') cgc ';
  sql := sql + 'from pcfornec where regexp_replace(cgc, ''[^0-9]'', '''') like regexp_replace(:BUSCA, ''[^0-9]'', '''') || ''%'' ';
  sql := sql + ' and tipopessoa = ''F'' ';

  Result := sql;
end;

class function TConsulta.GetSQLTextPorCrachaFuncionario(

  tipoConsulta: TTipoConsulta): String;
begin

  Result := '';

  if ( tipoConsulta = usuario ) then
  begin

    result := ' SELECT TO_CHAR(MATRICULA) AS CODIGO, NOME AS DESCRICAO FROM PCEMPR WHERE CODBARRA = :BUSCA ';
  end;

end;

class function TConsulta.GetSQLTextPorDescricao(
  tipoConsulta: TTipoConsulta): String;
begin

  Result := '';


  { É imprescindível que a consulta retorne os campos CODIGO e DESCRICAO,
    e os campos devem ser retornados como texto }

  case tipoConsulta of
    cliente:
      result := ' SELECT TO_CHAR(CODCLI) AS CODIGO, CLIENTE AS DESCRICAO FROM PCCLIENT WHERE CLIENTE LIKE ''%'' || :BUSCA || ''%'' '+
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND DTBLOQ IS NULL ','') +
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND DTBLOQ IS NOT NULL ','');

    produto:
      result := ' SELECT TO_CHAR(CODPROD) AS CODIGO, DESCRICAO FROM PCPRODUT WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ';

    cobranca:
      result := ' SELECT TO_CHAR(CODCOB) AS CODIGO, COBRANCA AS DESCRICAO FROM PCCOB WHERE COBRANCA LIKE ''%'' || :BUSCA || ''%'' ';

    fornecedor:
      result := ' SELECT TO_CHAR(CODFORNEC) AS CODIGO, FORNECEDOR AS DESCRICAO FROM PCFORNEC WHERE FORNECEDOR LIKE ''%'' || :BUSCA || ''%'' ';

    departamento:
      result := ' SELECT TO_CHAR(CODEPTO) AS CODIGO, DESCRICAO FROM PCDEPTO WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ';

    secao:
      result := ' SELECT TO_CHAR(CODSEC) AS CODIGO, DESCRICAO FROM PCSECAO WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ';

    categoria:
      result := ' SELECT TO_CHAR(CODCATEGORIA) AS CODIGO, CATEGORIA AS DESCRICAO FROM PCCATEGORIA WHERE CATEGORIA LIKE ''%'' || :BUSCA || ''%'' ';

    subcategoria:
      result := ' SELECT TO_CHAR(CODSUBCATEGORIA) AS CODIGO, SUBCATEGORIA AS DESCRICAO FROM PCSUBCATEGORIA WHERE SUBCATEGORIA LIKE ''%'' || :BUSCA || ''%'' ';

    praca:
      result := ' SELECT TO_CHAR(CODPRACA) AS CODIGO, PRACA AS DESCRICAO FROM PCPRACA WHERE PRACA LIKE ''%'' || :BUSCA || ''%'' ';

    distribuidora:
      result := ' SELECT TO_CHAR(CODDISTRIB) AS CODIGO, DESCRICAO FROM PCDISTRIB WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ';

    regiao:
      result := ' SELECT TO_CHAR(NUMREGIAO) AS CODIGO, REGIAO AS DESCRICAO FROM PCREGIAO WHERE REGIAO LIKE ''%'' || :BUSCA || ''%'' ';

    rota:
      result := ' SELECT TO_CHAR(CODROTA) AS CODIGO, DESCRICAO FROM PCROTAEXP WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ';

    motorista:
      result := ' SELECT TO_CHAR(MATRICULA) AS CODIGO, NOME AS DESCRICAO FROM PCEMPR WHERE TIPO = ''M'' AND NOME LIKE ''%'' || :BUSCA || ''%'' ' +
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND SITUACAO = ''A'' ','')+
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND SITUACAO <> ''A'' ','');

    veiculo:
      result := ' SELECT TO_CHAR(CODVEICULO) AS CODIGO, DESCRICAO FROM PCVEICUL WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ';

    centroCusto:
      result := ' SELECT CODIGOCENTROCUSTO AS CODIGO, DESCRICAO FROM PCCENTROCUSTO WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ';

    setor:
      result := ' SELECT TO_CHAR(CODSETOR) AS CODIGO, DESCRICAO FROM PCSETOR WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ';

    conta:
      result := ' SELECT TO_CHAR(CODCONTA) AS CODIGO, CONTA AS DESCRICAO FROM PCCONTA WHERE CONTA LIKE ''%'' || :BUSCA || ''%'' ' +
              iif( TConsulta.opcaoPesquisa = apenasAtivos, ' AND TIPO <> ''I'' ', '' ) +
              iif( TConsulta.opcaoPesquisa = apenasInativos, ' AND TIPO = ''I'' ', '' );

    grupoConta:
      result := ' SELECT TO_CHAR(CODGRUPO) AS CODIGO, GRUPO AS DESCRICAO FROM PCGRUPO WHERE GRUPO LIKE ''%'' || :BUSCA || ''%'' ';

    banco:
      result := ' SELECT TO_CHAR(CODBANCO) AS CODIGO, NOME AS DESCRICAO FROM PCBANCO WHERE NOME LIKE ''%'' || :BUSCA || ''%'' ';

    moeda:
      result := ' SELECT CODMOEDA AS CODIGO, MOEDA AS DESCRICAO FROM PCMOEDA WHERE MOEDA LIKE ''%'' || :BUSCA || ''%'' ';

    equipe:
      result := ' SELECT TO_CHAR(CODEQUIPE) AS CODIGO, DESCRICAO FROM BOEQUIPE WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ';

    comprador:
      result := ' SELECT TO_CHAR(MATRICULA) AS CODIGO, NOME AS DESCRICAO FROM PCEMPR WHERE CODSETOR = 2 AND NOME LIKE ''%'' || :BUSCA || ''%'' '+
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND SITUACAO = ''A'' ','')+
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND SITUACAO <> ''A'' ','');

    usuario:
      result := ' SELECT TO_CHAR(MATRICULA) AS CODIGO, NOME AS DESCRICAO FROM PCEMPR WHERE NOME LIKE ''%'' || :BUSCA || ''%'' '+
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND SITUACAO = ''A'' ','')+
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND SITUACAO <> ''A'' ','');

    rca:
      result := ' SELECT TO_CHAR(CODUSUR) AS CODIGO, NOME AS DESCRICAO FROM PCUSUARI WHERE NOME LIKE ''%'' || :BUSCA || ''%'' ';

    supervisor:
      result := ' SELECT TO_CHAR(CODSUPERVISOR) AS CODIGO, NOME AS DESCRICAO FROM PCSUPERV WHERE NOME LIKE ''%'' || :BUSCA || ''%'' ';

    transbordo:
      result := ' SELECT TO_CHAR(CODBASE) AS CODIGO, DESCRICAO FROM BOTRANSBORDO WHERE DESCRICAO LIKE ''%'' || :BUSCA || ''%'' '+
                  iif(TConsulta.opcaoPesquisa = apenasAtivos ,' AND DTEXCLUSAO IS NULL ','') +
                  iif(TConsulta.opcaoPesquisa = apenasInativos ,' AND DTEXCLUSAO IS NOT NULL ','');

    filial:
      result := ' SELECT TO_CHAR(CODIGO) AS CODIGO, FANTASIA AS DESCRICAO FROM PCFILIAL WHERE FANTASIA LIKE ''%'' || :BUSCA || ''%'' ';

    transportadora:
      result := ' SELECT TO_CHAR(CODFORNEC) AS CODIGO, FORNECEDOR AS DESCRICAO FROM PCFORNEC WHERE REVENDA = ''T'' AND FORNECEDOR LIKE ''%'' || :BUSCA || ''%'' ';

    motivoReentrega:
      result := ' SELECT to_char(CODDEVOL) AS CODIGO, MOTIVO AS DESCRICAO FROM PCTABDEV WHERE NVL(MOTIVOREENTREGA, ''N'') = ''S'' AND MOTIVO LIKE ''%'' || :BUSCA || ''%'' ';

    ncm:
      Result := 'SELECT CODNCM  as CODIGO, SUBSTR(descricao,1,100)  as descricao FROM PCNCM where to_char(DESCRICAO) LIKE ''%''  || :BUSCA || ''%'' ';

    grupoBem:
      Result := 'select to_char(codgrupo) as codigo, descgrupo as descricao from pcbensgrupo where descgrupo like ''%'' || :BUSCA || ''%'' ';

    produtoCiap:
      Result := ' select to_char(codprod) as codigo, descricao from pcprodciap where descricao like ''%'' || :BUSCA || ''%''';

    ramoAtividade:
      Result := ' select to_char(codativ) as codigo, ramo as descricao from pcativi where ramo like ''%'' || :BUSCA || ''%'' ';            
  end;

end;

class function TConsulta.Opcao(opcaoPesquisa: TOpcaoPesquisa) : TConsulta;
begin

  self.opcaoPesquisa := opcaoPesquisa;

end;

class function TConsulta.Pesquisar(tipoConsulta: TTipoConsulta): String;
var
  form_caption : String;

begin

  form_caption := '';

  case tipoConsulta of
    cliente:        form_caption := 'CLIENTES';
    produto:        form_caption := 'PRODUTOS';
    cobranca:       form_caption := 'COBRANÇAS';
    fornecedor:     form_caption := 'FORNECEDORES';
    departamento:   form_caption := 'DEPARTAMENTOS';
    secao:          form_caption := 'SEÇÕES';
    categoria:      form_caption := 'CATEGORIAS';
    subcategoria:   form_caption := 'SUBCATEGORIAS';
    praca:          form_caption := 'PRAÇAS';
    distribuidora:  form_caption := 'DISTRIBUIDORAS';
    regiao:         form_caption := 'REGIÕES';
    rota:           form_caption := 'ROTAS';
    motorista:      form_caption := 'MOTORISTAS';
    veiculo:        form_caption := 'VEÍCULOS';
    centroCusto:    form_caption := 'CENTROS DE CUSTO';
    setor:          form_caption := 'SETORES';
    conta:          form_caption := 'CONTAS';
    grupoConta:     form_caption := 'GRUPOS DE CONTAS';
    banco:          form_caption := 'BANCOS';
    moeda:          form_caption := 'MOEDAS';
    equipe:         form_caption := 'EQUIPES WMS';
    comprador:      form_caption := 'COMPRADORES';
    supervisor:     form_caption := 'SUPERVISORES';
    transbordo:     form_caption := 'BASE(TRANSBORDOS)';
    filial:         form_caption := 'FILIAIS';
    transportadora: form_caption := 'TRANSPORTADORAS';
    usuario:        form_caption := 'USUÁRIOS';
    motivoReentrega: form_caption := 'MOTIVOS DE REENTREGA';
    ncm:            form_caption := 'NCM';
    grupoBem:       form_caption := 'GRUPO DO BEM';
    produtoCiap:    form_caption := 'PRODUTOS DE CONSUMO INTERNO';
    ramoAtividade:  form_caption := 'RAMOS DE ATIVIDADE';
  end;


  if tipoConsulta = fornecedor then
  begin


    Application.CreateForm(TFrmConsultaWinthorFornecedor, FrmConsultaWinthorFornecedor);
    FrmConsultaWinthorFornecedor.Caption       := 'PESQUISA DE ' + form_caption;
    FrmConsultaWinthorFornecedor.TipoPesquisa  := tipoConsulta;
    FrmConsultaWinthorFornecedor.ShowModal;

    Result := FrmConsultaWinthorFornecedor.CodigoSelecionado;
    FreeAndNil(FrmConsultaWinthorFornecedor);
  end
  else
  begin

    Application.CreateForm(TFrmConsultaWinthor, FrmConsultaWinthor);
    FrmConsultaWinthor.Caption       := 'PESQUISA DE ' + form_caption;
    FrmConsultaWinthor.TipoPesquisa  := tipoConsulta;
    FrmConsultaWinthor.ShowModal;

    Result := FrmConsultaWinthor.CodigoSelecionado;
    FreeAndNil(FrmConsultaWinthor);
  end;


end;

class function TConsulta.PesquisarPorCNPJ(tipoConsulta: TTipoConsulta;
  cnpj: string; dataSource: TDataSource): integer;
var
  query : TFDQuery;
begin

  Result := 0;
  query := TConsulta.GetQuery(tipoConsulta, porCNPJ);

  if ( query = nil ) then
  begin

    Exit;
  end;

  query.ParamByName('BUSCA').Value := cnpj;
  query.Open;

  query.First;

  dataSource.DataSet := query;


  Result := query.RecordCount;
end;

class function TConsulta.PesquisarPorCodigo(tipoConsulta: TTipoConsulta;
  codigoPesquisa: Variant;tipoPesquisa : TTipoPesquisa = porCodigo): String;
var
  query : TFDQuery;

begin

  // Usando opções antes da chamada da pesquisa
  // TConsulta.Opcao(apenasAtivos).PesquisarPorCodigo(usuario, 14);
  Result := '';
  query := TConsulta.GetQuery(tipoConsulta,tipoPesquisa);

  if ( query = nil ) then
  begin

    Exit;
  end;

  query.ParamByName('BUSCA').Value := codigoPesquisa;
  query.Open;

  if ( query.RecordCount > 0 ) then
  begin

    Result := query.FieldByName('DESCRICAO').AsString;
  end;

  query.Close;
  FreeAndNil(query);
end;

class function TConsulta.PesquisarPorCodigoFormulario(
  tipoConsulta: TTipoConsulta; codigoPesquisa: string;
  dataSource: TDataSource): integer;
var
  query : TFDQuery;

begin

  Result := 0;
  query := TConsulta.GetQuery(tipoConsulta, porCodigoFormulario);

  if ( query = nil ) then
  begin

    Exit;
  end;

  query.ParamByName('BUSCA').Value := codigoPesquisa;
  query.Open;

  query.First;

  dataSource.DataSet := query;


  Result := query.RecordCount;

end;

class function TConsulta.PesquisarPorCPF(tipoConsulta: TTipoConsulta;
  cpf: string; dataSource: TDataSource): integer;
var
  query : TFDQuery;

begin

  Result := 0;
  query := TConsulta.GetQuery(tipoConsulta, porCPF);

  if ( query = nil ) then
  begin

    Exit;
  end;

  query.ParamByName('BUSCA').Value := cpf;
  query.Open;

  query.First;

  dataSource.DataSet := query;


  Result := query.RecordCount;

end;

class function TConsulta.PesquisarPorDescricao(tipoConsulta: TTipoConsulta;
  descricaoPesquisa: String; dataSource: TDataSource): Integer;
var
  query : TFDQuery;

begin

  Result := 0;
  query := TConsulta.GetQuery(tipoConsulta, porDescricao);

  if ( query = nil ) then
  begin

    Exit;
  end;

  query.ParamByName('BUSCA').Value := descricaoPesquisa;
  query.Open;

  query.First;

  dataSource.DataSet := query;


  Result := query.RecordCount;

end;


function BotaoPesquisaOnExit(  TipoConsulta : TTipoConsulta; ButtonEdit : TcxButtonEdit; TextEdit : TcxTextEdit; MensagemDeErro : String ) : Boolean;
var
  descricao : string;

begin
  ///  Jhonny Oliveira
  ///
  ///  Auxilia quando usamos em conjunto
  ///  um buttonEdit e textEdit para pesquisas
  ///  em filtros por exemplo,
  ///  deve ser usado no evendo onExit do componente
  ///
  ///  Esta procedure faz o trabalho de pesquisa,
  ///  preenchimento do textEdit
  ///
  ///  Parâmetros:
  ///   TipoConsulta : TTipoConsulta
  ///   - Enum localizado na unit UConsultasWinthor, como cliente, usuário
  ///     e etc
  ///
  ///   ButtonEdit : TcxButtonEdit
  ///   - Que contém o código a ser pesquisado
  ///
  ///   TextEdit : TcxTextEdit
  ///   - Que irá receber a string retornada da consulta
  ///
  ///   MensagemDeErro : String
  ///   - Mensagem de erro quando a pesquisa não encontrar resultados
  ///

  descricao := '';

  if ( ButtonEdit.Text <> '' ) then
  begin

    descricao := TConsulta.PesquisarPorCodigo(TipoConsulta, ButtonEdit.EditValue);

    if ( descricao = '' ) then
    begin
      TMsg.Alerta(MensagemDeErro);
      ButtonEdit.Clear;
      ButtonEdit.SetFocus;
    end;                      

  end;
  
  TextEdit.Text := descricao;

  Result := ( descricao <> '' );

end;

function BotaoPesquisaOnButtonClick( TipoConsulta : TTipoConsulta; ButtonEdit : TcxButtonEdit; Formulario : TForm ) : Boolean;
begin

  ///  Jhonny Oliveira
  ///
  ///  Auxilia quando usamos em conjunto
  ///  um buttonEdit para pesquisas
  ///  em filtros por exemplo,
  ///  deve ser usado no evendo Properties.onButtonClick do componente
  ///
  ///  Esta procedure faz o trabalho de pesquisa,
  ///  e avança para o próximo componente do formulário
  ///
  ///  Parâmetros:
  ///   TipoConsulta : TTipoConsulta
  ///   - Enum localizado na unit UConsultasWinthor, como cliente, usuário
  ///     e etc
  ///
  ///   ButtonEdit : TcxButtonEdit
  ///   - Que o usuário clicou para fazer a pesquisa
  ///
  ///   Formulario : TForm
  ///   - Necessário para utilizar o método Perform,
  ///   responsável por avançar para o próximo componente da
  ///   interface

  ButtonEdit.Text := TConsulta.Pesquisar(TipoConsulta);
  Formulario.Perform(WM_NEXTDLGCTL, 0, 0);

  Result := (ButtonEdit.Text <> '');

end;

end.
