unit INFOProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Product,
  Vcl.ExtDlgs, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TForm20 = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
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
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button3: TButton;
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
     begin
       if not(Product=nil) then
       begin

       

     end;

    end;
{$R *.dfm}

end.
