unit U_Pesquisa_Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Form_Pesquisa_Padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls;

type
  TFrm_Pesquisa_Padrao2 = class(TFrm_Pesquisa_Padrao)
    procedure bt_pesquisarClick(Sender: TObject);
    procedure bt_transferirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Pesquisa_Padrao2: TFrm_Pesquisa_Padrao2;
  Tipo: boolean;

implementation

{$R *.dfm}

procedure TFrm_Pesquisa_Padrao2.bt_pesquisarClick(Sender: TObject);
begin
  Q_pesq_padrao.Close; // fecha
  Q_pesq_padrao.SQL.Add(''); // limpa
  Q_pesq_padrao.Params.Clear; // limpamos os parametros
  Q_pesq_padrao.SQL.Clear; // limPa o sql
  Q_pesq_padrao.SQL.Add('SELECT A.ID_EMPRESA, ' + 'A.RAZAO_SOCIAL,' +
    'A.N_FANTASIA,         ' + 'A.ENDERECO,          ' + 'A.NUMERO,      ' +
    'A.BAIRRO,          ' + 'A.CIDADE,    ' + 'A.UF,             ' +
    'A.CEP ,         ' + 'A.TELEFONE,          ' + 'A.CNPJ,         ' +
    'A.EMAIL,          ' + 'A.CADASTRO ,        ' +
    '  a.LOGO FROM EMPRESA A      ');
  // OPÇÕES DE PESQUISA
  case cb_chave_pesquisa.ItemIndex of
    0:
      begin // pesquisa por c
        Q_pesq_padrao.SQL.Add('WHERE A.ID_EMPRESA =:PID_EMPRESA');
        // criamos o parametro
        Q_pesq_padrao.ParamByName('PID_EMPRESA').AsString := ed_nome.Text;
        // aponta para o campo do parametro

      end;

    1:
      begin // pesquisa por nome
        Q_pesq_padrao.SQL.Add('WHERE A.RAZAO_SOCIAL LIKE :PRAZAO_SOCIAL');
        // criamos o parametro
        Q_pesq_padrao.ParamByName('PRAZAO_SOCIAL').AsString :=
          '%' + ed_nome.Text + '%'; // aponta para o campo do parametro

      end;

    2:
      begin // pesquisa por dadta
        Q_pesq_padrao.SQL.Add('WHERE A.CADASTRO =:PCADASTRO');
        Q_pesq_padrao.ParamByName('PCADASTRO').AsDate :=
          strTodate(mk_inicio.Text);
      end;

    3:
      begin // pesquisa por periodo
        Q_pesq_padrao.SQL.Add('WHERE A.CADASTRO BETWEEN :PINICIO AND :PFIM');
        Q_pesq_padrao.ParamByName('PINICIO').AsDate :=
          strTodate(mk_inicio.Text);
        Q_pesq_padrao.ParamByName('PFIM').AsDate := strTodate(mk_fim.Text);
      end;

    4:
      begin
        Q_pesq_padrao.SQL.Add('ORDER BY A.ID_EMPRESA');

      end;
  end;

  // abre a query mostra o resultado
  Q_pesq_padrao.Open;

  // Mostra a quantidade de registros encontrados
  lb_Resultado.Caption := ' Total de Registros Localizados:   ' +
    IntTostr(Q_pesq_padrao.recordcount);

  // se nada for encontrado mostra a msg
  if Q_pesq_padrao.IsEmpty then
  begin
    Messagedlg('Registro não encontrado!', MtInformation, [mbOk], 0);
  end
  else
    abort;
end;

procedure TFrm_Pesquisa_Padrao2.bt_transferirClick(Sender: TObject);
begin
  inherited;
  if Q_pesq_padrao.recordcount > 0 then
  begin
    codigo := Q_pesq_padrao.Fields[0].AsInteger;
  end
  else
    abort;
end;

end.
