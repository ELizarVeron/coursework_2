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
    Button2: TButton;
    Label10: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
          var nothing_to_change, need_delete: bool;

  end;

var
  Form5: TForm5;
  agent_on_change: TAgent;
  to_change :string;


implementation

     constructor  TForm5.Create(AOwner: TComponent);
       begin
         inherited;
          nothing_to_change:= true;
          need_delete:=false;

       end;
        procedure TForm5.Button1Click(Sender: TObject); //тут нужно изменять в бд только те записи которые мы изменили
          begin
              to_change:='';
              agent_after_change:= TAgent.Create;
              if NOT(agent_on_change.Name=(Edit1.Text)) then
              begin
                  if (to_change='') then  to_change:= '  Company = '+#39 + Edit1.Text + #39  else  to_change:=to_change+' , Company = '+#39 + Edit1.Text + #39;
                  nothing_to_change:=false;
              end;

              if NOT(agent_on_change.Type_= (Edit2.Text)) then
              begin
                   if (to_change='') then  to_change:= ' Type_  = '+#39 + Edit2.Text + #39  else  to_change:=to_change+' , Type_ = '+#39 + Edit2.Text + #39;
                    nothing_to_change:=false;
              end;

              if NOT(agent_on_change.Boss=Edit3.Text) then
              begin
                    if (to_change='') then  to_change:= ' Director = '+#39 + Edit3.Text + #39  else  to_change:=to_change+' , Director = '+#39 + Edit3.Text + #39;
                      nothing_to_change:=false;
              end;

              if NOT(agent_on_change.Address=(Edit4.Text)) then
              begin
                      if (to_change='') then  to_change:= ' Adress = '+#39 + Edit4.Text + #39  else  to_change:=to_change+' , Adress = '+#39 + Edit4.Text + #39;
                       nothing_to_change:=false;
              end;

              if NOT(agent_on_change.Tel= (Edit5.Text)) then
              begin
                      if (to_change='') then  to_change:= ' Tel = '+#39 + Edit5.Text + #39  else  to_change:=to_change+' , Tel = '+#39 + Edit5.Text + #39;
                      nothing_to_change:=false;
              end;

              if NOT(agent_on_change.Email= (Edit6.Text)) then
              begin
                       if (to_change='') then  to_change:= ' Email = '+#39 + Edit6.Text + #39  else  to_change:=to_change+' , Email = '+#39 + Edit6.Text + #39;
                       nothing_to_change:=false;
              end;


               if NOT(agent_on_change.INN=(Edit7.Text)) then
               begin
                           if (to_change='') then  to_change:= ' INN = '+#39 + Edit7.Text + #39  else  to_change:=to_change+' , INN = '+#39 + Edit7.Text + #39;
                           nothing_to_change:=false;
               end;

                  if NOT(agent_on_change.KPP=StrToInt(Edit8.Text)) then
                begin
                            if (to_change='') then  to_change:= ' KPP = '+#39 + Edit8.Text + #39  else  to_change:=to_change+' , KPP = '+#39 + Edit8.Text + #39;
                             nothing_to_change:=false;
                end;

              if  nothing_to_change then
              begin
                 agent_after_change:=nil;
                Close;

              end
              else
              begin

                 agent_after_change.Name:=Edit1.Text;
                 agent_after_change.Type_:=Edit2.Text;
                 agent_after_change.Boss:=Edit3.Text;
                 agent_after_change.Address:=Edit4.Text;
                 agent_after_change.Tel    := (Edit5.Text);
                 agent_after_change.Email :=Edit6.Text;
                 agent_after_change.INN  :=(Edit7.Text);
                 agent_after_change.KPP  :=StrToInt(Edit8.Text);
                 agent_after_change.ID_ := agent_on_change.ID_;
                 var mc : TMain_class;
                 mc := TMain_class.Create;
                 mc.sql_update('agent',to_change, ' where Id = ' +   agent_on_change.ID_.ToString );
                 ShowMessage('Изменения сохранены');
                 Close;
              end;




          end;

procedure TForm5.Button2Click(Sender: TObject);
begin
               var mc : TMain_class;
                mc := TMain_class.Create;
                need_delete:=true;
                mc.sql_delete('agent', ' ID ' , agent_on_change.ID_.ToString );
                ShowMessage('Удаление успешно');
                Close;
end;

procedure TForm5.Ini(agent:TAgent);
        begin
              agent_on_change:=agent;
              Edit1.Text:=agent.Name;
              Edit2.Text:=agent.Type_;
              Edit3.Text:=agent.Boss;
              Edit4.Text:=agent.address;
              Edit5.Text:=agent.Tel;
              Edit6.Text:=agent.Email;
              Edit7.Text:=agent.INN;
              Edit8.Text:=agent.KPP.ToString;




        end;

procedure TForm5.Label5Click(Sender: TObject);
begin
  end;


{$R *.dfm}

end.
