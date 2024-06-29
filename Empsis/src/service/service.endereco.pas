unit service.endereco;

interface

uses
  SysUtils;
type
  TEndereco = class
  private
    FCpf: string;
    FCep: string;
    FRua: string;
    FNumero: string;
    FCidade: string;
    FEstado: string;
    FPais: string;
  public
    constructor Create(const Cpf, Cep, Rua, Numero, Cidade, Estado, Pais: string);
    property Cpf: string read FCpf write FCpf;
    property Cep: string read FCep write FCep;
    property Rua: string read FRua write FRua;
    property Numero: string read FNumero write FNumero;
    property Cidade: string read FCidade write FCidade;
    property Estado: string read FEstado write FEstado;
    property Pais: string read FPais write FPais;
    procedure editarEndereco(cpf: string);
    procedure cadastrarEndereco;
  end;
implementation

uses service.connection;
constructor TEndereco.Create(const cpf, cep, rua, numero, cidade, estado, pais: string);
begin
  inherited Create;
  FCpf := cpf;
  FCep := cep;
  FRua := rua;
  FNumero := numero;
  FCidade := cidade;
  FEstado := estado;
  FPais := pais;
end;

procedure TEndereco.editarEndereco(cpf: string);
begin
  try
    if not DataModuleConnection.Connection.Connected then
      DataModuleConnection.Connection.Connected := true;

    with DataModuleConnection.SQL_Query do
      begin
        Close;
        SQL.Text := 'UPDATE endereco SET cep = :cep,rua = :rua,numero = :numero,'+
        'cidade = :cidade,estado = :estado, pais = :pais WHERE endereco.cpf = '+cpf;
        Params.ParamByName('cep').AsInteger := StrtoInt(self.Cep);
        Params.ParamByName('rua').AsString := self.Rua;
        Params.ParamByName('numero').AsInteger := StrtoInt(self.Numero);
        Params.ParamByName('cidade').AsString := self.Cidade;
        Params.ParamByName('estado').AsString := self.Estado;
        Params.ParamByName('pais').AsString := self.Pais;
        ExecSQL;
      end;
  except on E:Exception do
    begin
      DataModuleConnection.Connection.Rollback;
      raise Exception.Create('Não foi possível alterar o endereço');
    end;
  end;
end;

procedure TEndereco.cadastrarEndereco;
begin
  try
  with DataModuleConnection.SQL_Query do
    begin
      SQL.Text := 'INSERT INTO endereco (cpf, cep, rua, numero, cidade, estado, pais) ' +
                  'VALUES (:cpf, :cep, :rua, :numero, :cidade, :estado, :pais)';
      ParamByName('cpf').AsString := self.Cpf;
      ParamByName('cep').AsString := self.Cep;
      ParamByName('rua').AsString := self.Rua;
      ParamByName('numero').AsString := self.Numero;
      ParamByName('cidade').AsString := self.Cidade;
      ParamByName('estado').AsString := self.Estado;
      ParamByName('pais').AsString := self.Pais;
      ExecSQL;
    end;
  except on E:Exception do
    begin
      DataModuleConnection.Connection.Rollback;
      raise Exception.Create('Não foi possível cadastrar o endereço');
    end;
  end;
end;

end.
