unit Supplier_Class;

interface
 uses System.Generics.Collections,Data.Win.ADODB,System.SysUtils,Vcl.Controls,
Vcl.Forms,  Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,Vcl.ExtCtrls,
TABLE_Agents,TABLE_History_Of_Reliz,TABLE_Products,TABLE_Requests_agent,
TABLE_Request_supplier,TABLE_Suppliers,TABLE_Materials,Main_Class,Frame_sups,Frame_agents;
type TSupplier_Class = class (TMain_Class)
  public
  var array_of_suppliers :TObjectList<TSupplier>;
      fr:TFrame;
   constructor Create();
  procedure load_frames(Panel1:TPanel;page,count_in_bd:integer); override;
  function from_ado_to_array(ado:tADOQuery):TObjectList<TSupplier>;
  end;
 implementation
   constructor TSupplier_Class.Create();
   begin
     inherited;
     array_of_suppliers:=from_ado_to_array( sql_select('select * from supplier','','',true));
   end;


    function TSupplier_Class.from_ado_to_array(ado:tADOQuery):TObjectList<TSupplier>;
    begin
      var sup:TSupplier;
       var   array_of_suppliers:= TObjectList<TSupplier>.Create;
              while not ado.Eof do
           begin
                  sup:= TSupplier.Create();
                  sup.ID:= ADO.Fields[0].AsInteger;
                  sup.Title:= ADO.Fields[1].AsString;

                 array_of_suppliers.Add(sup);
                 ADO.Next;
          end;
           result:=array_of_suppliers;
      end;

   procedure TSupplier_Class.load_frames(Panel1:TPanel;page,count_in_bd:integer);
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

      while  (beg<=en) and (beg<array_of_suppliers.Count) do
      begin
           fr:= TFrame5.Create(Panel1);
           var discount:integer;
            With fr do
            begin
              Parent:=Panel1;
              Name:='FORM'+beg.ToString;
              Top:=100*i;
              Tag:=1;

                   TFrame5(fr).Label2.Caption:=array_of_suppliers[beg].Title;

                //   data_.InsertDiscount(beg,discount.ToString);


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

