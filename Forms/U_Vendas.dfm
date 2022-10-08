inherited Frm_Vendas: TFrm_Vendas
  Cursor = crHourGlass
  Caption = 'Frm_Vendas'
  ClientHeight = 459
  ClientWidth = 1042
  OnShow = FormShow
  ExplicitWidth = 1048
  ExplicitHeight = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    Width = 1042
    ExplicitWidth = 1042
    inherited btnPesquisar: TBitBtn
      OnClick = btnPesquisarClick
    end
  end
  inherited pnlBottom: TPanel
    Top = 401
    Width = 1042
    ExplicitTop = 401
    ExplicitWidth = 1042
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 57
    Width = 1042
    Height = 344
    Align = alClient
    BevelOuter = bvNone
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 3
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1042
      Height = 113
      Align = alTop
      Color = clBtnShadow
      Ctl3D = True
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object Label1: TLabel
        Left = 32
        Top = 24
        Width = 60
        Height = 13
        Caption = 'N'#176' da venda'
      end
      object Label2: TLabel
        Left = 224
        Top = 24
        Width = 56
        Height = 13
        Caption = 'Data venda'
      end
      object Label4: TLabel
        Left = 920
        Top = 13
        Width = 77
        Height = 13
        Caption = 'Total de vendas'
      end
      object Label3: TLabel
        Left = 419
        Top = 24
        Width = 36
        Height = 13
        Caption = 'Usuario'
      end
      object Label5: TLabel
        Left = 44
        Top = 51
        Width = 48
        Height = 13
        Caption = 'N'#176' Cliente'
      end
      object Label7: TLabel
        Left = 256
        Top = 51
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label6: TLabel
        Left = 431
        Top = 51
        Width = 24
        Height = 13
        Caption = 'Qtde'
      end
      object DBEditnvendas: TDBEdit
        Left = 98
        Top = 24
        Width = 121
        Height = 21
        DataField = 'ID_VENDA'
        DataSource = ds_padrao
        TabOrder = 0
      end
      object DB_Cadastro: TDBEdit
        Left = 286
        Top = 24
        Width = 121
        Height = 21
        DataField = 'CADASTRO'
        DataSource = ds_padrao
        TabOrder = 1
      end
      object DBEditusuario: TDBEdit
        Left = 461
        Top = 24
        Width = 121
        Height = 21
        DataField = 'USUARIO'
        DataSource = ds_padrao
        TabOrder = 2
      end
      object DBEditidcliente: TDBEdit
        Left = 98
        Top = 51
        Width = 121
        Height = 21
        DataField = 'ID_CLIENTE'
        DataSource = ds_padrao
        TabOrder = 3
      end
      object DBEditvalor: TDBEdit
        Left = 286
        Top = 51
        Width = 121
        Height = 21
        DataField = 'VALOR'
        DataSource = ds_padrao
        TabOrder = 4
      end
      object Paneltotal: TPanel
        Left = 920
        Top = 32
        Width = 81
        Height = 41
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 5
      end
      object DBEditqtde: TDBEdit
        Left = 461
        Top = 51
        Width = 121
        Height = 21
        DataField = 'qtde'
        DataSource = ds_padrao
        TabOrder = 6
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 113
      Width = 1042
      Height = 184
      Align = alTop
      DataSource = ds_padrao
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  inherited Q_Padrao: TFDQuery
    SQL.Strings = (
      
        'select '#10' v.'#10'ID_VENDA,v.ID_CLIENTE,fp.ID_FORMA_PGTO,'#10#10' v.'#10'USUARIO' +
        ' ,'#10'v.VALOR,'#10' v.'#10'CADASTRO,v.qtde from '#10'venda v'
      
        'INNER JOIN cliente c on (c.ID_CLIENTE = v.ID_CLIENTE) INNER JOIN' +
        '  FORMA_PGTO FP ON (fp.ID_FORMA_PGTO = v.ID_FORMA_PGTO)')
    Left = 632
    Top = 112
  end
  inherited ds_padrao: TDataSource
    Left = 696
    Top = 120
  end
  object Q_pesq_padrao: TFDQuery
    Connection = DM.conexao
    Left = 842
    Top = 99
  end
end
