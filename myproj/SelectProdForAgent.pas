unit SelectProdForAgent;

interface
uses
  ComObj,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Data.DB,
  Data.Win.ADODB, Vcl.DBGrids, Main_Class , Agents, Product_Class, DateUtils , Request_Agents_Class;

type
  TForm18 = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Edit1: TEdit;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure  AppInfoInVList();
    procedure save_in_doc();
    function save_request_in_db(arr:array of string;agent_id:integer;new:boolean):integer;
    procedure save_composition_in_db(arr2:array  of string;agent_id:integer);
    procedure Init;
  private
    var arr: array[0..8] of string;
    var arr2: array[0..2] of string;
  public
    { Public declarations }

     var agent_id:integer;
     var agent_name:string;
     var in_list: array of boolean;
     var counts: array of integer;      //�������� ��������
     var v_list: TList<TList<string> >;   //0 ���, 1 - � ������ � �������, 2- � ������ ��� �����

     var temp_arr: TList<string>;

    var   wdApp, wdDoc, wdRng, wdTable : Variant;
      j, Res : Integer;
    D : TDateTime;
    Sd : TSaveDialog;
       const
  wdAlignParagraphCenter = 1;
  wdAlignParagraphLeft = 0;
  wdAlignParagraphRight = 2;
  wdLineStyleSingle = 1;
  end;

var
  Form18: TForm18;

implementation


procedure TForm18.Init;
begin
       setlength(counts,TProduct_class.array_of_products.Count);

          setlength(in_list,TProduct_class.array_of_products.Count);
          temp_arr:=TList<string>.create;
          v_list:=TList<TList<string>>.Create;
            var  i:integer;
          for i:=0 to TProduct_class.array_of_products.Count-1 do
          begin

             ComboBox1.Items.Add( TProduct_class.array_of_products[i].Name_ );
             counts[i]:= TProduct_class.array_of_products[i].In_stock;

          end;
end;

{$R *.dfm}
function CopyList(list:TList<string> ): TList<string>;
begin
     var  new: TList<string>;
        new:= TList<string>.create;
      var i:integer;
      for i := 0 to list.Count-1 do
        begin
          new.Add(list[i]);
        end;
        result:= new;

end;


