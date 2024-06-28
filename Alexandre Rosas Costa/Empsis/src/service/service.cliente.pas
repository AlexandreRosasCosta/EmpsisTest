unit service.cliente;

interface

uses
  SysUtils, RegularExpressions;
type
  TCliente = class
  private
    FNome: string;
    FCpf: string;
    FTelefone: string;
    FEmail: string;
    FDataNascimento: TDate;
    FStatus: boolean;
  public
    constructor Create(const Nome, Cpf, Telefone, Email: string; DataNascimento: TDate; status: boolean);
    property Nome: string read FNome write FNome;
    property Cpf: string read FCpf write FCpf;
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
    property Status: boolean read FStatus write FStatus;
    procedure cadastrarCliente;
    procedure deletarCliente(const cpf:string);
    procedure editarCliente(const cpf:string);
  end;
implementation

uses service.connection;

constructor TCliente.Create(const nome, cpf, telefone, email: string; dataNascimento: TDate; status:boolean);
begin
  inherited Create;
  FNome := nome;
  FCpf := cpf;
  FTelefone := telefone;
  FEmail := email;
  FDataNascimento := dataNascimento;
  FStatus := status;
end;

procedure TCliente.deletarCliente(const cpf:string);
begin
  try
    with DataModuleConnection.SQL_Query do
    begin
      Close;
      SQL.Text := 'UPDATE cliente SET cliente.status = 0 WHERE cliente.cpf = :cpf';
      Params.ParamByName('cpf').AsString := cpf;
      Open;
    end;
  except

  end;
end;

procedure TCliente.editarCliente(const cpf: string);
begin
  try
    if not DataModuleConnection.Connection.Connected then
      DataModuleConnection.Connection.Connected := true;

    with DataModuleConnection.SQL_Query do
    begin
      Close;
      SQL.Text := 'UPDATE cliente SET nome = :nome,telefone = :telefone,email = :email,'+
      'data_nascimento = :data_nascimento, status = :status WHERE cliente.cpf = '+cpf;
      Params.ParamByName('nome').AsString := self.Nome;
      Params.ParamByName('telefone').AsString := self.Telefone;
      Params.ParamByName('email').AsString:= self.Email;
      Params.ParamByName('data_nascimento').AsDate := self.DataNascimento;
      Params.ParamByName('status').AsBoolean := self.Status;
      ExecSQL;
    end;
  except on E:Exception do
    begin
      DataModuleConnection.Connection.Rollback;
      raise Exception.Create('N�o foi poss�vel alterar o endere�o');
    end;
  end;
end;

procedure TCliente.cadastrarCliente;
begin
  try
    with DataModuleConnection.SQL_Query do
    begin
      SQL.Text := 'INSERT INTO cliente (nome, cpf, telefone, email, data_nascimento) ' +
                  'VALUES (:nome, :cpf, :telefone, :email, :data_nascimento)';
      ParamByName('nome').AsString := self.Nome;
      ParamByName('cpf').AsString := self.Cpf;
      ParamByName('telefone').AsString := self.Telefone;
      ParamByName('email').AsString := self.Email;
      ParamByName('data_nascimento').AsDate := self.DataNascimento;
      ExecSQL;
    end;
  except on E:Exception do
  begin
    DataModuleConnection.Connection.Rollback;
    raise Exception.Create('N�o foi poss�vel cadastrar o cliente');
  end;
  end;
end;

end.
