unit Win_Manager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB,
  Vcl.ExtCtrls, Main_Class, Agent_Class,
  Vcl.ComCtrls, Supplier_Class, Product_Class, Request_Agents_Class, Nav_Frame,
  Navigator, Frame_req_ag,CREATE_REQUEST , CREATE_Agent, CREATE_EDIT_Product, CREATE_EDIT_Supplier,Material_Class;

type
  TForm4 = class(TForm)
    PageControl1: TPageControl;
    Agents: TTabSheet;
    Suppliers: TTabSheet;
    Requests: TTabSheet;
    Productions: TTabSheet;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Edit_Sup: TEdit;
    Sort_Sup: TComboBox;
    Filter_Sup: TComboBox;
    Edit_Req: TEdit;
    Sort_Req: TComboBox;
    Filter_Req: TComboBox;
    Edit_Prod: TEdit;
    Sort_Prod: TComboBox;
    Filter_Prod: TComboBox;
    Panel9: TPanel;
    Edit_Agent: TEdit;
    Sort_Agent: TComboBox;
    Filtr_Agent: TComboBox;
    Navigator_Agent_Frame: TFrame10;
    Navigator_Production_Frame: TFrame10;
    Navigator_Supplier_Frame: TFrame10;
    Navigator_Request_Frame: TFrame10;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel6: TPanel;
    procedure  Edit1Change(Sender: TObject);
    procedure  SortirovkaChange(Sender: TObject);
    procedure NavigatorFrameRightLabelClick(Sender: TObject);
    procedure NavigatorFrameLeftLabelClick(Sender: TObject);
    procedure NavigatorFrameLabel_1Click(Sender: TObject);
    procedure NavigatorFrameLabel_2Click(Sender: TObject);
    procedure NavigatorFrameLabel_3Click(Sender: TObject);
    procedure NavigatorFrameLabel_4Click(Sender: TObject);
    procedure reload_agents();
    procedure reload_req();
    procedure reload_ag();
    procedure reload_sup();
    procedure reload_prod();
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SuppliersContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    class var login: string;
    { Public declarations }
  end;

var
  Form4: TForm4;

  AgentClass: TAgent_Class;
  ADO_agent: TADOQuery;
  C_agent: integer;

  SupClass: TSupplier_Class;
  ADO_sup: TADOQuery;
  C_sup: integer;

  ProdClass: TProduct_Class;
  ADO_prod: TADOQuery;
  C_prod: integer;

  ReqClass: TRequest_Agents_Class;
  ADO_req:  TADOQuery;
  C_req: integer;

  MaterClass: TMaterial_Class;
  ADO_mater:  TADOQuery;
  C_mater: integer;

implementation

constructor TForm4.Create;
begin
  inherited;
  PageControl1.ActivePage := Agents;
  MaterClass := TMaterial_Class.Create;
  C_mater:= MaterClass.array_of_material.Count;


  AgentClass := TAgent_Class.Create();
  AgentClass.Panel:=Panel1;
  AgentClass.load_frames(Panel1, 0, AgentClass.array_of_agents.Count);
  AgentClass.load_pages(Navigator_Agent_Frame.Panel2, AgentClass.array_of_agents.Count,0);
  AgentClass.create_sort( Sort_Agent);
  AgentClass.create_filter( Filtr_Agent);


  SupClass := TSupplier_Class.Create;
  C_sup :=  SupClass.array_of_suppliers.Count;
  SupClass.load_frames(Panel3, 0, C_sup);
  SupClass.create_sort(Sort_Sup);
  SupClass.create_filter(filter_sup);
  SupClass.load_pages(Navigator_Supplier_Frame.Panel2, SupClass.array_of_suppliers.Count,0);


  ProdClass := TProduct_Class.Create;
  C_prod := ProdClass.array_of_products.Count;
  ProdClass.load_frames(Panel7, 0, C_prod);
  ProdClass.create_sort(Sort_Prod);
  ProdClass.create_filter(filter_prod);
  ProdClass.load_pages(Navigator_Production_Frame.Panel2, ProdClass.array_of_products.Count,0);

  ReqClass := TRequest_Agents_Class.Create;
  C_req:= ReqClass.array_of_requests_agent.Count;
  ReqClass.load_frames(Panel6,0, C_req);
  ReqClass.create_sort(sort_req);
  ReqClass.create_filter(Filter_req);
  ReqClass.load_pages(Navigator_Request_Frame.Panel2, ReqClass.array_of_requests_agent.Count,0);


   PageControl1.ActivePage := Agents;
