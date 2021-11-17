unit EDITAgent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Main_Class,TABLE_Agents;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    FName, FType_: string;
    FPriority, FSale, FTel, FSUMMA, FCount_s_year, FId, FDiscount: integer;
  public
     constructor Create( AOwner: TComponent);  override;
     procedure Ini(agent:TAgent);
    property Name: string read FName write FName;
    property Type_: string read FType_ write FType_;
    property Priority: integer read FPriority write FPriority;
    property Tel: integer read FTel write FTel;
     property ID: integer read FID write FID;
     var agent_after_change: TAgent;
  end;

var
  Form5: TForm5;
    agent_on_change: TAgent;
   to_change :string;


implementation

     constructor  TForm5.Create(AOwner: TComponent);
       begin
         inherited;


       end;
        procedure TForm5.Button1Click(Sender: TObject); //��� ����� �������� � �� ������ �� ������ ������� �� ��������
          begin
              to_change:='';
              if NOT(agent_on_change.Name=(Edit1.Text)) then
               if (to_change='') then  to_change:= '  Company = '+#39 + Edit1.Text + #39  else  to_change:=to_change+' , Company = '+#39 + Edit1.Text + #39;

              if NOT(agent_on_change.Type_= (Edit2.Text)) then
               if (to_change='') then  to_change:= ' Type_  = '+#39 + Edit2.Text + #39  else  to_change:=to_change+' , Type_ = '+#39 + Edit2.Text + #39;

              if NOT(agent_on_change.Boss=Edit3.Text) then
               if (to_change='') then  to_change:= ' Director = '+#39 + Edit3.Text + #39  else  to_change:=to_change+' , Director = '+#39 + Edit3.Text + #39;

              if NOT(agent_on_change.Address=(Edit4.Text)) then
               if (to_change='') then  to_change:= ' Adress = '+#39 + Edit4.Text + #39  else  to_change:=to_change+' , Adress = '+#39 + Edit4.Text + #39;

              if NOT(agent_on_change.Tel=StrToInt(Edit5.Text)) then
               if (to_change='') then  to_change:= ' Tel = '+#39 + Edit5.Text + #39  else  to_change:=to_change+' , Tel = '+#39 + Edit5.Text + #39;

              if NOT(agent_on_change.Email= (Edit6.Text)) then
               if (to_change='') then  to_change:= ' Email = '+#39 + Edit6.Text + #39  else  to_change:=to_change+' , Email = '+#39 + Edit6.Text + #39;

             if NOT(agent_on_change.INN=StrToInt(Edit7.Text)) then
               if (to_change='') then  to_change:= ' INN = '+#39 + Edit7.Text + #39  else  to_change:=to_change+' , INN = '+#39 + Edit7.Text + #39;

                if NOT(agent_on_change.KPP=StrToInt(Edit8.Text)) then
               if (to_change='') then  to_change:= ' KPP = '+#39 + Edit8.Text + #39  else  to_change:=to_change+' , KPP = '+#39 + Edit8.Text + #39;

             agent_after_change:= TAgent.Create;
             agent_after_change.Name:=Edit1.Text;
             agent_after_change.Type_:=Edit2.Text;
             agent_after_change.Boss:=Edit3.Text;
             agent_after_change.Address:=Edit4.Text;
             agent_after_change.Tel    :=STRtoINT(Edit5.Text);
             agent_after_change.Email :=Edit6.Text;
             agent_after_change.INN  :=StrToInt(Edit7.Text);
             agent_after_change.KPP  :=StrToInt(Edit8.Text);

             var mc : TMain_class;
             mc := TMain_class.Create;
             mc.sql_update('agent',to_change, ' where Id = ' +   agent_on_change.ID_.ToString ) ;

             ShowMessage('��������� ���������');


             Close;

          end;

procedure TForm5.Ini(agent:TAgent);
        begin
              agent_on_change:=agent;
              Edit1.Text:=agent.Name;
              Edit2.Text:=agent.Type_;
              Edit3.Text:=agent.Boss;
              Edit4.Text:=agent.address;
              Edit5.Text:=agent.Tel.ToString;
              Edit6.Text:=agent.Email;
              Edit7.Text:=agent.INN.ToString;
              Edit8.Text:=agent.KPP.ToString;




        end;

procedure TForm5.Label5Click(Sender: TObject);
begin

end;

{$R *.dfm}

end.