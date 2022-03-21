unit Material_Class;

interface

uses System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
 Agents, History_Of_Reliz, Product, Requests_agent,
  Request_supplier,Supplier, Material, Main_Class,
  Frame_products;

type
 TMaterial_Class = class(TMain_class)
  public

  var
  class var  array_of_materials: TObjectList<TMaterial>;
    class var  max_id: integer;
    fr: TFrame;
    constructor Create();

    function from_ado_to_array(ado: tADOQuery): TObjectList<TMaterial>;
 //   procedure create_sort(Sortirovka: TComboBox); override;
 //   procedure create_filter(Filtr: TComboBox); override;
  //  procedure FiltrChange(edit: TEdit; Filtr: TComboBox; sort: TComboBox);
  end;

implementation
constructor TMaterial_Class.Create();
begin
  inherited;
  array_of_materials := from_ado_to_array(sql_select(' * ', ' material ', '',
    '', false));

         max_id:=0;
  for var i := 0 to array_of_materials.Count-1 do
  begin
       if array_of_materials[i].Article>max_id then
       max_id:=array_of_materials[i].Article;

  end;
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


end.
