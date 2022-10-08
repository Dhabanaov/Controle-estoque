unit U_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Padrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask;

type
  TFrm_Produtos = class(TFrm_Padrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DB_ID_PRODUTO: TDBEdit;
    DB_PRODUTO_DESCRICAO: TDBEdit;
    DB_ID_FORNECEDOR: TDBEdit;
    DB_VL_CUSTO: TDBEdit;
    DB_VL_VENDA: TDBEdit;
    DB_ESTOQUE: TDBEdit;
    DB_ESTOQUE_MIN: TDBEdit;
    DB_CADASTRO: TDBEdit;
    DB_NOME_FORNECEDOR: TDBEdit;
    DB_UNIDADE: TDBComboBox;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Produtos: TFrm_Produtos;

implementation

{$R *.dfm}

uses U_Pesq_Produtos;

procedure TFrm_Produtos.btnNovoClick(Sender: TObject);
begin
  inherited;
  DB_CADASTRO.Enabled := False;
  DB_CADASTRO.Text := dateToStr(now);
  DB_ID_PRODUTO.SetFocus;
end;

procedure TFrm_Produtos.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Frm_Pesq_Produtos := TFrm_Pesq_Produtos.Create(self);
  Frm_Pesq_Produtos.ShowModal;
  try
    if Frm_Pesq_Produtos.codigo > 0 then
    begin
      q_padrao.Open;
      q_padrao.Locate('ID_PRODUTO', Frm_Pesq_Produtos.codigo, []);
    end;

  finally
    Frm_Pesq_Produtos.Free;
    Frm_Pesq_Produtos := nil;
  end;
end;

end.
