unit service.connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, IniFiles;

type
  TDataModuleConnection = class(TDataModule)
    SQL_Query: TFDQuery;
    Connection: TFDConnection;
    WaitCursor: TFDGUIxWaitCursor;
    Driver: TFDPhysMySQLDriverLink;
    {procedure DataModuleCreate(Sender: TObject);}
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleConnection: TDataModuleConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
{
procedure TDataModuleConnection.DataModuleCreate(Sender: TObject);
var
  LIniFile: TIniFile;
  LDatabase: string;
  LUserName: string;
  LPassword: string;
  LServidor: string;
  LPorta: integer;
  LCaminho: string;
begin
  try
    Connection.Connected := False;
    LCaminho := ExtractFileDir(ParamStr(0)) + '\Login.ini';
    LIniFile := TIniFile.Create(LCaminho);
    LDatabase := LIniFile.ReadString('Conexao', 'Database', '');
    LServidor := LIniFile.ReadString('Conexao', 'Servidor', '');
    LPorta := LIniFile.ReadInteger('Conexao', 'Porta', 0);
    LUserName := LIniFile.ReadString('Conexao', 'UserName', '');
    LPassword := LIniFile.ReadString('Conexao', 'Password', '');
    Connection.Params.Values['Database'] := LDatabase;
    Connection.Params.Values['User_Name'] := LUserName;
    Connection.Params.Values['Password'] := LPassword;
    Connection.Params.Values['Server'] := LServidor;
    Connection.Params.Values['Port'] := LPorta.ToString;
    Connection.Connected := True;
  finally
    FreeAndNil(LIniFile);
  end;
end;
}
end.
