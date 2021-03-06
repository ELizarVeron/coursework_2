unit Main_Class;

interface

uses System.Generics.Collections, Data.Win.ADODB, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Agents, History_Of_Reliz, Product, Requests_agent,
  Request_supplier, Supplier, Material, Vcl.Imaging.jpeg;

type
  TMain_class = class

  public class var
   const on_page = 5;
    constructor Create();

  var
    ADOCon: TADOConnection;
    array_of_material: TObjectList<TMaterial>;


        function sql2( s: string )
      : TADOQuery;
    function sql_select(select, from, where, order: string; distinct: boolean)
      : TADOQuery;
    procedure sql_update(table, column_value, where :string);
    procedure sql_delete(table, key, value :string);

      procedure sql_insert(table:string ;   values: array of string);
     procedure  sql(s:string);

    procedure create_filter(cbox: TComboBox); virtual;
    procedure create_sort(cbox: TComboBox); virtual;

    procedure load_pages(PanelNav: TPanel; count_in_bd, x: integer);
    function change_pages_l(PanelNav: TPanel ): integer;
    function change_pages_r(PanelNav: TPanel; x: integer): integer;

    procedure load_frames(Panel1: TPanel; page, count_in_bd: integer); virtual;

  private
  end;

implementation

uses Nav_Frame;

constructor TMain_class.Create;
begin
  inherited;
  ADOCon := TADOConnection.Create(nil);
  ADOCon.LoginPrompt := false;
  ADOCon.Provider := 'Microsoft.Jet.OLEDB.4.0';
  ADOCon.ConnectionString :=
  'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\????????\1111.mdb;Persist Security Info=False;';

end;

function TMain_class.sql_select(select, from, where, order: string;
  distinct: boolean): TADOQuery;
begin
  var
  ADO: TADOQuery;
  ADO := TADOQuery.Create(nil);
  var
    str: string;
  if (distinct = true) then
    str := 'select distinct ' + select + ' from ' + from
  else
    str := 'select ' + select + ' from ' + from + ' ';
  if (where <> '') then
  begin
    str := str + where;

  end;

  str := str + order;

  ADO.Connection := ADOCon;
  ADO.Active := false;
  ADO.SQL.Clear;
  ADO.SQL.Add(str);
  ADO.Active := true;

  result := ADO;
  // ADO.Destroy;
end;

 procedure TMain_Class.sql(s:string);
 begin

     var
    ADO: TADOQuery;
    ADO := TADOQuery.Create(nil);

     ADO.Connection := ADOCon;
    ADO.Active := false;
    ADO.SQL.Clear;
    ADO.SQL.Add(s );
    ADO.ExecSQL;



 end;

    function TMain_Class.sql2(s:string):TADOQuery;
 begin
    var
      ADO: TADOQuery;
      ADO := TADOQuery.Create(nil);



      ADO.Connection := ADOCon;
      ADO.Active := false;
      ADO.SQL.Clear;
      ADO.SQL.Add(s);
      ADO.Active := true;

  result := ADO;


 end;

  procedure TMain_Class.sql_update(table, column_value, where :string);
  begin
       var
    ADO: TADOQuery;
    ADO := TADOQuery.Create(nil);
     var
    str: string;
    str:= 'update '+ table+ ' set ' +  column_value+  where;
    ADO.Connection := ADOCon;
    ADO.Active := false;
     ADO.SQL.Clear;
    ADO.SQL.Add(str);
    ADO.ExecSQL;

  end;


   procedure TMain_Class.sql_delete(table, key, value :string);
  begin
       var
    ADO: TADOQuery;
    ADO := TADOQuery.Create(nil);
     var
    str: string;
    str:= 'delete from '+ table+ ' where ' +  key + ' = ' +     value       ;
    ADO.Connection := ADOCon;
    ADO.Active := false;
    ADO.SQL.Clear;
    ADO.SQL.Add(str);
    ADO.ExecSQL;

  end;

  procedure TMain_Class.sql_insert(table:string ; values: array of string);
  begin
       var
    ADO: TADOQuery;
    ADO := TADOQuery.Create(nil);
    var str,str2, v: string;

    var i:integer;
    var temp:double;
    for I := 0 to length(values)-1 do
    begin
        if not( i = length(values)-1)  then
        begin
                 if TryStrToFloat(values[i],temp) then
                  v:=v+ ' '+ temp.ToString + ' , '
                else
                  if ( (values[i]='true') or (values[i]='false')) then
                  v:=v+ ' '+  values[i]  + ' , '
                else
                    v:=v+ '  '+ QuotedStr( values[i]) + ' , ' ;
        end

        else

         begin
                 if TryStrToFloat(values[i],temp) then
                  v:=v+ ' '+ temp.ToString + '   '
                 else
                  if ( (values[i]='true') or (values[i]='false')) then
                  v:=v+ ' '+  values[i]  + '   '
                else
                    v:=v+ '  '+ QuotedStr( values[i]) + '  ' ;
        end



   end;
    str:= 'insert into '+ table+ ' values ( ' +  v + ' ) '  ;
    ADO.Connection := ADOCon;
    ADO.Active := false;
    ADO.SQL.Clear;
    ADO.SQL.Add(str);
    ADO.ExecSQL;

  end;

