unit Request_Info;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.ExtCtrls, Vcl.StdCtrls,DateUtils , Request_Agents_Class,Requests_agent,  Data.Win.ADODB, Main_Class,ChangesRequest ,Product_Class, Agent_Class;

type
  TForm11 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label_Status: TLabel;
    Label4: TLabel;
    Label_Red: TLabel;
    Button_Changes: TButton;
    Button_Delete: TButton;
    Timer1: TTimer;
    Label_Time: TLabel;
    CheckBox1: TCheckBox;
    Label_ForTimer: TLabel;
    Button_Delivery: TButton;
    Label_SummaPred: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    pr: TLabel;
    procedure Button_DeleteClick(Sender: TObject);
    procedure Button_ChangesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);




  private
  var timer_for_prepayment :bool;
  public
  constructor Create(AOwner: TComponent); override;

   var Req_on_frame:  TRequest_agent;
   var need_delete:boolean;
    procedure Do_List;
     procedure Cancel;
     procedure create_timer;
     procedure Init;
     procedure NextStepAfterPay;
     function  GetTimeToInWork: integer;
     procedure Craete_Manufacture;

      var panel:TPanel;
       var EndTime:integer;
        var max_time:integer;


  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

procedure TForm11.Button_ChangesClick(Sender: TObject);  //?????? ????????? ?? ??????
begin
       var ChangeReqWindow:TForm15;
       ChangeReqWindow:=TForm15.Create(self);
       ChangeReqWindow.Req_on_frame:=Req_on_frame;
       ChangeReqWindow.init;
       ChangeReqWindow.ShowModal;
       if( ChangeReqWindow.need_reload ) then
       begin
          Do_List;
          label_Red.Visible:=false;
          Button_Delete.Enabled:=false;
          Button_Changes.Enabled:=false;
       end;



       Req_on_frame.Status:= '2';
       init;

end;

 procedure TForm11.create_timer;
 begin




 end;

procedure TForm11.Button_DeleteClick(Sender: TObject); //???????? ??????
begin
   var mc:TMain_class;
   mc:=TMain_Class.Create;
   mc.sql_delete(  '  Request_from_agent ' , ' ID_request_agent ' , Req_on_frame.ID_Request.ToString) ;
   var i:integer;
   for I := 0 to  TRequest_Agents_Class.array_of_requests_agent.Count-1 do   begin
       if( TRequest_Agents_Class.array_of_requests_agent[i].ID_Request=Req_on_frame.ID_Request)
       then
       begin
       TRequest_Agents_Class.array_of_requests_agent.Delete(i);
       exit;
       end;

   end;
    need_delete:=true;
    ShowMessage('?????? ??????? ???????');
    Close;

end;
procedure TForm11.CheckBox1Click(Sender: TObject);   ///?????????? !!!!!!!!!
begin


         Timer1.Enabled := False;
         Req_on_frame.Premayment:=true;
         NextStepAfterPay;
         Craete_Manufacture;               ///???????? ?????? ???????
         init;

end;


procedure TForm11.Craete_Manufacture;
  var arr: array[0..8] of string;
  var i,j,id,s:integer;
begin
       var mc:=TMain_class.Create();
       var ado:TAdoquery;
       ado:=mc.sql_select('Id_manufacture','Manufacture','',' order by Id_manufacture   desc ',false);
        var id_manufacture_next := ado.Fields[0].AsInteger;

       for i:=0 to Req_on_frame.Composition.Count-1 do
       begin
           id_manufacture_next:=id_manufacture_next+1;
           arr[0]:=(id_manufacture_next).ToString;
           arr[1]:= '-'  ;
           arr[2]:=Req_on_frame.Composition[i].Articul.ToString ;

           id:=Req_on_frame.Composition[i].Articul;
           for j := 0 to TProduct_Class.array_of_products.Count-1   do
           begin
            if id = TProduct_Class.array_of_products[j].Article then
            s:= TProduct_Class.array_of_products[j].In_stock;


           end;


           arr[3]:=(Req_on_frame.Composition[i].Count -s). ToString;
           arr[4]:=Req_on_frame.ID_Request.ToString;
           arr[5]:=Date.Now.ToString;
           arr[6]:=FormatDateTime('dd.mm.yyyy hh:nn:ss ', EncodeDateTime(1999, 2, 9, 1, 2, 3,4));
           arr[7]:=FormatDateTime('dd.mm.yyyy hh:nn:ss ', EncodeDateTime(1999, 2, 9, 1, 2, 3,4));
           arr[8]:='1';

           mc.sql_insert('Manufacture',arr );

       end;

       ShowMessage('?????? ?? ???????????? ??????? ???????!');


end;

