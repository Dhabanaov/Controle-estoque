unit U_Empresa;

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
  TFrm_Empresa = class(TFrm_Padrao)
    Q_PadraoID_EMPRESA: TIntegerField;
    Q_PadraoRAZAO_SOCIAL: TStringField;
    Q_PadraoN_FANTASIA: TStringField;
    Q_PadraoENDERECO: TStringField;
    Q_PadraoNUMERO: TIntegerField;
    Q_PadraoBAIRRO: TStringField;
    Q_PadraoCIDADE: TStringField;
    Q_PadraoUF: TStringField;
    Q_PadraoCEP: TStringField;
    Q_PadraoTELEFONE: TStringField;
    Q_PadraoCNPJ: TStringField;
    Q_PadraoEMAIL: TStringField;
    Q_PadraoCADASTRO: TDateField;
    Q_PadraoLOGO: TBlobField;
    Label1: TLabel;
    DB_ID_Empresa: TDBEdit;
    Label2: TLabel;
    DB_RazaoSocial: TDBEdit;
    Label3: TLabel;
    DB_Fantasia: TDBEdit;
    Label4: TLabel;
    DB_Endereco: TDBEdit;
    Label5: TLabel;
    DB_Numero: TDBEdit;
    Label6: TLabel;
    DB_Bairro: TDBEdit;
    Label7: TLabel;
    DB_Cidade: TDBEdit;
    Label8: TLabel;
    DB_UF: TDBEdit;
    Label9: TLabel;
    DB_CEP: TDBEdit;
    Label10: TLabel;
    DB_Telefone: TDBEdit;
    Label11: TLabel;
    DB_CNPJ: TDBEdit;
    Label12: TLabel;
    DB_Email: TDBEdit;
    Label13: TLabel;
    DB_Cadastro: TDBEdit;
    Label14: TLabel;
    DB_Logomarca: TDBImage;
    bt_Foto: TBitBtn;
    bt_Clear: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure btnNovoClick(Sender: TObject);
    procedure bt_FotoClick(Sender: TObject);
    procedure bt_ClearClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Empresa: TFrm_Empresa;

implementation

{$R *.dfm}

uses U_Pesquisa_Empresa;

procedure TFrm_Empresa.btnNovoClick(Sender: TObject);
begin
  inherited;
  DB_Cadastro.Text := dateToStr(now);
  DB_RazaoSocial.SetFocus;
end;

procedure TFrm_Empresa.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Frm_Pesquisa_Padrao2 := TFrm_Pesquisa_Padrao2.Create(self);
  Frm_Pesquisa_Padrao2.ShowModal;
  try
    if Frm_Pesquisa_Padrao2.codigo > 0 then
    begin
      q_padrao.Open;
      q_padrao.Locate('ID_EMPRESA', Frm_Pesquisa_Padrao2.codigo, []);
    end;

  finally
    Frm_Pesquisa_Padrao2.Free;
    Frm_Pesquisa_Padrao2 := nil;
  end;
end;

procedure TFrm_Empresa.bt_ClearClick(Sender: TObject);
begin
  // Limpa imagem
  q_padrao.Edit;
  Q_PadraoLOGO.AsVariant := null;
  q_padrao.Refresh;
  MessageDlg('Imagem exclu?da com sucesso', mtInformation, [mbOk], 0);

end;

procedure TFrm_Empresa.bt_FotoClick(Sender: TObject);
begin

  q_padrao.Edit;
  OpenDialog1.Execute();
  DB_Logomarca.Picture.LoadFromFile(OpenDialog1.FileName);
  q_padrao.Refresh;
  MessageDlg('Imagem inserida com sucesso', mtInformation, [mbOk], 0);

end;

end.
