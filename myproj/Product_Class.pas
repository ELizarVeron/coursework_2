unit Product_Class;
interface
 uses System.Generics.Collections,Data.Win.ADODB,System.SysUtils,Vcl.Controls,
Vcl.Forms,  Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,Vcl.ExtCtrls,
TABLE_Agents,TABLE_History_Of_Reliz,TABLE_Products,TABLE_Requests_agent,
TABLE_Request_supplier,TABLE_Suppliers,TABLE_Materials,Main_Class,Frame_products;
type TProduct_Class = class (TMain_Class)
  public
  var array_of_products :TObjectList<TProduct>;
      fr:TFrame;
   constructor Create();
  procedure load_frames(Panel1:TPanel;page,count_in_bd:integer); override;
  function from_ado_to_array(ado:tADOQuery):TObjectList<TProduct>;
  end;
 implementation
   constructor TProduct_Class.Create();
   begin
     inherited;
     array_of_products:=from_ado_to_array( sql_select('select * from products','','',true));
   end;


    function TProduct_Class.from_ado_to_array(ado:tADOQuery):TObjectList<TProduct>;
    begin
      var prod:TProduct;
       var   array_of_products:= TObjectList<TProduct>.Create;
              while not ado.Eof do
           begin
                  prod:= TProduct.Create();
                  prod.Article:= ADO.Fields[0].AsInteger;
                  prod.Name_:= ADO.Fields[6].AsString;
                  prod.Cost:= ADO.Fields[1].AsInteger;
                 array_of_products.Add(prod);
                 ADO.Next;
          end;
           result:=array_of_products;
      end;

   procedure TProduct_Class.load_frames(Panel1:TPanel;page,count_in_bd:integer);
    begin
     var i,beg,en:integer;
     var Item: TControl;
       beg:=page*on_page;
       en:=((page+1)*on_page)-1;
        i:=0;
       while Panel1.ControlCount>0 do    //סעטנאול סעאנûו פנוילû
       begin
         Item:= Panel1.Controls[0];
         Item.Free;
       end;
      while  (beg<=en) and (beg<array_of_products.Count) do
      begin
           fr:= TFrame6.Create(Panel1);
           var discount:integer;
            With fr do
            begin
              Parent:=Panel1;
              Name:='FORM'+beg.ToString;
              Top:=100*i;
              Tag:=1;
              TFrame6(fr).Label1.Caption:=array_of_products[beg].Article.ToString;
                   TFrame6(fr).Label2.Caption:=array_of_products[beg].Name_;
                   TFrame6(fr).Label7.Caption:=array_of_products[beg].Cost.ToString;
                     Visible:=true;
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

