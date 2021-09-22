unit WinMaster;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Data.Win.ADODB, Vcl.ExtCtrls, Main_Class,Agent_Class,
  Vcl.ComCtrls,Supplier_Class,Product_Class;
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
  private
    { Private declarations }
  public
   constructor Create (AOwner: TComponent); override;
    { Public declarations }
  end;
var
  Form4: TForm4;
  AgentClass: TAgent_Class;
  ADO_agent:TADOQuery;
  C_agent:integer;
  SupClass:TSupplier_Class;
  ADO_sup:TADOQuery;
  C_sup:integer;
  ProdClass: TProduct_Class;
  ADO_prod:TADOQuery;
  C_prod:integer;
implementation
     constructor TForm4.Create;
     begin
        inherited;
             PageControl1.ActivePage:=Agents;

            AgentClass:= TAgent_Class.Create;
            ADO_agent:=AgentClass.sql_select('select * from agent','','',true);
            C_agent:=ADO_agent.RecordCount ;

            AgentClass.load_frames(Panel1,0,C_agent ) ;

            SupClass:=TSupplier_Class.Create;
            ADO_sup:=SupClass.sql_select('select * from supplier','','',true);
            C_sup:=ADO_sup.RecordCount ;
         //   SupClass.load_pages(Panel3,C_sup);
            SupClass.load_frames(Panel3,0,C_sup) ;


             ProdClass:=TProduct_Class.Create;
              ADO_prod:=ProdClass.sql_select('select * from products','','',true);
               C_prod:=ADO_prod.RecordCount ;
              ProdClass.load_frames(Panel7,0,C_agent) ;
             PageControl1.ActivePage:=Agents;


               AgentClass.load_pages(Panel2,C_agent,0 );
     end;
{$R *.dfm}

  procedure TForm4.Label1Click(Sender: TObject);
begin
          if    (PageControl1.ActivePage=Agents) then
        begin
               var x:= AgentClass.array_of_agents.Count-(strToInt(label5.Caption)*AgentClass.on_page);
               var nx:=  AgentClass.change_pages_l(Panel2,x);
               AgentClass.load_frames(Panel1,nx-1,AgentClass.array_of_agents.Count);

        end;
         if    (PageControl1.ActivePage=REQUESTS) then
        begin

        end;
         if    (PageControl1.ActivePage=Suppliers) then
        begin

        end;
          if    (PageControl1.ActivePage=Productions) then
        begin

        end;
end;

procedure TForm4.Label1MouseEnter(Sender: TObject);
begin
               Label1.Font.Color:=clred;
end;

procedure TForm4.Label6Click(Sender: TObject);
begin
       if    (PageControl1.ActivePage=Agents) then
        begin
               var x:= AgentClass.array_of_agents.Count-(strToInt(label5.Caption)*AgentClass.on_page);
               var nx:=  AgentClass.change_pages_r(Panel2,x);
               AgentClass.load_frames(Panel1,nx-1,AgentClass.array_of_agents.Count);

        end;
         if    (PageControl1.ActivePage=Productions) then
        begin
                var x:= ProdClass.array_of_products.Count-(strToInt(label5.Caption)*ProdClass.on_page);
               var nx:=  ProdClass.change_pages_r(Panel2,x);
               ProdClass.load_frames(Panel7,nx-1,ProdClass.array_of_products.Count);
        end;
         if    (PageControl1.ActivePage=Suppliers) then
        begin
               var x:= SupClass.array_of_suppliers.Count-(strToInt(label5.Caption)*SupClass.on_page);
               var nx:=  SupClass.change_pages_r(Panel2,x);
               SupClass.load_frames(Panel3,nx-1,SupClass.array_of_suppliers.Count);
        end;
end;

procedure TForm4.Label1MouseLeave(Sender: TObject);
begin
                  Label1.Font.Color:=clblack;
end;

 procedure TForm4.Label2Click(Sender: TObject);
begin              var i:= strtoint(label2.Caption)-1;
          if    (PageControl1.ActivePage=Agents) then
        begin
                 AgentClass.load_frames(Panel1,i,AgentClass.array_of_agents.Count) ;


        end;
         if    (PageControl1.ActivePage=Productions) then
        begin
                  ProdClass.load_frames(Panel7,i,ProdClass.array_of_products.Count)  ;
        end;
         if    (PageControl1.ActivePage=Suppliers) then
        begin
                 SupClass.load_frames(Panel3,i,SupClass.array_of_suppliers.Count);
        end;
        Label2.Font.Style:=[fsUnderline];
                  Label3.Font.Style:=[];
                   Label4.Font.Style:=[];
                    Label5.Font.Style:=[];
