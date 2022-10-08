inherited Frm_TrocaUsuario: TFrm_TrocaUsuario
  Caption = 'Frm_TrocaUsuario'
  ExplicitWidth = 864
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 29
    Top = 101
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = DB_Nome
  end
  object Label3: TLabel [1]
    Left = 29
    Top = 141
    Width = 30
    Height = 13
    Caption = 'Senha'
    FocusControl = DB_Senha
  end
  object Label4: TLabel [2]
    Left = 205
    Top = 141
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label5: TLabel [3]
    Left = 397
    Top = 141
    Width = 70
    Height = 13
    Caption = 'Data Cadastro'
    FocusControl = DB_Cadastro
  end
  inherited pnlBottom: TPanel
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  object DB_Nome: TDBEdit [7]
    Left = 29
    Top = 117
    Width = 500
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = ds_padrao
    TabOrder = 3
  end
  object DB_Senha: TDBEdit [8]
    Left = 29
    Top = 157
    Width = 134
    Height = 21
    DataField = 'SENHA'
    DataSource = ds_padrao
    PasswordChar = '*'
    TabOrder = 4
  end
  object DB_Cadastro: TDBEdit [9]
    Left = 397
    Top = 157
    Width = 134
    Height = 21
    DataField = 'CADASTRO'
    DataSource = ds_padrao
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object DB_Tipo: TDBComboBox [10]
    Left = 205
    Top = 157
    Width = 145
    Height = 21
    DataField = 'TIPO'
    DataSource = ds_padrao
    Items.Strings = (
      'ADMINISTRADOR'
      'APOIO')
    TabOrder = 6
  end
  inherited Q_Padrao: TFDQuery
    SQL.Strings = (
      'select '
      'ID_USUARIO,'
      'NOME,'
      'SENHA,'
      'TIPO,'
      'CADASTRO'
      'from usuario'
      'ORDER BY ID_USUARIO')
  end
  object Q_pesq_padrao: TFDQuery
    Connection = DM.conexao
    Left = 754
    Top = 107
  end
end
