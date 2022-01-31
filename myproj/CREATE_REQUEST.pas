unit CREATE_REQUEST;

interface

uses
  ComObj,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.Win.ADODB, Agent_Class, Request_agents_class, Product_Class,TABLE_Products, Main_Class;

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
  private
    { Private declarations }
  public
  constructor Create( AOwner: TComponent);  override;
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
implementation
 constructor  TForm9.Create(AOwner: TComponent);
       begin
         inherited;
           for I := 0 to TAgent_Class.array_of_agents.Count-1 do
           ComboBox1.Items.Add(TAgent_Class.array_of_agents[i].Name);

           mc:=TMain_class.Create;
           ado:=TADOQuery.Create(nil);

           label9.Caption:=
           (TRequest_Agents_Class.array_of_requests_agent
           [TRequest_Agents_Class.array_of_requests_agent.Count-1].ID_Request+1).ToString;

       end;

{$R *.dfm}

procedure TForm9.Button2Click(Sender: TObject);                 //для нового
begin

    wdApp := CreateOleObject('Word.Application');
  Sd := SaveDialog1;
 SaveDialog1.DefaultExt:='docx';
  sd.InitialDir:=' D:\Курсовая\Предложения_для_агентов ' ;
  if Sd.InitialDir = ''
  then Sd.InitialDir := ExtractFilePath( ParamStr(0) );
  //Запуск диалога сохранения файла.
  if not Sd.Execute then Exit;
  //Если файл с заданным именем существует, то запускаем диалог с пользователем.
  if FileExists(Sd.FileName) then begin
    Res := MessageBox(0, 'Файл с заданным именем уже существует. Перезаписать?'
      ,'Внимание!', MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL);
    if Res <> IDYES then Exit;
  end;
  //Попытка запустить MS Word.
  try
    wdApp := CreateOleObject('Word.Application');
  except
    MessageBox(0, 'Не удалось запустить MS Word. Действие отменено.'
      ,'Внимание!', MB_OK + MB_ICONERROR + MB_APPLMODAL);
    Exit;
  end;
  //Делаем видимым окно MS Word. На постоянной основе или на время отладки.
  wdApp.Visible := True;
  //Создаём новый документ.
  wdDoc := wdApp.Documents.Add;
  //На случай, если очень много данных и wdApp.Visible := True - тогда
  //для ускорения работы отключаем перерисовку окна MS Word.
  wdApp.ScreenUpdating := False;
  try
    wdRng := wdDoc.Content; //Диапазон, охватывающий всё содержимое документа.

    //Параграф 1. Заголовок отчёта.

    //Заголовок отчёта и перевод строки.
    wdRng.InsertAfter('Предложение для '+ name_agent + #13#10);
    //Выравнивание по центру.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphCenter;
    //Параметры шрифта.
    wdRng.Font.Name := 'Times New Roman';
    wdRng.Font.Bold := True;
    wdRng.Font.Size := 14;

    //Параграф 2. Общие сведения.

    //Формируем диапазон нового параграфа непосредственно за текущим диапазоном.
    wdRng.Start := wdRng.End;
    wdRng.InsertAfter(#13#10);
    D := Now;
    wdRng.InsertAfter('Дата: ' + FormatDateTime('dd.mm.yyyy', D) + #13#10);
    wdRng.InsertAfter('Время: ' + FormatDateTime('hh:nn:ss:zzz', D) + #13#10);
    //Сброс параметров параграфа.
    wdRng.ParagraphFormat.Reset;
    //Выравнивание по левому краю.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;
    //Отступ слева на 2 сантиметра. Размер отступа задаётся в типографских
    //единицах - в пунктах. 1 пункт = 0.035 сантиметра.
    //При записи в поле LeftIndent, отступ отсчитывается от левого поля на странице.
    //wdRng.ParagraphFormat.LeftIndent := 2 / 0.035;
    //Параметры шрифта.
    wdRng.Font.Reset; //Сброс параметров шрифта.
    wdRng.Font.Size := 12;
    wdRng.Font.Bold := True;

    //Параграф 3. Заголовок таблицы.

    wdRng.Start := wdRng.End;
    wdRng.InsertAfter(#13#10);
    wdRng.InsertAfter('Таблица 1. Товары в нличии.'#13#10);
    wdRng.ParagraphFormat.Reset;
    wdRng.Font.Reset;
    wdRng.Font.Size := 12;
    wdRng.Font.Bold := False;

    //Параграф 4. Таблица.

  //  if not Query1.Active then Query1.Open;

    wdRng.Start := wdRng.End;
    //Добавляем таблицу MS Word. Пока создаём таблицу с двумя строками.
    wdTable := wdDoc.Tables.Add(wdRng.Characters.Last, 2, 3);        //3 это количество столбцов
   //Параметры линий таблицы.
   wdTable.Borders.InsideLineStyle :=  wdLineStyleSingle ;
  wdTable.Borders.OutsideLineStyle := wdLineStyleSingle;
    //Сброс параметров параграфа.
    wdRng.ParagraphFormat.Reset;
    //Выравнивание всей таблицы - по левому краю.
  wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;


    //Оформление шапки.
     wdRng := wdTable.Rows.Item(1).Range; //Диапазон первой строки.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphCenter;
    wdRng.Font.Size := 10;
     wdRng.Font.Bold := True;


    //Оформление первой строки данных - это вторая строка в таблице.
    //При добавлении следующих строк, их оформление будет копироваться с этой строки.
     wdRng := wdTable.Rows.Item(2).Range; //Диапазон второй строки.
     wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;
     wdRng.Font.Size := 10;
   wdRng.Font.Bold := False;

    ///Записываем шапку таблицы.


     wdTable.Cell(1, 1).Range.Text := 'Наименование товара';
     wdTable.Cell(1, 2).Range.Text := 'Цена за 1ед.';
     wdTable.Cell(1, 3).Range.Text := 'В наличии';


       wdTable.Rows.Add;
    //Записываем данные таблицы.
   // Query1.DisableControls;
  //  Bm := Query1.GetBookMark;
  //  Query1.First;

    var k: integer;
     k:= 2; //Текущая строка в таблице MS Word.
   // while not Query1.Eof do begin

       for i := 0 to TProduct_Class.array_of_products.Count-1 do
       begin
               if (TProduct_Class.array_of_products[i].In_stock>0) then

               begin
                   wdTable.Cell(k, 1).Range.Text :=  TProduct_Class.array_of_products[i].Name_;
                   wdTable.Cell(k, 2).Range.Text := TProduct_Class.array_of_products[i].Cost;
                   wdTable.Cell(k, 3).Range.Text := TProduct_Class.array_of_products[i].In_stock;
                     Inc(k);
                     wdTable.Rows.Add;
               end;
       end;

  finally
    //Включение перерисовки окна MS Word. В случае, если wdApp.Visible := True.
  wdApp.ScreenUpdating := True;
 end;

 wdApp.DisplayAlerts := False; //Отключаем режим показа предупреждений.
 try
    wdDoc.SaveAs(FileName:=Sd.FileName); //Запись документа в файл.
 finally
    wdApp.DisplayAlerts := True; //Включаем режим показа предупреждений.
  end;

  //Закрываем документ.
  wdDoc.Close;
  //Закрываем MS Word.
  wdApp.Quit;

end;

procedure TForm9.ComboBox1Change(Sender: TObject);
begin
        var  b_new: bool;     //новый агент?
         var    id:integer;
        for I := 0 to TAgent_Class.array_of_agents.Count-1 do
          if TAgent_Class.array_of_agents[i].Name=ComboBox1.Items[ComboBox1.ItemIndex] then
          begin
               id:=TAgent_Class.array_of_agents[i].ID_;
               name_agent:= TAgent_Class.array_of_agents[i].name;
          end;

        ado:=mc.sql_select(' * ', ' history_of_reliz ', ' where ID_Agent =  ' + id.ToString , ' ' , false );
       // в адо - все истории реализации с этим агентом
       b_new:=true;
         for I := 0 to TRequest_agents_class.array_of_requests_agent.Count-1
         do begin
             if TRequest_agents_class.array_of_requests_agent[i].ID_Agent=id then
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

end.