constructor TForm11.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TForm11.NextStepAfterPay;    //??? ????? ???????
begin

        var mc:=TMain_class.Create();
        var time:= GetTimeToInWork;
        if time>0 then
        begin
             var s:=   ' Prepayment =  TRUE , Status = '+'3' + ' , DateOfBegin = ' + QuotedStr( FormatDateTime('dd.mm.yyyy hh:nn:ss ', Now)) ;
             mc.sql_update( 'Request_from_agent ' ,  s , ' where ID_request_agent =  ' +  Req_on_frame.ID_Request.ToString);
             Req_on_frame.Status:= '3';

        end
        else
        begin
             var s:=   ' Prepayment =  TRUE , Status = '+  '6' + ' , DateOfBegin = ' + QuotedStr( FormatDateTime('dd.mm.yyyy hh:nn:ss ', Now)) ;
             mc.sql_update( 'Request_from_agent ' ,  s , ' where ID_request_agent =  ' +  Req_on_frame.ID_Request.ToString);           //
             Req_on_frame.Status:='? ???????? ???????????';

        end;

end;

procedure TForm11.Init;
var
j:integer;
begin

     Label2.Caption:= DateTimeToStr( Req_on_frame.Date_Of_Create);
     Label4.Caption:=Req_on_frame.Company;
     Label_Status.Caption:=Req_on_frame.Status;
     Label13.Caption:=Req_on_frame.Cost.ToString;

     for j := 0 to Agent_class.TAgent_Class.array_of_agents.Count-1 do
       begin
       if Agent_class.TAgent_Class.array_of_agents[j].ID_ =Req_on_frame.ID_Agent  then

         //disc:=   Agent_class.TAgent_Class.array_of_agents[j].Discount;



       end;


     Label_SummaPred.Caption:= Label_SummaPred.Caption +  (   (Req_on_frame.Cost div 10) ).ToString;
     if Req_on_frame.Status= '???????'  then
      begin
            Label_Red.Caption:='?????????? ?????? ?????? ? ???????';
            Label_Status.Caption:='???????';
            Button_Changes.Enabled:=true;
            Button_Delete.Visible:=true;
            CheckBox1.Visible:=false;


      end

       else  if Req_on_frame.Status= '? ???????? ??????' then
      begin
            Label_Status.Caption:='? ???????? ??????';
            Label_Red.Visible:=false;
            Button_Changes.Visible:=false;
            Button_Delete.Visible:=false;
            CheckBox1.Visible:=true;
            //?????????????? ???????
            timer_for_prepayment:=true;
            Timer1.Enabled:=true;
            EndTime:=  SecondsBetween( Now, IncHour( Req_on_frame.Date_Of_Confirm , 72 )  );  //??????? ????? ?????? ? (???? ????????+72????)
            Label_Time.Visible:=true;

      end
       else if Req_on_frame.Status = '? ?????????' then
            begin
                   Label_Red.Visible:=false;
                   Label_Status.Caption:='? ????????? ? ???????';
                   Button_Changes.Visible:=false;
                   Button_Delete.Visible:=false;
                   CheckBox1.Visible:=false;
                  Label_Time.Visible:=false;
              Label_ForTimer.Visible:=false;
              Pr.Visible:=true;

            end
      else if Req_on_frame.Status= '? ??????'  then
      begin
            Label_Status.Caption:='? ??????';
            Label_Red.Visible:=false;
            Button_Changes.Visible:=false;
            Button_Delete.Visible:=false;
            CheckBox1.Visible:=false;
             Label_Time.Visible:=false;
              Label_ForTimer.Visible:=false;
             Pr.Visible:=true;

            timer_for_prepayment:=false;
            Timer1.Enabled:=true;
            EndTime:=  SecondsBetween( Now, IncHour( Req_on_frame. Date_Of_Begin , GetTimeToInWork )  );

            Label_Time.Visible:=true;
            Label_Time.Caption:='????? ?????? ?????: ';
      end

      else if Req_on_frame.Status= '? ???????? ???????????'  then
      begin
            Label_Status.Caption:='??????? ???????????';
            Label_Red.Visible:=false;
            Button_Changes.Visible:=false;
            Button_Delete.Visible:=false;
            Button_Delivery.Visible:=true;
            CheckBox1.Visible:=false;
              Label_Time.Visible:=false;
              Label_ForTimer.Visible:=false;
      end

      else if Req_on_frame.Status= '?????????'  then
      begin
            Label_Status.Caption:='?????????';
            Label_Red.Visible:=false;
            Button_Changes.Visible:=false;
            Button_Delete.Visible:=false;
            CheckBox1.Visible:=false;
            Label_Time.Visible:=false;
            Label_ForTimer.Visible:=false;

      end
        else if Req_on_frame.Status= '??????'  then
      begin
            Label_Status.Caption:='??????';
            Label_Red.Visible:=false;
            Button_Changes.Visible:=false;
            Button_Delete.Visible:=false;
            CheckBox1.Visible:=false;
            Label_Time.Visible:=false;
            Label_ForTimer.Visible:=false;

      end
       else
      begin
            Label_Status.Caption:='ERROR';
            Label_Red.Visible:=false;
            Button_Changes.Visible:=false;
            Button_Delete.Visible:=false;
            CheckBox1.Visible:=false;
            Label_Time.Visible:=false;
            Label_ForTimer.Visible:=false;

      end;

      if( Req_on_frame.Premayment )  then
      Pr.Visible:=true
      else   Pr.Visible:=false;
      Do_List;



