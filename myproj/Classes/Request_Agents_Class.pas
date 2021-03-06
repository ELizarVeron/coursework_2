unit Request_Agents_Class;

interface
  uses    System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
 Agents, History_Of_Reliz,   Requests_agent,
   Supplier,   Main_Class,    Agent_Class, Product,My_f;
  type
     TRequest_Agents_Class = class(TMain_class)
      public

      class var array_of_requests_agent: TObjectList<TRequest_Agent>;
            var mc:TMain_Class;
            constructor Create();
            class    procedure load_frames(Panel1: TPanel; page, count_in_bd: integer);
            function from_ado_to_array_req_ag(ado: tADOQuery): TObjectList<TRequest_Agent>;

            function from_ado_to_array_composition(ado: tADOQuery): TObjectList<TComposition_req_agent>;

           procedure reload;
           procedure FiltrChange(edit: TEdit; Filtr: TComboBox; sort: TComboBox);
           procedure create_sort(Sortirovka: TComboBox); override;
           procedure create_filter(Filtr: TComboBox); override;
           procedure CheckStatus;

     end;

implementation
uses   Frame_req_ag ;
procedure TRequest_Agents_Class.CheckStatus;
 var i: integer;
   ado:TADOQuery;
   have_in_process:boolean;
    begin
            for i  := 0 to array_of_requests_agent.Count-1  do
       begin
                 have_in_process:=false;
           if array_of_requests_agent[i].Status='В обработке' then
           begin
                 ado:=mc.sql_select('*',' manufacture ', ' Where Id_request_from_agent = ' +array_of_requests_agent[i].ID_Request.ToString,'',false   );

                 while not ado.Eof do
                 begin
                    if not( ado.FieldByName('Status').AsInteger = 3 ) then
                    begin
                          have_in_process:=true;
                    end;
                 ado.Next;
                 end;
                 if not have_in_process then   //если все готово
                 begin
                    mc.sql_update( ' request_from_agent ', ' Status = 5 ' , ' where Id_request_agent =  ' +  array_of_requests_agent[i].ID_Request.ToString);
                    array_of_requests_agent[i].Status:='5';
                 end;

           end;



       end;



    end;

constructor TRequest_Agents_Class.Create();
begin
  inherited;
 array_of_requests_agent := from_ado_to_array_req_ag(sql_select('*', 'Request_from_agent','',' order by ID_request_agent desc ', false));
  CheckStatus;
end;


  procedure TRequest_Agents_Class.reload;

  begin

  end;

function TRequest_Agents_Class.from_ado_to_array_composition( ado: tADOQuery): TObjectList<TComposition_req_agent>;
  var compos:  TObjectList<TComposition_req_agent>;
  var comp: TComposition_req_agent;
begin
     compos:= TObjectList<TComposition_req_agent>.Create;
       while not ado.Eof do
       begin
         comp:= TComposition_req_agent.Create;
         comp.Articul:=ado.FieldByName('Articul_product').AsInteger;
        // comp.Name_:= sql_select('Name_ ',' Products ','','',false).FieldByName('Name_').AsString;
         comp.Cost:=ado.FieldByName('Cost_of_product').AsInteger;
         comp.Count:=ado.FieldByName('Count').AsInteger;
         compos.Add(comp);
         ado.Next;
       end;
     result:=compos;
end;

