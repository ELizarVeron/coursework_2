unit Frame_manufacture;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Manufacture, INFOManufacture;

type
  TFrame_manufact = class(TFrame)
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
     Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    labelName: TLabel;
    labelCount: TLabel;
    procedure Panel1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
     var Man_on_frame:  TManufacture;
         panel:TPanel;

  end;

implementation

{$R *.dfm}

procedure TFrame_manufact.Panel1DblClick(Sender: TObject);
var WInfoManufacture: TForm24;
begin
        WInfoManufacture:=TForm24.Create(self);
        WInfoManufacture.Init(Man_on_frame);
        WInfoManufacture.Show;


end;

end.