end;
{$R *.dfm}

procedure TForm4.reload_agents();
begin

  AgentClass.load_frames(Panel1, 0, AgentClass.array_of_agents.Count);
  AgentClass.load_pages(Navigator_Agent_Frame.Panel2, AgentClass.array_of_agents.Count,0);

end;


procedure TForm4.reload_req();
begin

  ReqClass := TRequest_Agents_Class.Create;
  C_req:= ReqClass.array_of_requests_agent.Count;
  ReqClass.load_frames(Panel6,0, C_req);
  ReqClass.load_pages(Navigator_Request_Frame.Panel2, ReqClass.array_of_requests_agent.Count,0);

end;

procedure TForm4.reload_ag();
begin

  AgentClass := TAgent_Class.Create();
  AgentClass.load_frames(Panel1, 0, AgentClass.array_of_agents.Count);
  AgentClass.load_pages(Navigator_Agent_Frame.Panel2, AgentClass.array_of_agents.Count,0);

end;

procedure TForm4.reload_sup();
begin

  SupClass := TSupplier_Class.Create;
  C_sup :=  SupClass.array_of_suppliers.Count;
  SupClass.load_frames(Panel3, 0, C_sup);
  SupClass.load_pages(Navigator_Supplier_Frame.Panel2, SupClass.array_of_suppliers.Count,0);

end;

procedure TForm4.reload_prod();
begin

  ProdClass := TProduct_Class.Create;
  C_prod := ProdClass.array_of_products.Count;
  ProdClass.load_frames(Panel7, 0, C_agent);
  ProdClass.load_pages(Navigator_Production_Frame.Panel2, ProdClass.array_of_products.Count,0);

end;
procedure TForm4.Button1Click(Sender: TObject);    //???.??????
begin
        var
        Form12: TForm12;
        Form12 := TForm12.Create(self );
        Form12.ShowModal;
        reload_ag;

end;

procedure TForm4.Button2Click(Sender: TObject);     //???.??????????
begin
          var
        Form13: TForm13;
        Form13 := TForm13.Create(self);
        Form13.ShowModal;
        reload_sup;
end;

procedure TForm4.Button3Click(Sender: TObject);    //???????? ??????
 begin
     var

        Form9: TForm9;
        AgentClass := TAgent_Class.Create();
        Form9 := TForm9.Create(self);
        Form9.ShowModal;
        reload_req;
end;

procedure TForm4.Button4Click(Sender: TObject);      //add production
begin

        var
        Form14: TForm14;
        Form14 := TForm14.Create(self);
        Form14.InitForCreateProduct;
        Form14.ShowModal;
        reload_prod;
end;

procedure TForm4.Edit1Change(Sender: TObject); // ???? ????? ??? ???????????
begin

      if (PageControl1.ActivePage = Agents) then
     begin
         AgentClass.FiltrChange(Edit_Agent, Filtr_Agent, Sort_Agent);
         AgentClass.load_pages(Navigator_Agent_Frame.Panel2, AgentClass.array_of_agents.Count, 0);
         AgentClass.load_frames(Panel1, 0, AgentClass.array_of_agents.Count);
     end;
     if (PageControl1.ActivePage = Requests) then
  begin
      ReqClass.FiltrChange(Edit_Req, Filter_Req, Sort_Req);
        ReqClass.load_frames(Panel6, 0, ReqClass.array_of_requests_agent.Count);
        ReqClass.load_pages(Navigator_Request_Frame.Panel2, ReqClass.array_of_requests_agent.Count, 0);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
          SupClass.FiltrChange(Edit_Sup, Filter_Sup, Sort_Sup);
         SupClass.load_frames(Panel3, 0, SupClass.array_of_suppliers.Count);
         SupClass.load_pages( Navigator_Supplier_Frame.Panel2, SupClass.array_of_suppliers.Count, 0); // SupClass.
  end;
  if (PageControl1.ActivePage = Productions) then
  begin
     ProdClass.FiltrChange(Edit_Prod, Filter_Prod, Sort_Prod);
         ProdClass.load_frames(Panel7, 0, ProdClass.array_of_products.Count);
         ProdClass.load_pages(Navigator_Production_Frame.Panel2, ProdClass.array_of_products.Count, 0);
  end;