procedure TForm18.Button1Click(Sender: TObject);      //���������� � ������
begin

      var str:string;
      var h,n:integer;
      h:=  StrToInt(Label3.Caption);
      n:=   StrToInt(Edit1.Text);


      if(in_list[ComboBox1.ItemIndex]=false) then   //���� ����� �������� ��� � ���� �����
      begin
               if h>= n then   // ����  ����� ������ ��� ����
          begin
                  str:= ComboBox1.Items[ComboBox1.ItemIndex]+ '   ' + Edit1.Text + ' �� ' ;
                  Label3.Caption:=  ( h - n).ToString;   //�������
                 // temp_arr.Clear;
                    temp_arr:=TList<string>.create;
                  temp_arr.Add(ComboBox1.Items[ComboBox1.ItemIndex]);         //0
                  temp_arr.Add((n).ToString);                                    //1
                  temp_arr.Add('0');                                             //2


                   var x:integer;
                   var s:string;
                                             for x:= 0 to  temp_arr.Count-1 do
                  //���� ����� �� ������ ���������� � ���� �� �������.
                                                 begin

                                                  s:= s+temp_arr[x] + '  '  ;
                                                 end;



                  v_list.Add(CopyList(temp_arr));
                  in_list[ComboBox1.ItemIndex]:=true;
                  counts[ComboBox1.ItemIndex]:=h-n;
          end
         else     //���� �� �������
          begin

                str:= ComboBox1.Items[ComboBox1.ItemIndex]+'   ' +
                h.ToString + ' �� + ' + (n-h).ToString + ' �� ��� ����� ' ;
                Label3.Caption:=  '0';

                   temp_arr:=TList<string>.create;
                  temp_arr.Add(ComboBox1.Items[ComboBox1.ItemIndex]);         //0  ��������
                  temp_arr.Add(h.ToString);                                    //1
                  temp_arr.Add((n-h).ToString);                                             //2
                           //temp_arr.Add(h.ToString); //����� � �������                 //3





                  var x:integer;
                    var s:string;
                for x:= 0 to  temp_arr.Count-1 do
                 begin

                s:= s+temp_arr[x] + '  '  ;
               end;



                v_list.Add(CopyList(temp_arr));
                 in_list[ComboBox1.ItemIndex]:=true;
                 counts[ComboBox1.ItemIndex]:=0;
          end;
                ListBox1.Items.Add(str);
      end

      else               //���� ���� � ������

      begin
         var i,index:integer;


             for i := 0 to v_list.Count-1 do
        begin
                  if( ComboBox1.Items[ComboBox1.ItemIndex] = v_list[i][0])     //���� ��������� �������� � ����� ��������� � ����� �� ��������� ������������ ������
                  then
                  begin

                        counts[ComboBox1.ItemIndex]:= counts[ComboBox1.ItemIndex] +  StrToInt( v_list[i][1] );   //������� ����������
                        h:=counts[ComboBox1.ItemIndex];


                                             if h>= n then   // ����  ����� ������ ��� ����
                              begin
                                      str:= ComboBox1.Items[ComboBox1.ItemIndex]+ '   ' + Edit1.Text + ' �� ' ;
                                      Label3.Caption:=  ( h - n).ToString;   //�������
                                       v_list[i][1]:=n.ToString;
                                       v_list[i][2]:='0';

                                      counts[ComboBox1.ItemIndex]:=h-n;
                              end
                             else     //���� �� �������
                              begin

                                    str:= ComboBox1.Items[ComboBox1.ItemIndex]+'   ' +
                                    h.ToString + ' �� + ' + (n-h).ToString + ' �� ��� ����� ' ;
                                      Label3.Caption:=  '0';

                                       v_list[i][1]:=h.ToString;
                                       v_list[i][2]:=(n-h).ToString;




                                       counts[ComboBox1.ItemIndex]:=0;
                              end;
                                  //  ListBox1.Items.Add(str);
                                   ListBox1.Items[i]:=str;
                                      end;

        end;
      end;

          var x:integer;
          for x:= 0 to v_list.Count-1 do
          begin
            var s:string;
            s:= s+v_list[x][0]+ '  ' + v_list[x][1]+ ' ' + v_list[x][2];

          end;


end;

procedure TForm18.AppInfoInVList();
begin
     var k,i: integer;
       for i := 0 to v_list.Count-1 do
       begin
              for k := 0 to TProduct_Class.array_of_products.Count-1 do

               begin
                    if (TProduct_Class.array_of_products[k].Name_=v_list[i][0] ) then

                   begin
                        v_list[i].Add( TProduct_Class.array_of_products[k].Cost.ToString  )    ;  //���� �� ������� 3
                        v_list[i].Add( TProduct_Class.array_of_products[k].Time_.ToString  )    ;  //����� ������������  4                                      //����� �� ������������
                   end;

               end;
       end;


end;

function TForm18.save_request_in_db(arr:array  of string;agent_id:integer;new:boolean):integer;
begin
     var mc:TMain_class;
     mc:=TMain_class.Create();
     var ado2:TADOQuery;
     var next_id:integer;
      ado2:= mc.sql_select('*' , 'Request_from_agent' , ' ' ,'  order by ID_request_agent DESC ', false );
         next_id:=ado2.Fields[0].AsInteger+1;
     arr[0]:=next_id.ToString;
     arr[1]:=agent_id.ToString;
     arr[2]:='1';
     arr[3]:= FormatDateTime('dd.mm.yyyy hh:nn:ss ', Now);
     arr[4]:='false';
     arr[5]:='false';
     if(new) then arr[6]:='true'
     else arr[6]:='false';
     arr[7]:=FormatDateTime('dd.mm.yyyy hh:nn:ss ', EncodeDateTime(1999, 2, 9, 1, 2, 3,4));
     arr[8]:=FormatDateTime('dd.mm.yyyy hh:nn:ss ', EncodeDateTime(1999, 2, 9, 1, 2, 3,4));
     mc.sql_insert(' Request_from_agent ' ,arr );

     //���� �� � ����� ���������


     result:=  next_id;


