unit INFOManufacture;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Manufacture, Product_Class , Product, Material_Class,INFOManufacture2,Main_Class;

type
  TForm24 = class(TForm)
    LabelData: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LabelProd: TLabel;
    LabelCount: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Label9: TLabel;
    LabelId: TLabel;
    ListBox1: TListBox;
    Label11: TLabel;
    Label12: TLabel;
    LabelNeed: TLabel;
    LabelHave: TLabel;
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;        Rect: TRect; State: TOwnerDrawState);
    procedure Button1Click(Sender: TObject);
  private
    countlfag:integer;
  public
    procedure Init(man:TManufacture);
  end;

var
  Form24: TForm24;
  manufacture :TManufacture;
  product:TProduct;
implementation

{$R *.dfm}

{ TForm24 }

procedure TForm24.Button1Click(Sender: TObject);  //?????? ????????????
var FORM26: TForm26;
var count_now:integer;
var count_after:integer;
var i:integer;
begin


     FORM26:=TForm26.Create(self);
     manufacture.Status:='? ????????';
     FORM26.Init(manufacture);
     var s:=   '  Status = '+'2' + ' , Date_Of_Begin = ' + QuotedStr( FormatDateTime('dd.mm.yyyy hh:nn:ss ', Now)) ;
     mc.sql_update(' manufacture ', s, 'where id_manufacture =  ' + manufacture.ID_Manufacture.ToString );

     for i:=0 to product.list_of_materials.Count-1 do
       begin
           count_now:=product.list_of_materials[i].In_stock;
           count_after:=count_now - product.list_of_materials[i].Count;
            mc.sql_update('Material','In_stock = '+  count_after.ToString, ' where Article =  '+ product.list_of_materials[i].Article.ToString )  ;

       end;



     form26.Show;
     Close;
end;

procedure TForm24.Init(man:TManufacture);
var i:integer;
  begin
     mc:=TMain_class.Create( );
     manufacture:=man;
     LabelData.Caption:=DateToStr( man.Date_Of_Create);
     LabelProd.Caption:=man.Name_production;
     LabelCount.Caption:=man.Count.ToString;
     LabelId.Caption:=man.ID_Manufacture.ToString;
     product:= TProduct.Create;
     for   i := 0 to  TProduct_Class.array_of_products.Count-1 do
  begin
     if (man.Id_production =  TProduct_Class.array_of_products[i].Article   ) then
     begin
        product:=  TProduct_Class.array_of_products[i];

     end;

  end;


    ListBox1.Clear;
    var lm: TListOfMaterials;                                 //??? ?? ??? ?????? ???? ?????????? ???? ?? ??????????

    for I := 0 to product.list_of_materials.Count-1 do
    begin
      ListBox1.AddItem(product.list_of_materials[i].Title,  product.list_of_materials[i]) ;
      lm:=  ListBox1.Items.Objects[i] as TListOfMaterials;

      if(lm.In_stock<lm.Count) then
      Button1.Enabled:=false;

    end;

      // ListBox1.Repaint;





  end;

procedure TForm24.ListBox1Click(Sender: TObject);
var lm: TListOfMaterials;
begin
      if( ListBox1.ItemIndex=-1 ) then exit;

      lm:=  ListBox1.Items.Objects[ ListBox1.ItemIndex] as TListOfMaterials;

      labelNeed.Caption:= lm.Count.ToString;
      labelHave.Caption:=lm.In_stock.ToString;

end;

 procedure TForm24.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
  var i:integer;
  var lm: TListOfMaterials;
begin {
  if(countlfag= (Control as TListBox).Count ) then exit;
 ShowMessage('?????????');
 lm:=    ListBox1.Items.Objects[ Index] as TListOfMaterials;
 with (Control as TListBox).Canvas do
  begin
           if( lm.In_stock<lm.Count )then
           begin
                 FillRect(Rect);

                Font.Style := [fsBold];
            TextOut(Rect.Left, Rect.Top, (Control as TListBox).Items[Index]);
           end
           else
           begin
                  FillRect(Rect);

            Font.Style := [ ];
            TextOut(Rect.Left, Rect.Top, (Control as TListBox).Items[Index]);
           end;







  end;
    DrawFocusRect(ListBox1.Canvas.Handle, Rect);
  inc(countlfag);      }
end;

end.
