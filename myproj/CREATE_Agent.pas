unit CREATE_Agent;

interface

uses
  JPEG,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Main_Class, TABLE_Agents, Agent_class,
  Vcl.ExtDlgs;

type
  TForm12 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Image1: TImage;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    procedure SaveInArrayOfAgents;
    procedure SaveInDB;
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  new_agent: TAgent;
  arr: array[0..13] of string;
  img:TJpegImage;
implementation

{$R *.dfm}

  procedure TForm12.Button4Click(Sender: TObject);
begin
         if OpenPictureDialog1.Execute and
    FileExists(OpenPictureDialog1.FileName) then
   Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

end;



procedure TForm12.SaveInArrayOfAgents;
  begin
         new_agent:= TAgent.Create;
         new_agent.Name:=Edit1.Text;
         new_agent.Type_:=ComboBox1.Text;
         new_agent.Address:=Edit2.Text;
         new_agent.INN:=Edit9.Text;
         new_agent.Boss:=Edit5.Text;
         new_agent.Tel:=Edit6.Text;
         new_agent.Email:=Edit7.Text;
         new_agent.Priority:=0;
         new_agent.SUMMA:=0;
         new_agent.Count_s_year:=0;



  end;
    procedure TForm12.SaveInDB;
  begin
          var mc:TMain_class;
          mc:=TMain_class.Create;
          arr[0]:=(TAgent_Class.array_of_agents.Count+1).ToString;
          arr[1]:=new_agent.Name;
           arr[2]:=new_agent.Type_;
            arr[3]:=new_agent.Address;
             arr[4]:=new_agent.INN;
              arr[5]:=new_agent.KPP.ToString;
               arr[1]:=new_agent.Boss;
                arr[1]:=new_agent.Tel;
                 arr[1]:=new_agent.Email;
                //  arr[1]:=new_agent
                 //  arr[1]:=new_agent
                  //  arr[1]:=new_agent
                    // arr[1]:=new_agent



          //mc.sql_insert()



  end;

procedure TForm12.Button1Click(Sender: TObject);
begin




    try
        SaveInArrayOfAgents;
        SaveInDB;
    finally
        Close;
    end;

end;

end.