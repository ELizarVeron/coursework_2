unit ChangesRequest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  Vcl.ExtCtrls,Request_Agents_Class,Requests_agent,  Data.Win.ADODB, Main_Class,
  Vcl.Samples.Spin;

type
  TForm15 = class(TForm)
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
   FReq_on_frame: TRequest_agent;
  // FListBox:TListBox;
   arr: array of array[0..3] of string;
   arr_counts: array of integer;
  public
     property Req_on_frame: TRequest_agent read FReq_on_frame write FReq_on_frame;
     procedure init();
     procedure get_array();
     procedure   change_composition_in_db;
     procedure change_composition_in_array;
     procedure  change_status_in_db;
     procedure get_new_cost();
   var  need_reload:boolean;
    var mc:TMain_class;

  end;

var
  Form15: TForm15;

implementation
   procedure TForm15.init;
   begin
      mc:=TMain_class.Create();
      get_array;
      var i:integer;
      var lbl:TLabel;
      var spin_edt:TSpinEdit;
      var bvl:TBevel;


     for I := 0 to  length(arr)-1  do
        begin

          spin_edt:=TSpinEdit.Create(ScrollBox1);
          spin_edt.Parent:=ScrollBox1;
          spin_edt.Width:=70;
          spin_edt.Left:=90;
          spin_edt.MaxValue:= StrToInt(arr[i][1]);
          spin_edt.Text:=arr[i][1];
           spin_edt.Name:='edit' + i.ToString;
           spin_edt.Top:= spin_edt.Height*i + 10*i+5;



           lbl:=TLabel.Create(ScrollBox1);
          lbl.Parent:=ScrollBox1;
          lbl.Caption:=arr[i][0];
           lbl.Name:='label' + i.ToString;
           lbl.Top:= spin_edt.Top;


           bvl:=TBevel.Create(ScrollBox1);
           bvl.Parent:=ScrollBox1;
           bvl.Name:='bevel'+i.ToString;
           bvl.Height:=2;
           bvl.Width:=ScrollBox1.Width;
           bvl.Top:=spin_edt.Height*i + 10*i;


        end;


        end;


   procedure TForm15.change_status_in_db;
   begin

         var s:= ' Status =  ' + QuotedStr('2') + ' ,  DateOfConfirm =  ' + QuotedStr( FormatDateTime('dd.mm.yyyy hh:nn:ss ', Now) )  ;    //сохранятем новый статус и время отсчета
         mc.sql_update( 'Request_from_agent ' , s , ' where ID_request_agent =  ' + FReq_on_frame.ID_Request.ToString);

   end;


   procedure TForm15.Button1Click(Sender: TObject);
begin

         change_composition_in_db;
         change_status_in_db;
         change_composition_in_array;
         Req_On_Frame.Date_Of_Confirm:=   Now;

         SHowMessage( 'Изменения внесены' );
         need_reload:=true;
        Close;


end;

procedure TForm15.get_array();
   begin

       var ado_composition:= mc.sql_select(' * ', ' Composition_of_req_ag  ' , 'where id_request =  ' +  Req_on_frame.ID_Request.ToString , '   ' , false );
      setlength(arr,ado_composition.RecordCount);
       var i:=0;
       while not ado_composition.Eof do
      begin
         var ado_nameprod:= mc.sql_select( ' Name_ ', ' Products ' , 'where Article =  ' +   ado_composition.Fields[1].AsString  , ' ' , false );
         arr[i][0]:=ado_nameprod.Fields[0].AsString;
         arr[i][1]:=ado_composition.Fields[2].AsString; //колич продукта
         arr[i][2]:= ado_composition.Fields[1].AsString;    //артикль продукта
          arr[i][3]:= ado_composition.Fields[3].AsString;    //стоимость продукта в заявке
         i:=i+1;
         ado_composition.Next
      end;


   end;

procedure TForm15.get_new_cost;
var new_cost:integer;
begin
   new_cost:=0;
   for var i  := 0 to length(arr)-1 do
   begin
      new_cost:=  new_cost + StrToInt(arr[i][3]);
   end;
end;
procedure TForm15.change_composition_in_array;
begin

           for var I := 0 to  length(arr)-1  do
           begin

               for var j := 0 to  Req_on_frame.Composition.Count-1 do
               begin
                      if (( Req_on_frame.Composition[j].Articul.ToString)= arr[i][2])
                      then begin
                            var s:TSpinEdit;
                            s:= TScrollBox(ScrollBox1).FindChildControl('edit'+i.ToString)  as TSpinEdit ;    //s это количество новое
                             Req_on_frame.Composition[j].Count:= StrToInt(s.Text);
                      end;

               end;



           end;




                //проблемы с запросом тут были


end;

procedure   TForm15.change_composition_in_db;
     begin




           for var I := 0 to  length(arr)-1  do
           begin
                 var s:TSpinEdit;
                 s:=   TScrollBox(ScrollBox1).FindChildControl('edit'+i.ToString)  as TSpinEdit ;

                 var str:='delete from Composition_of_req_ag where ID_request  = ' + Req_on_frame.ID_Request.ToString +
                 ' and articul_product = ' +  arr[i][2]  ;
                   mc.sql(str);
                  str:= 'insert into Composition_of_req_ag values ( ' +Req_on_frame.ID_Request.ToString+ ',' + arr[i][2] + ' ,' +  s.Text  + ' ,' + arr[i][3]  +')';
                   mc.sql(str);




           end;
                //проблемы с запросом тут были



     end;

{$R *.dfm}

end.