end;



function TForm11.GetTimeToInWork: integer;  //??? ?? ????? ???? ???? ??? ??? ??????? ?????????    //??? ???????? ???? ?? ????? ?????? ? ??? ???? ?? ??????
begin
     var mc:=TMain_class.Create();
     var ado:=mc.sql_select( ' * ' , ' Composition_of_req_ag ' , ' where ID_request =  ' +  Req_on_frame.ID_Request.ToString , '' , false ); //?????? ??????
     var ado2,ado_instock:TADOQuery;
      max_time:=0;
     var need_job:=false;
     while  not ado.Eof do
     begin

       ado_instock:= mc.sql_select( ' In_stock ' , ' Products ' , ' where Article =  ' +  ado.Fields[1].AsString , '' , false );


       if  ( ado_instock.Fields[0].AsInteger < ado.Fields[2].AsInteger) then  need_job:=true;

       ado2:= mc.sql_select( ' Time_ ' , ' Products ' , ' where Article =  ' +  ado.Fields[1].AsString , '' , false );
       if ( ado2.Fields[0].AsInteger > max_time ) then  max_time:=ado2.Fields[0].AsInteger;
       ado.Next;
     end;

     if(need_job = false ) then
     begin

         result:=0;
     end
     else
     begin
            //showmessage('???? ???????');
            result:=max_time;
     end;




end;


procedure TForm11.Do_List;
begin
       ListBox1.Clear;
   var mc:=TMain_class.Create();
   var  mc2:=TMain_class.Create();
   var  ado_composition:= mc.sql_select(' * ', ' Composition_of_req_ag  ' , 'where id_request =  ' +  Req_on_frame.ID_Request.ToString , '   ' , false );
     if ( ado_composition.IsEmpty) then
     begin
          ListBox1.Visible:=false;
         // label9.Caption:='??? ???? ??? ?????? ???...';

     end

     else
     begin
           while not ado_composition.Eof do
      begin
        ListBox1.Visible:=true;
         var ado_nameprod:= mc2.sql_select( ' Name_ ', ' Products ' , 'where Article =  ' +   ado_composition.Fields[1].AsString  , ' ' , false );
         ListBox1.Items.Add( ado_nameprod.Fields[0].AsString + '   '  + ado_composition.Fields[2].AsString + '??' );
         ado_composition.Next
      end;


     end;



end;



procedure TForm11.Timer1Timer(Sender: TObject);
var
  H, M, S, D: Integer;
begin
  EndTime := EndTime - 1; // ???????? ?? ???????    ??? ???? ? ????????!!
  // ??? ????? ?? ?????
  D:=  EndTime div 86400; //??? ????? ???
  var ost:= EndTime mod 86400 ;
  H:= ost div 3600;   //????? ????
  ost:= ost mod 3600;
  M:=  ost div 60; //????? ??????
  S:=ost mod 60;

  Label_ForTimer.Visible:=true;
  Label_ForTimer.Caption :=  '????:'+ IntToStr (D)+ ' ?????: '+ IntToStr (H ) + ' ?????: ' + IntToStr (M ) + ' ??????:' + IntToStr (S );
  // ???? ????? ???????????, ?? ????????????? ?????? ? ?????????? ?????????.
  if EndTime = 0 then
  begin
    Timer1.Enabled := False;

         if timer_for_prepayment then             //???? ?????? ??? ?????????? ? ???? ??? ????????? ????????????
           begin
               ShowMessage('????? ???????');
               Cancel;

           end
           else
           begin
               ShowMessage('????? ???????');
                //????? ??? ????????? ??????? ??????


           end;

  end;

end;


procedure TForm11.Cancel; //
begin
        var mc:=TMain_class.Create();
        var s:=   '  Status = '+ QuotedStr('????????');
             mc.sql_update( 'Request_from_agent ' ,  s , ' where ID_request_agent =  ' +  Req_on_frame.ID_Request.ToString);           //
             Req_on_frame.Status:= '????????';


end;

 end.
