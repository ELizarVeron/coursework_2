unit WinManager;

interface

uses
 System.Generics.Collections, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Frame_agents, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Fr_ag, BD_Manager,TABLE_Agents;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Edit1: TEdit;
    Sortirovka: TComboBox;
    Filtr: TComboBox;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Button1: TButton;
    PanelNav: TPanel;
    LabelLeft: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelRight: TLabel;
    procedure change_pages_r(x:integer);
    procedure change_pages_l();
    procedure Edit1Change(Sender: TObject);
    procedure FiltrChange(Sender: TObject);
    procedure SortirovkaChange(Sender: TObject);

    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure LabelRightMouseEnter(Sender: TObject);
    procedure LabelRightMouseLeave(Sender: TObject);
    procedure LabelLeftMouseLeave(Sender: TObject);
    procedure LabelLeftMouseEnter(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure LabelRightClick(Sender: TObject);
    procedure LabelLeftClick(Sender: TObject);


  private
    { Private declarations }
  public
     constructor Create (AOwner: TComponent); override;
      procedure  load_frames(page:integer);
      function add_data_for_manager(SQL:string):TObjectList<TAgent>;
      function  Sortirovka_get_sql():string;
      function   Edit_get_sql():string;
      procedure  create_filter();
      procedure  create_sort();
    {  function get_sale(c:integer):integer; }
      procedure  load_pages();

  end;

var
  my_SQL: string;
  log: string;
  data_:TFor_Manager;
  Form3: TForm3;
  fr:TFrame;
  array_of_agents :TObjectList<TAgent>;   //массив агентов создаем
  first_index: integer;   //номера выведенных форм на странице
  last_index:integer;

   const Col=5;

implementation
 constructor TForm3.Create;
     begin

        inherited;
         array_of_agents:=Form3.add_data_for_manager('Select * from Agent');
         create_filter();
         create_sort;
         load_frames(0);
         load_pages;


     end;


 procedure  TForm3.create_filter();  //сдесь просто добавляет эелементы типа в выпадающий список
     begin
         var i:integer;
         Filtr.Items.Add('Все');
         ADOQuery1.SQL.Add('Select Distinct Type_ from Agent') ;
         ADOQuery1.Active:=true;
         while not ADOQuery1.Eof do
          begin
          Filtr.Items.Add(ADOQuery1.FieldByName('Type_').AsString);
          ADOQuery1.Next
          end;


     end;
 procedure  TForm3.create_sort();
   begin
         Sortirovka.Items.Add(' ↑ По наименованию');
         Sortirovka.Items.Add(' ↓ По наименованию');
         Sortirovka.Items.Add(' ↑ По размеру скидки');
         Sortirovka.Items.Add(' ↓ По размеру скидки');
         Sortirovka.Items.Add(' ↑ По приоритету');
         Sortirovka.Items.Add(' ↓ По приоритету');

   end;
function TForm3.add_data_for_manager (SQL:string): TObjectList<TAgent>;
  begin
  //в этом методе получаем массив записей таблицы агент
     data_:= TFor_Manager.Create;   //создаем список агентов
     data_.NewDataSet(SQL);
         //достаем данные из бд с помощью  переданного запроса
     result:=data_.Records;   //возвращаем список полученных записей

  end;
procedure TForm3.SortirovkaChange(Sender: TObject);
begin
       load_pages();
      FiltrChange(Sender);

end;

function TForm3.Sortirovka_get_sql():string;
begin
            var x:string;
      x:=' order by ' ;
      case Sortirovka.ItemIndex of
         0:
         x:=x+'company asc' ;
         1:
          x:=x+'company desc' ;
         2:
          x:=x+'discount asc' ;
         3:
          x:=x+'discount desc' ;
         4:
          x:=x+'priority asc' ;
         5:
          x:=x+'priority desc' ;
      end;
      if Sortirovka.ItemIndex<0 then
        result:=''
        else
        result:= x;
end;


procedure TForm3.Edit1Change(Sender: TObject);
begin
  FiltrChange(Sender);


end;
 function  TForm3.Edit_get_sql():string;    //вспомогательная функция для формирования текста запроса
begin
          var inp,x:string;
          inp:=Edit1.Text;
          if (inp='') then
          result:=''
          else
          result:='   Company like '+#39+'%'+inp+'%'+#39;

end;


procedure TForm3.FiltrChange(Sender: TObject);  //событие на изменение фильтрации
begin
       var item,x:string;
       item:=Filtr.Items[Filtr.ItemIndex];   //то что пишем в поиске
       if (item='Все') or (Filtr.ItemIndex<0)   //если все или ничего
        then
        begin

            if (Edit_get_sql='') then
             x:='Select * from Agent '
             else
            X:='Select * from Agent where '

        end

        else          //если все таки что то ввели в поиск
        begin
          if (Edit_get_sql='') then
          x:='Select * from Agent where Type_ = ' +#39+item+#39
          else
          x:='Select * from Agent where Type_ = ' +#39+item+#39 + ' and ';
        end;


       x:=x+Edit_get_sql;    //прибавляем фильтрацию
       x:=x+Sortirovka_get_sql();    //сортировочку добавим
       ADOQuery1.SQL.Clear;
       array_of_agents:= Form3.add_data_for_manager(x); //передаем полученный запрос в функцию загрухки данных
       load_frames(0);     //грузим фреймы ,навигатор сбрасывается
end;

procedure TForm3.Label1Click(Sender: TObject);
begin

    load_frames(StrToInt(Label1.Caption)-1);
   label2.Font.Style:=label2.Font.Style-[fsUnderline];
    label3.Font.Style:=label3.Font.Style-[fsUnderline];
     label4.Font.Style:=label4.Font.Style-[fsUnderline];
      label1.Font.Style:=label1.Font.Style+[fsUnderline];

end;

procedure TForm3.Label1MouseEnter(Sender: TObject);
begin
          Label1.Font.Color:=clred;
end;

procedure TForm3.Label1MouseLeave(Sender: TObject);
begin

             Label1.Font.Color:=clblack;
end;

procedure TForm3.Label2MouseEnter(Sender: TObject);
begin
          Label2.Font.Color:=clred;
end;


procedure TForm3.Label2MouseLeave(Sender: TObject);
begin

Label2.Font.Color:=clblack;
end;

procedure TForm3.Label3Click(Sender: TObject);
begin
  load_frames(StrToInt(Label3.Caption)-1);
   label1.Font.Style:=label1.Font.Style-[fsUnderline];
    label2.Font.Style:=label2.Font.Style-[fsUnderline];
     label4.Font.Style:=label4.Font.Style-[fsUnderline];
      label3.Font.Style:=label3.Font.Style+[fsUnderline];
end;

procedure TForm3.Label3MouseEnter(Sender: TObject);
begin

     Label3.Font.Color:=clred;
end;

procedure TForm3.Label3MouseLeave(Sender: TObject);
begin

Label3.Font.Color:=clblack;
end;

procedure TForm3.Label4Click(Sender: TObject);
begin

    load_frames(StrToInt(Label4.Caption)-1);
   label1.Font.Style:=label1.Font.Style-[fsUnderline];
    label3.Font.Style:=label3.Font.Style-[fsUnderline];
     label2.Font.Style:=label2.Font.Style-[fsUnderline];
      label4.Font.Style:=label4.Font.Style+[fsUnderline];
end;

procedure TForm3.Label4MouseEnter(Sender: TObject);
begin

        Label4.Font.Color:=clred;
end;

procedure TForm3.Label4MouseLeave(Sender: TObject);
begin

          Label4.Font.Color:=clblack;

end;

procedure TForm3.LabelLeftClick(Sender: TObject);
begin

               if (label1.Caption='5') then
               LabelLeft.Visible:=false;
               change_pages_l();

end;

procedure TForm3.LabelLeftMouseEnter(Sender: TObject);
begin
          LabelLeft.Font.Color:=clred;


end;

procedure TForm3.LabelLeftMouseLeave(Sender: TObject);
begin
          LabelLeft.Font.Color:=clblack;
end;

procedure TForm3.LabelRightClick(Sender: TObject);
begin
 var x:integer;
 x:=array_of_agents.Count-(strToInt(label4.Caption)*Col);
 change_pages_r(x);
end;

procedure TForm3.LabelRightMouseEnter(Sender: TObject);
begin
                    LabelRight.Font.Color:=clred;
end;

procedure TForm3.LabelRightMouseLeave(Sender: TObject);
begin
                   LabelRight.Font.Color:=clblack;
end;



procedure TForm3.load_pages();  //первая загрузка
begin
  var count,on_page: integer;
  on_page:=Col;                  //столько фреймов на странице
  count:= array_of_agents.Count;   //кол во всех агентов  в базе

  if (count <on_page) then   //если навигатор не нужен
  begin
    PanelNav.Visible:=false;
  end
  else
  begin
  PanelNav.Visible:=true;
       var cel,ost:integer;
           cel:=count div on_page;
           ost:= count mod on_page;
       if (cel>=4) then
       begin
              PanelNav.Controls[0].Visible:=false;
               PanelNav.Controls[1].Visible:=true;
               Label1.Caption:='1';
               Label2.Caption:='2';
               Label3.Caption:='3';
               Label4.Caption:='4';
               PanelNav.Controls[2].Visible:=true;
               PanelNav.Controls[3].Visible:=true;
               PanelNav.Controls[4].Visible:=true;
               PanelNav.Controls[5].Visible:=true;
       end
       else       //тут уже меньше 4ех старниц
       begin
               if cel=1 then
               begin
               Label1.Caption:='1';
                Label1.Visible:=true;
               end;
                if cel=2 then
               begin
               Label1.Caption:='1';
                Label1.Visible:=true;
                Label2.Caption:='2';
                Label2.Visible:=true;
               end;
                if cel=3 then
               begin
               Label1.Caption:='1';
                Label1.Visible:=true;
                Label2.Caption:='2';
                Label2.Visible:=true;
                Label3.Caption:='3';
                Label3.Visible:=true;
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
               Label2.Caption:='2';
               end;
                if cel=2 then
               begin
               Label3.Caption:='3';
               end;
                if cel=3 then
               begin
               Label4.Caption:='4';
               end;
          end;

       end;



      end;

       label1.Font.Style:=label1.Font.Style+[fsUnderline];

  end;



procedure TForm3.load_frames(page:integer);
begin
var i,beg,en:integer;
var Item: TControl;
beg:=page*Col;
en:=((page+1)*Col)-1;
i:=0;
   while Panel1.ControlCount>0 do    //стираем старые фреймы
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
               data_.InsertDiscount(beg,discount.ToString);

               TFrame3(fr).Label8.Caption:=  TFrame3(fr).Label8.Caption+array_of_agents[beg].SUMMA.ToString;
                 Visible:=true;
                   Show;
                   Inc(beg);
                     Inc(i);


        end;

  end;

  var j:integer;
  var comp: TComponent;
 for i := 0 to Panel1.ControlCount - 1 do
if Panel1.Controls[i].Tag = 1 then
begin
     Panel1.Controls[i].Show;
     Panel1.Controls[i].Visible := true;

end;

end;

procedure TForm3.Label2Click(Sender: TObject);
begin
  load_frames(StrToInt(Label2.Caption)-1);
   label1.Font.Style:=label1.Font.Style-[fsUnderline];
    label3.Font.Style:=label3.Font.Style-[fsUnderline];
     label4.Font.Style:=label4.Font.Style-[fsUnderline];
      label2.Font.Style:=label2.Font.Style+[fsUnderline];
end;

procedure TForm3.change_pages_r(x:integer);

  begin
          var n:=Col-1;
                if (x>=n) then
                begin
                  LabelLeft.Visible:=true;
                 PanelNav.Controls[1].Visible:=true;
                 PanelNav.Controls[2].Visible:=true;
                 PanelNav.Controls[3].Visible:=true;
                 PanelNav.Controls[4].Visible:=true;
                 PanelNav.Controls[5].Visible:=true;

                 Label1.Caption:=(StrToInt(Label1.Caption)+Col-1).ToString ;
                 Label2.Caption:=(StrToInt(Label2.Caption)+Col-1).ToString ;
                 Label3.Caption:=(StrToInt(Label3.Caption)+Col-1).ToString ;
                 Label4.Caption:=(StrToInt(Label4.Caption)+Col-1).ToString ;

                 label1.Font.Style:=label1.Font.Style+[fsUnderline];
                 label2.Font.Style:=label1.Font.Style-[fsUnderline];
                 label3.Font.Style:=label1.Font.Style-[fsUnderline];
                 label4.Font.Style:=label1.Font.Style-[fsUnderline];

                     load_frames(Strtoint(label1.Caption)-1);
                end

                else if (x=n-1) then
                     begin
                          LabelLeft.Visible:=true;
                           PanelNav.Controls[1].Visible:=true;
                           PanelNav.Controls[2].Visible:=true;
                           PanelNav.Controls[3].Visible:=true;
                           PanelNav.Controls[4].Visible:=false;
                           PanelNav.Controls[5].Visible:=false;

                           Label1.Caption:=(StrToInt(Label1.Caption)+Col-1).ToString ;
                           Label2.Caption:=(StrToInt(Label2.Caption)+Col-1).ToString ;
                           Label3.Caption:=(StrToInt(Label3.Caption)+Col-1).ToString ;
                           Label4.Caption:=(StrToInt(Label4.Caption)+Col-1).ToString ;

                           label1.Font.Style:=label1.Font.Style+[fsUnderline];
                           label2.Font.Style:=label1.Font.Style-[fsUnderline];
                           label3.Font.Style:=label1.Font.Style-[fsUnderline];
                           label4.Font.Style:=label1.Font.Style-[fsUnderline];

                     load_frames(Strtoint(label1.Caption)-1);
                     end
                else if  (x=n-2)  then
                begin
                    LabelLeft.Visible:=true;
                           PanelNav.Controls[1].Visible:=true;
                           PanelNav.Controls[2].Visible:=true;
                           PanelNav.Controls[3].Visible:=false;
                           PanelNav.Controls[4].Visible:=false;
                           PanelNav.Controls[5].Visible:=false;

                           Label1.Caption:=(StrToInt(Label1.Caption)+Col-1).ToString ;
                           Label2.Caption:=(StrToInt(Label2.Caption)+Col-1).ToString ;
                           Label3.Caption:=(StrToInt(Label3.Caption)+Col-1).ToString ;
                           Label4.Caption:=(StrToInt(Label4.Caption)+Col-1).ToString ;

                           label1.Font.Style:=label1.Font.Style+[fsUnderline];
                           label2.Font.Style:=label1.Font.Style-[fsUnderline];
                           label3.Font.Style:=label1.Font.Style-[fsUnderline];
                           label4.Font.Style:=label1.Font.Style-[fsUnderline];

                     load_frames(Strtoint(label1.Caption)-1);
                end
                 else if  (x=n-3)   then
                begin
                         LabelLeft.Visible:=true;
                           PanelNav.Controls[1].Visible:=true;
                           PanelNav.Controls[2].Visible:=false;
                           PanelNav.Controls[3].Visible:=false;
                           PanelNav.Controls[4].Visible:=false;
                           PanelNav.Controls[5].Visible:=false;

                           Label1.Caption:=(StrToInt(Label1.Caption)+Col-1).ToString ;
                           Label2.Caption:=(StrToInt(Label2.Caption)+Col-1).ToString ;
                           Label3.Caption:=(StrToInt(Label3.Caption)+Col-1).ToString ;
                           Label4.Caption:=(StrToInt(Label4.Caption)+Col-1).ToString ;

                           label1.Font.Style:=label1.Font.Style+[fsUnderline];
                           label2.Font.Style:=label1.Font.Style-[fsUnderline];
                           label3.Font.Style:=label1.Font.Style-[fsUnderline];
                           label4.Font.Style:=label1.Font.Style-[fsUnderline];

                     load_frames(Strtoint(label1.Caption)-1);
                end;



  end;
  procedure TForm3.change_pages_l();

  begin
                 LabelRight.Visible:=true;
                 PanelNav.Controls[1].Visible:=true;
                 Label1.Caption:=(StrToInt(Label1.Caption)-Col+1).ToString ;
                 Label2.Caption:=(StrToInt(Label2.Caption)-Col+1).ToString ;
                 Label3.Caption:=(StrToInt(Label3.Caption)-Col+1).ToString ;
                 Label4.Caption:=(StrToInt(Label4.Caption)-Col+1).ToString ;
                 PanelNav.Controls[2].Visible:=true;
                 PanelNav.Controls[3].Visible:=true;
                 PanelNav.Controls[4].Visible:=true;
                 PanelNav.Controls[5].Visible:=true;
                 label1.Font.Style:=label1.Font.Style-[fsUnderline];
                 label2.Font.Style:=label1.Font.Style-[fsUnderline];
                 label3.Font.Style:=label1.Font.Style-[fsUnderline];
                 label4.Font.Style:=label1.Font.Style+[fsUnderline];
                 load_frames(Strtoint(label4.Caption)-1);






  end;
  {$R *.dfm}
end.
