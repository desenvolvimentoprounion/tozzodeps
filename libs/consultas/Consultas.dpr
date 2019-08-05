program Consultas;



{%TogetherDiagram 'ModelSupport_Consultas\default.txaPackage'}

uses
  Forms,
  UFrmConsultaWinthor in 'UFrmConsultaWinthor.pas' {FrmConsultaWinthor},
  UConsultasWinthor in 'UConsultasWinthor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmConsultaWinthor, FrmConsultaWinthor);
  Application.Run;
end.

