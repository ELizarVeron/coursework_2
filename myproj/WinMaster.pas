unit WinMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB,
  Vcl.ExtCtrls, Main_Class, Agent_Class,
  Vcl.ComCtrls, Supplier_Class, Product_Class, Request_Agents_Class, Nav_Frame;

type
  TForm4 = class(TForm)
    PageControl1: TPageControl;
    Agents: TTabSheet;
    Suppliers: TTabSheet;
    Requests: TTabSheet;
    Productions: TTabSheet;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    no_line: TLabel;
    line: TLabel;
    Frame71: TFrame7;
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
    procedure Label6Click(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label6MouseEnter(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure  Edit1Change(Sender: TObject);
    procedure  SortirovkaChange(Sender: TObject);
    procedure  FiltrChange(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
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

implementation

constructor TForm4.Create;
begin
  inherited;
  PageControl1.ActivePage := Agents;

  AgentClass := TAgent_Class.Create;

  AgentClass.load_frames(Panel1, 0, AgentClass.array_of_agents.Count);
  AgentClass.load_pages(Panel2, AgentClass.array_of_agents.Count, 0);
  AgentClass.create_sort( Sort_Agent);
  AgentClass.create_filter( Filtr_Agent);

  SupClass := TSupplier_Class.Create;
  ADO_sup := SupClass.sql_select('*', 'supplier', '', '', false);
  C_sup := ADO_sup.RecordCount;
  SupClass.load_frames(Panel3, 0, C_sup);
  SupClass.create_sort(Sort_Sup);
  SupClass.create_filter(filter_sup);


  ProdClass := TProduct_Class.Create;
  ADO_prod := ProdClass.sql_select('*', 'products', '', '', false);
  C_prod := ADO_prod.RecordCount;
  ProdClass.load_frames(Panel7, 0, C_agent);
  ProdClass.create_sort(Sort_Prod);
  ProdClass.create_filter(filter_prod);


  ReqClass := TRequest_Agents_Class.Create;
  ADO_req:= ReqClass.sql_select('*', 'Request_from_agent','','',false);
  C_req:= ADO_req.RecordCount;
  ReqClass.load_frames(Panel6,0, C_req);
    ReqClass.create_sort(sort_req);
  ReqClass.create_filter(Filter_req);



   PageControl1.ActivePage := Agents;
end;
{$R *.dfm}

procedure TForm4.Edit1Change(Sender: TObject); // edit change
begin

      if (PageControl1.ActivePage = Agents) then
     begin
         AgentClass.FiltrChange(Edit_Agent, Filtr_Agent, Sort_Agent);
         AgentClass.load_frames(Panel1, 0, AgentClass.array_of_agents.Count);
         AgentClass.load_pages(Panel2, C_agent, 0);
     end;
     if (PageControl1.ActivePage = Requests) then
  begin
        ReqClass.FiltrChange(Edit_Agent, Filtr_Agent, Sort_Agent);
        ReqClass.load_frames(Panel6, 0, ReqClass.array_of_requests_agent.Count);
        ReqClass.load_pages(Panel2, C_req, 0);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
         SupClass.FiltrChange(Edit_Sup, Filter_Sup, Sort_Sup);
         SupClass.load_frames(Panel3, 0, SupClass.array_of_suppliers.Count);
         SupClass.load_pages(Panel2, C_sup, 0); // SupClass.
  end;
  if (PageControl1.ActivePage = Productions) then
  begin
         ProdClass.FiltrChange(Edit_Prod, Filter_Prod, Sort_Prod);
         ProdClass.load_frames(Panel7, 0, ProdClass.array_of_products.Count);
         ProdClass.load_pages(Panel2, C_prod, 0);
  end;


end;

procedure TForm4.FiltrChange(Sender: TObject);
begin
     if (PageControl1.ActivePage = Agents) then
     begin
         AgentClass.FiltrChange(Edit_Agent, Filtr_Agent, Sort_Agent);
          AgentClass.load_pages(Panel2, C_agent, 0);
     end;
     if (PageControl1.ActivePage = Requests) then
  begin

  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
          // SupClass.
  end;
  if (PageControl1.ActivePage = Productions) then
  begin
           //ProdClass.FiltrChange(Edit3,ComboBox4,ComboBox3) ;
  end;

end;

procedure TForm4.SortirovkaChange(Sender: TObject);
begin
     if (PageControl1.ActivePage = Agents) then
     begin
         AgentClass.FiltrChange(Edit_Agent, Filtr_Agent, Sort_Agent);
          AgentClass.load_pages(Panel2, C_agent, 0);
     end;
     if (PageControl1.ActivePage = Requests) then
  begin

  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
          // SupClass.
  end;
  if (PageControl1.ActivePage = Productions) then
  begin
          // ProdClass.FiltrChange(Edit3,ComboBox4,ComboBox3) ;
  end;

end;

procedure TForm4.Label1Click(Sender: TObject);
begin
  if (PageControl1.ActivePage = Agents) then
  begin
    var
    x := AgentClass.array_of_agents.Count -
      (strToInt(Label5.Caption) * AgentClass.on_page);
    var
    nx := AgentClass.change_pages_l(Panel2, x);
    AgentClass.load_frames(Panel1, nx - 1, AgentClass.array_of_agents.Count);

  end;
  if (PageControl1.ActivePage = Requests) then
  begin

  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin

  end;
  if (PageControl1.ActivePage = Productions) then
  begin

  end;
end;

procedure TForm4.Label1MouseEnter(Sender: TObject);
begin
  Label1.Font.Color := clred;
end;

procedure TForm4.Label6Click(Sender: TObject);  //������� ������
begin
  if (PageControl1.ActivePage = Agents) then
  begin
    var
    x := AgentClass.array_of_agents.Count -
      (strToInt(Label5.Caption) * AgentClass.on_page);     //������� ������� �� �����������
    var
    nx := AgentClass.change_pages_r(Panel2, x);
    AgentClass.load_frames(Panel1, nx - 1, AgentClass.array_of_agents.Count);

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    var
    x := ProdClass.array_of_products.Count -
      (strToInt(Label5.Caption) * ProdClass.on_page);
    var
    nx := ProdClass.change_pages_r(Panel2, x);
    ProdClass.load_frames(Panel7, nx - 1, ProdClass.array_of_products.Count);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    var
    x := SupClass.array_of_suppliers.Count -
      (strToInt(Label5.Caption) * SupClass.on_page);
    var
    nx := SupClass.change_pages_r(Panel2, x);
    SupClass.load_frames(Panel3, nx - 1, SupClass.array_of_suppliers.Count);
  end;
end;

procedure TForm4.Label1MouseLeave(Sender: TObject);
begin
  Label1.Font.Color := clblack;
end;

procedure TForm4.Label2Click(Sender: TObject);
begin
  var
  i := strToInt(Label2.Caption) - 1;
  if (PageControl1.ActivePage = Agents) then
  begin
    AgentClass.load_frames(Panel1, i, AgentClass.array_of_agents.Count);

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    ProdClass.load_frames(Panel7, i, ProdClass.array_of_products.Count);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    SupClass.load_frames(Panel3, i, SupClass.array_of_suppliers.Count);
  end;
  Label2.Font.Style := [fsUnderline];
  Label3.Font.Style := [];
  Label4.Font.Style := [];
  Label5.Font.Style := [];
end;

procedure TForm4.Label2MouseEnter(Sender: TObject);
begin
  Label2.Font.Color := clred;
end;

procedure TForm4.Label2MouseLeave(Sender: TObject);
begin
  Label2.Font.Color := clblack;
end;

procedure TForm4.Label3Click(Sender: TObject);
begin
  var
  i := strToInt(Label3.Caption) - 1;
  if (PageControl1.ActivePage = Agents) then
  begin
    AgentClass.load_frames(Panel1, i, AgentClass.array_of_agents.Count);

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    ProdClass.load_frames(Panel7, i, ProdClass.array_of_products.Count);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    SupClass.load_frames(Panel3, i, SupClass.array_of_suppliers.Count);
  end;
  Label2.Font.Style := [];
  Label3.Font.Style := [fsUnderline];
  Label4.Font.Style := [];
  Label5.Font.Style := [];
end;

procedure TForm4.Label3MouseEnter(Sender: TObject);
begin
  Label3.Font.Color := clred;
end;

procedure TForm4.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Color := clblack;
end;

procedure TForm4.Label4Click(Sender: TObject);
begin
  var
  i := strToInt(Label4.Caption) - 1;
  if (PageControl1.ActivePage = Agents) then
  begin
    AgentClass.load_frames(Panel1, i, AgentClass.array_of_agents.Count);

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    ProdClass.load_frames(Panel7, i, ProdClass.array_of_products.Count);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    SupClass.load_frames(Panel3, i, SupClass.array_of_suppliers.Count);
  end;
  Label2.Font.Style := [];
  Label3.Font.Style := [];
  Label4.Font.Style := [fsUnderline];
  Label5.Font.Style := [];
end;

procedure TForm4.Label4MouseEnter(Sender: TObject);
begin
  Label4.Font.Color := clred;
end;

procedure TForm4.Label4MouseLeave(Sender: TObject);
begin
  Label4.Font.Color := clblack;
end;

procedure TForm4.Label5Click(Sender: TObject);
begin
  var
  i := strToInt(Label5.Caption) - 1;
  if (PageControl1.ActivePage = Agents) then
  begin
    AgentClass.load_frames(Panel1, i, AgentClass.array_of_agents.Count);

  end;
  if (PageControl1.ActivePage = Productions) then
  begin
    ProdClass.load_frames(Panel7, i, ProdClass.array_of_products.Count);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin
    SupClass.load_frames(Panel3, i, SupClass.array_of_suppliers.Count);
  end;
  Label2.Font.Style := [];
  Label3.Font.Style := [];
  Label4.Font.Style := [];
  Label5.Font.Style := [fsUnderline];
end;

procedure TForm4.Label5MouseEnter(Sender: TObject);
begin
  Label5.Font.Color := clred;
end;

procedure TForm4.Label5MouseLeave(Sender: TObject);
begin
  Label5.Font.Color := clblack;
end;

procedure TForm4.Label6MouseEnter(Sender: TObject);
begin
  Label6.Font.Color := clred;

end;

procedure TForm4.Label6MouseLeave(Sender: TObject);
begin
  Label6.Font.Color := clblack;
end;

procedure TForm4.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.ActivePage = Agents) then
  begin
    AgentClass.load_pages(Panel2, AgentClass.array_of_agents.Count, 0);

  end;
  if (PageControl1.ActivePage = Productions) then
  begin

    ProdClass.load_pages(Panel2, ProdClass.array_of_products.Count, 0);
  end;
  if (PageControl1.ActivePage = Suppliers) then
  begin

    SupClass.load_pages(Panel2, SupClass.array_of_suppliers.Count, 0);
  end;
end;

end.
