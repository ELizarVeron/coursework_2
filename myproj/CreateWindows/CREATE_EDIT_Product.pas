unit CREATE_EDIT_Product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,Main_Class,JPEG, Product_Class,Product,
  Vcl.ExtDlgs, System.Generics.Collections,Material,Material_Class ;

type
  TForm14 = class(TForm)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Edit_name: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    Стандарт: TLabel;
    Edit_standart: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit_selfcost: TEdit;
    Edit_mincost: TEdit;
    Label13: TLabel;
    Button_save: TButton;
    Edit_length: TEdit;
    Edit_width: TEdit;
    Edit_height: TEdit;
    Edit_weigth_without: TEdit;
    Edit_weigth_with: TEdit;
    PageControl1: TPageControl;
    OpenPictureDialog1: TOpenPictureDialog;
    OpenPictureDialog2: TOpenPictureDialog;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label14: TLabel;
    Edit_time: TEdit;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label15: TLabel;
    Button1: TButton;
    procedure Button_saveClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    private
    procedure SaveNewInArrayOfProducts;
    procedure SaveProdInDB;
    procedure SaveMaterialsInDB;
    procedure SaveIcon;

    procedure EditInArray;
    procedure UpdateProdInDB;
    procedure UpdateMaterialInDB;



   // procedure  SaveNewInArrayOfProd;
    //procedure  SaveProdInDB;
  public
         constructor Create( AOwner: TComponent);  override;
         procedure InitForEdit(prod:TProduct);
         procedure InitForCreateProduct( );
        var   need_change_foto, nothing_to_change_logo, modeEdit,need_delete:boolean;
        var  prod_after_change:TProduct;
        var lm_of_new_product:TObjectList<TListOfMaterials>;
  end;

var
  Form14: TForm14;
  new_prod: TProduct;
  img:TJpegImage;
  materials:TObjectList<TMaterial>;
  mc:TMain_class;
  prod_on_change:TProduct;
  prod_after_change:TProduct;

  img_name_icon, img_name_sert: string;
  ext:string;

implementation

  constructor TForm14.Create(AOwner: TComponent);
  begin

           mc:=TMain_class.Create;
           new_prod:=  TProduct.Create;
           materials:= TObjectList<TMaterial>.Create;

           inherited;

  end;

   procedure TForm14.EditInArray;
   var i:integer;
    begin

        prod_on_change.Name_:= Edit_name.Text  ;

         prod_on_change.Type_:='Игрушка';
         prod_on_change.Cost:= StrToInt(Edit_selfcost.Text);
         prod_on_change.Time_:= StrToInt(Edit_time.Text);
         prod_on_change.Technology:= Memo1.Text;
         prod_on_change.Logo:= img_name_icon;
         prod_on_change.In_stock:=0;
         prod_on_change.WeigthWith:= StrToInt(edit_weigth_with.Text);
         prod_on_change.WeightWithout :=StrToInt(edit_weigth_without.Text);
         prod_on_change.Height :=StrToInt(edit_height.Text);
         prod_on_change.Length :=StrToInt(edit_Length.Text);
         prod_on_change.Width:=StrToInt(edit_Width.Text);
         prod_on_change.Standart:=edit_standart.Text;
         prod_on_change.Sertificate :=img_name_sert;

         prod_on_change.CostForAgent:=StrToInt(Edit_mincost.Text);

         prod_on_change.list_of_materials.Count :=0;
         for I := 0 to   ListBox2.Count-1 do
          begin
           //  prod_on_change.list_of_materials.Add(ListBox2.Items.Objects[i] as TListOfMaterials  );

          end;


       //  TProduct_Class.array_of_products.Add(new_prod);

    end;


    procedure TForm14.UpdateMaterialInDB;
    var arr: array[0..2] of string;
    var i:integer;
    begin
         mc.sql_delete(' list_of_materials ' , ' Article_of_products ',  prod_on_change.Article.ToString  ) ;
         arr[0]:=  IntToStr(prod_on_change.Article);
         for I := 0 to ListBox2.Items.Count-1 do
         begin
            arr[1]:= (ListBox2.Items.Objects[i] as TListOfMaterials).Article.ToString;
            arr[2]:= (ListBox2.Items.Objects[i] as TListOfMaterials).Count.ToString;
            mc.sql_insert(' List_of_materials ', arr);
         end;


    end;

    procedure TForm14.UpdateProdInDB;
    var changes:string;
    begin
          changes:=changes+ ' Name_ = '+ QuotedStr( Edit_Name.Text);
          changes:=changes+ ' ,costForAgent = '+  Edit_mincost.Text;
          changes:=changes+ ' ,img = '+ QuotedStr(img_name_icon);
          changes:=changes+ ' , SelfCost = '+ Edit_selfcost.Text;
          changes:=changes+ ' , Standart = '+ QuotedStr(Edit_standart.Text);
          changes:=changes+ ' , Time_ = '+ Edit_time.Text;
          changes:=changes+ ' , Technology = '+ QuotedStr(Memo1.Text);
          changes:=changes+ ' , length = '+ Edit_length.Text;
          changes:=changes+ ' , height  = '+ Edit_height.Text;
          changes:=changes+ ' , width = '+ Edit_width.Text;
          changes:=changes+ ' , Weight_with_pack = '+ Edit_weigth_with.Text;
          changes:=changes+ ' , Weight_without_pack = '+ Edit_weigth_without.Text;
          mc.sql_update(' Products ' , changes , ' where Article =  ' + prod_on_change.Article.ToString  ) ;

    end;

