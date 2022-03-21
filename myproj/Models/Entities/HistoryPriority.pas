unit HistoryPriority;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    procedure Filtr(agent_id:integer);
    { Public declarations }
  end;

var
  Form6: TForm6;
    AgentID:integer;
implementation
       procedure TForm6.Filtr(agent_id:integer);
     begin
         ADOTable1.Filter:= ' ID_agent like '  +   agent_id.ToString;
          ADOTable1.Filtered:=true;
            AgentID:=agent_id;
          if ADOTable1.IsEmpty then
          DBGrid1.Visible:=false
          else
          begin
               DBGrid1.Visible:=true;


          end;


     end;
{$R *.dfm}

end.
