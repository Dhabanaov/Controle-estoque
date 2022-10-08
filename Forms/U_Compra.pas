unit U_Compra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Padrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Datasnap.DBClient, Vcl.Mask;

type
  TFrm_Compra = class(TFrm_Padrao)
    Label1: TLabel;
    Label13: TLabel;
    DB_ID_Compra: TDBEdit;
    DB_Cadastro: TDBEdit;
    Label3: TLabel;
    DB_ID_FORNECEDOR: TDBEdit;
    DB_NOME_FORNECEDOR: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    DBEditformapagamento: TDBEdit;
    DBEditdescricao: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBusuario: TDBEdit;
    DB_Valor: TDBEdit;
    Q_pesq_padrao: TFDQuery;
    procedure btnNovoClick(Sender: TObject);
    procedure DB_ID_FORNECEDORChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Compra: TFrm_Compra;

implementation

{$R *.dfm}

uses u_principal, u_dm, U_Pesquisa_Empresa;

procedure TFrm_Compra.btnNovoClick(Sender: TObject);
begin
  inherited;
  DB_Cadastro.Text := dateToStr(now);
  DB_ID_FORNECEDOR.SetFocus;
end;

procedure TFrm_Compra.btnPesquisarClick(Sender: TObject);
begin
  inherited;
//  Frm_Pesquisa_Padrao2 := TFrm_Pesquisa_Padrao2.Create(self);
//  Frm_Pesquisa_Padrao2.ShowModal;
//  try
//    if Frm_Pesquisa_Padrao2.codigo > 0 then
//    begin
//
//      q_padrao.Open;
//      case Tipo of
//        False:
//          q_padrao.Locate('ID_EMPRESA', Frm_Pesquisa_Padrao2.codigo, []);
//        True:
//          q_padrao.Locate('ID_compra', Frm_Pesquisa_Padrao2.codigo, []);
//      end;
//
//    end;
//
//  finally
//    Frm_Pesquisa_Padrao2.Free;
//    Frm_Pesquisa_Padrao2 := nil;
//  end;
end;

procedure TFrm_Compra.DB_ID_FORNECEDORChange(Sender: TObject);
begin
  inherited;
  if not(q_padrao.State = dsBrowse) then
  begin
    Q_pesq_padrao.Close; // fecha
    Q_pesq_padrao.SQL.Add(''); // limpa
    Q_pesq_padrao.Params.Clear; // limpamos os parametros
    Q_pesq_padrao.SQL.Clear; // limPa o sql
    Q_pesq_padrao.SQL.Add('SELECT NOME FROM FORNECEDOR '); // add sql
    Q_pesq_padrao.SQL.Add('WHERE ID_FORNECEDOR =:ID_FORNECEDOR');
    // criamos o parametro
    Q_pesq_padrao.ParamByName('ID_FORNECEDOR').AsInteger :=
      strToInt(DB_ID_FORNECEDOR.Text); // aponta para o campo do parametro
    Q_pesq_padrao.Open;

    DB_NOME_FORNECEDOR.Text := Q_pesq_padrao.Fields[0].AsString;
  end;

end;

end.
