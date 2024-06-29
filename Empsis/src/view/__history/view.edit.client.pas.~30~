unit view.edit.client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Mask;

type
  TEditForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BirthLabel: TLabel;
    CepEdit: TEdit;
    CepLabel: TLabel;
    CityEdit: TEdit;
    CityLabel: TLabel;
    ContactEdit: TEdit;
    ContactLabel: TLabel;
    CountryEdit: TEdit;
    CountryLabel: TLabel;
    CpfLabel: TLabel;
    DateTimePickerBirth: TDateTimePicker;
    EmailEdit: TEdit;
    EmailLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    NumEdit: TEdit;
    NumLabel: TLabel;
    StateEdit: TEdit;
    StateLabel: TLabel;
    StreetEdit: TEdit;
    StreetLabel: TLabel;
    EditButton: TButton;
    CheckBoxActivate: TCheckBox;
    CancelButton: TButton;
    CpfEdit: TEdit;
    procedure EditButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditForm: TEditForm;

implementation

{$R *.dfm}

uses service.connection, service.cliente, service.endereco;


{ TEditForm }

procedure TEditForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TEditForm.EditButtonClick(Sender: TObject);
var
  Cliente: TCliente;
  Endereco: TEndereco;
  checked: boolean;
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
  else if (NumEdit.Text = '') then
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

  if not CheckBoxActivate.Checked then
  begin
    checked := false;
  end
  else
  begin
    CheckBoxActivate.Enabled := false;
    checked := true;
  end;

  try
    Cliente := TCliente.Create(NameEdit.Text, CpfEdit.Text, ContactEdit.Text, EmailEdit.Text, DateTimePickerBirth.Date, checked);
    Endereco := TEndereco.Create(CpfEdit.Text, CepEdit.Text, StreetEdit.Text, NumEdit.Text, CityEdit.Text, StateEdit.Text, CountryEdit.Text);
    Cliente.editarCliente(CpfEdit.Text);
    Endereco.editarEndereco(CpfEdit.Text);
    ShowMessage('Edição realizada com sucesso!');
    ModalResult := mrOk;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;

end.
