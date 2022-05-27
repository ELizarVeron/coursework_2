unit Frame_manufacture;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Manufacture, INFOManufacture, INFOManufacture2;

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
    procedure AppData;
  private
    { Private declarations }
  public
     var Man_on_frame:  TManufacture;
         panel:TPanel;

  end;

implementation

{$R *.dfm}

procedure TFrame_manufact.AppData;
begin
       Label8.Caption :=  Man_on_frame.ID_Manufacture.ToString;
       Label4.Caption :=  DateTimeToStr(Man_on_frame.Date_Of_Create);
       Label6.Caption := Man_on_frame.Status;
       Label8.Caption :=  Man_on_frame.ID_Manufacture.ToString;
       LabelCount.Caption :=  Man_on_frame.Count.ToString;
       LabelName.Caption:= Man_on_frame.Name_production;
       panel:=Panel1;

end;

procedure TFrame_manufact.Panel1DblClick(Sender: TObject);
var WInfoManufacture: TForm24;
var WInfoManufacture2: TForm26;
begin
        if( Man_on_frame.Status ='�������' ) then
        begin

        WInfoManufacture:=TForm24.Create(self);
        WInfoManufacture.Init(Man_on_frame);
        WInfoManufacture.ShowModal;


        end
        else
             if( Man_on_frame.Status ='� ��������' ) then
        begin

        WInfoManufacture2:=TForm26.Create(self);
        WInfoManufacture2.Init(Man_on_frame);
        WInfoManufacture2.ShowModal;


        end
        else
             if( Man_on_frame.Status ='���������' ) then
        begin

        WInfoManufacture2:=TForm26.Create(self);
        WInfoManufacture2.InitDone(Man_on_frame);

        WInfoManufacture2.ShowModal;


        end;

     AppData;

end;

end.
