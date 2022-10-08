unit U_Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Padrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrm_Vendas = class(TFrm_Padrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    DBEditnvendas: TDBEdit;
    DB_Cadastro: TDBEdit;
    DBEditusuario: TDBEdit;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    DBEditidcliente: TDBEdit;
    Q_pesq_padrao: TFDQuery;
    Label7: TLabel;
    DBEditvalor: TDBEdit;
    Paneltotal: TPanel;
    Label6: TLabel;
    DBEditqtde: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisa;
  public
    { Public declarations }
  end;

var
  Frm_Vendas: TFrm_Vendas;

implementation

{$R *.dfm}
uses U_Pesquisa_Venda;

procedure TFrm_Vendas.btnNovoClick(Sender: TObject);
begin
  inherited;
  DB_Cadastro.Text := dateToStr(now);
  DB_Cadastro.Enabled := False;
end;

procedure TFrm_Vendas.btnPesquisarClick(Sender: TObject);
begin
  inherited;
 Frm_Pesquisa_Padrao1 := TFrm_Pesquisa_Padrao1.Create(self);
  Frm_Pesquisa_Padrao1.ShowModal;
  try
   if Frm_Pesquisa_Padrao1.codigo > 0 then
      begin
        q_padrao.Open;
        Q_Padrao.Locate('ID_VENDA',Frm_Pesquisa_Padrao1.codigo,[]);
      end;

  finally
    Frm_Pesquisa_Padrao1.Free;
    Frm_Pesquisa_Padrao1:=nil;
  end;
end;

procedure TFrm_Vendas.FormShow(Sender: TObject);
begin
  inherited;
  Pesquisa();
end;

procedure TFrm_Vendas.Pesquisa;
begin
  Q_pesq_padrao.Close; // fecha
  Q_pesq_padrao.SQL.Add(''); // limpa
  Q_pesq_padrao.Params.Clear; // limpamos os parametros
  Q_pesq_padrao.SQL.Clear; // limPa o sql
  Q_pesq_padrao.SQL.Add('SELECT COUNT(*) FROM VENDA ');
  Q_pesq_padrao.Open;
  Paneltotal.Caption := intTostr(Q_pesq_padrao.Fields[0].AsInteger);
end;

end.
