﻿unit Agent_Class;

interface
 uses System.Generics.Collections,Data.Win.ADODB,System.SysUtils,Vcl.Controls,
Vcl.Forms,  Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,Vcl.ExtCtrls,
TABLE_Agents,TABLE_History_Of_Reliz,TABLE_Products,TABLE_Requests_agent,
TABLE_Request_supplier,TABLE_Suppliers,TABLE_Materials,Main_Class,Frame_agents,DateUtils;
type TAgent_Class = class (TMain_Class)
  public
  var array_of_agents :TObjectList<TAgent>;

      fr:TFrame;
   constructor Create();
  procedure load_frames(Panel1:TPanel;page,count_in_bd:integer); override;
  procedure create_sort(Sortirovka:TComboBox); override;
  procedure create_filter(Filtr:TComboBox); override;
  function from_ado_to_array_agents(ado:tADOQuery):TObjectList<TAgent>;
   function from_ado_to_array_history(ado:tADOQuery):TObjectList<THistory_Of_Reliz>;
   function from_ado_to_array_product(ado:tADOQuery):TObjectList<TProduct>;
   procedure Get_History_and_Products;
    procedure Get_sale;
   procedure   Get_Count_and_Sale;
  end;
 implementation
   constructor TAgent_Class.Create();
   begin
     inherited;
     array_of_agents:=from_ado_to_array_agents( sql_select(' * ',' agent ','','','',false));
     Get_History_and_Products;
     Get_Count_and_Sale;

   end;

     procedure TAgent_Class.Get_sale;
              begin
                     var i:integer;
                  for I := 0 to array_of_agents.Count-1 do
                  begin
                      if array_of_agents[i].SUMMA >=50000 then array_of_agents[i].Discount:=25
                       else if ((array_of_agents[i].SUMMA<500000) and (array_of_agents[i].SUMMA>=150000)) then array_of_agents[i].Discount:=20
                       else if ((array_of_agents[i].SUMMA<150000) and (array_of_agents[i].SUMMA>=50000)) then array_of_agents[i].Discount:=10
                        else if ((array_of_agents[i].SUMMA<50000) and (array_of_agents[i].SUMMA>=10000)) then array_of_agents[i].Discount:=5
                        else if array_of_agents[i].SUMMA<10000 then array_of_agents[i].Discount:=0;


                  end;

              end;


    procedure TAgent_Class.create_sort(Sortirovka: TComboBox);
    begin
         Sortirovka.Items.Add(' ↑ По наименованию');
         Sortirovka.Items.Add(' ↓ По наименованию');
         Sortirovka.Items.Add(' ↑ По размеру скидки');
         Sortirovka.Items.Add(' ↓ По размеру скидки');
         Sortirovka.Items.Add(' ↑ По приоритету');
         Sortirovka.Items.Add(' ↓ По приоритету');

    end;

     procedure TAgent_Class.create_filter(Filtr:TComboBox);
     begin
         var i:integer;
         var ado_help:TADOQuery;
         ado_help:= TADOQuery.Create(Filtr);
         Filtr.Items.Add('Все');
         ado_help:= sql_select(' Type_ ',' Agent ', '','','', true);
       //  ado_help.SQL.Add('Select Distinct Type_ from Agent') ;
         while not ado_help.Eof do
          begin
          Filtr.Items.Add(ado_help.FieldByName('Type_').AsString);
          ado_help.Next
          end;

     end;

       procedure   TAgent_Class.Get_Count_and_Sale;
       begin
         var i,j,k,c,s:integer;
         for I := 0 to array_of_agents.Count-1 do
         begin
               if (array_of_agents[i].history_of_reliz=nil) then
               begin
                    //  код на случай отсутствия истории реализации у агента
               end
               else
               begin

                 for j := 0 to array_of_agents[i].history_of_reliz.Count-1 do
                         begin
                             k:=DaysBetween(Date,array_of_agents[i].history_of_reliz[j].Date);
                             if k<366 then
                             begin
                               c:=array_of_agents[i].history_of_reliz[j].Count;
                                array_of_agents[i].Count_s_year:=array_of_agents[i].Count_s_year+c; //количество единиц за год
                             end;

                             s:=array_of_agents[i].history_of_reliz[j].Count*array_of_agents[i].history_of_reliz[j].Product.Cost;
                             array_of_agents[i].SUMMA:=  array_of_agents[i].SUMMA+s;


                         end;




               end;



         end;

           Get_Sale;
       end;

     function TAgent_Class.from_ado_to_array_history(ado:tADOQuery):TObjectList<THistory_Of_Reliz>;
          begin

            var history:THistory_Of_Reliz;
             var   array_of_history:= TObjectList<THistory_Of_Reliz>.Create;
                    while not ado.Eof do
                 begin
                         history:=THistory_Of_Reliz.Create;
                         history.IDAgent:=ado.Fields[0].AsInteger;
                         history.Date:=ado.Fields[2].AsDateTime;
                         history.Count:=ado.Fields[3].AsInteger;
                         history.ArticleProduct:=ado.Fields[1].AsInteger;
                         //артикул продукта      ???
                         array_of_history.Add(history);

                         ado.Next;
                end;
                result:=array_of_history;
      end;

        function TAgent_Class.from_ado_to_array_product(ado:tADOQuery):TObjectList<TProduct>; //берем массив продукта из адо
          begin

            var product:TProduct;
               var array_of_products:=TObjectList<TProduct>.Create;
                    while not ado.Eof do
                 begin
                         product:=TProduct.Create;
                         product.Article:=ado.Fields[0].AsInteger;
                         product.Name_:=ado.Fields[6].AsString;
                         product.Cost:=ado.Fields[1].AsInteger;

                          array_of_products.Add(product)   ;

                         ado.Next;

                end;
                result:=array_of_products;
      end;

     procedure TAgent_Class.Get_History_and_Products(); //для каждого агента в  массив его истории добавляем записи
     begin
            var i,j,x:integer;


            for I := 0 to array_of_agents.Count-1 do
            begin
                  array_of_agents[i].history_of_reliz:=from_ado_to_array_history(sql_select('*','History_of_reliz','where ID_Agent = '+array_of_agents[i].ID_.ToString,'','',false ));
                     //ТУТ ИСКЛЮЧЕНИЕ     (НИЖЕ СРТРОКА
                      x:=array_of_agents[i].history_of_reliz.Count-1;
                  for j := 0 to x do
                    begin
                        //индекс 0,так как продукт всего 1 на каждую запись истории
                        array_of_agents[i].history_of_reliz[j].Product:=from_ado_to_array_product(sql_select('*','Products','where Article = '+array_of_agents[i].history_of_reliz[j].ArticleProduct.ToString,'','',false ))[0];

                    end;



            end;

     end;

    function TAgent_Class.from_ado_to_array_agents(ado:tADOQuery):TObjectList<TAgent>;
    begin

      var agent:TAgent;
       var   array_of_agents_:= TObjectList<TAgent>.Create;
              while not ado.Eof do
           begin
                  agent:= TAgent.Create();
                  agent.ID_:= ADO.Fields[0].AsInteger;
                  agent.Name:= ADO.Fields[1].AsString;
                  agent.Type_:= ADO.Fields[2].AsString;
                  agent.Tel:= ADO.Fields[7].AsInteger;
                 array_of_agents_.Add(agent);
                 ADO.Next;
          end;
           result:=array_of_agents_;
      end;

   procedure TAgent_Class.load_frames(Panel1:TPanel;page,count_in_bd:integer);
    begin
     var i,beg,en:integer;
     var Item: TControl;
       beg:=page*on_page;
       en:=((page+1)*on_page)-1;
        i:=0;
       while Panel1.ControlCount>0 do    //стираем старые фреймы
       begin
         Item:= Panel1.Controls[0];
         Item.Free;
       end;
      while  (beg<=en) and (beg<array_of_agents.Count) do
      begin
           fr:= TFrame3.Create(Panel1);
           var discount:integer;
            With fr do
            begin
              Parent:=Panel1;
              Name:='FORM'+beg.ToString;
              Top:=(fr.Height *i)+10;
              Tag:=1;
              TFrame3(fr).Label1.Caption:=array_of_agents[beg].Type_;
                   TFrame3(fr).Label2.Caption:=array_of_agents[beg].Name;
                   TFrame3(fr).Label5.Caption:=array_of_agents[beg].Tel.ToString;
                   TFrame3(fr).Label4.Caption:=array_of_agents[beg].Count_s_year.ToString+TFrame3(fr).Label4.Caption;
                   TFrame3(fr).Label3.Caption:=array_of_agents[beg].discount.ToString+'%';
                //   data_.InsertDiscount(beg,discount.ToString);
                   TFrame3(fr).Label8.Caption:=  TFrame3(fr).Label8.Caption+array_of_agents[beg].SUMMA.ToString;
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
