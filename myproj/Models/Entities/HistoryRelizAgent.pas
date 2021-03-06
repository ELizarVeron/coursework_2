unit HistoryRelizAgent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Menus, Create_RelizAgent,
  Vcl.ComCtrls, Vcl.DBCGrids, Agent_Class;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Filtr(agent_id:integer);
  end;

var
  Form7: TForm7;
  AgentID:integer;
implementation
     procedure TForm7.Filtr(agent_id:integer);
     begin
         ADOTable1.Filter:= ' ID_Agent like '  +   agent_id.ToString;
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

procedure TForm7.Button1Click(Sender: TObject);       //????????
begin
   ADOTable1.Active:=false;
   ADOTable1.Active:=true;

  var create_reliz: TForm8;
  create_reliz := TForm8.Create(nil);
  create_reliz.id:=AgentID;
  create_reliz.tbl:=ADOTable1;
  create_reliz.ShowModal ;

// ADOTable1.Active:=false;
 //ADOTable1.Active:=true;
   ADOtable1.Requery();
    ADOTable1.Active:=false;
   ADOTable1.Active:=true;
    DBGrid1.Visible:=true;

end;

procedure TForm7.Button2Click(Sender: TObject);    //????????
begin
       DBGrid1.SelectedRows.CurrentRowSelected := true;

        Var X: word;
      X := MessageDlg('??????? ???????', MTConfirmation, [MBYes, MBNo], 0);
       If X = mrYes then
       begin
             //   ShowMessage(DBGrid1.SelectedRows.Items[1]);
           DBGrid1.SelectedRows.Delete;
       end;

end;

end.
