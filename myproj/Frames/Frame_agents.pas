unit Frame_agents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, EDITAgent, HistoryRelizAgent,HistoryPriority, Vcl.Menus, Agents,Agent_Class, INFOAgent;

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
    N2: TMenuItem;
    N3: TMenuItem;
    CheckBox1: TCheckBox;
    N4: TMenuItem;


    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ShowINFO;
    procedure Panel1DblClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);

  private

    { Private declarations }
  public
     AgentOnFrame: TAgent;
     AgentID: integer;
     panel:TPanel;
     cheked:bool;

     var arr: array[0..5] of string;
     procedure AddData;

    constructor Create(AOwner: TComponent); override;

    { Public declarations }
  end;

implementation
uses  Main_Class, Win_Manager;
  var i:integer;
procedure TFrame3.CheckBox1Click(Sender: TObject);
begin
    AgentOnFrame.on_change_priority:=CheckBox1.Checked;

end;

constructor TFrame3.Create(AOwner: TComponent);
begin
  inherited;
   mc:=TMAin_class.Create;
    cheked:=true;
    if cheked  then
              CheckBox1.Enabled:=true;
end;
procedure TFrame3.Image1Click(Sender: TObject);
begin

end;

{$R *.dfm}

procedure TFrame3.N1Click(Sender: TObject);        //??????????????
begin



     var EWin : TForm5;  //???? ??????????????
       begin
       EWin := TForm5.Create ( self );
       EWin.init(AgentOnFrame);
       EWin.ShowModal;

       if (EWin.need_delete=true) then
         begin
              var i,k:integer;
               k:=TAgent_Class.array_of_agents.Count-1;
                 for  i:=0 to (k) do
                  begin
                       if (TAgent_Class.array_of_agents[i].ID_=AgentId) then
                       begin
                               TAgent_Class.array_of_agents.Delete(i);
                               break;
                       end;

                  end;
          TAgent_Class.load_frames(panel,0,TAgent_Class.array_of_agents.Count-1);     //???????????? ?????? ? ???????? ????? ???????? 1 ??? ??????

         end;

                      //???? ???? ???????? ??? ?? ? ?????? ??? ? ?????? ??? ? ????????   ? ???? ??????? ????? ??????????
       if  (EWin.save_me )and ((EWin.change = true ) or (EWin.change_points = true )or (EWin.change_logo = true )) then
       begin
       AgentOnFrame:=EWin.agent_after_change;
       AddData;           //?????? ????? ?????????????
                  var i:integer;
                 for  i:=0 to TAgent_Class.array_of_agents.Count-1 do      //? ??? ???????? ??? ???? ? ?????? ???????
                  begin
                       if (TAgent_Class.array_of_agents[i].ID_=AgentId) then
                         TAgent_Class.array_of_agents[i]:=EWin.agent_after_change;

                  end;



       end;


   end;



end;

procedure TFrame3.N2Click(Sender: TObject);
begin                                                //??????? reliz?
          var HRWin: TForm7;
          HRWin:=TForm7.Create(self);
          HRWin.Filtr(AgentID);
          HRWin.Show;
end;

procedure TFrame3.N3Click(Sender: TObject);
begin                                                       //??????? priority

          var HPWin: TForm6;
          HPWin:=TForm6.Create(self);
          HPWin.Filtr(AgentID);
          HPWin.Show;

end;

procedure TFrame3.N4Click(Sender: TObject);           //????? ??????????
 var s:string;
 new_priority:integer;
begin
          InputQuery('????? ??????????', '???????? ????????? ??:',s);
           if TryStrToInt(s,new_priority) and (new_priority>=0 ) and (new_priority<=10 )  then
           begin
               for  i:=0 to TAgent_Class.array_of_agents.Count-1 do      //
                  begin
                       if (TAgent_Class.array_of_agents[i].on_change_priority) then
                       begin
                              arr[3]:=  IntToStr(TAgent_Class.array_of_agents[i].Priority);   //?????? ????????
                              TAgent_Class.array_of_agents[i].Priority:= StrToInt(s);
                              TAgent_Class.array_of_agents[i].on_change_priority:= false; //?????? ???????
                              mc.sql_update(' agent ' , ' Priority = ' + s , ' where id =  ' +    TAgent_Class.array_of_agents[i].ID_.ToString  )  ;
                              arr[0]:=  TAgent_Class.array_of_agents[i].ID_.ToString;
                              arr[1]:=  TForm4.login;
                              arr[2]:=  FormatDateTime('dd.mm.yyyy', Now);
                              arr[4]:=  s; //????? ????????

                              if(StrToInt(arr[3]) < StrToInt( arr[4])) then     //???? ?????? ?????? ??????
                              arr[5]:= ' + ' +   IntToStr ( (StrToInt(arr[4]) - StrToInt( arr[3])))
                               else
                              arr[5]:= ' - ' +   IntToStr ( (StrToInt(arr[3]) - StrToInt( arr[4]))) ;

                            mc.sql_insert( ' History_of_priority ' , arr);



                       end;

                  end;

                                   //???? ???????? ? ?? ???????
              TAgent_Class.load_frames(panel,0,TAgent_Class.array_of_agents.Count-1);   //???????? ??????? ????? ????? ???????????
             ShowMessage('????????? ??????? ?????????');


           end
           else
            ShowMessage('????????? ??? ???? ?? 0 ?? 10');
end;

procedure TFrame3.Panel1DblClick(Sender: TObject);
begin
            ShowINFO;
end;

procedure TFrame3.PopupMenu1Popup(Sender: TObject);
 var  flag: boolean;
begin
        flag:=false;
        for  i:=0 to TAgent_Class.array_of_agents.Count-1 do      //
                  begin
                       if (TAgent_Class.array_of_agents[i].on_change_priority) then
                       begin
                             flag:=true;
                       end;

                  end;
        if(flag) then PopupMenu1.Items.Items[3].Enabled:=true
        else  PopupMenu1.Items.Items[3].Enabled:=false;

end;

procedure TFrame3.AddData ;     //???????? ?????? ? ???????? ?????? ?? ?????? ????????????? ? ??????
begin
      AgentID:= AgentOnFrame.ID_;
      Label1.Caption := AgentOnFrame.Type_;
      Label2.Caption := AgentOnFrame.Name;
      Label5.Caption := AgentOnFrame.Tel;
      Label4.Caption := AgentOnFrame.Count_s_year.ToString +
      Label4.Caption;
      Label3.Caption := AgentOnFrame.Discount.ToString + '%';
      Label7.Caption := AgentOnFrame.Priority.ToString;
      Label8.Caption := Label8.Caption + AgentOnFrame.SUMMA.ToString;
      if (AgentOnFrame.Logo = '') then

       Image1.Picture.Graphic.LoadFromFile('icn.png')
      else
      Image1.Picture.Graphic.LoadFromFile(AgentOnFrame.Logo);

      CheckBox1.Checked:=AgentOnFrame.on_change_priority;
end;

 procedure TFrame3.ShowINFO ;
 begin
     var AINFO: TForm17;
     AINFO:=TForm17.Create(self);
     AINFO.Agent:=AgentOnFrame;
     AINFO.Init;
     AINFO.Show;

 end;


end.