end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       application.Terminate;
end;

procedure TForm4.SortirovkaChange(Sender: TObject);
begin
     if (PageControl1.ActivePage = Agents) then
     begin
         AgentClass.FiltrChange(Edit_Agent, Filtr_Agent, Sort_Agent);
           AgentClass.load_pages(Navigator_Agent_Frame.Panel2, C_agent, 0);
     end;
     if (PageControl1.ActivePage = Requests) then
  begin
          ReqClass.FiltrChange(Edit_Req,Filter_Req,Sort_Req);
          ReqClass.load_pages(Navigator_Request_Frame.Panel2, C_req,0);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
           SupClass.FiltrChange(Edit_Sup,Filter_Sup,Sort_Sup);
          SupClass.load_pages(Navigator_Supplier_Frame.Panel2, C_sup,0);
  end;
  if (PageControl1.ActivePage = Productions) then
  begin
         ProdClass.FiltrChange(Edit_Prod,Filter_Prod,Sort_Prod);
          ProdClass.load_pages(Navigator_Production_Frame.Panel2, C_sup,0);
  end;

end;

procedure TForm4.SuppliersContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

/////////////////////////////////////

procedure TForm4.NavigatorFrameLabel_1Click(Sender: TObject);        ///1
begin
      var  i : integer;
  if (PageControl1.ActivePage = Agents) then
  begin
    i:= strToInt(  Navigator_Agent_Frame.Label_1.Caption) - 1;
    AgentClass.load_frames(Panel1, i, AgentClass.array_of_agents.Count);
    Navigator_Agent_Frame.Label_1.Font.Style := [fsUnderline];
    Navigator_Agent_Frame.Label_2.Font.Style := [];
    Navigator_Agent_Frame.Label_3.Font.Style:= [];
    Navigator_Agent_Frame.Label_4.Font.Style := [];

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    i:= strToInt( Navigator_Production_Frame.Label_1.Caption) - 1;
    ProdClass.load_frames(Panel7, i, ProdClass.array_of_products.Count);
    Navigator_Production_Frame.Label_1.Font.Style := [fsUnderline];
    Navigator_Production_Frame.Label_2.Font.Style := [];
    Navigator_Production_Frame.Label_3.Font.Style:= [];
    Navigator_Production_Frame.Label_4.Font.Style := [];
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    i:= strToInt(  Navigator_Supplier_Frame.Label_1.Caption  ) - 1;
    SupClass.load_frames(Panel3, i, SupClass.array_of_suppliers.Count);
     Navigator_Supplier_Frame.Label_1.Font.Style := [fsUnderline];
   Navigator_Supplier_Frame.Label_2.Font.Style := [];
   Navigator_Supplier_Frame.Label_3.Font.Style:= [];
   Navigator_Supplier_Frame.Label_4.Font.Style := [];
  end;
    if (PageControl1.ActivePage = Requests) then
  begin
    i:= strToInt(  Navigator_Request_Frame.Label_1.Caption  ) - 1;
    ReqClass.load_frames(Panel6, i, ReqClass.array_of_requests_agent.Count);
     Navigator_Request_Frame.Label_1.Font.Style := [fsUnderline];
   Navigator_Request_Frame.Label_2.Font.Style := [];
   Navigator_Request_Frame.Label_3.Font.Style:= [];
   Navigator_Request_Frame.Label_4.Font.Style := [];
  end;

end;

