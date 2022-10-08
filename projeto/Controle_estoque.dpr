program Controle_estoque;

uses
  Vcl.Forms,
  U_Principal in '..\Forms\U_Principal.pas' {Frm_Principal},
  U_DM in '..\Forms\U_DM.pas' {DM: TDataModule},
  U_Padrao in '..\Forms\U_Padrao.pas' {Frm_Padrao},
  U_Usuario in '..\Forms\U_Usuario.pas' {Frm_Usuario},
  U_Empresa in '..\Forms\U_Empresa.pas' {Frm_Empresa},
  U_Cliente in '..\Forms\U_Cliente.pas' {Frm_Cliente},
  U_Fornecedor in '..\Forms\U_Fornecedor.pas' {Frm_Fornecedor},
  U_FormPgto in '..\Forms\U_FormPgto.pas' {Frm_FormPgto},
  U_Form_Pesquisa_Padrao in '..\Forms\U_Form_Pesquisa_Padrao.pas' {Frm_Pesquisa_Padrao},
  U_Pesq_Usuario in '..\Forms\U_Pesq_Usuario.pas' {Frm_Pesq_Usuario},
  U_Pesq_Cliente in '..\Forms\U_Pesq_Cliente.pas' {Frm_Pesq_Cliente},
  U_Pesq_Fornecedor in '..\Forms\U_Pesq_Fornecedor.pas' {Frm_Pesq_Fornecedor},
  U_Movimento_Padrao in '..\Forms\U_Movimento_Padrao.pas' {Frm_Padrao_Movimento},
  U_Compra in '..\Forms\U_Compra.pas' {Frm_Compra},
  U_TelaLogin in '..\Forms\U_TelaLogin.pas' {telalogin},
  U_TrocaUsuario in '..\Forms\U_TrocaUsuario.pas' {Frm_TrocaUsuario},
  U_Vendas in '..\Forms\U_Vendas.pas' {Frm_Vendas},
  U_Pesquisa_Venda in '..\Forms\U_Pesquisa_Venda.pas' {Frm_Pesquisa_Padrao1},
  U_Pesquisa_Empresa in '..\Forms\U_Pesquisa_Empresa.pas' {Frm_Pesquisa_Padrao2},
  U_Produtos in '..\Forms\U_Produtos.pas' {Frm_Produtos},
  U_Pesq_Produtos in '..\Forms\U_Pesq_Produtos.pas' {Frm_Pesq_Produtos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Ttelalogin, telalogin);
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.CreateForm(TDM, DM);
  Application.Run;

end.
