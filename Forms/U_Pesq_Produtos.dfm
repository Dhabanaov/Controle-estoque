inherited Frm_Pesq_Produtos: TFrm_Pesq_Produtos
  Caption = 'Frm_Pesq_Produtos'
  ClientHeight = 309
  ClientWidth = 1065
  ExplicitWidth = 1081
  ExplicitHeight = 348
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1065
    Caption = 'Pesquisa de Produtos'
    ExplicitWidth = 120
    inherited bt_pesquisar: TBitBtn
      OnClick = bt_pesquisarClick
    end
    inherited bt_transferir: TBitBtn
      OnClick = bt_transferirClick
    end
  end
  inherited Panel2: TPanel
    Top = 248
    Width = 1065
    ExplicitTop = -61
    ExplicitWidth = 120
  end
  inherited DBGrid1: TDBGrid
    Width = 1065
    Height = 167
    DataSource = ds_pesq_padrao
    OnDblClick = DBGrid1DblClick
  end
  inherited Q_pesq_padrao: TFDQuery
    SQL.Strings = (
      'SELECT '
      ' a.ID_PRODUTO,'
      ' a.PRODUTO_DESCRICAO, '
      ' b.NOME,'
      ' a.VL_CUSTO,'
      ' a.VL_VENDA, '
      ' a.ESTOQUE, '
      ' a.ESTOQUE_MIN, '
      ' a.UNIDADE, '
      ' a.CADASTRO'
      'FROM PRODUTO a '
      'INNER JOIN FORNECEDOR b ON b.ID_FORNECEDOR = a.ID_FORNECEDOR')
  end
  inherited ds_pesq_padrao: TDataSource
    AutoEdit = False
  end
end
