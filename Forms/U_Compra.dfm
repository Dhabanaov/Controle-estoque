inherited Frm_Compra: TFrm_Compra
  Caption = 'Compra'
  ExplicitWidth = 864
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 32
    Top = 72
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = DB_ID_Compra
  end
  object Label13: TLabel [1]
    Left = 216
    Top = 72
    Width = 70
    Height = 13
    Caption = 'Data Cadastro'
    FocusControl = DB_Cadastro
  end
  object Label3: TLabel [2]
    Left = 32
    Top = 118
    Width = 104
    Height = 13
    Caption = 'C'#243'digo do fornecedor'
    FocusControl = DB_ID_FORNECEDOR
  end
  object Label2: TLabel [3]
    Left = 216
    Top = 118
    Width = 83
    Height = 13
    Caption = 'Nome fornecedor'
    FocusControl = DB_ID_FORNECEDOR
  end
  object Label4: TLabel [4]
    Left = 32
    Top = 160
    Width = 121
    Height = 13
    Caption = 'C'#243'digo forma pagamento'
    FocusControl = DBEditformapagamento
  end
  object Label5: TLabel [5]
    Left = 216
    Top = 160
    Width = 115
    Height = 13
    Caption = 'Nome forma pagamento'
    FocusControl = DBEditformapagamento
  end
  object Label6: TLabel [6]
    Left = 32
    Top = 202
    Width = 36
    Height = 13
    Caption = 'Usuario'
    FocusControl = DBusuario
  end
  object Label7: TLabel [7]
    Left = 32
    Top = 245
    Width = 72
    Height = 13
    Caption = 'Valor de venda'
    FocusControl = DB_Valor
  end
  inherited pnlTop: TPanel
    inherited btnPesquisar: TBitBtn
      OnClick = btnPesquisarClick
    end
  end
  inherited pnlBottom: TPanel
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  object DB_ID_Compra: TDBEdit [11]
    Left = 32
    Top = 88
    Width = 134
    Height = 21
    DataField = 'ID_COMPRA'
    DataSource = ds_padrao
    TabOrder = 3
  end
  object DB_Cadastro: TDBEdit [12]
    Left = 216
    Top = 88
    Width = 134
    Height = 21
    DataField = 'CADASTRO'
    DataSource = ds_padrao
    TabOrder = 4
  end
  object DB_ID_FORNECEDOR: TDBEdit [13]
    Left = 32
    Top = 134
    Width = 134
    Height = 21
    DataField = 'ID_FORNECEDOR'
    DataSource = ds_padrao
    TabOrder = 5
    OnChange = DB_ID_FORNECEDORChange
  end
  object DB_NOME_FORNECEDOR: TDBEdit [14]
    Left = 216
    Top = 134
    Width = 298
    Height = 21
    DataField = 'NOME'
    DataSource = ds_padrao
    TabOrder = 6
  end
  object DBEditformapagamento: TDBEdit [15]
    Left = 32
    Top = 176
    Width = 134
    Height = 21
    DataField = 'ID_FORMA_PGTO'
    DataSource = ds_padrao
    TabOrder = 7
  end
  object DBEditdescricao: TDBEdit [16]
    Left = 216
    Top = 176
    Width = 298
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = ds_padrao
    TabOrder = 8
  end
  object DBusuario: TDBEdit [17]
    Left = 32
    Top = 218
    Width = 482
    Height = 21
    DataField = 'USUARIO'
    DataSource = ds_padrao
    TabOrder = 9
  end
  object DB_Valor: TDBEdit [18]
    Left = 32
    Top = 261
    Width = 251
    Height = 21
    DataField = 'VALOR'
    DataSource = ds_padrao
    TabOrder = 10
  end
  inherited Q_Padrao: TFDQuery
    SQL.Strings = (
      
        'SELECT '#10'c.ID_COMPRA,'#10'c.ID_FORNECEDOR,'#10'c.ID_FORMA_PGTO,'#10'c.USUARIO' +
        ','#10'c.VALOR,'#10'c.CADASTRO,'#10'B.NOME,'#10'fp.DESCRICAO'#10'FROM compra c'#10'INNER ' +
        'JOIN FORNECEDOR b ON (b.ID_FORNECEDOR = c.ID_FORNECEDOR)'#10'INNER J' +
        'OIN  FORMA_PGTO FP ON (fp.ID_FORMA_PGTO = c.ID_FORMA_PGTO)')
  end
  object Q_pesq_padrao: TFDQuery
    Connection = DM.conexao
    Left = 624
    Top = 152
  end
end