end;

procedure TForm4.Label2MouseEnter(Sender: TObject);
begin
       Label2.Font.Color:=clred;
end;
 procedure TForm4.Label2MouseLeave(Sender: TObject);
begin
            Label2.Font.Color:=clblack;
end;


 procedure TForm4.Label3Click(Sender: TObject);
begin
            var i:= strtoint(label3.Caption)-1;
          if    (PageControl1.ActivePage=Agents) then
        begin
                 AgentClass.load_frames(Panel1,i,AgentClass.array_of_agents.Count) ;

        end;
         if    (PageControl1.ActivePage=Productions) then
        begin
                  ProdClass.load_frames(Panel7,i,ProdClass.array_of_products.Count)  ;
        end;
         if    (PageControl1.ActivePage=Suppliers) then
        begin
                 SupClass.load_frames(Panel3,i,SupClass.array_of_suppliers.Count);
        end;
        Label2.Font.Style:=[];
                  Label3.Font.Style:=[fsUnderline];
                   Label4.Font.Style:=[];
                    Label5.Font.Style:=[];
end;

procedure TForm4.Label3MouseEnter(Sender: TObject);
begin
           Label3.Font.Color:=clred;
end;

procedure TForm4.Label3MouseLeave(Sender: TObject);
begin
                 Label3.Font.Color:=clblack;
end;


procedure TForm4.Label4Click(Sender: TObject);
begin
            var i:= strtoint(label4.Caption)-1;
          if    (PageControl1.ActivePage=Agents) then
        begin
                 AgentClass.load_frames(Panel1,i,AgentClass.array_of_agents.Count) ;

        end;
         if    (PageControl1.ActivePage=Productions) then
        begin
                  ProdClass.load_frames(Panel7,i,ProdClass.array_of_products.Count)  ;
        end;
         if    (PageControl1.ActivePage=Suppliers) then
        begin
                 SupClass.load_frames(Panel3,i,SupClass.array_of_suppliers.Count);
        end;
        Label2.Font.Style:=[];
                  Label3.Font.Style:=[];
                   Label4.Font.Style:=[fsUnderline];
                    Label5.Font.Style:=[];
end;

procedure TForm4.Label4MouseEnter(Sender: TObject);
begin
               Label4.Font.Color:=clred;
end;

procedure TForm4.Label4MouseLeave(Sender: TObject);
begin
                      Label4.Font.Color:=clblack;
end;

 procedure TForm4.Label5Click(Sender: TObject);
begin
                 var i:= strtoint(label5.Caption)-1;
          if    (PageControl1.ActivePage=Agents) then
        begin
                 AgentClass.load_frames(Panel1,i,AgentClass.array_of_agents.Count) ;

        end;
         if    (PageControl1.ActivePage=Productions) then
        begin
                  ProdClass.load_frames(Panel7,i,ProdClass.array_of_products.Count)  ;
        end;
         if    (PageControl1.ActivePage=Suppliers) then
        begin
                 SupClass.load_frames(Panel3,i,SupClass.array_of_suppliers.Count);
        end;
        Label2.Font.Style:=[];
                  Label3.Font.Style:=[];
                   Label4.Font.Style:=[];
                    Label5.Font.Style:=[fsUnderline];
end;

procedure TForm4.Label5MouseEnter(Sender: TObject);
begin
               Label5.Font.Color:=clred;
end;

 procedure TForm4.Label5MouseLeave(Sender: TObject);
begin
                           Label5.Font.Color:=clblack;
end;

 procedure TForm4.Label6MouseEnter(Sender: TObject);
    begin
                         Label6.Font.Color:=clred;

    end;
 procedure TForm4.Label6MouseLeave(Sender: TObject);
    begin
                                Label6.Font.Color:=clblack;
    end;
procedure TForm4.PageControl1Change(Sender: TObject);
begin
        if    (PageControl1.ActivePage=Agents) then
        begin
              AgentClass.load_pages(Panel2,AgentClass.array_of_agents.Count,0);

        end;
         if    (PageControl1.ActivePage=Productions) then
        begin

               ProdClass.load_pages(Panel2,ProdClass.array_of_products.Count,0);
        end;
         if    (PageControl1.ActivePage=Suppliers) then
        begin

               SupClass.load_pages(Panel2 ,SupClass.array_of_suppliers.Count,0);
        end;
end;

end.