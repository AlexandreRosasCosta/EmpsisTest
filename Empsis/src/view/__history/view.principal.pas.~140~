unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.DBCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RegisterClient: TButton;
    GridMain: TDBGrid;
    DataSourceGrid: TDataSource;
    SearchBox: TSearchBox;
    SearchLabel: TLabel;
    RadioGroupSearch: TRadioGroup;
    DeleteButton: TButton;
    CheckBoxInative: TCheckBox;
    DBNavigator1: TDBNavigator;
    EditButton: TButton;
    Label1: TLabel;
    procedure RegisterClientClick(Sender: TObject);
    procedure UpdateGrid;
    procedure RadioGroupSearchClick(Sender: TObject);
    procedure SearchBoxChange(Sender: TObject);
    procedure UpdateGridSearch(const FilterText: string);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CheckBoxInativeClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure GridMainDblClick(Sender: TObject);
    procedure GridMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridMainCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses service.connection, view.register.client, service.endereco,
  service.cliente, view.edit.client;

procedure TMainForm.UpdateGrid;
begin
  try
    if not DataModuleConnection.Connection.Connected then
    begin
      DataModuleConnection.Connection.Connected := True;
    end;
    with DataModuleConnection.SQL_Query do
    begin
      Close;
      if not CheckBoxInative.Checked then
      begin
          SQL.Text := 'SELECT * FROM cliente INNER JOIN endereco ON endereco.cpf = cliente.cpf WHERE cliente.status = 1';
      end
      else
      begin
        SQL.Text := 'SELECT * FROM cliente INNER JOIN endereco ON endereco.cpf = cliente.cpf WHERE 1=1';
      end;
      Open;
    end;
    DataSourceGrid.DataSet := DataModuleConnection.SQL_Query;
    GridMain.DataSource := DataSourceGrid;
    if DataSourceGrid.DataSet.IsEmpty then
    begin
      EditButton.Enabled := false;
    end
    else
      EditButton.Enabled := true;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar a tabela: ' + E.Message);
      DataModuleConnection.Connection.Connected := False;
    end;
  end;
end;

procedure TMainForm.UpdateGridSearch(const FilterText: string);
var
  FilterColumn: string;
begin
  if not DataModuleConnection.Connection.Connected then
    DataModuleConnection.Connection.Connected := true;
  try
    with DataModuleConnection.SQL_Query do
    begin
      Close;
      if not CheckBoxInative.Checked then
      begin
        SQL.Text := 'SELECT * FROM cliente INNER JOIN endereco ON endereco.cpf = cliente.cpf WHERE cliente.status = 1';
      end
      else
      begin
        SQL.Text := 'SELECT * FROM cliente INNER JOIN endereco ON endereco.cpf = cliente.cpf WHERE 1=1';
      end;
      if (RadioGroupSearch.ItemIndex = 0) and (Length(SearchBox.Text) > 0) then
      begin
        SQL.Add('AND cliente.nome LIKE :filter');
        Params.ParamByName('filter').AsString := '%'+SearchBox.Text+'%';
        Open;
      end
      else if (RadioGroupSearch.ItemIndex = 1) and (Length(SearchBox.Text) > 0) then
      begin
        SQL.Add('AND cliente.cpf = :filter');
        Params.ParamByName('filter').AsString := SearchBox.Text;
        Open;
      end
      else if ((RadioGroupSearch.ItemIndex = 0) or (RadioGroupSearch.ItemIndex = 1)) and (Length(SearchBox.Text) = 0) then
      begin
        Open;
      end;
    end;
  except on E:Exception do
    begin
      ShowMessage('Erro: '+E.Message);
    end;
  end;
end;

procedure TMainForm.CheckBoxInativeClick(Sender: TObject);
begin
  UpdateGrid;
end;

procedure TMainForm.DeleteButtonClick(Sender: TObject);
var
  Cpf: string;
  Cliente: TCliente;
