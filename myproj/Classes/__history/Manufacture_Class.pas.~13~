unit Manufacture_Class;

interface
 uses    System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
 Agents, History_Of_Reliz,   Manufacture,
   Supplier,   Main_Class,    Supplier_Class;
type
  TManufacture_Class  = class(TMain_class)
  public
    class var array_of_manufacture: TObjectList<TManufacture>;
           constructor Create();
           class    procedure load_frames(Panel1: TPanel; page, count_in_bd: integer);
           function from_ado_to_array_manufacture(ado: tADOQuery): TObjectList<TManufacture>;
           procedure reload;
           procedure FiltrChange(edit: TEdit; Filtr: TComboBox; sort: TComboBox);
           procedure create_sort(Sortirovka: TComboBox); override;
           procedure create_filter(Filtr: TComboBox); override;

  end;

implementation
 uses  Frame_manufacture;
{ TManufacture_Class }

constructor TManufacture_Class.Create;
begin
     inherited;
 array_of_manufacture := from_ado_to_array_manufacture(sql_select('*', 'Manufacture','',' order by Id_manufacture ',false));
end;

procedure TManufacture_Class.create_filter(Filtr: TComboBox);
begin


end;

procedure TManufacture_Class.create_sort(Sortirovka: TComboBox);
begin
   Sortirovka.Items.Add(' ↑ По дате создания');
  Sortirovka.Items.Add(' ↓ По дате создания');

end;

procedure TManufacture_Class.FiltrChange(edit: TEdit; Filtr, sort: TComboBox);
begin

end;

function TManufacture_Class.from_ado_to_array_manufacture(
  ado: tADOQuery): TObjectList<TManufacture>;
begin
      var
    manufacture: TManufacture;
    var mc:TMain_Class;
        mc:=TMain_Class.Create;
  var   array_of_manufacture := TObjectList<TManufacture>.Create();

  while not ado.Eof do
  begin
    manufacture := TManufacture.Create();
    manufacture.ID_Manufacture:= ado.FieldByName('Id_manufacture').AsInteger;
    manufacture.Login_Master:= ado.FieldByName('Login_master').AsString;
    manufacture.Id_production:=  ado.FieldByName('Id_production').AsInteger;
    manufacture.Count:=ado.FieldByName('Count').AsInteger;

    manufacture.Id_request_from_agent:=ado.FieldByName('Id_request_from_agent').AsInteger;
    manufacture.Date_Of_Create:=ado.FieldByName('Date_Of_Create').AsDateTime;
    manufacture.Date_Of_Begin:= ado.FieldByName('Date_Of_Begin').AsDateTime;
    manufacture.Date_Of_End:=  ado.FieldByName('Date_Of_End').AsDateTime;




    manufacture.Status:= mc.sql_select('name', 'Status_manufacture' , 'where ID = ' + ado.FieldByName('Status').AsString,'',false).Fields[0].AsString;

    ;
    //manufacture.Company:=mc.sql_select('Title', 'Supplier' , 'where ID = ' + req.ID_Sup.ToString,'',false).Fields[0].AsString; //что бы узнать имя по id


    manufacture.Name_production:= mc.sql_select('Name_', 'Products' , 'where Article = ' +   manufacture.Id_production.ToString ,  '',false).Fields[0].AsString;
    array_of_manufacture.Add(manufacture);
    ado.Next;
  end;
  result := array_of_manufacture;

end;

class procedure TManufacture_Class.load_frames(Panel1: TPanel; page,
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
      while (beg <= en) and (beg < array_of_manufacture.Count) do
      begin
        fr := TFrame_manufact.Create(Panel1);
        var
          discount: integer;

        With fr do
        begin
          Parent := Panel1;
          Name := 'FORM' + beg.ToString;
          Top := (fr.Height * i) + 10;
          Tag := 1;
           TFrame_manufact(fr).panel:=Panel1;
           TFrame_manufact(fr).Man_on_frame:= array_of_manufacture[beg];
            TFrame_manufact(fr).AppData;
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

procedure TManufacture_Class.reload;
begin

end;

end.
