unit EDITRequestSup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Request_supplier,Main_class,Product_Class, Material_class;

type
  TFormEditReqSup = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure  SaveMaterialFromSup;
  public
    constructor Create( AOwner: TComponent);  override;
   var req_on_edit:  TRequest_supplier;
   procedure Init(req: TRequest_supplier);
   var receipt,reload:boolean;
  end;

var
  FormEditReqSup: TFormEditReqSup;
  mc:TMain_class;
  i,j:Integer;
implementation

{$R *.dfm}

{ TForm24 }

procedure TFormEditReqSup.Button1Click(Sender: TObject);
begin
     Close;
end;

procedure TFormEditReqSup.Button2Click(Sender: TObject);
begin
     if CheckBox1.Checked=false then    exit;
     reload:=true;
     receipt:=true;
     mc:=TMain_class.Create;
     mc.sql_update('Request_for_supplier', ' Status = ' + QuotedStr('3'), 'where Id_request_sup =  ' + req_on_edit.ID_Request.ToString );

        for   i := 0 to    TProduct_Class.array_of_products.Count-1 do
        begin
            for j := 0 to   TProduct_Class.array_of_products[i].list_of_materials.Count-1 do
            begin
                if(TProduct_Class.array_of_products[i].list_of_materials[j].Article =req_on_edit.Material.Article  )  then

                TProduct_Class.array_of_products[i].list_of_materials[j].Count:=    TProduct_Class.array_of_products[i].list_of_materials[j].Count + req_on_edit.Count;

            end;



        end;

      SaveMaterialFromSup;



     ShowMessage('Сохранено');
     Close;
end;

constructor TFormEditReqSup.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TFormEditReqSup.Init(req: TRequest_supplier);
begin
     req_on_edit:=req;

     Label2.Caption:=req_on_edit.ID_Request.ToString;
     Label4.Caption:=req_on_edit.Company;
     Label6.Caption:=req_on_edit.Material.Title;
     Label8.Caption:=req_on_edit.Count.ToString;

     if(req_on_edit.Status = 'Завершена') then
     begin
      CheckBox1.Checked:=true;
      CheckBox1.Enabled:=false;
       Button2.Visible:=false;
       Button1.Visible:=false;
     end;



end;

procedure TFormEditReqSup.SaveMaterialFromSup;
var count_now:integer;
var count_after:integer;
begin
    mc:=TMain_class.Create;
    count_now:= mc.sql_select('In_stock','Material','where Article =   '+ req_on_edit.Material.Article.ToString  ,'',false ).Fields[0].AsInteger;
    count_after:=count_now+req_on_edit.Count;
    mc.sql_update('Material','In_stock = '+  count_after.ToString, ' where Article =  '+ req_on_edit.Material.Article.ToString );

end;

end.
