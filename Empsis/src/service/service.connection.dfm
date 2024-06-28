object DataModuleConnection: TDataModuleConnection
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object SQL_Query: TFDQuery
    Active = True
    Connection = Connection
    SQL.Strings = (
      'SELECT * '
      'FROM cliente'
      'INNER JOIN endereco'
      'ON endereco.cpf = cliente.cpf'
      '')
    Left = 624
    Top = 168
  end
  object Connection: TFDConnection
    Params.Strings = (
      'Database=empsis_system'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 144
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 104
    Top = 40
  end
  object Driver: TFDPhysMySQLDriverLink
    DriverID = 'MySQL'
    Left = 160
    Top = 144
  end
end
