unit EDITProduct;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Product,
  Vcl.ExtDlgs, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;


type
  TForm25 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Стандарт: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button3: TButton;
    Edit10: TEdit;
    TabSheet3: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    TabSheet4: TTabSheet;
    Label11: TLabel;
    Label13: TLabel;
    DBGrid1: TDBGrid;
    OpenPictureDialog1: TOpenPictureDialog;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Label15: TLabel;
  private
    FProduct:TProduct;
  public
    procedure Init;
    property Product: TProduct read FProduct write FProduct;
  end;

var
  Form25: TForm25;

implementation

{$R *.dfm}

{ TForm25 }

procedure TForm25.Init;
begin
          if not(Product=nil) then
       begin
       Edit1.Text:=Product.Name_;
      // Label16.Caption:=Product.Type_;
        Edit2.Text:=Product.Standart;
        Edit3.Text:=Product.Cost.ToString;
        Edit4.Text:=Product.CostForAgent.ToString;

      //  Label20.Caption:=Product.Length.ToString;
        // Label21.Caption:= Product.Width.ToString;
          //Label22.Caption:=Product.Height.ToString;
           //Label23.Caption:=Product.WeightWithout.ToString;
            //Label24.Caption:=Product.WeigthWith.ToString;

        Memo1.Text:=Product.Technology;



        ADOQuery1.Active := false;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add(' Select * from History_of_cost where id_product =:id   ');
        ADOQuery1.Parameters.ParamByName('id').Value:=Product.Article;
        ADOQuery1.Active := true;



    end;
    end;

end.
