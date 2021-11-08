unit Request_Agents_Class;

interface
  uses    System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  TABLE_Agents, TABLE_History_Of_Reliz,   TABLE_Requests_agent,
   TABLE_Suppliers,   Main_Class,     Frame_req_ag , Agent_Class;
  type
     TRequest_Agents_Class = class(TMain_Class)
      public
      var
          array_of_requests_agent: TObjectList<TRequest_Agent>;
          fr: TFrame;
           constructor Create();
           procedure load_frames(Panel1: TPanel; page, count_in_bd: integer); override;
           function from_ado_to_array_req_ag(ado: tADOQuery): TObjectList<TRequest_Agent>;
     end;

implementation
constructor TRequest_Agents_Class.Create();
begin
  inherited;
 array_of_requests_agent := from_ado_to_array_req_ag(sql_select('*', 'Request_from_agent', '',
    '', false));
end;

function TRequest_Agents_Class.from_ado_to_array_req_ag(ado: tADOQuery): TObjectList<TRequest_Agent>;
 begin
      var
    req: TRequest_Agent;
  var
  array_of_requests_agent := TObjectList<TRequest_Agent>.Create;
  while not ado.Eof do
  begin
    req := TRequest_Agent.Create();
    req.ID_Request := ado.Fields[0].AsInteger;
    req.ID_Agent := ado.Fields[1].AsInteger;
    req.Status:=  ado.Fields[2].AsString;
    req.Date_Of_Create:=ado.Fields[3].AsDateTime;
    array_of_requests_agent.Add(req);
    ado.Next;
  end;
  result := array_of_requests_agent;

 end;

  procedure TRequest_Agents_Class.load_frames(Panel1: TPanel; page, count_in_bd: integer);
  begin
        var
        i, beg, en: integer;
      var
        Item: TControl;
      beg := page * on_page;
      en := ((page + 1) * on_page) - 1;
      i := 0;
      while Panel1.ControlCount > 0 do // ������� ������ ������
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
          TFrame9(fr).Label1.Caption :=sql_select('Company', 'Agent' , 'where ID = ' +   array_of_requests_agent[beg].ID_Agent.ToString,'',false).Fields[0].AsString; //��� �� ������ ��� ������ �� id
          TFrame9(fr).Label4.Caption :=  DateTimeToStr(array_of_requests_agent[beg].Date_Of_Create);
          TFrame9(fr).Label6.Caption := array_of_requests_agent[beg].Status;
          TFrame9(fr).Label8.Caption :=  array_of_requests_agent[beg].ID_Request.ToString;
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
