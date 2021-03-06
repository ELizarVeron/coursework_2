unit INFOAgent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls, Vcl.ExtCtrls, Agents  ,ADDPoints   ;

type
  TForm17 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image1: TImage;
    Label11: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ListBox1: TListBox;
    Edit_Name: TEdit;
    Edit_Type: TEdit;
    Edit_Boss: TEdit;
    Edit_Address: TEdit;
    Edit_Tel: TEdit;
    Edit_Email: TEdit;
    Edit_INN: TEdit;
    Edit_LPP: TEdit;
    Edit_Count: TEdit;
    Edit_Sale: TEdit;
    Edit_Priority: TEdit;
    procedure ListBox1DblClick(Sender: TObject);
  private
   FAgent: TAgent;
  public
     property Agent: TAgent read FAgent write FAgent;
    procedure Init;
  end;

var
  Form17: TForm17;

implementation

     procedure TForm17.Init;
     begin
       if not(agent=nil) then
       begin
           Edit_Name.Text:=agent.Name;
           Edit_Type.Text:=agent.Type_;
           Edit_Boss.Text:=agent.Boss;
           Edit_Address.Text:=agent.Address;
           Edit_Tel.Text:=agent.Tel;
           Edit_Email.Text:=agent.Email;
           Edit_INN.Text:=agent.INN;
           Edit_LPP.Text:=agent.KPP;
           Edit_Count.Text:=agent.Count_s_year.ToString;
           Edit_sale.Text:=agent.Sale.ToString;
           Edit_priority.Text:=agent.Priority.ToString;


               if (agent.Logo = '') then
                Image1.Picture.LoadFromFile('icn.png')
                else
                Image1.Picture.LoadFromFile(agent.Logo);

               if (agent.points.Count>0) then
               begin
                var s:string;
                for var  i:= 0 to agent.points.Count-1 do
                begin

                       s:= '"'+ agent.points[i].Name + '" ' + agent.points[i].City + ' ' + agent.points[i].Street + ' ' +  (agent.points[i].House) + ' ' +  (agent.points[i].Flat) ;
                       ListBox1.Items.AddObject(s,agent.points[i]);
                end;

               end;


       end;


     end;


{$R *.dfm}

procedure TForm17.ListBox1DblClick(Sender: TObject);

//point:TPoint_;
begin
  // point:=  ListBox1.Items.Objects [ ListBox1.ItemIndex ]    as TPoint_;
 //  IP := TForm22.Create(self);
 //  IP.Init( point ) ;
  // IP.Show;

end;

end.
