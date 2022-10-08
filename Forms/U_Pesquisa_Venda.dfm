inherited Frm_Pesquisa_Padrao1: TFrm_Pesquisa_Padrao1
  Caption = 'Frm_Pesquisa_Venda'
  ClientHeight = 373
  ClientWidth = 1020
  ExplicitWidth = 1036
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1020
    ExplicitWidth = 1020
    inherited bt_pesquisar: TBitBtn
      OnClick = bt_pesquisarClick
    end
    inherited bt_transferir: TBitBtn
      OnClick = bt_transferirClick
    end
  end
  inherited Panel2: TPanel
    Top = 312
    Width = 1020
    ExplicitTop = 312
    ExplicitWidth = 1020
  end
  inherited DBGrid1: TDBGrid
    Width = 1020
    Height = 231
    DataSource = ds_pesq_padrao
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FORMA_PGTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CADASTRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde'
        Title.Caption = 'Quantidade'
        Visible = True
      end>
  end
  inherited Q_pesq_padrao: TFDQuery
    SQL.Strings = (
      'select '
      ' ID_VENDA,'
      'ID_CLIENTE,'
      'ID_FORMA_PGTO,'
      'USUARIO ,'
      'VALOR,'
      ' CADASTRO,'
      'qtde'
      ' from '
      'venda')
  end
  inherited ds_pesq_padrao: TDataSource
    AutoEdit = False
  end
end
