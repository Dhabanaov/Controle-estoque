object DM: TDM
  OldCreateOrder = False
  Height = 313
  Width = 365
  object conexao: TFDConnection
    Params.Strings = (
      'Database=estoque'
      'User_Name=root'
      'Password=64133'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object transacao: TFDTransaction
    Connection = conexao
    Left = 144
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 216
    Top = 96
  end
end
