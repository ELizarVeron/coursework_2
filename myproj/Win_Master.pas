﻿unit Win_Master;

interface
uses
  System.Generics.Collections, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Frame_agents, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  BD_Manager, Agents, Navigator,Main_Class,Product_Class,Supplier_Class,Request_Sup_Class;
type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Navigator_Manufacture: TFrame10;
    Navigator_Materials: TFrame10;
    Navigator_Production: TFrame10;
    Panel_manufacture: TPanel;
    Panel_MAterials: TPanel;
    Panel_request_sup: TPanel;
    Panel_production: TPanel;
    PanelUp: TPanel;
    Edit_Agent: TEdit;
    Sort_Agent: TComboBox;
    Filtr_Agent: TComboBox;
    Button1: TButton;
    PanelUpReqSup: TPanel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button2: TButton;
    PanelUpProd: TPanel;
    Edit_Prod: TEdit;
    Sort_Prod: TComboBox;
    Filter_prod: TComboBox;
    Button4: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
     constructor Create(AOwner: TComponent); override;
  end;

  var
  Form3: TForm3;

  ProdClass: TProduct_Class;
  ADO_prod: TADOQuery;
  C_prod: integer;

  ReqClass: TRequest_Sup_Class;
  ADO_req:  TADOQuery;
  C_req: integer;

implementation

constructor TForm3.Create;
begin
       inherited;

  ProdClass := TProduct_Class.Create;
  C_prod := ProdClass.array_of_products.Count;
  ProdClass.load_frames(Panel_production, 0, C_prod);
  ProdClass.create_sort(Sort_Prod);
  ProdClass.create_filter(filter_prod);
  ProdClass.load_pages(Navigator_Production.Panel2, ProdClass.array_of_products.Count,0);


end;





{$R *.dfm}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   application.Terminate;
end;

end.