procedure TMain_Class.create_filter(cbox: TComboBox);
begin

end;

procedure TMain_Class.create_sort(cbox: TComboBox);
begin

end;

procedure TMain_Class.load_pages(PanelNav: TPanel; count_in_bd, x: integer);
begin
  if (count_in_bd < on_page) then // ???? ????????? ?? ?????
  begin
    PanelNav.Visible := false;
  end
  else
  begin
    PanelNav.Visible := true;
    var
    cel, ost: integer;
    cel := count_in_bd div on_page;
    ost := count_in_bd mod on_page;
    var
      Lab: TLabel;
    Lab := TLabel.Create(nil);
    if (cel > 4) then
    begin
      PanelNav.Controls[0].Visible := false;
      PanelNav.Controls[1].Visible := true;
      (PanelNav.Controls[1] As TLabel).Caption := '1';
      (PanelNav.Controls[2] As TLabel).Caption := '2';
      (PanelNav.Controls[3] As TLabel).Caption := '3';
      (PanelNav.Controls[4] As TLabel).Caption := '4';
      PanelNav.Controls[2].Visible := true;
      PanelNav.Controls[3].Visible := true;
      PanelNav.Controls[4].Visible := true;
      PanelNav.Controls[5].Visible := true;
    end
    else // ??? ??? ?????? 4?? ???????
    begin
      if cel = 1 then
      begin
        (PanelNav.Controls[1] As TLabel).Caption := '1';
        PanelNav.Controls[1].Visible := true;
         PanelNav.Controls[2].Visible := false;
         PanelNav.Controls[3].Visible := false;
        PanelNav.Controls[4].Visible := false;
      end;
      if cel = 2 then
      begin
        (PanelNav.Controls[1] As TLabel).Caption := '1';
        PanelNav.Controls[1].Visible := true;
        (PanelNav.Controls[2] As TLabel).Caption := '2';
        PanelNav.Controls[2].Visible := true;
        PanelNav.Controls[3].Visible := false;
        PanelNav.Controls[4].Visible := false;
      end;
      if cel = 3 then
      begin
        (PanelNav.Controls[1] As TLabel).Caption := '1';
        PanelNav.Controls[1].Visible := true;
        (PanelNav.Controls[2] As TLabel).Caption := '2';
        PanelNav.Controls[2].Visible := true;
        (PanelNav.Controls[3] As TLabel).Caption := '3';
        PanelNav.Controls[3].Visible := true;
        PanelNav.Controls[4].Visible := false;
      end;
      if cel = 4 then
         if ost=0 then
         begin
              PanelNav.Controls[0].Visible := false;
              (PanelNav.Controls[1] As TLabel).Caption := '1';
              (PanelNav.Controls[2] As TLabel).Caption := '2';
              (PanelNav.Controls[3] As TLabel).Caption := '3';
              (PanelNav.Controls[4] As TLabel).Caption := '4';
              PanelNav.Controls[1].Visible := true;
              PanelNav.Controls[2].Visible := true;
              PanelNav.Controls[3].Visible := true;
              PanelNav.Controls[4].Visible := true;
              PanelNav.Controls[5].Visible := false;
         end
         else
         begin
               PanelNav.Controls[0].Visible := false;
              (PanelNav.Controls[1] As TLabel).Caption := '1';
              (PanelNav.Controls[2] As TLabel).Caption := '2';
              (PanelNav.Controls[3] As TLabel).Caption := '3';
              (PanelNav.Controls[4] As TLabel).Caption := '4';
              PanelNav.Controls[1].Visible := true;
              PanelNav.Controls[2].Visible := true;
              PanelNav.Controls[3].Visible := true;
              PanelNav.Controls[4].Visible := true;
              PanelNav.Controls[5].Visible := true;
         end;

      PanelNav.Controls[0].Visible := false;
      PanelNav.Controls[5].Visible := false;
      if (ost = 0) then // ???? ????????? ?? ?????
      begin
        var
          i: integer;
        for i := 1 to cel do
          PanelNav.Controls[i].Visible := true;
      end
      else
      begin
        var
          i: integer;
        for i := 1 to cel + 1 do
          PanelNav.Controls[i].Visible := true;
        if cel = 1 then
        begin
          (PanelNav.Controls[2] As TLabel).Caption := '2';
        end;
        if cel = 2 then
        begin
          (PanelNav.Controls[3] As TLabel).Caption := '3';
        end;
        if cel = 3 then
        begin
          (PanelNav.Controls[4] As TLabel).Caption := '4';
        end;
      end;
    end;

  end;

