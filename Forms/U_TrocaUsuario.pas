unit U_TrocaUsuario;

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
  TFrm_TrocaUsuario = class(TFrm_Padrao)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DB_Nome: TDBEdit;
    DB_Senha: TDBEdit;
    DB_Cadastro: TDBEdit;
    DB_Tipo: TDBComboBox;
    Q_pesq_padrao: TFDQuery;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_TrocaUsuario: TFrm_TrocaUsuario;

implementation

{$R *.dfm}

uses U_TelaLogin;

procedure TFrm_TrocaUsuario.btnAlterarClick(Sender: TObject);
begin
  inherited;
  begin
    Q_pesq_padrao.close; // fecha
    Q_pesq_padrao.SQL.Add(''); // limpa
    Q_pesq_padrao.Params.Clear; // limpamos os parametros
    Q_pesq_padrao.SQL.Clear; // limPa o sql
    Q_pesq_padrao.SQL.Add
      ('UPDATE SET NOME :NOME,SENHA =:SENHA,TIPO =:TIPO,cadastro =:cadastro');
    // add sql
    Q_pesq_padrao.SQL.Add('WHERE ID_USUARIO =:ID_USUARIO ');
    // criamos o parametro
    Q_pesq_padrao.ParamByName('nome').AsString :=
      Q_padrao.ParamByName('nome').AsString;

    Q_pesq_padrao.ParamByName('SENHA').AsString :=
      Q_padrao.ParamByName('SENHA').AsString;

    Q_pesq_padrao.ParamByName('tipo').AsString :=
      Q_padrao.ParamByName('tipo').AsString;

    Q_pesq_padrao.ParamByName('cadastro').AsDate :=
      Q_padrao.ParamByName('cadastro').AsDate;

    Q_pesq_padrao.ParamByName('ID_USUARIO').AsInteger := FID_USUARIO;
    Q_pesq_padrao.Open;

  end;
end;

procedure TFrm_TrocaUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;
  DB_Cadastro.Text := DateToStr(now);
  DB_Nome.SetFocus;
end;

end.
