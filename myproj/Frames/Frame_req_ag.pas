unit Frame_req_ag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,  Request_Agents_Class ,Request_Info, Requests_agent,  Data.Win.ADODB, Main_Class;

type
  TFrame9 = class(TFrame)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Panel1Click(Sender: TObject);
    //procedure DoList;
  private
   var   RequestInfoWindow: TForm11;
    { Private declarations }
  public
    var Req_on_frame:  TRequest_agent;
        mc:TMain_Class;
        ado_composition:TADOQuery;
         mc2:TMain_Class;
        ado_nameprod:TADOQuery;
         panel:TPanel;
  end;

implementation

{$R *.dfm}

procedure TFrame9.Panel1Click(Sender: TObject);
begin
      RequestInfoWindow:= TForm11.Create(self);
       RequestInfoWindow.Req_on_frame:=Req_on_frame;
       RequestInfoWindow.panel:=panel;
       RequestInfoWindow.Init;
       RequestInfoWindow.ShowModal;
       TRequest_Agents_Class.load_frames(panel,0, TRequest_Agents_Class.array_of_requests_agent.Count-1);


end;

end.