end;

function TMain_Class.change_pages_l(PanelNav: TPanel ): integer;
begin

  PanelNav.Controls[5].Visible := true;
  (PanelNav.Controls[1] As TLabel).Caption :=
    (StrToInt((PanelNav.Controls[1] As TLabel).Caption) - 4).ToString;


  (PanelNav.Controls[2] As TLabel).Caption :=
    (StrToInt((PanelNav.Controls[2] As TLabel).Caption) - 4).ToString;
  (PanelNav.Controls[3] As TLabel).Caption :=
    (StrToInt((PanelNav.Controls[3] As TLabel).Caption) - 4).ToString;
  (PanelNav.Controls[4] As TLabel).Caption :=
    (StrToInt((PanelNav.Controls[4] As TLabel).Caption) - 4).ToString;
  if ((PanelNav.Controls[1] As TLabel).Caption = '1') then
    (PanelNav.Controls[0] As TLabel).Visible := false;
  PanelNav.Controls[2].Visible := true;
  PanelNav.Controls[3].Visible := true;
  PanelNav.Controls[4].Visible := true;
  PanelNav.Controls[5].Visible := true;
  (PanelNav.Controls[1] As TLabel).Font.Style :=
    (PanelNav.Controls[6] as TLabel).Font.Style; // ??? ??? ?????
  (PanelNav.Controls[2] As TLabel).Font.Style :=
    (PanelNav.Controls[6] as TLabel).Font.Style;
  (PanelNav.Controls[3] As TLabel).Font.Style :=
    (PanelNav.Controls[6] as TLabel).Font.Style;
  (PanelNav.Controls[4] As TLabel).Font.Style :=
    (PanelNav.Controls[7] as TLabel).Font.Style;
  // ?????? ???????????? ??????? ?????
  var
  nx := StrToInt((PanelNav.Controls[4] as TLabel).Caption);  //????? ???????? (??????? ??????)????????? ?? ?????? ??????
  result := nx;