begin
  if not DataModuleConnection.SQL_Query.IsEmpty then
  begin
    Cpf := DataModuleConnection.SQL_Query.FieldByName('cpf').AsString;
    Cliente := nil;
    if MessageDlg('Você tem certeza que deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        Cliente.deletarCliente(Cpf);
        UpdateGrid;
      finally
        Cliente.Free;
      end;
    end
    else
    begin
      GridMain.DataSource.DataSet.Cancel;
      Abort;
    end;
  end
  else
    ShowMessage('Nenhum cliente selecionado.');
end;

procedure TMainForm.EditButtonClick(Sender: TObject);
var
  EditForm: TEditForm;
begin
  EditForm := TEditForm.Create(Self);
  with DataModuleConnection.SQL_Query do
  begin
    EditForm.NameEdit.Text := FieldByName('nome').AsString;
    EditForm.CpfEdit.Text := FieldByName('cpf').AsString;
    EditForm.ContactEdit.Text := FieldByName('telefone').AsString;
    EditForm.EmailEdit.Text := FieldByName('email').AsString;
    EditForm.DateTimePickerBirth.Date := FieldByName('data_nascimento').AsDateTime;
    EditForm.CepEdit.Text := FieldByName('cep').AsString;
    EditForm.StreetEdit.Text := FieldByName('rua').AsString;
    EditForm.NumEdit.Text := FieldByName('numero').AsString;
    EditForm.CityEdit.Text := FieldByName('cidade').AsString;
    EditForm.StateEdit.Text := FieldByName('estado').AsString;
    EditForm.CountryEdit.Text := FieldByName('pais').AsString;
    if FieldByName('status').AsBoolean = true then
    begin
      EditForm.CheckBoxActivate.Checked := true;
      EditForm.CheckBoxActivate.Enabled := false;
    end;
  end;
  try
    if EditForm.ShowModal = mrOk then
    begin
      UpdateGrid;
    end;
  finally
    EditForm.Free;
  end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
 if SearchBox.Enabled = true then
 begin
   UpdateGridSearch(SearchBox.Text);
 end
 else
  UpdateGrid;
end;

procedure TMainForm.GridMainCellClick(Column: TColumn);
begin
  if (DataSourceGrid.DataSet.FieldByName('status').AsBoolean = false) then
  begin
    DeleteButton.Enabled := false;
  end
  else
  begin
    DeleteButton.Enabled := true;
  end;
end;

procedure TMainForm.GridMainDblClick(Sender: TObject);
begin
  EditButtonClick(Sender);
end;

procedure TMainForm.GridMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DataSourceGrid.DataSet.FieldByName('status').AsBoolean = false) then
  begin
    GridMain.Canvas.Brush.Color := clWebGainsboro;
    GridMain.Canvas.Font.Color := clWhite;
  end
  else
  begin
    GridMain.Canvas.Font.Color := clWindowText;
  end;
  GridMain.Canvas.FillRect(Rect);
  GridMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TMainForm.RadioGroupSearchClick(Sender: TObject);
begin
  SearchBox.Enabled := RadioGroupSearch.ItemIndex <> -1;
  SearchBox.Text := '';
  if (RadioGroupSearch.ItemIndex = 0) then
    begin
      SearchBox.TextHint := 'Digite o nome do cliente';
    end
  else if RadioGroupSearch.ItemIndex = 1 then
    begin
      SearchBox.TextHint := 'Digite o CPF do cliente';
    end;
end;


procedure TMainForm.RegisterClientClick(Sender: TObject);
var
  RegisterForm: TRegisterClientForm;
begin
  RegisterForm := TRegisterClientForm.Create(Self);
  try
   if RegisterForm.ShowModal = mrOk then
    begin
      UpdateGrid;
    end;
  finally
    RegisterForm.Free;
  end;
end;

procedure TMainForm.SearchBoxChange(Sender: TObject);
begin
  if SearchBox.Enabled then
  begin
    UpdateGridSearch(SearchBox.Text);
  end;
end;

end.
