unit Request_Info;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.ExtCtrls, Vcl.StdCtrls,Request_Agents_Class,TABLE_Requests_agent,  Data.Win.ADODB, Main_Class,ChangesRequest;

type
  TForm11 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    Label11: TLabel;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);


  private
    { Private declarations }
  public
   var Req_on_frame:  TRequest_agent;
   var need_delete:boolean;
    procedure Do_List;
     procedure Waiting;
     procedure create_timer;
     procedure Init;
     procedure  ChangeToInWork;
      var panel:TPanel;
       var EndTime:integer;
        var max_time:integer;
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
begin
       var ECHR:TForm15;

       ECHR:=TForm15.Create(self);
       ECHR.Req_on_frame:=Req_on_frame;

       ECHR.init;
       ECHR.ShowModal;
       if( ECHR.need_reload ) then
       begin
          Do_List;
          Waiting;
       end;
       label6.Caption:= '� �������� ������';

       TRequest_Agents_Class.load_frames(panel,0,TRequest_Agents_Class.array_of_requests_agent.Count);
       Timer1.Enabled:=true;
       EndTime:= max_time;

end;

 procedure TForm11.create_timer;
 begin




 end;

procedure TForm11.Button2Click(Sender: TObject); //�������� ������
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
      ShowMessage('������ ������� �������');
    Close;

end;
procedure TForm11.CheckBox1Click(Sender: TObject);
begin

        label11.Visible:=false;
        Timer1.Enabled := False;
        var mc:=TMain_class.Create();
        mc.sql_update( 'Request_from_agent ' , ' Prepayment =  TRUE , Status = '+ QuotedStr('� ������')  , ' where ID_request_agent =  ' +  Req_on_frame.ID_Request.ToString);            //

       for var i := 0 to   TRequest_Agents_Class.array_of_requests_agent.Count-1 do
        begin
           if TRequest_Agents_Class.array_of_requests_agent[i].ID_Request = Req_on_frame.ID_Request  then
           TRequest_Agents_Class.array_of_requests_agent[i].Status:='� ������';
           TRequest_Agents_Class.array_of_requests_agent[i].Premayment:=true;


        end;
         ChangeToInWork;
         label10.Caption:= '��������������� ����� �� ��������� ������������ ';
         label11.Visible:=true;

           Timer1.Enabled:=true;
           EndTime:= 50;

        ShowMessage('�����');




end;

procedure TForm11.ChangeToInWork;  //��� �� ����� ���� ���� ��� ��� ������� ���������    //��� �������� ���� �� ����� ������ � ��� ���� �� ������
begin
     var mc:=TMain_class.Create();
     var ado:=mc.sql_select( ' * ' , ' Com ' , ' where IDR =  ' +  Req_on_frame.ID_Request.ToString , '' , false ); //������ ������
     var ado2,ado_instock:TADOQuery;
      max_time:=0;
     var need_job:=false;
     while  not ado.Eof do
     begin

       ado_instock:= mc.sql_select( ' In_stock ' , ' Products ' , ' where Article =  ' +  ado.Fields[1].AsString , '' , false );


       if  ( ado_instock.Fields[0].AsInteger < ado.Fields[2].AsInteger) then  need_job:=true;

       ado2:= mc.sql_select( ' Time ' , ' Products ' , ' where Article =  ' +  ado.Fields[0].AsString , '' , false );
       if ( ado2.Fields[0].AsInteger > max_time ) then  max_time:=ado2.Fields[0].AsInteger;
       ado.Next;
     end;

     if(need_job = false ) then
     showmessage('������ �������� ��� ����')
     else
      showmessage('���� �������');

end;


procedure TForm11.Do_List;
begin
       ListBox1.Clear;
   var mc:=TMain_class.Create();
   var  mc2:=TMain_class.Create();

   var  ado_composition:= mc.sql_select(' * ', ' Com  ' , 'where idr =  ' +  Req_on_frame.ID_Request.ToString , '   ' , false );
     if ( ado_composition.IsEmpty) then
     begin
          ListBox1.Visible:=false;
          label9.Caption:='��� ���� ��� ������ ���...';

     end

     else
     begin
           while not ado_composition.Eof do
      begin
        ListBox1.Visible:=true;
         var ado_nameprod:= mc2.sql_select( ' Name_ ', ' Products ' , 'where Article =  ' +   ado_composition.Fields[1].AsString  , ' ' , false );
         ListBox1.Items.Add( ado_nameprod.Fields[0].AsString + '   '  + ado_composition.Fields[2].AsString + '��' );
         ado_composition.Next
      end;


     end;



end;

procedure TForm11.Timer1Timer(Sender: TObject);
var
  H, M, S, D: Integer;
begin
  EndTime := EndTime - 1; // �������� �� �������
  // ��� ����� �� �����
 S := EndTime mod 60;
 M := EndTime div 60 mod 60;
 H := EndTime mod 650 div 24 ;
 D := EndTime div 1728;
 label11.Visible:=true;
  Label11.Caption := IntToStr (D)+ '   '+ IntToStr (H ) + ':' + IntToStr (M ) + ':' + IntToStr (S );
  // ���� ����� �����������, �� ������������� ������ � ���������� ���������.
  if EndTime = 0 then
  begin
    Timer1.Enabled := False;
    ShowMessage('����� �������');
  end;

end;

procedure TForm11.Waiting;
begin

   label10.Visible:=false;
   Button1.Enabled:=false;
end;


procedure TForm11.Init;
begin

     Label2.Caption:= DateToStr( Req_on_frame.Date_Of_Create);
     Label4.Caption:=Req_on_frame.Company;
    Label6.Caption:=Req_on_frame.Status;
      if Req_on_frame.Status= '� �������� ������' then
      begin
            Label10.Caption:='����� �� ������: ';
            Button1.Enabled:=false;



      end;


      if( Req_on_frame.Premayment )  then
      Label8.Caption:= '��'
      else  Label8.Caption:= '���'  ;
      Do_List;



end;

end.