procedure TForm14.InitForEdit(prod:TProduct);
   var i:integer;
   begin
        Label13.Caption:= 'Редактирвоание информации о продукции';

        prod_after_change:=  TProduct.Create;
        prod_on_change:= prod;
        Edit_name.Text:= prod_on_change.Name_;
        Edit_mincost.Text:=prod_on_change.CostForAgent.ToString;
        Edit_selfcost.Text:=prod_on_change.Cost.ToString;
        Edit_standart.Text:=prod_on_change.Standart;
        Edit_time.Text:=prod_on_change.Time_.ToString;
        Memo1.Text:=prod_on_change.Technology;
        Edit_length.Text:=prod_on_change.Length.ToString;
        Edit_height.Text:=prod_on_change.Height.ToString;
        Edit_width.Text:=prod_on_change.Width.ToString;
        Edit_weigth_with.Text:=prod_on_change.WeigthWith.ToString;
        Edit_weigth_without.Text:=prod_on_change.WeightWithout.ToString;



        if(prod.Logo = '') then
         Image1.Picture.LoadFromFile('icn.png')
          else
         Image1.Picture.LoadFromFile(prod.Logo);


          for I := 0 to  prod_on_change.list_of_materials.Count-1 do
          begin
            ListBox2.AddItem(prod_on_change.list_of_materials[i].Title +
            ' '+prod_on_change.list_of_materials[i].Count.ToString+' ед. '   ,
             prod_on_change.list_of_materials[i]) ;

          end;


          for I := 0 to  TMaterial_Class.array_of_material.Count-1 do
          begin
            ListBox1.AddItem(TMaterial_Class.array_of_material[i].Title, TMaterial_Class.array_of_material[i]) ;

          end;




   end;





procedure TForm14.InitForCreateProduct();
 var i:integer;
begin
            for I := 0 to  TMaterial_Class.array_of_material.Count-1 do
          begin
            ListBox1.AddItem(TMaterial_Class.array_of_material[i].Title, TMaterial_Class.array_of_material[i]) ;

          end;
       lm_of_new_product:= TObjectList<TListOfMaterials>.Create;
end;

procedure TForm14.ListBox1DblClick(Sender: TObject);
var scount:String;
 var i:integer;
 var m:TListOfMaterials;
begin

      if not InputQuery('Количетсво материала',
        'Введите количетсво материала:', scount)
      then exit
      else
      begin
         m:= TListOfMaterials.Create;
         m.Article:=  (ListBox1.Items.Objects[ListBox1.ItemIndex]  as TMaterial).Article;
         m.Title:=  (ListBox1.Items.Objects[ListBox1.ItemIndex]  as TMaterial).Title;
         m.Count:=  StrToInt( scount );
         m.In_stock:=  (ListBox1.Items.Objects[ListBox1.ItemIndex]  as TMaterial).In_stock;

         if( ListBox2.Items.Count>0) then
         begin
               for I := 0 to  ListBox2.Items.Count-1 do
          begin
            if (ListBox2.Items.Objects[i] as TListOfMaterials).Article =  m.Article  then

            ListBox2.Items.Delete(i);
          end;

         end;


          ListBox2.AddItem(
          ListBox1.Items[ListBox1.ItemIndex]+' '+scount+' ед. ' ,  m  ) ;

      end;

end;

procedure TForm14.ListBox2DblClick(Sender: TObject);
begin

end;

{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);           // удалить материал из списка 2
begin
  ListBox2.DeleteSelected;
end;

procedure TForm14.Button3Click(Sender: TObject);  // удаление или отмена
begin
       if (modeEdit = True) then
               begin
                 need_delete:=true;
                // mc.sql_delete( 'Supplier' , ' Id '  ,sup_on_change.ID.ToString );
                 ShowMessage('Удалено');
                 Close;
               end

               else
               begin
                   Close;

               end;

end;




