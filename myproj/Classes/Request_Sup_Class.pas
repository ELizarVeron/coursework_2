﻿unit Request_Sup_Class;

interface
 uses    System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
 Agents, History_Of_Reliz,   Request_supplier,
   Supplier,   Main_Class,    Supplier_Class,Material_class;

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
   var
    i: integer;
  var
  ado_help: tADOQuery;
  ado_help := tADOQuery.Create(Filtr);
  Filtr.Items.Add('Все');
  ado_help := sql_select(' Status ', ' Request_for_supplier ', '', '', true);
  while not ado_help.Eof do
  begin
    Filtr.Items.Add(ado_help.FieldByName('Status').AsString);
    ado_help.Next
  end;


end;

procedure TRequest_Sup_Class.create_sort(Sortirovka: TComboBox);
begin
    Sortirovka.Items.Add(' ↑ По дате создания');
  Sortirovka.Items.Add(' ↓ По дате создания');

end;

procedure TRequest_Sup_Class.FiltrChange(edit: TEdit; Filtr, sort: TComboBox);
begin

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
    req.Status:=  ado.Fields[2].AsString;
    req.Date_Of_Create:=ado.Fields[3].AsDateTime;
    req.Count:=ado.FieldByName('Count').AsInteger;



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
          TFrame4(fr).Label1.Caption :=array_of_requests_sup[beg].Company;
          TFrame4(fr).Label4.Caption :=  DateTimeToStr(array_of_requests_sup[beg].Date_Of_Create);
          TFrame4(fr).Label6.Caption := array_of_requests_sup[beg].Status;
          TFrame4(fr).Label8.Caption :=  array_of_requests_sup[beg].ID_Request.ToString;
           TFrame4(fr).panel:=Panel1;
          TFrame4(fr).Req_on_frame:= array_of_requests_sup[beg];
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
