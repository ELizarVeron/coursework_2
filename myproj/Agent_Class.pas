unit Agent_Class;

interface
 uses System.Generics.Collections,Data.Win.ADODB,System.SysUtils,Vcl.Controls,
Vcl.Forms,  Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,Vcl.ExtCtrls,
TABLE_Agents,TABLE_History_Of_Reliz,TABLE_Products,TABLE_Requests_agent,
TABLE_Request_supplier,TABLE_Suppliers,TABLE_Materials,Main_Class,Frame_agents;
type TAgent_Class = class (TMain_Class)
  public
  var array_of_agents :TObjectList<TAgent>;
      fr:TFrame;
   constructor Create();
  procedure load_frames(Panel1:TPanel;page,count_in_bd:integer); override;
  function from_ado_to_array(ado:tADOQuery):TObjectList<TAgent>;
  end;
 implementation
   constructor TAgent_Class.Create();
   begin
     inherited;
     array_of_agents:=from_ado_to_array( sql_select('select * from agent','','',true));
   end;


    function TAgent_Class.from_ado_to_array(ado:tADOQuery):TObjectList<TAgent>;
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
       while Panel1.ControlCount>0 do    //סעטנאול סעאנûו פנוילû
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
              Top:=100*i;
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
