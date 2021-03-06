unit Agent_Class;

interface

uses System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Agents,  History_Of_Reliz,  Product, Requests_agent,
  Request_supplier, Supplier, Material, Main_Class,
   DateUtils,AddPoints;

type
  TAgent_Class = class(TMain_class)
  public
  var
   class var on_page:integer;
   class var  max_id: integer;
   class var array_of_agents: TObjectList<TAgent>;
     Panel:TPanel;
    fr: TFrame;

    constructor Create();
    class  procedure load_frames(Panel1: TPanel; page, count_in_bd: integer);
    procedure create_sort(Sortirovka: TComboBox); override;
    procedure create_filter(Filtr: TComboBox); override;
    function from_ado_to_array_agents(ado: tADOQuery): TObjectList<TAgent>;
    function from_ado_to_array_history(ado: tADOQuery) : TObjectList<THistory_Of_Reliz>;
    function from_ado_to_array_product(ado: tADOQuery): TObjectList<TProduct>;
    function from_ado_to_array_points(ado: tADOQuery)  : TObjectList<TPoint_>;
    procedure Get_History_and_Products;
    procedure Get_sale;
    procedure Get_points;
    procedure Get_Count_and_Sale;
    procedure FiltrChange(edit: TEdit; Filtr: TComboBox; sort: TComboBox);
    procedure EditAgentsFrame;

  end;

implementation
 uses Frame_agents;
constructor TAgent_Class.Create();
begin
  inherited;
   on_page:=5;
  array_of_agents := from_ado_to_array_agents(sql_select(' * ', ' agent ', '',
    ' order by company ', false));
    max_id:=0;
  for var i := 0 to array_of_agents.Count-1 do
  begin
       if array_of_agents[i].ID_>max_id then
       max_id:=array_of_agents[i].ID_;

  end;

  Get_History_and_Products;
  Get_Count_and_Sale;
  Get_Points;


end;


