unit Win_Master;

interface
uses
  System.Generics.Collections, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Frame_agents, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  BD_Manager, Agents, Navigator,Main_Class,Product_Class,Supplier_Class,
  Request_Sup_Class,Material_Class,Frame_manufacture,Manufacture_Class,Create_manufacture,Create_Req_Sup,Create_material;
type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabMan: TTabSheet;
    TabReq: TTabSheet;
    TabMat: TTabSheet;
    TabProd: TTabSheet;
    Navigator_Manufacture: TFrame10;
    Navigator_Req: TFrame10;
    Navigator_Production: TFrame10;
    Panel_manufacture: TPanel;
    Panel_MAterials: TPanel;
    Panel_request_sup: TPanel;
    Panel_production: TPanel;
    PanelUpMan: TPanel;
    Edit_Man: TEdit;
    Sort_man: TComboBox;
    Filtr_man: TComboBox;
    Button1: TButton;
    PanelUpReqSup: TPanel;
    Edit_req: TEdit;
    Sort_req: TComboBox;
    Filtr_req: TComboBox;
    ButtonAddRequest: TButton;
    PanelUpProd: TPanel;
    Edit_Prod: TEdit;
    Sort_Prod: TComboBox;
    Filter_prod: TComboBox;
    PanelUpMat: TPanel;
    Edit_mat: TEdit;
    Sort_mat: TComboBox;
    Navigator_Material: TFrame10;
    Filtr_mat: TComboBox;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure reload_req();
      procedure reload_prod();
       procedure NavigatorFrameRightLabelClick(Sender: TObject);
    procedure NavigatorFrameLeftLabelClick(Sender: TObject);
    procedure NavigatorFrameLabel_1Click(Sender: TObject);
    procedure NavigatorFrameLabel_2Click(Sender: TObject);
    procedure NavigatorFrameLabel_3Click(Sender: TObject);
    procedure NavigatorFrameLabel_4Click(Sender: TObject);
    procedure ButtonAddRequestClick(Sender: TObject);
    procedure EditsChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);

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

  MaterClass: TMaterial_Class;
  ADO_mater:  TADOQuery;
  C_mater: integer;

   ManClass: TManufacture_Class;
  ADO_man:  TADOQuery;
  C_man: integer;

implementation

constructor TForm3.Create;
begin
       inherited;
  MaterClass := TMaterial_Class.Create;
  C_mater:= MaterClass.array_of_material.Count;
  MaterClass.load_frames(Panel_MAterials,0, C_req);
  MaterClass.create_sort(Sort_mat);
  MaterClass.create_filter(Filtr_mat);
  MaterClass.load_pages(Navigator_Material.Panel2,MaterClass.array_of_material.Count,0);


  ProdClass := TProduct_Class.Create;
  C_prod := ProdClass.array_of_products.Count;
  ProdClass.load_frames(Panel_production, 0, C_prod);
  ProdClass.create_sort(Sort_Prod);
  ProdClass.create_filter(filter_prod);
  ProdClass.load_pages(Navigator_Production.Panel2, ProdClass.array_of_products.Count,0);


  ReqClass := TRequest_Sup_Class.Create;
  C_req:= ReqClass.array_of_requests_sup.Count;
  ReqClass.load_frames(Panel_request_sup,0, C_req);
  ReqClass.create_sort(Sort_req);
  ReqClass.create_filter(Filtr_req);
  ReqClass.load_pages(Navigator_Req.Panel2, ReqClass.array_of_requests_sup.Count,0);


  ManClass := TManufacture_Class.Create;
  C_man:= ManClass.array_of_manufacture.Count;
  ManClass.load_frames(Panel_manufacture,0, C_man);
  ManClass.create_sort(sort_man);
  ManClass.create_filter(Filtr_man);
  ManClass.load_pages(Navigator_Manufacture.Panel2, ManClass.array_of_manufacture.Count,0);


end;





{$R *.dfm}



procedure TForm3.Button2Click(Sender: TObject);      //добавление материала
var CM: TForm21;
begin
     CM:=TForm21.Create(self);
     CM.ShowModal;
end;

procedure TForm3.ButtonAddRequestClick(Sender: TObject);
var CreateReqSup:TForm23;
begin
    CreateReqSup:= TForm23.Create(self);
    CreateReqSup.ShowModal;
    reload_req;
end;

