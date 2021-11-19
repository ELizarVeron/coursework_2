unit Frame_agents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, EDITAgent, Vcl.Menus, TABLE_Agents;

type
  TFrame3 = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Label8: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;


    procedure N1Click(Sender: TObject);

  private

    { Private declarations }
  public
     AgentOnFrame: TAgent;
     AgentID: integer;
     procedure AddData;

    constructor Create(AOwner: TComponent); override;

    { Public declarations }
  end;

implementation
uses  Main_Class,Agent_Class;
constructor TFrame3.Create(AOwner: TComponent);
begin
  inherited;

end;
{$R *.dfm}

procedure TFrame3.N1Click(Sender: TObject);        //РЕДАКТИРОВАНИЕ
begin



     var EWin : TForm5;  //окно редактирования
       begin
       EWin := TForm5.Create ( nil );
       EWin.ini(AgentOnFrame);
       EWin.ShowModal;
       if  not(EWin.agent_after_change = nil) then
       begin
       AgentOnFrame:=EWin.agent_after_change;
       AddData;
       end;


   end;

   var i:integer;
   for  i:=0 to TAgent_Class.array_of_agents.Count-1 do
    begin
         if (TAgent_Class.array_of_agents[i].ID_=AgentId) then
           TAgent_Class.array_of_agents[i]:=EWin.agent_after_change;

    end;

end;

procedure TFrame3.AddData ;
begin
      AgentID:= AgentOnFrame.ID_;
      Label1.Caption := AgentOnFrame.Type_;
      Label2.Caption := AgentOnFrame.Name;
      Label5.Caption := AgentOnFrame.Tel.ToString;
      Label4.Caption := AgentOnFrame.Count_s_year.ToString +
      Label4.Caption;
      Label3.Caption := AgentOnFrame.Discount.ToString + '%';
      Label7.Caption := AgentOnFrame.Priority.ToString;
      Label8.Caption := Label8.Caption + AgentOnFrame.SUMMA.ToString;
end;




end.
