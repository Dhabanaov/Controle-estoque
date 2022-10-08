inherited Frm_Pesquisa_Padrao2: TFrm_Pesquisa_Padrao2
  Caption = 'U_Pesquisa_Empresa'
  ExplicitWidth = 1149
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited bt_pesquisar: TBitBtn
      OnClick = bt_pesquisarClick
    end
    inherited bt_transferir: TBitBtn
      OnClick = bt_transferirClick
    end
  end
  inherited DBGrid1: TDBGrid
    DataSource = ds_pesq_padrao
  end
end