procedure TForm3.EditsChange(Sender: TObject);
begin
  if (PageControl1.ActivePage = TabReq) then
     begin
         ReqClass.FiltrChange(Edit_Req, Filtr_Req, Sort_Req);
         ReqClass.load_frames(Panel_request_sup, 0, ReqClass.array_of_requests_sup.Count);
         ReqClass.load_pages(Navigator_Req.Panel2, ReqClass.array_of_requests_sup.Count, 0);
     end;
     if (PageControl1.ActivePage = TabMat) then
  begin
        MaterClass.FiltrChange(Edit_mat, Filtr_mat, Sort_mat);
        MaterClass.load_frames(Panel_MAterials, 0, MaterClass.array_of_material.Count);
        MaterClass.load_pages(Navigator_Material.Panel2,  MaterClass.array_of_material.Count, 0);
  end;
  if (PageControl1.ActivePage = TabProd) then
  begin
         ProdClass.FiltrChange(Edit_prod, Filter_prod,Sort_prod);
         ProdClass.load_frames(Panel_Production, 0, ProdClass.array_of_products.Count);
         ProdClass.load_pages( Navigator_Production.Panel2, ProdClass.array_of_products.Count, 0);
  end;
  if (PageControl1.ActivePage = TabMan) then
  begin
         ManClass.FiltrChange(Edit_Man, Filtr_Man, Sort_Man);
         ManClass.load_frames(Panel_manufacture, 0, ManClass.array_of_manufacture.Count);
         ManClass.load_pages(Navigator_Manufacture.Panel2, ManClass.array_of_manufacture.Count, 0);
  end;

end;



procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   application.Terminate;
end;

procedure TForm3.reload_req;
begin
  ReqClass := TRequest_Sup_Class.Create;
  C_req:= ReqClass.array_of_requests_sup.Count;
  ReqClass.load_frames(Panel_request_sup,0, C_req);
  ReqClass.load_pages(Navigator_Req.Panel2, ReqClass.array_of_requests_sup.Count,0);
end;

procedure TForm3.reload_prod();
begin
  ProdClass := TProduct_Class.Create;
  C_prod := ProdClass.array_of_products.Count;
  ProdClass.load_frames(Panel_production, 0, C_prod);
  ProdClass.load_pages(Navigator_Production.Panel2, ProdClass.array_of_products.Count,0);


end;


procedure TForm3.NavigatorFrameLabel_1Click(Sender: TObject);        ///1
begin
      var  i : integer;
  if (PageControl1.ActivePage =TabMan) then
  begin
    i:= strToInt(  Navigator_Manufacture.Label_1.Caption) - 1;
    ManClass.load_frames(Panel_manufacture, i, ManClass.array_of_manufacture.Count);
    Navigator_Manufacture.Label_1.Font.Style := [fsUnderline];
    Navigator_Manufacture.Label_2.Font.Style := [];
    Navigator_Manufacture.Label_3.Font.Style:= [];
    Navigator_Manufacture.Label_4.Font.Style := [];

  end;
  if (PageControl1.ActivePage = TabReq) then
  begin
    i:= strToInt( Navigator_Req.Label_1.Caption) - 1;
    ReqClass.load_frames(Panel_request_sup, i, ReqClass.array_of_requests_sup.Count);
    Navigator_Req.Label_1.Font.Style := [fsUnderline];
   Navigator_Req.Label_2.Font.Style := [];
   Navigator_Req.Label_3.Font.Style:= [];
    Navigator_Req.Label_4.Font.Style := [];
  end;
  if (PageControl1.ActivePage = TabProd) then
  begin
    i:= strToInt(  Navigator_Production.Label_1.Caption  ) - 1;
    ProdClass.load_frames(Panel_production, i, ProdClass.array_of_products.Count);
     Navigator_Production.Label_1.Font.Style := [fsUnderline];
   Navigator_Production.Label_2.Font.Style := [];
   Navigator_Production.Label_3.Font.Style:= [];
   Navigator_Production.Label_4.Font.Style := [];
  end;
    if (PageControl1.ActivePage = TabMat) then
  begin
    i:= strToInt(  Navigator_Material.Label_1.Caption  ) - 1;
   MaterClass.load_frames(Panel_materials, i, MaterClass.array_of_material.Count);
     Navigator_Material.Label_1.Font.Style := [fsUnderline];
   Navigator_Material.Label_2.Font.Style := [];
   Navigator_Material.Label_3.Font.Style:= [];
   Navigator_Material.Label_4.Font.Style := [];
  end;
