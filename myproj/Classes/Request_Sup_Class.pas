unit Request_Sup_Class;

interface
 uses    System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
 Agents, History_Of_Reliz,   Request_supplier,
   Supplier,   Main_Class,    Supplier_Class,Material_class,My_f;

type
  TRequest_Sup_Class  = class(TMain_class  )
  public
    class var array_of_requests_sup: TObjectList<TRequest_Supplier>;

           constructor Create();
           class    procedure load_frames(Panel1: TPanel; page, count_in_bd: integer);
           function from_ado_to_array_req_sup(ado: tADOQuery): TObjectList<TRequest_Supplier>;
           procedure reload;
           procedure FiltrChange(edit: TEdit; Filtr: TComboBox; sort: TComboBox);
           procedure create_sort(Sortirovka: TComboBox); override;
           procedure create_filter(Filtr: TComboBox); override;

  end;


implementation
uses   Frame_req_sup ;


{ TRequest_Sup_Class }

constructor TRequest_Sup_Class.Create;
begin
      inherited;
 array_of_requests_sup := from_ado_to_array_req_sup(sql_select('*', 'Request_for_supplier','',' order by Id_request_sup desc ',false));
end;

procedure TRequest_Sup_Class.create_filter(Filtr: TComboBox);
begin
  Filtr.Items.Add('Все');
    Filtr.Items.Add('Создана');
   // Filtr.Items.Add('В процессе');
    Filtr.Items.Add('Завершена');


end;

procedure TRequest_Sup_Class.create_sort(Sortirovka: TComboBox);
begin
    Sortirovka.Items.Add(' ↑ По дате создания');
  Sortirovka.Items.Add(' ↓ По дате создания');
   Sortirovka.Items.Add(' ↑ По колиеству');
  Sortirovka.Items.Add(' ↓ По количеству');

end;

procedure TRequest_Sup_Class.FiltrChange(edit: TEdit; Filtr, sort: TComboBox);
begin
      var
    item: string;
  var
    sql,  where, like, order: string;
  var
  distinct: boolean;
  distinct := false;

  sql := ' Request_for_supplier inner join Supplier on  Request_for_supplier.Id_sup = Supplier.id  ';

  item := Filtr.Items[Filtr.ItemIndex]; // то что пишем в фильтре
  if (item = 'Все') or (Filtr.ItemIndex < 0) // если все или ничего
  then
  begin
    if (edit.Text = '') then
      where := ' '
    else
      where := 'where Supplier.Title like ' + #39 + '%' + edit.Text + '%' + #39;

  end

  else // если все таки что то ввели в фильтр
  begin
    if (edit.Text = '') then
      where := '  where    status =  ' + My_f.Return_IDOfStatusMan(item).ToString
    else
      where := ' where status = ' + My_f.Return_IDOfStatusMan(item).ToString + ' and  Supplier.Title like ' +
        #39 + '%' + edit.Text + '%' + #39;
  end;

  order := ' order by ';
  case sort.ItemIndex of
    0:
      order := order + 'Request_for_supplier.DataOfCreate asc';
    1:
      order := order + 'Request_for_supplier.DataOfCreate desc';
    2:
      order := order + 'Request_for_supplier.count asc';
    3:
      order := order + 'Request_for_supplier.count desc';

  end;
  if sort.ItemIndex < 0 then
    order := '';

  array_of_requests_sup := from_ado_to_array_req_sup(sql_select(' * ', sql, where,
  order, false));

end;

function TRequest_Sup_Class.from_ado_to_array_req_sup(
  ado: tADOQuery): TObjectList<TRequest_Supplier>;
begin
       var
    req: TRequest_supplier;
    var mc:TMain_Class;
        mc:=TMain_Class.Create;
  var
  array_of_requests_sup := TObjectList<TRequest_Supplier>.Create;
  while not ado.Eof do
  begin
    req := TRequest_supplier.Create();
    req.ID_Request := ado.Fields[0].AsInteger;
    req.ID_Sup := ado.Fields[1].AsInteger;

    req.Date_Of_Create:=ado.Fields[3].AsDateTime;
    req.Count:=ado.FieldByName('Count').AsInteger;

   req.Status:= mc.sql_select('name', 'Status_manufacture' , 'where ID = ' + ado.FieldByName('Status').AsString,'',false).Fields[0].AsString;

    req.Company:=mc.sql_select('Title', 'Supplier' , 'where ID = ' + req.ID_Sup.ToString,'',false).Fields[0].AsString; //что бы узнать имя по id
    var article := ado.FieldByName('Article_material').AsInteger;
    var mater: TMaterial_Class;
     mater:=TMaterial_class.Create;

      for var i  := 0 to mater.array_of_material.Count-1 do
      begin
        if (mater.array_of_material[i].Article=article) then
        begin
          req.Material:=mater.array_of_material[i];
          break;

        end;


      end;


    array_of_requests_sup.Add(req);
    ado.Next;
  end;
  result := array_of_requests_sup;

end;

class procedure TRequest_Sup_Class.load_frames(Panel1: TPanel; page,
  count_in_bd: integer);
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
      while (beg <= en) and (beg < array_of_requests_sup.Count) do
      begin
        fr := TFrame4.Create(Panel1);
        var
          discount: integer;

        With fr do
        begin
          Parent := Panel1;
          Name := 'FORM' + beg.ToString;
          Top := (fr.Height * i) + 10;
          Tag := 1;
          TFrame4(fr).panel:=Panel1;
          TFrame4(fr).Req_on_frame:= array_of_requests_sup[beg];
          TFrame4(fr).Appdata;
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

procedure TRequest_Sup_Class.reload;
begin

end;

end.
