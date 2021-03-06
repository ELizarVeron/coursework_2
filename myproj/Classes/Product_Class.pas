unit Product_Class;

interface

uses System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
 Agents, History_Of_Reliz, Product, Requests_agent,
  Request_supplier,Supplier, Material, Main_Class,
  Frame_products,Material_Class;

type
  TProduct_Class = class(TMain_class)
  public

  var
  class var  array_of_products: TObjectList<TProduct>;
     class var  max_id: integer;
    fr: TFrame;
    constructor Create();
    procedure load_frames(Panel1: TPanel; page, count_in_bd: integer); override;
    function from_ado_to_array(ado: tADOQuery): TObjectList<TProduct>;

    procedure create_sort(Sortirovka: TComboBox); override;
    procedure create_filter(Filtr: TComboBox); override;
    procedure FiltrChange(edit: TEdit; Filtr: TComboBox; sort: TComboBox);

    procedure GetMaterials;
  class  function GetProd(id:integer):TProduct;
  end;

implementation

constructor TProduct_Class.Create();
begin
  inherited;
  array_of_products := from_ado_to_array(sql_select(' * ', ' products ', '',
    '', false));

         max_id:=0;
  for var i := 0 to array_of_products.Count-1 do
  begin
       if array_of_products[i].Article>max_id then
       max_id:=array_of_products[i].Article;

  end;
  GetMaterials;
end;

function TProduct_Class.from_ado_to_array(ado: tADOQuery)
  : TObjectList<TProduct>;
begin
  var
    prod: TProduct;
  var
  array_of_products := TObjectList<TProduct>.Create;
  while not ado.Eof do
  begin
    prod := TProduct.Create();
    prod.Article := ado.FieldByName('Article').AsInteger;
    prod.Cost:= ado.Fields[1].AsInteger;
    prod.Time_ := ado.Fields[2].AsInteger;
    prod.In_stock:= ado.Fields[3].AsInteger;
    prod.Technology := ado.Fields[4].AsString;
    prod.Name_ := ado.FieldByName('Name_').AsString;
    prod.Logo := ado.FieldByName('Img').AsString;
    prod.CostForAgent:=ado.FieldByName('CostForAgent').AsInteger;
    prod.Standart:=  ado.FieldByName('Standart').AsString;
    prod.Sertificate:=ado.FieldByName('Sertificat').AsString;
    prod.WeigthWith:=ado.FieldByName('Weight_with_pack').AsInteger;
    prod.WeightWithout:=ado.FieldByName('Weight_without_pack').AsInteger;
    prod.Height:=  ado.FieldByName('Height').AsInteger;
    prod.width:=  ado.FieldByName('width').AsInteger;
     prod.length:=  ado.FieldByName('length').AsInteger;



//    prod.Type_:= sql_select('title','Types_of_product', 'where id = ' + ado.FieldByName('Type_').AsString  ,'',false  ).ToString;


    array_of_products.Add(prod);
    ado.Next;
  end;
  result := array_of_products;
end;

procedure TProduct_Class.GetMaterials;
 var i :integer;
  ado: tADOQuery;
  lm:TListOfMaterials;

begin

    for   i := 0 to  array_of_products.Count-1 do
  begin
          ado:=sql2('SELECT Material.Article, Material.Title,  Material.In_stock, List_of_materials.Count FROM products INNER JOIN (list_of_materials INNER JOIN material ON List_of_materials.Article_of_material = Material.Article)'+ ' ON products.Article = List_of_materials.Article_of_products where products.Article = ' + array_of_products[i].Article.ToString);
      while not ado.Eof do
      begin
          lm:=TListOfMaterials.Create;
          lm.Article:=ado.Fields[0].AsInteger;
           lm.Title:=ado.Fields[1].AsString;
            lm.In_stock:=ado.Fields[2].AsInteger;
             lm.Count:=ado.Fields[3].AsInteger;
             array_of_products[i].list_of_materials.add(lm);
         ado.Next;

      end;


  end;

end;

class function TProduct_Class.GetProd(id: integer): TProduct;
var i:integer;
begin
  for   i := 0 to  array_of_products.Count-1 do
  begin
     if (id =  array_of_products[i].Article   ) then
     begin

         result:= array_of_products[i];
         exit;
     end;

  end;