end;
procedure TForm3.NavigatorFrameLabel_2Click(Sender: TObject);
begin
        var  i : integer;
  if (PageControl1.ActivePage = TabMan) then
  begin
    i:= strToInt(  Navigator_Manufacture.Label_2.Caption) - 1;
    ManClass.load_frames(Panel_manufacture, i,  ManClass.array_of_manufacture.Count);
    Navigator_Manufacture.Label_1.Font.Style := [];
   Navigator_Manufacture.Label_2.Font.Style := [fsUnderline];
   Navigator_Manufacture.Label_3.Font.Style:= [];
   Navigator_Manufacture.Label_4.Font.Style := [];

  end;
  if (PageControl1.ActivePage = TabReq) then
  begin
    i:= strToInt( Navigator_Req.Label_2.Caption) - 1;
    ReqClass.load_frames(Panel_request_sup, i, ReqClass.array_of_requests_sup.Count);
    Navigator_Req.Label_1.Font.Style := [];
   Navigator_Req.Label_2.Font.Style := [fsUnderline];
   Navigator_Req.Label_3.Font.Style:= [];
    Navigator_Req.Label_4.Font.Style := [];
  end;
  if (PageControl1.ActivePage = TabProd) then
  begin
    i:= strToInt(  Navigator_Production.Label_2.Caption  ) - 1;
    ProdClass.load_frames(Panel_production, i, ProdClass.array_of_products.Count);
     Navigator_Production.Label_1.Font.Style := [];
   Navigator_Production.Label_2.Font.Style := [fsUnderline];
   Navigator_Production.Label_3.Font.Style:= [];
   Navigator_Production.Label_4.Font.Style := [];
  end;

    if (PageControl1.ActivePage = TabMat) then
  begin
    i:= strToInt(  Navigator_Material.Label_2.Caption  ) - 1;
    MaterClass.load_frames(Panel_materials, i, MaterClass.array_of_material.Count);
    Navigator_Material.Label_1.Font.Style := [];
   Navigator_Material.Label_2.Font.Style := [fsUnderline];
   Navigator_Material.Label_3.Font.Style:= [];
   Navigator_Material.Label_4.Font.Style := [];
  end;
end;
procedure TForm3.NavigatorFrameLabel_3Click(Sender: TObject);
begin
        var  i : integer;
  if (PageControl1.ActivePage = TabMan) then
  begin
    i:= strToInt(  Navigator_Manufacture.Label_3.Caption) - 1;
    ManClass.load_frames(Panel_manufacture, i, ManClass.array_of_manufacture.Count);
    Navigator_Manufacture.Label_1.Font.Style := [];
    Navigator_Manufacture.Label_2.Font.Style := [];
    Navigator_Manufacture.Label_3.Font.Style:= [fsUnderline];
    Navigator_Manufacture.Label_4.Font.Style := [];

  end;
  if (PageControl1.ActivePage = TabReq) then
  begin
    i:= strToInt( Navigator_Req.Label_3.Caption) - 1;
    ReqClass.load_frames(Panel_request_sup, i, ReqClass.array_of_requests_sup.Count);
    Navigator_Req.Label_1.Font.Style := [];
    Navigator_Req.Label_2.Font.Style := [];
    Navigator_Req.Label_3.Font.Style:= [fsUnderline];
    Navigator_Req.Label_4.Font.Style := [];
  end;
  if (PageControl1.ActivePage = TabProd) then
  begin
    i:= strToInt(  Navigator_Production.Label_3.Caption  ) - 1;
    ProdClass.load_frames(Panel_production, i, ProdClass.array_of_products.Count);
     Navigator_Production.Label_1.Font.Style := [];
   Navigator_Production.Label_2.Font.Style := [];
   Navigator_Production.Label_3.Font.Style:= [fsUnderline];
   Navigator_Production.Label_4.Font.Style := [];
  end;


  if (PageControl1.ActivePage = TabMat) then
  begin
    i:= strToInt(  Navigator_Material.Label_3.Caption  ) - 1;
    MaterClass.load_frames(Panel_materials, i, MaterClass.array_of_material.Count);
    Navigator_Material.Label_1.Font.Style := [];
   Navigator_Material.Label_2.Font.Style := [];
   Navigator_Material.Label_3.Font.Style:= [fsUnderline];
   Navigator_Material.Label_4.Font.Style := [];
  end;
end;