end;

 procedure TForm18.save_composition_in_db(arr2:array  of string;agent_id:integer);
 begin
        var mc:TMain_class;
     mc:=TMain_class.Create();


       var i:integer;
      for I := 0 to v_list.Count-1 do
      begin
          arr2[0]:=(TRequest_Agents_Class.array_of_requests_agent.Count +1).ToString;
          var  article:integer;
          var ado:TADOQuery;
           ado:= mc.sql_select(' article ', ' Products ' , 'where Name_ =  ' + QuotedStr( v_list[i][0]) , ' ' , false );
          arr2[1]:=ado.Fields[0].AsString;

          arr2[2]:= (StrToInt( v_list[i][1] )+ StrToInt(v_list[i][2])).ToString;
             mc.sql_insert('Composition_of_req_ag ' ,arr2 );

      end;



 end;


 procedure TForm18.save_in_doc();
begin
        wdApp := CreateOleObject('Word.Application');
   Sd := SaveDialog1;
   SaveDialog1.DefaultExt:='docx';
  sd.InitialDir:=' D:\��������\�����������_���_������� ' ;
  if Sd.InitialDir = ''
  then Sd.InitialDir := ExtractFilePath( ParamStr(0) );
  //������ ������� ���������� �����.
  if not Sd.Execute then Exit;
  //���� ���� � �������� ������ ����������, �� ��������� ������ � �������������.
  if FileExists(Sd.FileName) then begin
    Res := MessageBox(0, '���� � �������� ������ ��� ����������. ������������?'
      ,'��������!', MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL);
    if Res <> IDYES then Exit;
  end;
  //������� ��������� MS Word.
  try
    wdApp := CreateOleObject('Word.Application');
  except
    MessageBox(0, '�� ������� ��������� MS Word. �������� ��������.'
      ,'��������!', MB_OK + MB_ICONERROR + MB_APPLMODAL);
    Exit;
  end;
  //������ ������� ���� MS Word. �� ���������� ������ ��� �� ����� �������.
 // wdApp.Visible := True;  //
  //������ ����� ��������.
  wdDoc := wdApp.Documents.Add;
  //�� ������, ���� ����� ����� ������ � wdApp.Visible := True - �����
  //��� ��������� ������ ��������� ����������� ���� MS Word.
  wdApp.ScreenUpdating := False;
  try
    wdRng := wdDoc.Content; //��������, ������������ �� ���������� ���������.

    //�������� 1. ��������� ������.

    //��������� ������ � ������� ������.
    wdRng.InsertAfter('����������� ��� '+ agent_name + #13#10);
    //������������ �� ������.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphCenter;
    //��������� ������.
    wdRng.Font.Name := 'Times New Roman';
    wdRng.Font.Bold := True;
    wdRng.Font.Size := 14;

    //�������� 2. ����� ��������.

    //��������� �������� ������ ��������� ��������������� �� ������� ����������.
    wdRng.Start := wdRng.End;
    wdRng.InsertAfter(#13#10);
    D := Now;
    wdRng.InsertAfter('����: ' + FormatDateTime('dd.mm.yyyy', D) + #13#10);
    wdRng.InsertAfter('�����: ' + FormatDateTime('hh:nn:ss', D) + #13#10);
    //����� ���������� ���������.
    wdRng.ParagraphFormat.Reset;
    //������������ �� ������ ����.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;
    //������ ����� �� 2 ����������. ������ ������� ������� � ������������
    //�������� - � �������. 1 ����� = 0.035 ����������.
    //��� ������ � ���� LeftIndent, ������ ������������� �� ������ ���� �� ��������.
    //wdRng.ParagraphFormat.LeftIndent := 2 / 0.035;
    //��������� ������.
    wdRng.Font.Reset; //����� ���������� ������.
    wdRng.Font.Size := 12;
    wdRng.Font.Bold := True;

    //�������� 3. ��������� �������.

    wdRng.Start := wdRng.End;
    wdRng.InsertAfter(#13#10);
    wdRng.InsertAfter('������� 1. ������ � ������� � ��� �����.'#13#10);
    wdRng.ParagraphFormat.Reset;
    wdRng.Font.Reset;
    wdRng.Font.Size := 12;
    wdRng.Font.Bold := False;

    //�������� 4. �������.

  //  if not Query1.Active then Query1.Open;

    wdRng.Start := wdRng.End;
    //��������� ������� MS Word. ���� ������ ������� � ����� ��������.
    wdTable := wdDoc.Tables.Add(wdRng.Characters.Last, 2, 5);        //3 ��� ���������� ��������
   //��������� ����� �������.
   wdTable.Borders.InsideLineStyle :=  wdLineStyleSingle ;
  wdTable.Borders.OutsideLineStyle := wdLineStyleSingle;
    //����� ���������� ���������.
    wdRng.ParagraphFormat.Reset;
    //������������ ���� ������� - �� ������ ����.
  wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;


    //���������� �����.
     wdRng := wdTable.Rows.Item(1).Range; //�������� ������ ������.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphCenter;
    wdRng.Font.Size := 10;
     wdRng.Font.Bold := True;


    //���������� ������ ������ ������ - ��� ������ ������ � �������.
    //��� ���������� ��������� �����, �� ���������� ����� ������������ � ���� ������.
     wdRng := wdTable.Rows.Item(2).Range; //�������� ������ ������.
     wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;
     wdRng.Font.Size := 10;
   wdRng.Font.Bold := False;

    ///���������� ����� �������.


     wdTable.Cell(1, 1).Range.Text := '������������ ������';
     wdTable.Cell(1, 2).Range.Text := '���� �� 1��.';
     wdTable.Cell(1, 3).Range.Text := '� �������';
      wdTable.Cell(1, 4).Range.Text := '��� �����';
     wdTable.Cell(1, 5).Range.Text := '����� �� ������������';



       wdTable.Rows.Add;

    var k,i: integer;
     k:= 2; //������� ������ � ������� MS Word.

     AppInfoInVList();

       for i := 0 to v_list.Count-1 do
       begin
               wdTable.Cell(k, 1).Range.Text := v_list[i][0];
               wdTable.Cell(k, 2).Range.Text := v_list[i][3];
               wdTable.Cell(k, 3).Range.Text := v_list[i][1];
               wdTable.Cell(k, 4).Range.Text := v_list[i][2];
               wdTable.Cell(k, 5).Range.Text := v_list[i][4];
               Inc(k);

               wdTable.Rows.Add;

       end;



  finally
    //��������� ����������� ���� MS Word. � ������, ���� wdApp.Visible := True.
  wdApp.ScreenUpdating := True;
 end;

 wdApp.DisplayAlerts := False; //��������� ����� ������ ��������������.
 try
    wdDoc.SaveAs(FileName:=Sd.FileName); //������ ��������� � ����.
 finally
    wdApp.DisplayAlerts := True; //�������� ����� ������ ��������������.
  end;

  //��������� ��������.
  wdDoc.Close;
  //��������� MS Word.
  wdApp.Quit;

end;

 procedure TForm18.Button2Click(Sender: TObject);     //���������
    begin
           try
            //    save_in_doc;
                save_request_in_db(arr,agent_id,false);
                save_composition_in_db(arr2,agent_id);

           finally
                  ShowMessage('����������� ������� ��������');
                   Close;
           end;



    end;

procedure TForm18.Button3Click(Sender: TObject);      //��������
begin
           var i:integer;

      for i := 0 to v_list.Count-1 do
        begin

                  if( ComboBox1.Items[ComboBox1.ItemIndex] =v_list[i][0])   //���� ����� �������� ������ �� ������
                  then
                  begin
                      label3.Caption:= (counts[i]+ StrToInt(v_list[i][1])).ToString ;  //��� ������ ����� �� ������

                  end;


        end;

                  v_List.Delete(ListBox1.ItemIndex);


                  in_list[i]:=false;
                  ListBox1.DeleteSelected;


end;

procedure TForm18.ComboBox1Change(Sender: TObject);
begin
       var  i:integer;
       for i:=0 to TProduct_class.array_of_products.Count-1 do
          begin
              if (TProduct_class.array_of_products[i].Name_ =  ComboBox1.Items[ComboBox1.ItemIndex] )   then
              begin
                    if in_list[i] then
                      Label3.Caption:=counts[i].ToString
                    else
                     Label3.Caption:=TProduct_class.array_of_products[i].In_stock.ToString;




              end;
          end;

end;

end.
procedure TForm18.FormCreate(Sender: TObject);
begin

end;


