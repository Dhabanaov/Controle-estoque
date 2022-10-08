unit U_DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, Data.DB, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.SqlExpr, FireDAC.Comp.UI;

type
  TDM = class(TDataModule)
    conexao: TFDConnection;
    transacao: TFDTransaction;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
