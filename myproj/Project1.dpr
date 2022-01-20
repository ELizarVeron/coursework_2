program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  My_f in 'My_f.pas',
  WinManager in 'WinManager.pas' {Form3},
  WinMaster in 'WinMaster.pas' {Form4},
  Frame_agents in 'Frame_agents.pas' {Frame3: TFrame},
  Fr_ag in 'Fr_ag.pas' {Frame4: TFrame},
  BD_class in 'BD_class.pas',
  BD_Manager in 'BD_Manager.pas',
  TABLE_Agents in 'TABLE_Agents.pas',
  TABLE_History_Of_Reliz in 'TABLE_History_Of_Reliz.pas',
  TABLE_Materials in 'TABLE_Materials.pas',
  TABLE_Products in 'TABLE_Products.pas',
  TABLE_Request_supplier in 'TABLE_Request_supplier.pas',
  TABLE_Requests_agent in 'TABLE_Requests_agent.pas',
  TABLE_Suppliers in 'TABLE_Suppliers.pas',
  Main_Class in 'Main_Class.pas',
  Agent_Class in 'Agent_Class.pas',
  Supplier_Class in 'Supplier_Class.pas',
  Frame_sups in 'Frame_sups.pas' {Frame5: TFrame},
  Frame_products in 'Frame_products.pas' {Frame6: TFrame},
  Product_Class in 'Product_Class.pas',
  Nav_Frame in 'Nav_Frame.pas' {Frame7: TFrame},
  Request_Frame in 'Request_Frame.pas' {Frame8: TFrame},
  Request_Agents_Class in 'Request_Agents_Class.pas',
  Frame_req_ag in 'Frame_req_ag.pas' {Frame9: TFrame},
  EDITAgent in 'EDITAgent.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;

end.
