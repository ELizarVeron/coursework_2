program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Win_Master in 'Win_Master.pas' {Form3},
  Win_Manager in 'Win_Manager.pas' {Form4},
  History_Of_Reliz in 'Models\Entities\History_Of_Reliz.pas',
  Product in 'Models\Entities\Product.pas',
  Request_supplier in 'Models\Entities\Request_supplier.pas',
  Requests_agent in 'Models\Entities\Requests_agent.pas',
  Supplier in 'Models\Entities\Supplier.pas',
  Main_Class in 'Classes\Main_Class.pas',
  Agent_Class in 'Classes\Agent_Class.pas',
  Supplier_Class in 'Classes\Supplier_Class.pas',
  Product_Class in 'Classes\Product_Class.pas',
  Nav_Frame in 'Frames\Nav_Frame.pas' {Frame7: TFrame},
  Request_Agents_Class in 'Classes\Request_Agents_Class.pas',
  EDITAgent in 'EditWindows\EDITAgent.pas' {Form5},
  Navigator in 'Navigator.pas' {Frame10: TFrame},
  HistoryPriority in 'Models\Entities\HistoryPriority.pas' {Form6},
  HistoryRelizAgent in 'Models\Entities\HistoryRelizAgent.pas' {Form7},
  Create_RelizAgent in 'CreateWindows\Create_RelizAgent.pas' {Form8},
  CREATE_REQUEST in 'CreateWindows\CREATE_REQUEST.pas' {Form9},
  Request_Info in 'InfoWindows\Request_Info.pas' {Form11},
  CREATE_Agent in 'CreateWindows\CREATE_Agent.pas' {Form12},
  CREATE_EDIT_Supplier in 'CreateWindows\CREATE_EDIT_Supplier.pas' {Form13},
  CREATE_EDIT_Product in 'CreateWindows\CREATE_EDIT_Product.pas' {Form14},
  ChangesRequest in 'EditWindows\ChangesRequest.pas' {Form15},
  AddPoints in 'CreateWindows\AddPoints.pas' {Form16},
  INFOAgent in 'InfoWindows\INFOAgent.pas' {Form17},
  INFOSupplier in 'InfoWindows\INFOSupplier.pas' {Form19},
  INFOProduct in 'InfoWindows\INFOProduct.pas' {Form20},
  Agents in 'Models\Entities\Agents.pas',
  Frame_agents in 'Frames\Frame_agents.pas',
  Frame_sups in 'Frames\Frame_sups.pas',
  Frame_products in 'Frames\Frame_products.pas',
  Frame_req_ag in 'Frames\Frame_req_ag.pas',
  My_f in 'My_f.pas',
  Manufacture in 'Models\Entities\Manufacture.pas',
  Frame_manufacture in 'Frames\Frame_manufacture.pas' {Frame_manufact: TFrame},
  Manufacture_Class in 'Classes\Manufacture_Class.pas',
  Request_Sup_Class in 'Classes\Request_Sup_Class.pas',
  Material_Class in 'Classes\Material_Class.pas',
  Frame_material in 'Frames\Frame_material.pas' {Framematerial: TFrame},
  Create_Request_Sup in 'ForMaster\Create_Request_Sup.pas' {Form10},
  SelectProdForAgent in 'CreateWindows\SelectProdForAgent.pas' {Form18},
  Frame_req_sup in 'Frames\Frame_req_sup.pas',
  Create_material in 'CreateWindows\Create_material.pas' {Form21},
  Create_Req_Sup in 'CreateWindows\Create_Req_Sup.pas' {Form23},
  EDITRequestSup in 'EditWindows\EDITRequestSup.pas' {FormEditReqSup},
  INFOManufacture in 'InfoWindows\INFOManufacture.pas' {Form24},
  Material in 'Models\Entities\Material.pas',
  INFOManufacture2 in 'InfoWindows\INFOManufacture2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm23, Form23);
  Application.CreateForm(TForm24, Form24);
  Application.Run;

end.