procedure TForm14.Button4Click(Sender: TObject); //загрузка картинки
begin
  need_change_foto:=true;
      if OpenPictureDialog1.Execute and
   FileExists(OpenPictureDialog1.FileName) then
   begin
        Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
        ext:= ExtractFileExt(OpenPictureDialog1.FileName);

   end;

end;

procedure TForm14.Button5Click(Sender: TObject);    //удаление картинки
begin
    Image1.Picture:=nil;
    prod_on_change.Logo:='';
    need_change_foto:=true;

end;

procedure TForm14.Button_saveClick(Sender: TObject);  //сохранение
begin
      if(ListBox2.Items.Count = 0 ) then
      begin
        ShowMessage('Список материалов не может быть пустым');
        exit;
      end;

      if not (modeEdit ) then  //если режим создания
       begin
        SaveIcon;
         SaveNewInArrayOfProducts;
         SaveProdInDB;
         SaveMaterialsInDB;

         Inc(TProduct_Class.max_id);

       end
       else
       begin                    //если режим редактирования
         if   (need_change_foto) then  SaveIcon;
         EditInArray;
         UpdateProdInDB;
         UpdateMaterialInDB;




       end;
       ShowMessage('Сохранено');
        Close;

end;

procedure TForm14.SaveNewInArrayOfProducts;
var i:integer;
begin
         new_prod.Article:=(TProduct_Class.max_id +1) ;
         new_prod.Name_:=Edit_name.Text;
         new_prod.Type_:='Игрушка';
         new_prod.Cost:= StrToInt(Edit_selfcost.Text);
         new_prod.Time_:= StrToInt(Edit_time.Text);
         new_prod.Technology:= Memo1.Text;
         new_prod.Logo:= img_name_icon;
         new_prod.In_stock:=0;
         new_prod.WeigthWith:= StrToInt(edit_weigth_with.Text);
         new_prod.WeightWithout :=StrToInt(edit_weigth_without.Text);
         new_prod.Height :=StrToInt(edit_height.Text);
         new_prod.Length :=StrToInt(edit_Length.Text);
         new_prod.Width:=StrToInt(edit_Width.Text);
         new_prod.Standart:=edit_standart.Text;
         new_prod.Sertificate :=img_name_sert;
         new_prod.CostForAgent:=StrToInt(Edit_mincost.Text);


         for I := 0 to   ListBox2.Count-1 do
          begin
             lm_of_new_product.Add(ListBox2.Items.Objects[i] as TListOfMaterials  );

          end;

         new_prod.list_of_materials := lm_of_new_product ;
         TProduct_Class.array_of_products.Add(new_prod);

end;

procedure TForm14.SaveProdInDB;
var arr: array[0..15] of string;
begin
     arr[0]:= (TProduct_Class.max_id +1).ToString;
          arr[1]:=new_prod.Cost.ToString;
           arr[2]:=new_prod.Time_.ToString;
            arr[3]:=new_prod.In_stock.ToString;
             arr[4]:=new_prod.Technology;
              arr[5]:=new_prod.Name_;

                arr[6]:=new_prod.Height.ToString;
                 arr[7]:=new_prod.Width.ToString;
                  arr[8]:=new_prod.Length.ToString;
                  arr[9]:=new_prod.WeigthWith.ToString;
                  arr[10]:=new_prod.WeightWithout.ToString;
                  arr[11]:=new_prod.Sertificate;
                   arr[12]:=new_prod.Standart;
                    arr[13]:=new_prod.CostForAgent.ToString;
                        arr[14]:=new_prod.Type_;
                         arr[15]:=new_prod.Logo;

            mc.sql_insert('Products', arr);

end;



procedure TForm14.SaveMaterialsInDB;
var arr: array[0..2] of string;
var i:integer;
begin
   arr[0]:=  IntToStr(new_prod.Article);
   for I := 0 to   new_prod.list_of_materials.Count-1 do
          begin
           arr[1]:=  IntToStr(new_prod.list_of_materials[i].Article);
           arr[2]:=  IntToStr(new_prod.list_of_materials[i].Count);
           mc.sql_insert(' List_of_materials ', arr);
          end;



end;
procedure TForm14.SaveIcon;
begin


     if  (Image1.Picture.Graphic = nil ) then
      begin
        // agent_after_change.Logo:='icn.png';
        img_name_icon:= 'icn.png';

      end
      else
      begin
         //  ext:=ExtractFileExt(OpenPictureDialog1.FileName);

         img_name_icon:=  'img_prod' + (prod_on_change.Article ).ToString+'.png'    ;



           var MyFolder:= 'images\';
           var Path,FileName: String;
            Path:=ExtractFilePath(ParamStr(0))+MyFolder;
            if ForceDirectories(Path) then
            begin
            img_name_icon:=Path+img_name_icon;

            end;

           Image1.Picture.SaveToFile(img_name_icon);

      end;

end;

end.
