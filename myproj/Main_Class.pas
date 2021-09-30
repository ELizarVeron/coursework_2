unit Main_Class;

interface
uses System.Generics.Collections,Data.Win.ADODB,System.SysUtils,Vcl.Controls,
Vcl.Forms,  Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,Vcl.ExtCtrls,
TABLE_Agents,TABLE_History_Of_Reliz,TABLE_Products,TABLE_Requests_agent,
TABLE_Request_supplier,TABLE_Suppliers,TABLE_Materials,Vcl.Imaging.jpeg;
type TMain_Class = class

     public
     const on_page=5;
     constructor Create();
      var
      ADOCon: TADOConnection;

         array_of_material :TObjectList<TMaterial>;
     function sql_select(select,from,where:string;distinct:boolean):TADOQuery;


     procedure create_filter(cbox:TComboBox);
     procedure create_sort(cbox:TComboBox);

     procedure load_pages(PanelNav:TPanel;count_in_bd,x:integer);
       function change_pages_l(PanelNav:TPanel;x:integer):integer;
         function change_pages_r( PanelNav:TPanel;x:integer):integer;

     procedure load_frames(Panel1:TPanel;page,count_in_bd:integer ); virtual;

     private
      end;


implementation
      constructor TMain_Class.Create;
      begin
        inherited;
        ADOCon:= TADOConnection.Create(nil);
        ADOCOn.LoginPrompt:=false;
        ADOCOn.Provider:= 'Microsoft.Jet.OLEDB.4.0';
        ADOCOn.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Курсовая\Database2.mdb;Persist Security Info=False;';

      end;

     function TMain_Class.sql_select(select,from,where:string;distinct:boolean):TADOQuery;
      begin
        var ADO :TADOQuery;
        ADO:=TADOQuery.Create(nil);
        var str:string;
        str:=select; //доделай это
        ADO.Connection:=ADOCon;
        ADO.Active:=false;
        ADO.SQL.Clear;
        ADO.SQL.Add(str);
        ADO.Active:=true;

        result:=ADO;
        //ADO.Destroy;
      end;

      procedure TMain_Class.create_filter(cbox:TComboBox);
        begin

        end;
      procedure TMain_Class.create_sort(cbox:TComboBox);
        begin

        end;
      procedure TMain_Class.load_pages(PanelNav:TPanel;count_in_bd,x:integer);
        begin
           if (count_in_bd <on_page) then   //если навигатор не нужен
            begin
              PanelNav.Visible:=false;
            end
            else
            begin
            PanelNav.Visible:=true;
                 var cel,ost:integer;
                     cel:=count_in_bd div on_page;
                     ost:= count_in_bd mod on_page;
                 var Lab:TLabel;
                 Lab:=TLAbel.Create(nil);
                 if (cel>=4) then
                 begin
                        PanelNav.Controls[0].Visible:=false;
                         PanelNav.Controls[1].Visible:=true;
                        (PanelNav.Controls[1] As TLabel).Caption:='1';
                        (PanelNav.Controls[2] As TLabel).Caption:='2';
                        (PanelNav.Controls[3] As TLabel).Caption:='3';
                        (PanelNav.Controls[4] As TLabel).Caption:='4';
                         PanelNav.Controls[2].Visible:=true;
                         PanelNav.Controls[3].Visible:=true;
                         PanelNav.Controls[4].Visible:=true;
                         PanelNav.Controls[5].Visible:=true;
                 end
                 else       //тут уже меньше 4ех старниц
                 begin
                         if cel=1 then
                         begin
                          (PanelNav.Controls[1] As TLabel).Caption:='1';
                          PanelNav.Controls[1].Visible:=true;
                         end;
                          if cel=2 then
                         begin
                         (PanelNav.Controls[1] As TLabel).Caption:='1';
                         PanelNav.Controls[1].Visible:=true;
                           (PanelNav.Controls[2] As TLabel).Caption:='2';
                            PanelNav.Controls[2].Visible:=true;
                            PanelNav.Controls[3].Visible:=false;
                            PanelNav.Controls[4].Visible:=false;
                         end;
                          if cel=3 then
                         begin
                         (PanelNav.Controls[1] As TLabel).Caption:='1';
                           PanelNav.Controls[1].Visible:=true;
                         (PanelNav.Controls[2] As TLabel).Caption:='2';
                          PanelNav.Controls[2].Visible:=true;
                          (PanelNav.Controls[3] As TLabel).Caption:='3';
                           PanelNav.Controls[3].Visible:=true;
                               PanelNav.Controls[4].Visible:=false;
                         end;
                         PanelNav.Controls[0].Visible:=false;
                         PanelNav.Controls[5].Visible:=false;
                     if (ost=0) then   //если стрелочки не нужны
                    begin
                    var i:integer;
                       for I := 1 to cel do
                           PanelNav.Controls[i].Visible:=true;
                    end
                       else
                    begin
                       var i:integer;
                       for I := 1 to cel+1 do
                           PanelNav.Controls[i].Visible:=true;
                       if cel=1 then
                         begin
                         (PanelNav.Controls[2] As TLabel).Caption:='2';
                         end;
                          if cel=2 then
                         begin
                         (PanelNav.Controls[3] As TLabel).Caption:='3';
                         end;
                          if cel=3 then
                         begin
                         (PanelNav.Controls[4] As TLabel).Caption:='4';
                         end;
                    end;
                 end;

                end;


          end;

       function TMain_Class.change_pages_l(PanelNav:TPanel;x:integer):integer;
       begin



                 PanelNav.Controls[5].Visible:=true;
                 (PanelNav.Controls[1] As TLabel).Caption:=(StrToInt((PanelNav.Controls[1] As TLabel).Caption)-on_page+1).ToString ;
                  (PanelNav.Controls[2] As TLabel).Caption:=(StrToInt( (PanelNav.Controls[2] As TLabel).Caption)-on_page+1).ToString ;
                  (PanelNav.Controls[3] As TLabel).Caption:=(StrToInt( (PanelNav.Controls[3] As TLabel).Caption)-on_page+1).ToString ;
                  (PanelNav.Controls[4] As TLabel).Caption:=(StrToInt( (PanelNav.Controls[4] As TLabel).Caption)-on_page+1).ToString ;
                 if  ((PanelNav.Controls[1] As TLabel).Caption='1') then  (PanelNav.Controls[0] As TLabel).Visible:=false;
                 PanelNav.Controls[2].Visible:=true;
                 PanelNav.Controls[3].Visible:=true;
                 PanelNav.Controls[4].Visible:=true;
                 PanelNav.Controls[5].Visible:=true;
                  (PanelNav.Controls[1] As TLabel).Font.Style:=(PanelNav.Controls[6] as TLabel).Font.Style;   //эти без черты
                  (PanelNav.Controls[2] As TLabel).Font.Style:=(PanelNav.Controls[6] as TLabel).Font.Style;
                  (PanelNav.Controls[3] As TLabel).Font.Style:=(PanelNav.Controls[6] as TLabel).Font.Style;
                  (PanelNav.Controls[4] As TLabel).Font.Style:=(PanelNav.Controls[7] as TLabel).Font.Style;  //делаем подчеркнутым крайний права
                  var nx := Strtoint((PanelNav.Controls[4] as TLabel).Caption);
                   Result:=nx;

       end;
         function TMain_Class.change_pages_r(PanelNav:TPanel;x:integer):integer;

          begin
                    var n:= on_page-1;
                    if (x>=n) then
                begin
                 PanelNav.Controls[0].Visible:=true;
                 PanelNav.Controls[1].Visible:=true;
                 PanelNav.Controls[2].Visible:=true;
                 PanelNav.Controls[3].Visible:=true;
                 PanelNav.Controls[4].Visible:=true;
                 PanelNav.Controls[5].Visible:=true;

                end
                else if (x=n-1) then
                     begin
                         PanelNav.Controls[0].Visible:=true;
                           PanelNav.Controls[1].Visible:=true;
                           PanelNav.Controls[2].Visible:=true;
                           PanelNav.Controls[3].Visible:=true;
                           PanelNav.Controls[4].Visible:=false;
                           PanelNav.Controls[5].Visible:=false;

                     end
                else if  (x=n-2)  then
                begin
                 PanelNav.Controls[0].Visible:=true;
                           PanelNav.Controls[1].Visible:=true;
                           PanelNav.Controls[2].Visible:=true;
                           PanelNav.Controls[3].Visible:=false;
                           PanelNav.Controls[4].Visible:=false;
                           PanelNav.Controls[5].Visible:=false;

                end
                 else if  (x=n-3)   then
                begin
                           PanelNav.Controls[0].Visible:=true;
                           PanelNav.Controls[1].Visible:=true;
                           PanelNav.Controls[2].Visible:=false;
                           PanelNav.Controls[3].Visible:=false;
                           PanelNav.Controls[4].Visible:=false;
                           PanelNav.Controls[5].Visible:=false;

                end;
                       (PanelNav.Controls[1] as TLabel).Caption:=(StrToInt((PanelNav.Controls[1] as TLabel).Caption)+n).ToString;
                       (PanelNav.Controls[2] as TLabel).Caption:=(StrToInt((PanelNav.Controls[2] as TLabel).Caption)+n).ToString;
                       (PanelNav.Controls[3] as TLabel).Caption:=(StrToInt((PanelNav.Controls[3] as TLabel).Caption)+n).ToString;
                       (PanelNav.Controls[4] as TLabel).Caption:=(StrToInt((PanelNav.Controls[4] as TLabel).Caption)+n).ToString;

                         (PanelNav.Controls[1] As TLabel).Font.Style:=(PanelNav.Controls[7] as TLabel).Font.Style; //делаем подчеркнутым крайний слева
                  (PanelNav.Controls[2] As TLabel).Font.Style:=(PanelNav.Controls[6] as TLabel).Font.Style;
                  (PanelNav.Controls[3] As TLabel).Font.Style:=(PanelNav.Controls[6] as TLabel).Font.Style;     //эти без черты
                  (PanelNav.Controls[4] As TLabel).Font.Style:=(PanelNav.Controls[6] as TLabel).Font.Style;

                       var nx := Strtoint((PanelNav.Controls[1] as TLabel).Caption);
                   Result:=nx;
          end;


          procedure TMain_Class.load_frames(Panel1:TPanel;page,count_in_bd:integer);
         begin
         var fr:TFrame;
            var i,beg,en:integer;
            var Item: TControl;
            beg:=page* on_page;
            en:=((page+1)*on_page)-1;
            i:=0;
               while Panel1.ControlCount>0 do    //стираем старые фреймы
               begin
                 Item:= Panel1.Controls[0];
                 Item.Free;
               end;

         end;
end.