end;

function TMain_Class.change_pages_r(PanelNav: TPanel; x: integer): integer; //x ??????? ?? ??????????? ?? ????????

begin
  var
    n := on_page-1;

  var  count_of_str:=x div on_page; //??? ?? ?????? ??? ???????
  if(x>count_of_str*on_page) then count_of_str:=count_of_str+1;

  if (count_of_str > 4) then    //???? ?????????? ?????? ?? ??? ?? ?? ????????     x>5
  begin
    PanelNav.Controls[0].Visible := true;
    PanelNav.Controls[1].Visible := true;
    PanelNav.Controls[2].Visible := true;
    PanelNav.Controls[3].Visible := true;
    PanelNav.Controls[4].Visible := true;
    PanelNav.Controls[5].Visible := true;

  end
  else if (count_of_str = 4) then
  begin
    PanelNav.Controls[0].Visible := true;
    PanelNav.Controls[1].Visible := true;
    PanelNav.Controls[2].Visible := true;
    PanelNav.Controls[3].Visible := true;
    PanelNav.Controls[4].Visible := true;
    PanelNav.Controls[5].Visible := false;

  end

  else if (count_of_str = 3) then
  begin
    PanelNav.Controls[0].Visible := true;
    PanelNav.Controls[1].Visible := true;
    PanelNav.Controls[2].Visible := true;
    PanelNav.Controls[3].Visible := true;
    PanelNav.Controls[4].Visible := false;
    PanelNav.Controls[5].Visible := false;

  end
  else if (count_of_str =  2) then
  begin
    PanelNav.Controls[0].Visible := true;
    PanelNav.Controls[1].Visible := true;
    PanelNav.Controls[2].Visible := true;
    PanelNav.Controls[3].Visible := false;
    PanelNav.Controls[4].Visible := false;
    PanelNav.Controls[5].Visible := false;

  end
  else if (count_of_str = 1) then
  begin
    PanelNav.Controls[0].Visible := true;
    PanelNav.Controls[1].Visible := true;
    PanelNav.Controls[2].Visible := false;
    PanelNav.Controls[3].Visible := false;
    PanelNav.Controls[4].Visible := false;
    PanelNav.Controls[5].Visible := false;

  end;
  (PanelNav.Controls[1] as TLabel).Caption :=
    (StrToInt((PanelNav.Controls[1] as TLabel).Caption) + n).ToString;
  (PanelNav.Controls[2] as TLabel).Caption :=
    (StrToInt((PanelNav.Controls[2] as TLabel).Caption) + n).ToString;
  (PanelNav.Controls[3] as TLabel).Caption :=
    (StrToInt((PanelNav.Controls[3] as TLabel).Caption) + n).ToString;
  (PanelNav.Controls[4] as TLabel).Caption :=
    (StrToInt((PanelNav.Controls[4] as TLabel).Caption) + n).ToString;

  (PanelNav.Controls[1] As TLabel).Font.Style :=
    (PanelNav.Controls[7] as TLabel).Font.Style;
  // ?????? ???????????? ??????? ?????
  (PanelNav.Controls[2] As TLabel).Font.Style :=
    (PanelNav.Controls[6] as TLabel).Font.Style;
  (PanelNav.Controls[3] As TLabel).Font.Style :=
    (PanelNav.Controls[6] as TLabel).Font.Style; // ??? ??? ?????
  (PanelNav.Controls[4] As TLabel).Font.Style :=
    (PanelNav.Controls[6] as TLabel).Font.Style;

  var
  nx := StrToInt((PanelNav.Controls[1] as TLabel).Caption);  //????? ????? ????? ? ????? ??????????
  result := nx;
end;

procedure TMain_Class.load_frames(Panel1: TPanel; page, count_in_bd: integer);
begin

end;

end.