procedure TForm4.NavigatorFrameLabel_2Click(Sender: TObject);
begin
        var  i : integer;
  if (PageControl1.ActivePage = Agents) then
  begin
    i:= strToInt(  Navigator_Agent_Frame.Label_2.Caption) - 1;
    AgentClass.load_frames(Panel1, i, AgentClass.array_of_agents.Count);
    Navigator_Agent_Frame.Label_1.Font.Style := [];
   Navigator_Agent_Frame.Label_2.Font.Style := [fsUnderline];
   Navigator_Agent_Frame.Label_3.Font.Style:= [];
   Navigator_Agent_Frame.Label_4.Font.Style := [];

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    i:= strToInt( Navigator_Production_Frame.Label_2.Caption) - 1;
    ProdClass.load_frames(Panel7, i, ProdClass.array_of_products.Count);
    Navigator_Production_Frame.Label_1.Font.Style := [];
   Navigator_Production_Frame.Label_2.Font.Style := [fsUnderline];
   Navigator_Production_Frame.Label_3.Font.Style:= [];
    Navigator_Production_Frame.Label_4.Font.Style := [];
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    i:= strToInt(  Navigator_Supplier_Frame.Label_2.Caption  ) - 1;
    SupClass.load_frames(Panel3, i, SupClass.array_of_suppliers.Count);
     Navigator_Supplier_Frame.Label_1.Font.Style := [];
   Navigator_Supplier_Frame.Label_2.Font.Style := [fsUnderline];
   Navigator_Supplier_Frame.Label_3.Font.Style:= [];
   Navigator_Supplier_Frame.Label_4.Font.Style := [];
  end;

    if (PageControl1.ActivePage = Requests) then
  begin
    i:= strToInt(  Navigator_Request_Frame.Label_2.Caption  ) - 1;
    ReqClass.load_frames(Panel6, i, ReqClass.array_of_requests_agent.Count);
    Navigator_Request_Frame.Label_1.Font.Style := [];
   Navigator_Request_Frame.Label_2.Font.Style := [fsUnderline];
   Navigator_Request_Frame.Label_3.Font.Style:= [];
   Navigator_Request_Frame.Label_4.Font.Style := [];
  end;

end;


procedure TForm4.NavigatorFrameLabel_3Click(Sender: TObject);
begin

        var  i : integer;
  if (PageControl1.ActivePage = Agents) then
  begin
    i:= strToInt(  Navigator_Agent_Frame.Label_3.Caption) - 1;
    AgentClass.load_frames(Panel1, i, AgentClass.array_of_agents.Count);
    Navigator_Agent_Frame.Label_1.Font.Style := [];
    Navigator_Agent_Frame.Label_2.Font.Style := [];
    Navigator_Agent_Frame.Label_3.Font.Style:= [fsUnderline];
    Navigator_Agent_Frame.Label_4.Font.Style := [];

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    i:= strToInt( Navigator_Production_Frame.Label_3.Caption) - 1;
    ProdClass.load_frames(Panel7, i, ProdClass.array_of_products.Count);
    Navigator_Production_Frame.Label_1.Font.Style := [];
    Navigator_Production_Frame.Label_2.Font.Style := [];
    Navigator_Production_Frame.Label_3.Font.Style:= [fsUnderline];
    Navigator_Production_Frame.Label_4.Font.Style := [];
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    i:= strToInt(  Navigator_Supplier_Frame.Label_3.Caption  ) - 1;
    SupClass.load_frames(Panel3, i, SupClass.array_of_suppliers.Count);
     Navigator_Supplier_Frame.Label_1.Font.Style := [];
   Navigator_Supplier_Frame.Label_2.Font.Style := [];
   Navigator_Supplier_Frame.Label_3.Font.Style:= [fsUnderline];
   Navigator_Supplier_Frame.Label_4.Font.Style := [];
  end;

    if (PageControl1.ActivePage = Requests) then
  begin
    i:= strToInt(  Navigator_Request_Frame.Label_3.Caption  ) - 1;
    ReqClass.load_frames(Panel6, i, ReqClass.array_of_requests_agent.Count);
    Navigator_Request_Frame.Label_1.Font.Style := [];
    Navigator_Request_Frame.Label_2.Font.Style := [];
    Navigator_Request_Frame.Label_3.Font.Style:= [fsUnderline];
    Navigator_Request_Frame.Label_4.Font.Style := [];
  end;
end;



