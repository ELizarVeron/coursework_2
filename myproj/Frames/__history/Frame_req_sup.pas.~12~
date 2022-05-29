unit Frame_req_sup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,  Request_Sup_Class ,Request_Info, Request_supplier,  EDITRequestSup;

type
  TFrame4 = class(TFrame)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FrameDblClick(Sender: TObject);
  private
    { Private declarations }
  public
  procedure Appdata;
       var Req_on_frame:  TRequest_supplier;
         panel:TPanel;
  end;

implementation

{$R *.dfm}

procedure TFrame4.Appdata;
begin
   Label1.Caption :=Req_on_frame.Company;
         Label4.Caption :=  DateTimeToStr(Req_on_frame.Date_Of_Create);
         Label6.Caption := Req_on_frame.Status;
         Label8.Caption :=  Req_on_frame.ID_Request.ToString;
         Label10.Caption:= Req_on_frame.Material.Title;
end;

procedure TFrame4.FrameDblClick(Sender: TObject);
var EditWindow:TFormEditReqSup;
begin
    EditWindow:=TFormEditReqSup.Create(nil);
    EditWindow.Init(Req_on_frame);
    EditWindow.ShowModal;
    if(EditWindow.receipt) then
    begin
       Req_on_frame.Status:='Завершена';


    end;
    TRequest_Sup_Class.load_frames(panel,0, TRequest_Sup_Class.array_of_requests_sup.Count);

end;

end.
