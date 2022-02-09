program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Win_Master in 'Win_Master.pas' {Form3},
  Win_Manager in 'Win_Manager.pas' {Form4},
  Frame_agents in 'Frame_agents.pas' {Frame3: TFrame},
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
  Request_Agents_Class in 'Request_Agents_Class.pas',
  Frame_req_ag in 'Frame_req_ag.pas' {Frame9: TFrame},
  EDITAgent in 'EDITAgent.pas' {Form5},
  Navigator in 'Navigator.pas' {Frame10: TFrame},
  HistoryPriority in 'HistoryPriority.pas' {Form6},
  HistoryRelizAgent in 'HistoryRelizAgent.pas' {Form7},
  Create_RelizAgent in 'Create_RelizAgent.pas' {Form8},
  CREATE_REQUEST in 'CREATE_REQUEST.pas' {Form9},
  SelectProducts in 'SelectProducts.pas' {Form10},
  Request_Info in 'Request_Info.pas' {Form11},
  CREATE_Agent in 'CREATE_Agent.pas' {Form12},
  CREATE_Supplier in 'CREATE_Supplier.pas' {Form13},
  CREATE_Product in 'CREATE_Product.pas' {Form14},
  ChangesRequest in 'ChangesRequest.pas' {Form15};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.Run;

end.
