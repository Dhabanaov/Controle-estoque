unit U_TelaLogin;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, frxDock;

type
  Ttelalogin = class(TForm)
    Q_Padrao: TFDQuery;
    Q_PadraoID_USUARIO: TIntegerField;
    Q_PadraoNOME: TStringField;
    Q_PadraoSENHA: TStringField;
    Q_PadraoTIPO: TStringField;
    Q_PadraoCADASTRO: TDateField;
    ds_padrao: TDataSource;
    Q_pesq_padrao: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    criarusuario: TButton;
    Editnome: TEdit;
    procedure OKBtnClick(Sender: TObject);
    procedure criarusuarioClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FAcesso: Boolean;
  public

    { Public declarations }
  end;

var
  telalogin: Ttelalogin;
  FNome: string;
  FSenha: string;
  FTipo: Integer;
  FID_USUARIO: Integer;

implementation

{$R *.dfm}

uses U_Form_Pesquisa_Padrao, Vcl.Dialogs, U_Principal, U_Usuario;

procedure Ttelalogin.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure Ttelalogin.criarusuarioClick(Sender: TObject);
begin
  Frm_Usuario := TFrm_Usuario.Create(self);
  Frm_Usuario.ShowModal;
  try

  finally
    Frm_Usuario.Free;
    Frm_Usuario := nil;
  end;
end;

procedure Ttelalogin.FormShow(Sender: TObject);
begin
  Editnome.SetFocus;
end;

procedure Ttelalogin.OKBtnClick(Sender: TObject);
begin
  begin
    Q_pesq_padrao.Close; // fecha
    Q_pesq_padrao.SQL.Add(''); // limpa
    Q_pesq_padrao.Params.Clear; // limpamos os parametros
    Q_pesq_padrao.SQL.Clear; // limPa o sql
    Q_pesq_padrao.SQL.Add('SELECT ID_USUARIO, NOME,SENHA,TIPO FROM usuario ');
    // add sql
    Q_pesq_padrao.SQL.Add('WHERE nome =:nome AND senha =:senha');
    // criamos o parametro
    Q_pesq_padrao.ParamByName('nome').AsString := Editnome.Text;
    Q_pesq_padrao.ParamByName('SENHA').AsString := Password.Text;
    Q_pesq_padrao.Open;

    case Q_pesq_padrao.IsEmpty of
      True:
        begin
          Messagedlg('Usuario ou senha incorreta!', MtInformation, [mbOk], 0);
        end;
      False:
        begin
          FNome := Editnome.Text;
          FSenha := Password.Text;
          if length(Q_pesq_padrao.Fields[3].AsString) > 10 then
            FTipo := 0;
          FID_USUARIO := Q_pesq_padrao.Fields[0].AsInteger;

          Frm_Principal := TFrm_Principal.Create(self);
          Frm_Principal.ShowModal;
          try

          finally
            Frm_Principal.Free;
            Frm_Principal := nil;
          end;
          self.Hide;
          Close();
        end;
    end;
  end;
end;

initialization

RegisterClass(Ttelalogin);

finalization

UnRegisterClass(Ttelalogin);

end.