procedure TForm3.NavigatorFrameLabel_4Click(Sender: TObject);
begin

        var  i : integer;

         if (PageControl1.ActivePage = TabMan) then
  begin
    i:= strToInt(  Navigator_Manufacture.Label_4.Caption) - 1;
    ManClass.load_frames(Panel_manufacture, i, ManClass.array_of_manufacture.Count);
    Navigator_Manufacture.Label_1.Font.Style := [];
    Navigator_Manufacture.Label_2.Font.Style := [];
    Navigator_Manufacture.Label_3.Font.Style:= [];
    Navigator_Manufacture.Label_4.Font.Style := [fsUnderline];

  end;
    if (PageControl1.ActivePage = TabReq) then
  begin
    i:= strToInt( Navigator_Req.Label_4.Caption) - 1;
    ReqClass.load_frames(Panel_request_sup, i, ReqClass.array_of_requests_sup.Count);
    Navigator_Req.Label_1.Font.Style := [];
    Navigator_Req.Label_2.Font.Style := [];
    Navigator_Req.Label_3.Font.Style:= [];
    Navigator_Req.Label_4.Font.Style := [fsUnderline];
  end;
  if (PageControl1.ActivePage = TabProd) then
  begin
    i:= strToInt(  Navigator_Production.Label_4.Caption  ) - 1;
    ProdClass.load_frames(Panel_production, i, ProdClass.array_of_products.Count);
     Navigator_Production.Label_1.Font.Style := [];
   Navigator_Production.Label_2.Font.Style := [];
   Navigator_Production.Label_3.Font.Style:= [];
   Navigator_Production.Label_4.Font.Style := [fsUnderline];
  end;


  if (PageControl1.ActivePage = TabMat) then
  begin
    i:= strToInt(  Navigator_Material.Label_4.Caption  ) - 1;
    MaterClass.load_frames(Panel_materials, i, MaterClass.array_of_material.Count);
    Navigator_Material.Label_1.Font.Style := [];
   Navigator_Material.Label_2.Font.Style := [];
   Navigator_Material.Label_3.Font.Style:= [];
   Navigator_Material.Label_4.Font.Style := [fsUnderline];
  end;


end;

procedure TForm3.NavigatorFrameLeftLabelClick(Sender: TObject);           //стрела в лево агента
begin
        var nx : integer;
  if (PageControl1.ActivePage = TabMan) then
  begin
    nx := ManClass.change_pages_l( Navigator_Manufacture.Panel2);
    ManClass.load_frames(Panel_manufacture, nx - 1, ManClass.array_of_manufacture.Count);
  end;
  if (PageControl1.ActivePage = TabReq) then
  begin
    nx := ReqClass.change_pages_l( Navigator_Req.Panel2);
    ReqClass.load_frames(Panel_request_sup, nx - 1, ReqClass.array_of_requests_sup.Count);
  end;
  if (PageControl1.ActivePage = TabProd) then
  begin
    nx := ProdClass.change_pages_l( Navigator_Production.Panel2 );
    ProdClass.load_frames(Panel_production, nx - 1, ProdClass.array_of_products.Count);
  end;
    if (PageControl1.ActivePage = TabMat) then
  begin
    nx := MaterClass.change_pages_l( Navigator_Material.Panel2 );
    MaterClass.load_frames(Panel_materials, nx - 1, MaterClass.array_of_material.Count);
  end;
end;
procedure TForm3.NavigatorFrameRightLabelClick(Sender: TObject);    // right а
begin
        var  x,nx : integer;
  if (PageControl1.ActivePage = TabMan) then
  begin
    x := ManClass.array_of_manufacture.Count -
      (strToInt(Navigator_Manufacture.Label_4.Caption) * ManClass.on_page);  //оставшиеся фреймы для следущих страниц
    nx := ManClass.change_pages_r( Navigator_Manufacture.Panel2, x);
    ManClass.load_frames(Panel_manufacture, nx - 1, ManClass.array_of_manufacture.Count);

  end;
  if (PageControl1.ActivePage = TabReq) then
  begin
      x := ReqClass.array_of_requests_sup.Count -
      (strToInt(Navigator_Req.Label_4.Caption) * ReqClass.on_page);
    nx := ReqClass.change_pages_r( Navigator_Req.Panel2, x);
    ReqClass.load_frames(Panel_request_sup, nx - 1, ReqClass.array_of_requests_sup.Count);

  end;
  if (PageControl1.ActivePage = TabProd) then
  begin
     x := ProdClass.array_of_products.Count -
      (strToInt(Navigator_Production.Label_4.Caption) * ProdClass.on_page);
    nx := ProdClass.change_pages_r( Navigator_Production.Panel2, x);
    ProdClass.load_frames(Panel_production, nx - 1, ProdClass.array_of_products.Count);

  end;

    if (PageControl1.ActivePage = TabMat) then
  begin
     x := MaterClass.array_of_material.Count -
      (strToInt(Navigator_Material.Label_4.Caption) * MaterClass.on_page);
    nx := MaterClass.change_pages_r( Navigator_Material.Panel2, x);
    MaterClass.load_frames(Panel_materials, nx - 1, MaterClass.array_of_material.Count);
  end;

end;

procedure TForm3.PageControl1Change(Sender: TObject);
begin
  if(PageControl1.ActivePageIndex=3 )  then
  begin
   MaterClass := TMaterial_Class.Create;
  C_mater:= MaterClass.array_of_material.Count;
  MaterClass.load_frames(Panel_MAterials,0, C_req);


  end;

end;

end.
