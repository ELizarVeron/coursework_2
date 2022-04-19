unit CREATE_EDIT_Product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,Main_Class,JPEG, Product_Class,Product,
  Vcl.ExtDlgs, System.Generics.Collections ;

type
  TForm14 = class(TForm)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Edit_name: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    ComboBox_type: TComboBox;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    —тандарт: TLabel;
    Edit_standart: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit_selfcost: TEdit;
    Edit_mincost: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button_loadsert: TButton;
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
    procedure Button_saveClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure SaveNewInArrayOfProducts;
    procedure SaveProdInDB;
    procedure SaveMaterialsInDB;
    procedure SaveIcon;
   // procedure  SaveNewInArrayOfProd;
    //procedure  SaveProdInDB;
  public
         constructor Create( AOwner: TComponent);  override;
        procedure Init(prod:TProduct);
        var   nothing_to_change, nothing_to_change_logo, modeEdit,need_delete:boolean;
        var  prod_after_change:TProduct;
  end;

var
  Form14: TForm14;
  new_prod: TProduct;
  arr: array[0..15] of string;
  img:TJpegImage;
  materials:TObjectList<TMaterial>;
  mc:TRequests;
  prod_on_change:TProduct;
  prod_after_change:TProduct;

  img_name_icon, img_name_sert: string;
  ext:string;

implementation

  constructor TForm14.Create(AOwner: TComponent);
  begin

           mc:=TRequests.Create;
           new_prod:=  TProduct.Create;
           materials:= TObjectList<TMaterial>.Create;

           inherited;

  end;

   procedure TForm14.Init(prod:TProduct);
   begin

        prod_after_change:=  TProduct.Create;
        prod_on_change:= prod;
        Edit_mincost.Text:=prod.CostForAgent.ToString;
        Edit_selfcost.Text:=prod.Cost.ToString;
        Edit_standart.Text:=prod.Standart;
        Edit_time.Text:=prod.Time_.ToString;
        Memo1.Text:=prod.Technology;
        Edit_length.Text:=prod.Length.ToString;
        Edit_height.Text:=prod.Height.ToString;
        Edit_width.Text:=prod.Width.ToString;
        Edit_weigth_with.Text:=prod.WeigthWith.ToString;
        Edit_weigth_without.Text:=prod.WeightWithout.ToString;

        prod_on_change:=prod;

        if(prod.Logo = '') then
         Image1.Picture.LoadFromFile('icn.png')
          else
         Image1.Picture.LoadFromFile(prod.Logo);









   end;





{$R *.dfm}

procedure TForm14.Button3Click(Sender: TObject);  // удаление или отмена
begin
       if (modeEdit = True) then
               begin
                 need_delete:=true;
                // mc.sql_delete( 'Supplier' , ' Id '  ,sup_on_change.ID.ToString );
                 ShowMessage('”далено');
                 Close;
               end

               else
               begin
                   Close;

               end;

end;




procedure TForm14.Button4Click(Sender: TObject); //загрузка картинки
begin
   nothing_to_change_logo:=false;
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
    nothing_to_change:=false;

end;

procedure TForm14.Button_saveClick(Sender: TObject);  //сохранение
begin
      if not (modeEdit ) then  //если режим создани€
       begin
         SaveNewInArrayOfProducts;
         SaveProdInDB;
        // SaveMaterialsInDB;
         Inc(TProduct_Class.max_id);


        Close;



       end
       else
       begin                    //если режим редактировани€





       end;
       ShowMessage('—охранено');
        Close;

end;

procedure TForm14.SaveNewInArrayOfProducts;
begin
       new_prod.Article:=(TProduct_Class.max_id +1) ;
         new_prod.Name_:=Edit_name.Text;
         new_prod.Type_:=ComboBox_type.Text;
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


         new_prod.materials := materials;
         TProduct_Class.array_of_products.Add(new_prod);

end;

procedure TForm14.SaveProdInDB;
begin
     arr[0]:= (TProduct_Class.max_id +1).ToString;
          arr[1]:=new_prod.Cost.ToString;
           arr[2]:=new_prod.Time_.ToString;
            arr[3]:=new_prod.In_stock.ToString;
             arr[4]:=new_prod.Technology;
              arr[5]:=new_prod.Name_;
               arr[6]:=new_prod.Logo;
                arr[7]:=new_prod.Height.ToString;
                 arr[8]:=new_prod.Width.ToString;
                  arr[9]:=new_prod.Length.ToString;
                  arr[10]:=new_prod.WeigthWith.ToString;
                  arr[11]:=new_prod.WeightWithout.ToString;
                  arr[12]:=new_prod.Sertificate;
                   arr[13]:=new_prod.Standart;
                    arr[14]:=new_prod.CostForAgent.ToString;
                        arr[15]:=new_prod.Type_;

            mc.sql_insert('Products', arr);

end;

procedure TForm14.SaveMaterialsInDB;
begin


end;
procedure TForm14.SaveIcon;
begin



end;

end.