end;

procedure TProduct_Class.load_frames(Panel1: TPanel;
  page, count_in_bd: integer);
begin
  var
    i, beg, en: integer;
  var
    Item: TControl;
  beg := page * on_page;
  en := ((page + 1) * on_page) - 1;
  i := 0;
  while Panel1.ControlCount > 0 do // стираем старые фреймы
  begin
    Item := Panel1.Controls[0];
    Item.Free;
  end;
  while (beg <= en) and (beg < array_of_products.Count) do
  begin
    fr := TFrame6.Create(Panel1);
    var
      discount: integer;
    With fr do
    begin
      Parent := Panel1;
      Name := 'FORM' + beg.ToString;
      Top := (fr.Height * i) + 10;
      Tag := 1;
      TFrame6(fr).productOnFrame:= array_of_products[beg];
       TFrame6(fr).AppData;
      Visible := true;
      Show;
      Inc(beg);
      Inc(i);

    end;
  end;
  for i := 0 to Panel1.ControlCount - 1 do
    if Panel1.Controls[i].Tag = 1 then
    begin
      Panel1.Controls[i].Show;
      Panel1.Controls[i].Visible := true;
    end;

end;
   procedure TProduct_Class.create_sort(Sortirovka: TComboBox);
begin
  Sortirovka.Items.Add(' ↑ По наименованию');
  Sortirovka.Items.Add(' ↓ По наименованию');
  Sortirovka.Items.Add(' ↑ По стоимости для агена');
  Sortirovka.Items.Add(' ↓ По стоимсоти для агента ');
  Sortirovka.Items.Add(' ↑ По времени производства');
  Sortirovka.Items.Add(' ↓ По времени производства');
   Sortirovka.Items.Add(' ↑ По наличию единиц на складе');
  Sortirovka.Items.Add(' ↓ По наличию единиц на складе');

end;

procedure TProduct_Class.create_filter(Filtr: TComboBox);
begin
  var
    i: integer;
  var
    ado_help: tADOQuery;
  ado_help := tADOQuery.Create(Filtr);
  Filtr.Items.Add('Все');
 {
   ado_help := sql_select(' Type_ ', ' Products ', '', '', true);
  // ado_help.SQL.Add('Select Distinct Type_ from Agent') ;
  while not ado_help.Eof do
  begin
    Filtr.Items.Add(ado_help.FieldByName('Type_').AsString);
    ado_help.Next
  end;
  }
end;

procedure TProduct_Class.FiltrChange(edit: TEdit; Filtr: TComboBox;
  sort: TComboBox);
begin // надо создать новый sql запрос и перезагрузить фреймы
  // потом мб надо вынести это в маин класс
  var
    item: string;
  var
    select, from, where, like, order: string;
  var
    distinct: boolean;
  distinct := false;
  select := ' * ';
  from := ' Products ';

  item := Filtr.Items[Filtr.ItemIndex]; // то что пишем в фильтре
  if (item = 'Все') or (Filtr.ItemIndex < 0) // если все или ничего
  then
  begin
    if (edit.Text = '') then
      where := ' '
    else
      where := 'where Name_ like ' + #39 + '%' + edit.Text + '%' + #39;

  end

  else // если все таки что то ввели в фильтр
  begin
    if (edit.Text = '') then
      where := '  where Type_ = ' + #39 + item + #39
    else
      where := ' where Type_ = ' + #39 + item + #39 + ' and  Company like ' +
        #39 + '%' + edit.Text + '%' + #39;
  end;

  order := ' order by ';
  case sort.ItemIndex of
    0:
      order := order + 'Name_ asc';
    1:
      order := order + 'Name_ desc';
    2:
      order := order + 'CostForAgent asc';
    3:
      order := order + 'CostForAgent desc';
    4:
      order := order + 'time_ asc';
    5:
      order := order + 'time_ desc';
       6:
      order := order + 'in_stock desc';
       7:
      order := order + 'in_stock desc';
  end;
  if sort.ItemIndex < 0 then
    order := '';

  array_of_products := from_ado_to_array(sql_select(' * ', from, where,
    order, false));

end;

end.
