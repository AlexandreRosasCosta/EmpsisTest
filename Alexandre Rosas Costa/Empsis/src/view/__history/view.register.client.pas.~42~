unit view.register.client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Mask, System.RegularExpressions, System.JSON,Vcl.WinXCtrls, IdHTTP, IdSSLOpenSSL;

type
  TRegisterClientForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    NameLabel: TLabel;
    NameEdit: TEdit;
    CpfLabel: TLabel;
    ContactLabel: TLabel;
    EmailEdit: TEdit;
    EmailLabel: TLabel;
    CityEdit: TEdit;
    CityLabel: TLabel;
    CepLabel: TLabel;
    StreetEdit: TEdit;
    StreetLabel: TLabel;
    NumEdit: TEdit;
    NumLabel: TLabel;
    StateEdit: TEdit;
    StateLabel: TLabel;
    CountryEdit: TEdit;
    CountryLabel: TLabel;
    DateTimePickerBirth: TDateTimePicker;
    BirthLabel: TLabel;
    RegisterButton: TButton;
    CancelButton: TButton;
    CpfEdit: TMaskEdit;
    CepEdit: TEdit;
    ContactEdit: TMaskEdit;
    procedure RegisterButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterClientForm: TRegisterClientForm;

implementation

{$R *.dfm}

uses service.cliente, service.endereco;

procedure TRegisterClientForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TRegisterClientForm.RegisterButtonClick(Sender: TObject);
var
  Cliente: TCliente;
  Endereco: TEndereco;
  cpf: string;
  contato: string;
begin
  if CpfEdit.Text = '' then
  begin
    ShowMessage('Campo CPF está incorreto');
    Exit;
  end
  else if (NameEdit.Text = '') or (Length(NameEdit.Text) < 3) then
  begin
    ShowMessage('Campo NOME está incorreto.');
    Exit;
  end
  else if (CepEdit.Text = '') or (Length(CepEdit.Text) < 8) then
  begin
    ShowMessage('Campo CEP está incorreto.');
    Exit;
  end
  else if (EmailEdit.Text = '') or (Length(EmailEdit.Text) < 6) then
  begin
    ShowMessage('O campo EMAIL está incorreto.');
    Exit;
  end
  else if (StreetEdit.Text = '') or (Length(StreetEdit.Text) < 3) then
  begin
    ShowMessage('O campo RUA está incorreto.');
    Exit;
  end
  else if (NumEdit.Text = '') or (Length(NumEdit.Text) < 3) then
  begin
    ShowMessage('O campo N° está incorreto.');
    Exit;
  end
  else if (StateEdit.Text = '') or (Length(StateEdit.Text) < 3) then
  begin
    ShowMessage('O campo ESTADO está incorreto.');
    Exit;
  end
  else if (CountryEdit.Text = '') or (Length(CountryEdit.Text) < 3) then
  begin
    ShowMessage('O campo PAÍS está incorreto.');
    Exit;
  end;

  try
    contato := ContactEdit.Text;
    contato := TRegEx.Replace(contato, '\D', '');
    cpf := CpfEdit.Text;
    cpf := TRegEx.Replace(cpf, '\D', '');
    Cliente := TCliente.Create(NameEdit.Text, cpf, contato, EmailEdit.Text, DateTimePickerBirth.Date, true);
    Endereco := TEndereco.Create(cpf, CepEdit.Text, StreetEdit.Text, NumEdit.Text, CityEdit.Text, StateEdit.Text, CountryEdit.Text);
    Cliente.cadastrarCliente;
    Endereco.cadastrarEndereco;
    ShowMessage('Cliente e endereço cadastrados com sucesso!');
    ModalResult := mrOk;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;

end.
