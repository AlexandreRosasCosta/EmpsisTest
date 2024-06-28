program Empsis;

uses
  Vcl.Forms,
  view.principal in 'src\view\view.principal.pas' {MainForm},
  service.connection in 'src\service\service.connection.pas' {DataModuleConnection: TDataModule},
  view.register.client in 'src\view\view.register.client.pas' {RegisterClientForm},
  service.cliente in 'src\service\service.cliente.pas',
  service.endereco in 'src\service\service.endereco.pas',
  view.edit.client in 'src\view\view.edit.client.pas' {EditForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDataModuleConnection, DataModuleConnection);
  Application.CreateForm(TEditForm, EditForm);
  Application.Run;
end.