function TRequest_Agents_Class.from_ado_to_array_req_ag(ado: tADOQuery): TObjectList<TRequest_Agent>;
 begin
    var
    req: TRequest_Agent;

        mc:=TMain_Class.Create;
  var
  array_of_requests_agent := TObjectList<TRequest_Agent>.Create;
  while not ado.Eof do
  begin
    req := TRequest_Agent.Create();


    req.ID_Request := ado.FieldByName('Id_request_agent').AsInteger;
    req.ID_Agent := ado.Fields[1].AsInteger;
    req.Status:=  ado.Fields[2].AsString;
    req.Date_Of_Create:=ado.Fields[3].AsDateTime;
    if(req.Status = 'В ожидании оплаты'  )   then
    req.Date_Of_Confirm:=ado.Fields[7].AsDateTime;
    req.Date_Of_Begin:=ado.Fields[8].AsDateTime;
    req.Premayment:= ado.Fields[4].AsBoolean;
    req.Done:= ado.Fields[5].AsBoolean;
    req.Company:=mc.sql_select('Company', 'Agent' , 'where ID = ' + req.ID_Agent.ToString,'',false).Fields[0].AsString; //что бы узнать имя агента по id
    req.Composition:= from_ado_to_array_composition(sql_select('*','Composition_of_req_ag',' where ID_request = '+req.ID_Request.ToString ,'',false ) );

    req.GetCost;


    array_of_requests_agent.Add(req);
    ado.Next;
  end;
  result := array_of_requests_agent;

 end;



procedure TRequest_Agents_Class.create_sort(Sortirovka: TComboBox);
begin

  Sortirovka.Items.Add(' ↑ По дате создания');
  Sortirovka.Items.Add(' ↓ По дате создания');


end;

procedure TRequest_Agents_Class.create_filter(Filtr: TComboBox);
begin


  var
  ado_help: tADOQuery;
  ado_help := tADOQuery.Create(Filtr);
  Filtr.Items.Add('Все');
  ado_help := sql_select(' *', ' Status_request ', '', '', true);
  // ado_help.SQL.Add('Select Distinct Type_ from Agent') ;
  while not ado_help.Eof do
  begin

   Filtr.Items.Add(ado_help.FieldByName('Name').AsString);
    ado_help.Next
  end;

end;

class procedure TRequest_Agents_Class.load_frames(Panel1: TPanel; page, count_in_bd: integer);
  begin
        var
        i, beg, en: integer;
      var
        Item: TControl;
         var  fr: TFrame;
      beg := page * on_page;
      en := ((page + 1) * on_page) - 1;
      i := 0;
      while Panel1.ControlCount > 0 do // стираем старые фреймы
      begin
        Item := Panel1.Controls[0];
        Item.Free;
      end;
      while (beg <= en) and (beg < array_of_requests_agent.Count) do
      begin
        fr := TFrame9.Create(Panel1);
        var
          discount: integer;

        With fr do
        begin
          Parent := Panel1;
          Name := 'FORM' + beg.ToString;
          Top := (fr.Height * i) + 10;
          Tag := 1;

           TFrame9(fr).panel:=Panel1;
          TFrame9(fr).Req_on_frame:= array_of_requests_agent[beg];
           TFrame9(fr).AppData;
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

procedure TRequest_Agents_Class.FiltrChange(edit: TEdit; Filtr: TComboBox;
  sort: TComboBox);
begin

  var
    item: string;
  var
    select, from, where, like, order: string;
  var
  distinct: boolean;
  distinct := false;
  select := ' * ';
  from := ' Request_from_agent ';

  item := Filtr.Items[Filtr.ItemIndex];
  if (item = 'Все') or (Filtr.ItemIndex < 0)
  then
  begin
    if (edit.Text = '') then
      where := ' '
    else
      where := 'where ID_request_agent  like ' + #39 +   edit.Text + #39    ;

  end

  else // если все таки что то ввели в фильтр
  begin


    if (edit.Text = '') then
      where := '  where Status = '  + My_f.Returt_NameOfStatusReq((item)).ToString
    else
      where := ' where Status = '  + My_f.Returt_NameOfStatusReq( (item)).ToString   + ' and  Company like ' +
        #39 + '%' + edit.Text + '%' + #39;
  end;

  order := ' order by ';
  case sort.ItemIndex of

    0:
      order := order + 'DataOfCreate asc';
    1:
      order := order + 'DataOfCreate desc';

  end;
  if sort.ItemIndex < 0 then
    order := '';

    array_of_requests_agent := from_ado_to_array_req_ag(sql_select(' * ', from, where,
    order, false));

end;


end.
