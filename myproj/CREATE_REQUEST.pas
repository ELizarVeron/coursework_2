unit CREATE_REQUEST;

interface

uses
  ComObj,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.Win.ADODB, Agent_Class, Request_agents_class, Product_Class,TABLE_Products, Main_Class ,SelectProducts;

type
  TForm9 = class(TForm)
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button2: TButton;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure save_in_file;
  private
    var arr: array[0..6] of string;
    var arr2: array[0..2] of string;
  public
  constructor Create( AOwner: TComponent);  override;
  var v_list: TList<TList<string> >;   //0 ���, 1 - � ������ � �������, 2- � ������ ��� �����

    { Public declarations }
  end;

var
  Form9: TForm9;
   i,id_agent:integer;
   mc: TMain_Class;
   ado: TADOQuery;
   name_agent:string;
    wdApp, wdDoc, wdRng, wdTable : Variant;
     j, Res : Integer;
    D : TDateTime;
 //   Bm : TBookMark;
    Sd : TSaveDialog;
    array_of_productss: TObjectList<TProduct>;
    const
  wdAlignParagraphCenter = 1;
  wdAlignParagraphLeft = 0;
  wdAlignParagraphRight = 2;

  wdLineStyleSingle = 1;

    var  SPW : TForm10;
implementation
 constructor  TForm9.Create(AOwner: TComponent);
       begin
         inherited;
           for I := 0 to TAgent_Class.array_of_agents.Count-1 do
           ComboBox1.Items.Add(TAgent_Class.array_of_agents[i].Name);

           mc:=TMain_class.Create;
           ado:=TADOQuery.Create(nil);
            if( TRequest_Agents_Class.array_of_requests_agent.Count >0) then

             label9.Caption:=
            (TRequest_Agents_Class.array_of_requests_agent
            [TRequest_Agents_Class.array_of_requests_agent.Count-1].ID_Request+1).ToString

            else     label9.Caption:='0';



           SPW:=TForm10.Create(nil);
       end;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);      //��� �������������
begin


      SPW.agent_id:= id_agent;
      SPW.agent_name:=name_agent;
      SPW.ShowModal;
      Close;

end;




procedure TForm9.Button2Click(Sender: TObject);                 //��� ������
begin
          //save_in_file;
         var next_id:integer;
         next_id:=SPW.save_request_in_db(arr,id_agent,true);
         // ��� ����� �������� � ������ ���������� ����������� ������ ��� ������� ������� ���� � ������
         var mc:TMain_class;
         mc:=TMain_class.Create();
         var ado, ado2:TADOQuery;
         ado:=mc.sql_select('*', ' products ' , ' where In_stock > 0 ' , ' Order by Name_ ' , false );

         ado2:= mc.sql_select('*' , 'Request_from_agent' , ' ' ,'  order by ID_request_agent DESC ', false );

         arr2[0]:= (next_id).ToString;
         while not ado.Eof  do
         begin
             arr2[1]:=ado.Fields[0].AsString;
             arr2[2]:=ado.Fields[3].AsString;
             mc.sql_insert( ' Com  ' , arr2 );   //��������� � ������ ������ ��� �������, �����.  �� ������
             ado.Next;
         end;

         ShowMessage('������ ������� ��������') ;
          Close;




end;

procedure TForm9.ComboBox1Change(Sender: TObject);
begin
        var  b_new: bool;     //����� �����?

        for I := 0 to TAgent_Class.array_of_agents.Count-1 do
          if TAgent_Class.array_of_agents[i].Name=ComboBox1.Items[ComboBox1.ItemIndex] then
          begin
               id_agent:=TAgent_Class.array_of_agents[i].ID_;
               name_agent:= TAgent_Class.array_of_agents[i].name;

          end;

        ado:=mc.sql_select(' * ', ' history_of_reliz ', ' where ID_Agent =  ' + id_agent.ToString , ' ' , false );
       // � ��� - ��� ������� ���������� � ���� �������
       b_new:=true;
         for I := 0 to TRequest_agents_class.array_of_requests_agent.Count-1
         do begin
             if TRequest_agents_class.array_of_requests_agent[i].ID_Agent=id_agent then
             begin
                    b_new:= false;
                    break;

             end;

         end;

         if b_new then
         begin
            label10.Visible:=true ;
             Button2.Visible:=true;
             Button1.Visible:=false;

         end
         else
         begin
              Label10.Visible:=false;
               Button2.Visible:=false;
                Button1.Visible:=true;

         end;

end;


procedure TForm9.save_in_file;
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
  wdApp.Visible := True;
  //������ ����� ��������.
  wdDoc := wdApp.Documents.Add;
  //�� ������, ���� ����� ����� ������ � wdApp.Visible := True - �����
  //��� ��������� ������ ��������� ����������� ���� MS Word.
  wdApp.ScreenUpdating := False;
  try
    wdRng := wdDoc.Content; //��������, ������������ �� ���������� ���������.

    //�������� 1. ��������� ������.

    //��������� ������ � ������� ������.
    wdRng.InsertAfter('����������� ��� '+ name_agent + #13#10);
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
    wdRng.InsertAfter('������� 1. ������ � �������.'#13#10);
    wdRng.ParagraphFormat.Reset;
    wdRng.Font.Reset;
    wdRng.Font.Size := 12;
    wdRng.Font.Bold := False;

    //�������� 4. �������.

  //  if not Query1.Active then Query1.Open;

    wdRng.Start := wdRng.End;
    //��������� ������� MS Word. ���� ������ ������� � ����� ��������.
    wdTable := wdDoc.Tables.Add(wdRng.Characters.Last, 2, 4);        //3 ��� ���������� ��������
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
     wdTable.Cell(1, 4).Range.Text := '����� �� ������������';

       wdTable.Rows.Add;


    var k: integer;
     k:= 2; //������� ������ � ������� MS Word.


       for i := 0 to TProduct_Class.array_of_products.Count-1 do
       begin
               if (TProduct_Class.array_of_products[i].In_stock>0) then

               begin
                   wdTable.Cell(k, 1).Range.Text :=  TProduct_Class.array_of_products[i].Name_;
                   wdTable.Cell(k, 2).Range.Text := TProduct_Class.array_of_products[i].Cost;
                   wdTable.Cell(k, 3).Range.Text := TProduct_Class.array_of_products[i].In_stock;
                   wdTable.Cell(k, 4).Range.Text := TProduct_Class.array_of_products[i].Time_;
                     Inc(k);

                     wdTable.Rows.Add;
               end;
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

end.
