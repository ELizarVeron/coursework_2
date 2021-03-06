unit INFOProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Product,
  Vcl.ExtDlgs, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Imaging.pngimage;

type
  TForm20 = class(TForm)
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Image1: TImage;
    Стандарт: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    TabSheet3: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    ADOQuery1: TADOQuery;
    ListBox1: TListBox;
    Label12: TLabel;
    Label20: TLabel;
    ADOQuery1id_product: TIntegerField;
    ADOQuery1date_: TDateTimeField;
    ADOQuery1login_manager: TWideStringField;
    ADOConnection1: TADOConnection;
  private
    FProduct:TProduct;
  public
    procedure Init;
    property Product: TProduct read FProduct write FProduct;
  end;

var
  Form20: TForm20;

implementation
procedure TForm20.Init;
var i:integer;
     begin
       if not(Product=nil) then
       begin
       if not (Product.Logo='' ) then
       Image1.Picture.LoadFromFile(Product.Logo)
       else
       Image1.Picture.LoadFromFile('icn.png');


       Label15.Caption:=Product.Name_;

       Label17.Caption:=Product.Standart;
       Label18.Caption:=Product.Cost.ToString;
       Label19.Caption:=Product.CostForAgent.ToString;
        Label20.Caption:=Product.Time_.ToString;
        Label21.Caption:=Product.Length.ToString;
         Label22.Caption:= Product.Width.ToString;
          Label23.Caption:=Product.Height.ToString;
           Label24.Caption:=Product.WeightWithout.ToString;
            Label25.Caption:=Product.WeigthWith.ToString;

        Memo1.Text:=Product.Technology;

        for I := 0 to Product.list_of_materials.Count-1 do
        begin
        ListBox1.Items.Add( Product.list_of_materials[i].Title + ' ' + Product.list_of_materials[i].Count.ToString);

        end;

     end;

    end;
{$R *.dfm}

end.