procedure TAgent_Class.FiltrChange(edit: TEdit; Filtr: TComboBox;
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
  from := ' agent ';

  item := Filtr.Items[Filtr.ItemIndex]; // то что пишем в фильтре
  if (item = 'Все') or (Filtr.ItemIndex < 0) // если все или ничего
  then
  begin
    if (edit.Text = '') then
      where := ' '
    else
      where := 'where Company like ' + #39 + '%' + edit.Text + '%' + #39;

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
      order := order + 'company asc';
    1:
      order := order + 'company desc';
    2:
      order := order + 'discount asc';
    3:
      order := order + 'discount desc';
    4:
      order := order + 'priority asc';
    5:
      order := order + 'priority desc';
  end;
  if sort.ItemIndex < 0 then
    order := '';

  array_of_agents := from_ado_to_array_agents(sql_select(' * ', from, where,
    order, false));
  Get_History_and_Products;
  Get_Count_and_Sale;

end;

procedure TAgent_Class.Get_sale;
begin
  var
    i: integer;
  for i := 0 to array_of_agents.Count - 1 do
  begin
    if array_of_agents[i].SUMMA >= 50000 then
      array_of_agents[i].Discount := 25
    else if ((array_of_agents[i].SUMMA < 500000) and
      (array_of_agents[i].SUMMA >= 150000)) then
      array_of_agents[i].Discount := 20
    else if ((array_of_agents[i].SUMMA < 150000) and
      (array_of_agents[i].SUMMA >= 50000)) then
      array_of_agents[i].Discount := 10
    else if ((array_of_agents[i].SUMMA < 50000) and
      (array_of_agents[i].SUMMA >= 10000)) then
      array_of_agents[i].Discount := 5
    else if array_of_agents[i].SUMMA < 10000 then
      array_of_agents[i].Discount := 0;

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

procedure TAgent_Class.create_filter(Filtr: TComboBox);
begin
  var
    i: integer;
  var
    ado_help: tADOQuery;
  ado_help := tADOQuery.Create(Filtr);
  Filtr.Items.Add('Все');
  ado_help := sql_select(' Type_ ', ' Agent ', '', '', true);
  // ado_help.SQL.Add('Select Distinct Type_ from Agent') ;
  while not ado_help.Eof do
  begin
    Filtr.Items.Add(ado_help.FieldByName('Type_').AsString);
    ado_help.Next
  end;

end;

function TAgent_Class.from_ado_to_array_points(ado: tADOQuery) : TObjectList<TPoint_>;
begin

  var
    point: TPoint_;
  var
  array_of_points := TObjectList<TPoint_>.Create;
  while not ado.Eof do
  begin
    point := TPoint_.Create;
    point.AgentID:=ado.Fields[0].AsInteger;
     point.City:=ado.Fields[1].AsString;
      point.Street:=ado.Fields[2].AsString;
       point.Flat:=ado.Fields[3].AsString;
        point.Building:=ado.Fields[4].AsString;
         point.Index_:=ado.Fields[5].AsInteger;
          point.Tel:=ado.Fields[6].AsString;
           point.Name:=ado.Fields[7].AsString;
            point.House:=ado.Fields[8].AsString;
      array_of_points.Add(point);

    ado.Next;
  end;
  result := array_of_points;
end;

procedure TAgent_Class.Get_Points;
begin
  var
    i: integer;
  for i := 0 to array_of_agents.Count - 1 do
  begin
    array_of_agents[i].points := from_ado_to_array_points
      (sql_select('*', 'Points', 'where ID_Agent = ' + array_of_agents
      [i].ID_.ToString, '', false));
  end;

end;

procedure TAgent_Class.Get_Count_and_Sale;
begin
  var
    i, j, k, c, s: integer;
  for i := 0 to array_of_agents.Count - 1 do
  begin
    if (array_of_agents[i].history_of_reliz = nil) then
    begin
      // код на случай отсутствия истории реализации у агента
    end
    else
    begin
      for j := 0 to array_of_agents[i].history_of_reliz.Count - 1 do
      begin
        k := DaysBetween(Date, array_of_agents[i].history_of_reliz[j].Date);
        if k < 366 then
        begin
          c := array_of_agents[i].history_of_reliz[j].Count;
          array_of_agents[i].Count_s_year := array_of_agents[i].Count_s_year +
            c; // количество единиц за год
        end;

        s := array_of_agents[i].history_of_reliz[j].Count * array_of_agents[i]
          .history_of_reliz[j].Product.Cost;
        array_of_agents[i].SUMMA := array_of_agents[i].SUMMA + s;

      end;

    end;

  end;

  Get_sale;
end;

function TAgent_Class.from_ado_to_array_history(ado: tADOQuery)
  : TObjectList<THistory_Of_Reliz>;
begin

  var
    history: THistory_Of_Reliz;
  var
  array_of_history := TObjectList<THistory_Of_Reliz>.Create;
  while not ado.Eof do
  begin
    history := THistory_Of_Reliz.Create;
    history.IDAgent := ado.Fields[0].AsInteger;
    history.Date := ado.Fields[2].AsDateTime;
    history.Count := ado.Fields[3].AsInteger;
    history.ArticleProduct := ado.Fields[1].AsInteger;
    // артикул продукта      ???
    array_of_history.Add(history);

    ado.Next;
  end;
  result := array_of_history;
end;

function TAgent_Class.from_ado_to_array_product(ado: tADOQuery)
  : TObjectList<TProduct>; // берем массив продукта из адо
begin

  var
    Product: TProduct;
  var
  array_of_products := TObjectList<TProduct>.Create;
  while not ado.Eof do
  begin
    Product := TProduct.Create;
    Product.Article := ado.Fields[0].AsInteger;
    Product.Name_ := ado.Fields[6].AsString;
    Product.Cost := ado.Fields[1].AsInteger;
    array_of_products.Add(Product);

    ado.Next;

  end;
  result := array_of_products;
end;

procedure TAgent_Class.Get_History_and_Products();
// для каждого агента в  массив его истории добавляем записи
begin
  var
    i, j, x: integer;

  for i := 0 to array_of_agents.Count - 1 do
  begin
    array_of_agents[i].history_of_reliz := from_ado_to_array_history
      (sql_select('*', 'History_of_reliz', 'where ID_Agent = ' + array_of_agents
      [i].ID_.ToString, '', false));

    x := array_of_agents[i].history_of_reliz.Count - 1;
    for j := 0 to x do
    begin
      // индекс 0,так как продукт всего 1 на каждую запись истории
      array_of_agents[i].history_of_reliz[j].Product :=
        from_ado_to_array_product(sql_select('*', 'Products',
        'where Article = ' + array_of_agents[i].history_of_reliz[j]
        .ArticleProduct.ToString, '', false))[0];

    end;

  end;

end;

function TAgent_Class.from_ado_to_array_agents(ado: tADOQuery)
  : TObjectList<TAgent>;
begin

  var
    agent: TAgent;
  var
  array_of_agents_ := TObjectList<TAgent>.Create;
  while not ado.Eof do
  begin
    agent := TAgent.Create();
    agent.ID_ := ado.Fields[0].AsInteger;
    agent.Name := ado.Fields[1].AsString;
    agent.Type_ := ado.Fields[2].AsString;
    agent.Address:= ado.Fields[3].AsString;
    agent.INN := ado.Fields[4].AsString;
    agent.KPP := ado.Fields[5].AsString;
    agent.Boss:= ado.Fields[6].AsString;
    agent.Tel := ado.Fields[7].AsString;
    agent.Email:= ado.Fields[8].AsString;

    agent.Logo:=ado.Fields[9].AsString;
    agent.Priority  := ado.Fields[10].AsInteger;
    array_of_agents_.Add(agent);
    ado.Next;
  end;

  result := array_of_agents_;
end;

class procedure TAgent_Class.load_frames(Panel1: TPanel; page, count_in_bd: integer);

begin
  var
    i, beg, en: integer;
  var
    item: TControl;
  beg := page * on_page;
  en := ((page + 1) * on_page) - 1;
  i := 0;
  while Panel1.ControlCount > 0 do // стираем старые фреймы
  begin
    item := Panel1.Controls[0];
    item.Free;
  end;
  while (beg <= en) and (beg < array_of_agents.Count) do
  begin
    fr := TFrame3.Create(Panel1);

    var
      Discount: integer;
    With fr do
    begin
      Parent := Panel1;
     // panel:=Panel1;
      Name := 'FORM' + beg.ToString;
      Top := (fr.Height * i) + 10;
      Tag := 1;

      TFrame3(fr).panel:=Panel1;
      TFrame3(fr).AgentOnFrame:=array_of_agents[beg];
       TFrame3(fr).AddData;
        TFrame3(fr).AgentID:=array_of_agents[beg].ID_;


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
 procedure TAgent_Class.EditAgentsFrame;
   begin


   end;


end.