procedure TForm4.NavigatorFrameLabel_4Click(Sender: TObject);
begin

        var  i : integer;
  if (PageControl1.ActivePage = Agents) then
  begin
    i:= strToInt(  Navigator_Agent_Frame.Label_4.Caption) - 1;
    AgentClass.load_frames(Panel1, i, AgentClass.array_of_agents.Count);
    Navigator_Agent_Frame.Label_1.Font.Style := [];
   Navigator_Agent_Frame.Label_2.Font.Style := [];
   Navigator_Agent_Frame.Label_3.Font.Style:= [];
   Navigator_Agent_Frame.Label_4.Font.Style := [fsUnderline];

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    i:= strToInt( Navigator_Production_Frame.Label_4.Caption) - 1;
    ProdClass.load_frames(Panel7, i, ProdClass.array_of_products.Count);
    Navigator_Production_Frame.Label_1.Font.Style := [];
   Navigator_Production_Frame.Label_2.Font.Style := [];
   Navigator_Production_Frame.Label_3.Font.Style:= [];
    Navigator_Production_Frame.Label_4.Font.Style := [fsUnderline];
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    i:= strToInt(  Navigator_Supplier_Frame.Label_4.Caption  ) - 1;
    SupClass.load_frames(Panel3, i, SupClass.array_of_suppliers.Count);
     Navigator_Supplier_Frame.Label_1.Font.Style := [];
   Navigator_Supplier_Frame.Label_2.Font.Style := [];
   Navigator_Supplier_Frame.Label_3.Font.Style:= [];
   Navigator_Supplier_Frame.Label_4.Font.Style := [fsUnderline];
  end;

    if (PageControl1.ActivePage = Requests) then
  begin
    i:= strToInt(  Navigator_Request_Frame.Label_4.Caption  ) - 1;
    ReqClass.load_frames(Panel6, i, ReqClass.array_of_requests_agent.Count);
    Navigator_Request_Frame.Label_1.Font.Style := [];
    Navigator_Request_Frame.Label_2.Font.Style := [];
    Navigator_Request_Frame.Label_3.Font.Style:= [];
    Navigator_Request_Frame.Label_4.Font.Style := [fsUnderline];
  end;
end;

procedure TForm4.NavigatorFrameLeftLabelClick(Sender: TObject);           //?????? ? ???? ??????
begin

        var nx : integer;
  if (PageControl1.ActivePage = Agents) then
  begin
    nx := AgentClass.change_pages_l( Navigator_Agent_Frame.Panel2);
    AgentClass.load_frames(Panel1, nx - 1, AgentClass.array_of_agents.Count);
  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    nx := ProdClass.change_pages_l( Navigator_Production_Frame.Panel2);
    ProdClass.load_frames(Panel7, nx - 1, ProdClass.array_of_products.Count);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    nx := SupClass.change_pages_l( Navigator_Supplier_Frame.Panel2 );
    SupClass.load_frames(Panel3, nx - 1, SupClass.array_of_suppliers.Count);
  end;

    if (PageControl1.ActivePage = Requests) then
  begin
    nx := ReqClass.change_pages_l( Navigator_Request_Frame.Panel2 );
    ReqClass.load_frames(Panel6, nx - 1, ReqClass.array_of_requests_agent.Count);
  end;



end;

procedure TForm4.NavigatorFrameRightLabelClick(Sender: TObject);    // right ?
begin

     var  x,nx : integer;
  if (PageControl1.ActivePage = Agents) then
  begin

    x := AgentClass.array_of_agents.Count -
      (strToInt(Navigator_Agent_Frame.Label_4.Caption) * AgentClass.on_page);  //?????????? ?????? ??? ???????? ???????
    nx := AgentClass.change_pages_r( Navigator_Agent_Frame.Panel2, x);
    AgentClass.load_frames(Panel1, nx - 1, AgentClass.array_of_agents.Count);

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
      x := ProdClass.array_of_products.Count -
      (strToInt(Navigator_Production_Frame.Label_4.Caption) * ProdClass.on_page);
    nx := ProdClass.change_pages_r( Navigator_Production_Frame.Panel2, x);
    ProdClass.load_frames(Panel7, nx - 1, ProdClass.array_of_products.Count);

  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
     x := SupClass.array_of_suppliers.Count -
      (strToInt(Navigator_Supplier_Frame.Label_4.Caption) * SupClass.on_page);
    nx := SupClass.change_pages_r( Navigator_Supplier_Frame.Panel2, x);
    SupClass.load_frames(Panel3, nx - 1, SupClass.array_of_suppliers.Count);

  end;

    if (PageControl1.ActivePage = Requests) then
  begin
     x := ReqClass.array_of_requests_agent.Count -
      (strToInt(Navigator_Request_Frame.Label_4.Caption) * ReqClass.on_page);
    nx := ReqClass.change_pages_r( Navigator_Request_Frame.Panel2, x);
    ReqClass.load_frames(Panel6, nx - 1, ReqClass.array_of_requests_agent.Count);
  end;

end;

end.
