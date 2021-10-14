unit BD_Manager;

interface
uses                       //потом сотри лишнее
 System.Generics.Collections,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Frame_agents, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Fr_ag, BD_class, TABLE_Agents,DateUtils;

  type TFor_Manager = class (Tdata_from_bd)
  public
     constructor Create ( );
     procedure NewDataSet(SQL:String); override;
     procedure InsertDiscount(id:integer;disqount:string);
     class var Records : TObjectList<TAgent>;  //тут должн ыбыть все записи из БД!!!!!!!нн зависсимо от фильтрации
  protected
  private
  end;

  var For_Manager: TFor_Manager;

implementation
 constructor TFor_Manager.Create;
     begin
       Records:=TObjectList<TAgent>.Create;
       inherited;
     end;

 procedure TFor_Manager.NewDataSet(SQL:String);
  begin
         ADOQuery1.SQL.Add(SQL);
         ADOQuery1.Active:=true;
           ADOQuery2.SQL.Clear;
         var agent: TAgent;
          var   str_id:string;
          var x:integer;
     while not ADOQuery1.Eof do
     begin
            agent:= TAgent.Create();

            agent.ID_:= ADOQuery1.Fields[0].AsInteger;
            agent.Name:= ADOQuery1.Fields[1].AsString;
            agent.Type_:= ADOQuery1.Fields[2].AsString;
            agent.Tel:= ADOQuery1.Fields[7].AsInteger;

            ADOQuery2.Active:=False;
            ADOQuery2.SQL.Clear;  //2ой запрос для истории продаж
            ADOQuery2.SQL.Add('Select * from History_of_reliz where ID_Agent = ' + agent.ID_.ToString );
            ADOQuery2.Active:=true;
              while not ADOQuery2.Eof do
              begin
                  x:=DaysBetween(Date,ADOQuery2.Fields[2].AsDateTime);
                  if(x<366) then agent.Count_s_year:= agent.Count_s_year+ADOQuery2.Fields[3].AsInteger;
                  ADOQuery3.SQL.Clear;
                  ADOQuery3.SQL.Add('Select * From Products where Article= '+ ADOquery2.Fields[1].AsString);
                  ADOQuery3.Active:=true;
                  agent.SUMMA:=ADOQuery2.Fields[3].AsInteger * ADOQuery3.Fields[1].AsInteger;
                  ADOQuery2.Next;
              end;
             agent.Discount:= agent.get_sale(agent.SUMMA);
             Records.Add(agent);
      ADOQuery1.Next;
     end;


  end;
  procedure TFor_Manager.InsertDiscount(id:integer;disqount:string);
  begin
         ADOQuery1.SQL.Clear;
         ADOQuery1.SQL.Add('UPDATE AGENT SET DISCOUNT ='
          +disqount+' where ID = '+id.ToString);
         ADOQuery1.ExecSQL;
  end;
end.
