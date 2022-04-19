unit INFOManufacture;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Manufacture ;

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
  private
    { Private declarations }
  public
    procedure Init(man:TManufacture);
  end;

var
  Form24: TForm24;
  manufacture :TManufacture;
implementation

{$R *.dfm}

{ TForm24 }

procedure TForm24.Init(man:TManufacture);
var i:integer;
  begin
     manufacture:=man;
     LabelData.Caption:=DateToStr( man.Date_Of_Create);
     LabelProd.Caption:=man.Name_production;
     LabelCount.Caption:=man.Count.ToString;
     LabelId.Caption:=man.ID_Manufacture.ToString;





  end;

end.
