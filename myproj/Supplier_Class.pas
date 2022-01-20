﻿unit Supplier_Class;

interface

uses System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  TABLE_Agents, TABLE_History_Of_Reliz, TABLE_Products, TABLE_Requests_agent,
  TABLE_Request_supplier, TABLE_Suppliers, TABLE_Materials, Main_Class,
  Frame_sups, Frame_agents;

type
  TSupplier_Class = class(TMain_Class)
  public
  var
    array_of_suppliers: TObjectList<TSupplier>;
    fr: TFrame;
    constructor Create();
    procedure load_frames(Panel1: TPanel; page, count_in_bd: integer); override;
    function from_ado_to_array_suppliers(ado: tADOQuery): TObjectList<TSupplier>;
         procedure create_sort(Sortirovka: TComboBox); override;
            procedure create_filter(Filtr: TComboBox); override;
             procedure FiltrChange(edit: TEdit; Filtr: TComboBox; sort: TComboBox);
  end;

implementation

constructor TSupplier_Class.Create();
begin
  inherited;
  array_of_suppliers := from_ado_to_array_suppliers(sql_select('*', 'supplier', '',
    '', false));
end;

function TSupplier_Class.from_ado_to_array_suppliers(ado: tADOQuery)
  : TObjectList<TSupplier>;
begin
  var
    sup: TSupplier;
  var
  array_of_suppliers := TObjectList<TSupplier>.Create;
  while not ado.Eof do
  begin
    sup := TSupplier.Create();
    sup.ID := ado.Fields[0].AsInteger;
    sup.Title := ado.Fields[1].AsString;
    array_of_suppliers.Add(sup);
    ado.Next;
  end;
  result := array_of_suppliers;
end;


procedure TSupplier_Class.FiltrChange(edit: TEdit; Filtr: TComboBox;
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
  from := ' supplier ';

  item := Filtr.Items[Filtr.ItemIndex]; //
  if (item = 'Все') or (Filtr.ItemIndex < 0) // если все или ничего
  then
  begin
    if (edit.Text = '') then
      where := ' '
    else
      where := 'where Title like ' + #39 + '%' + edit.Text + '%' + #39;

  end

  else // если все таки что то ввели в фильтр
  begin
    if (edit.Text = '') then
      where := '  where Type = ' + #39 + item + #39
    else
      where := ' where Type = ' + #39 + item + #39 + ' and  Title like ' +
        #39 + '%' + edit.Text + '%' + #39;
  end;

  order := ' order by ';
  case sort.ItemIndex of
    0:
      order := order + 'title asc';
    1:
      order := order + 'title desc';
    2:
      order := order + 'rate asc';
    3:
      order := order + 'rate desc';

  end;
  if sort.ItemIndex < 0 then
    order := '';

  array_of_suppliers := from_ado_to_array_suppliers(sql_select(' * ', from, where,
    order, false));


end;

procedure TSupplier_Class.create_sort(Sortirovka: TComboBox);
begin
  Sortirovka.Items.Add(' ↑ По наименованию ');
  Sortirovka.Items.Add(' ↓ По наименованию ');
  Sortirovka.Items.Add(' ↑ По рейтингу');
  Sortirovka.Items.Add(' ↓ По рейтингу');


end;

procedure TSupplier_Class.create_filter(Filtr: TComboBox);
begin
  var
    i: integer;
  var
    ado_help: tADOQuery;
  ado_help := tADOQuery.Create(Filtr);
  Filtr.Items.Add('Все');
  ado_help := sql_select(' Type ', ' Supplier ', '', '', true);
  // ado_help.SQL.Add('Select Distinct Type_ from Agent') ;
  while not ado_help.Eof do
  begin
    Filtr.Items.Add(ado_help.FieldByName('Type').AsString);
    ado_help.Next
  end;

end;


procedure TSupplier_Class.load_frames(Panel1: TPanel;     page, count_in_bd: integer);
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
  while (beg <= en) and (beg < array_of_suppliers.Count) do
  begin
    fr := TFrame5.Create(Panel1);
    var
      discount: integer;
    With fr do
    begin
      Parent := Panel1;
      Name := 'FORM' + beg.ToString;
      Top := (fr.Height * i) + 10;
      Tag := 1;
      TFrame5(fr).Label2.Caption := array_of_suppliers[beg].Title;
      // data_.InsertDiscount(beg,discount.ToString);

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
