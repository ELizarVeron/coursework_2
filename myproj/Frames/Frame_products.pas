unit Frame_products;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,   Product,    INFOProduct,   Vcl.Imaging.pngimage,    Vcl.Menus                            ;

type
  TFrame6 = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image1: TImage;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure Panel1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    productOnFrame :TProduct;
    procedure ShowInfo;
    procedure AppData;
  end;

implementation
   uses CREATE_EDIT_Product;
{$R *.dfm}

procedure TFrame6.AppData;
begin
 if (productOnFrame.Logo = '') then

      Image1.Picture.Graphic.LoadFromFile('icn.png')
      else
      Image1.Picture.Graphic.LoadFromFile(productOnFrame.Logo);
      Label1.Caption := productOnFrame.Article.ToString;
     Label2.Caption := productOnFrame.Name_;
    Label7.Caption := productOnFrame.CostForAgent.ToString;
end;

procedure TFrame6.N1Click(Sender: TObject);
begin
   //редакт
     var
        Form14: TForm14;
        Form14 := TForm14.Create(self);
        Form14.modeEdit:=true;
        Form14.InitForEdit(productOnFrame);
        Form14.ShowModal;
        AppData;
end;

procedure TFrame6.Panel1Click(Sender: TObject);
begin
  ShowINFO;
end;

procedure TFrame6.ShowINFO ;
 begin
     var PINFO: TForm20;
     PINFO:=TForm20.Create(self);
     PINFO.Product:=productOnFrame;
     PINFO.Init;
     PINFO.Show;

 end;

end.
