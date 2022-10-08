unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TFrm_Principal = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    stbPrincipal: TStatusBar;
    tmrPrincipal: TTimer;
    mnuPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Usurio1: TMenuItem;
    Empresa1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedor1: TMenuItem;
    Produto1: TMenuItem;
    Formadepagamento1: TMenuItem;
    Movimento1: TMenuItem;
    Compra1: TMenuItem;
    Venda1: TMenuItem;
    Relatrio1: TMenuItem;
    Listadeusurios1: TMenuItem;
    Listadefornecedores1: TMenuItem;
    Listadeprodutos1: TMenuItem;
    Listadecompras1: TMenuItem;
    Listadevendas1: TMenuItem;
    Sobreosistema1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Tempo: TMenuItem;
    Timer1: TTimer;
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Abre_Tela_Usuario;
    procedure Usurio1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Abre_Tela_Empresa;
    procedure Empresa1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Abre_Tela_Cliente;
    procedure Abre_Tela_Fornecedor;
    procedure SpeedButton4Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Abre_Tela_Produto;
    procedure SpeedButton5Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Abre_Tela_FormPgto;
    procedure SpeedButton6Click(Sender: TObject);
    procedure Formadepagamento1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Abre_Tela_Compra;
    procedure SpeedButton9Click(Sender: TObject);
    procedure Abre_Tela_TrocarUsuario;
    procedure SpeedButton8Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 function TimeBetween(aDateStart, aDateEnd: TDateTime): String;
var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

uses U_Usuario, U_Empresa, U_Cliente, U_Fornecedor, U_Produtos, U_FormPgto,
  U_Compra, u_TelaLogin, U_TrocaUsuario,U_Vendas;

procedure TFrm_Principal.SpeedButton10Click(Sender: TObject);
begin
if Messagedlg('Deseja sair do sistema mesmo ?', mtConfirmation, [mbOk, mbNo], 0)
    = mrOk then
  Close();
end;

procedure TFrm_Principal.SpeedButton1Click(Sender: TObject);
begin
  Abre_Tela_Usuario;
end;

procedure TFrm_Principal.SpeedButton2Click(Sender: TObject);
begin
  Abre_Tela_Empresa();
end;

procedure TFrm_Principal.SpeedButton3Click(Sender: TObject);
begin
  Abre_Tela_Cliente;
end;

procedure TFrm_Principal.SpeedButton4Click(Sender: TObject);
begin
 if FTipo = 0 then
  Abre_Tela_Fornecedor;
end;

procedure TFrm_Principal.SpeedButton5Click(Sender: TObject);
begin
 if FTipo = 0  then
  Abre_Tela_Produto;
end;

procedure TFrm_Principal.SpeedButton6Click(Sender: TObject);
begin
  Abre_Tela_FormPgto;
end;

procedure TFrm_Principal.SpeedButton7Click(Sender: TObject);
begin
  Abre_Tela_Compra;
end;

procedure TFrm_Principal.SpeedButton8Click(Sender: TObject);
begin
  Frm_Vendas := TFrm_Vendas.Create(self);
  Frm_Vendas.ShowModal;
  try

  finally
    Frm_Vendas.Free;
    Frm_Vendas := nil;
  end;
end;

procedure TFrm_Principal.SpeedButton9Click(Sender: TObject);
begin
  // Abre_Tela_TrocarUsuario;
end;

procedure TFrm_Principal.tmrPrincipalTimer(Sender: TObject);
begin
  stbPrincipal.Panels[0].Text := DateToStr(now);
  stbPrincipal.Panels[1].Text := TimeToStr(now);
  stbPrincipal.Panels[2].Text := 'Bem-vindo ao sistema';
end;

procedure TFrm_Principal.Usurio1Click(Sender: TObject);
begin
  Abre_Tela_Usuario;
end;

procedure TFrm_Principal.Abre_Tela_Usuario;
begin
  frm_Usuario := TFrm_Usuario.Create(self);
  frm_Usuario.ShowModal;
  try

  finally
    frm_Usuario.Free;
    frm_Usuario := nil;
  end;
end;

procedure TFrm_Principal.Compra1Click(Sender: TObject);
begin
 Abre_Tela_Compra;
end;

procedure TFrm_Principal.Empresa1Click(Sender: TObject);
begin
 if FTipo = 0 then
  Abre_Tela_Empresa;
end;

procedure TFrm_Principal.Formadepagamento1Click(Sender: TObject);
begin
 if FTipo = 0 then
  Abre_Tela_FormPgto;
end;

procedure TFrm_Principal.Fornecedor1Click(Sender: TObject);
begin
  Abre_Tela_Fornecedor;
end;

procedure TFrm_Principal.Produto1Click(Sender: TObject);
begin
  Abre_Tela_Produto;
end;

procedure TFrm_Principal.Abre_Tela_Compra;
begin
  Frm_Compra := TFrm_Compra.Create(self);
  Frm_Compra.ShowModal;
  try

  finally
    Frm_Compra.Free;
    Frm_Compra := nil;
  end;
end;

procedure TFrm_Principal.Abre_Tela_Empresa;
begin
  frm_Empresa := TFrm_Empresa.Create(self);
  frm_Empresa.ShowModal;
  try

  finally
    frm_Empresa.Free;
    frm_Empresa := nil;
  end;
end;

procedure TFrm_Principal.Abre_Tela_Cliente;
begin
  frm_Cliente := TFrm_Cliente.Create(self);
  frm_Cliente.ShowModal;
  try

  finally
    frm_Cliente.Free;
    frm_Cliente := nil;
  end;
end;

procedure TFrm_Principal.Abre_Tela_Fornecedor;
begin
  frm_Fornecedor := TFrm_Fornecedor.Create(self);
  frm_Fornecedor.ShowModal;
  try

  finally
    frm_Fornecedor.Free;
    frm_Fornecedor := nil;
  end;
end;

procedure TFrm_Principal.Abre_Tela_FormPgto;
begin
  frm_FormPgto := TFrm_FormPgto.Create(self);
  frm_FormPgto.ShowModal;
  try

  finally
    frm_FormPgto.Free;
    frm_FormPgto := nil;
  end;
end;

procedure TFrm_Principal.Abre_Tela_Produto;
begin
  frm_Produtos := TFrm_Produtos.Create(self);
  frm_Produtos.ShowModal;
  try

  finally
    frm_Produtos.Free;
    frm_Produtos := nil;
  end;
end;

procedure TFrm_Principal.Abre_Tela_TrocarUsuario;
begin
  frm_TrocaUsuario := Tfrm_TrocaUsuario.Create(self);
  frm_TrocaUsuario.ShowModal;
  try

  finally
    frm_TrocaUsuario.Free;
    frm_TrocaUsuario := nil;
  end;
end;


function TimeBetween(aDateStart, aDateEnd: TDateTime): String;
var
  Hour, Minute, Second: Integer;
begin
  Result := '';

  if (aDateStart < aDateEnd) then
    Second := Round(86400 * (aDateEnd - aDateStart))
  else
    Second := Round(86400 * (aDateStart - aDateEnd));

  Hour := Second div 3600;
  Second := Second - (Hour * 3600);
  Minute := Second div 60;
  Second := Second - (Minute * 60);

  if (Hour > 0) then
  begin
    if (Length(IntToStr(Hour)) > 2) then
      Result := IntToStr(Hour)
    else
      Result := FormatFloat('00', Hour);
  end
  else
    Result := FormatFloat('00', 0);

  Result := Result + ':' + FormatFloat('00', Minute) + ':' +
    FormatFloat('00', Second);
end;


end.
