unit Material_Class;

interface

uses System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
 Agents, History_Of_Reliz, Product, Requests_agent,
  Request_supplier,Supplier, Material, Main_Class,
  Frame_material;

type
 TMaterial_Class = class(TMain_class)
  public

  var

  class var  array_of_material: TObjectList<TMaterial>;
    class var  max_id: integer;
    fr: TFrame;
    constructor Create();

    function from_ado_to_array(ado: tADOQuery): TObjectList<TMaterial>;
 //   procedure create_sort(Sortirovka: TComboBox); override;
 //   procedure create_filter(Filtr: TComboBox); override;
  procedure FiltrChange(edit: TEdit; Filtr: TComboBox; sort: TComboBox);
  procedure load_frames(Panel1: TPanel; page, count_in_bd: integer); override;
  end;

implementation
constructor TMaterial_Class.Create();
begin
  inherited;
  array_of_material := from_ado_to_array(sql_select(' * ', ' material ', '',
    ' order by title ', false));

         max_id:=0;
  for var i := 0 to array_of_material.Count-1 do
  begin
       if array_of_material[i].Article>max_id then
       max_id:=array_of_material[i].Article;

  end;



end;

procedure TMaterial_Class.FiltrChange(edit: TEdit; Filtr, sort: TComboBox);

begin

       array_of_material :=
        from_ado_to_array(
         sql2 (' Select * from Material  where Title like ' + #39 + '%' + edit.Text + '%' + #39)
         ) ;
end;

function TMaterial_Class.from_ado_to_array(ado: tADOQuery)
  : TObjectList<TMaterial>;
begin
  var
    material: TMaterial;
  var
  array_of_materials := TObjectList<TMaterial>.Create;
  while not ado.Eof do
  begin
    material := TMaterial.Create();
    material.Article := ado.Fields[0].AsInteger;
    material.Title:= ado.Fields[1].AsString;
    material.In_stock:= ado.Fields[2].AsInteger;
    material.Cost := ado.Fields[3].AsInteger;
    array_of_materials.Add(material);
    ado.Next;
  end;
  result := array_of_materials;
end;


procedure TMaterial_Class.load_frames(Panel1: TPanel; page,
  count_in_bd: integer);
begin
  var
    i, beg, en: integer;
  var
    Item: TControl;
  beg := page * on_page;
  en := ((page + 1) * on_page) - 1;
  i := 0;
  while Panel1.ControlCount > 0 do // סעטנאול סעאנûו פנוילû
  begin
    Item := Panel1.Controls[0];
    Item.Free;
  end;
  while (beg <= en) and (beg < array_of_material.Count) do
  begin
    fr := TFramematerial.Create(Panel1);
    var
      discount: integer;
    With fr do
    begin
      Parent := Panel1;
      Name := 'FORM' + beg.ToString;
      Top := (fr.Height * i) + 10;
      Tag := 1;
      TFramematerial(fr).materialOnFrame:= array_of_material[beg];
      TFramematerial(fr).Label8.Caption := array_of_material[beg].Title;
      TFramematerial(fr).Label4.Caption := array_of_material[beg].Cost.ToString;
      TFramematerial(fr).Label6.Caption := array_of_material[beg].In_stock.ToString;
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

end.
