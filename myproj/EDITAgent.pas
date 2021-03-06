unit EDITAgent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Generics.Collections,System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Main_Class,Agents,
  Vcl.ExtCtrls, Vcl.ExtDlgs,AddPoints ;

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
    Image1: TImage;
    Button4: TButton;
    Button5: TButton;
    Label11: TLabel;
    ListBox1: TListBox;
    Button3: TButton;
    Button6: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
      procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    FName, FType_: string;
    FPriority, FSale, FTel, FSUMMA, FCount_s_year, FId, FDiscount: integer;
  public
     constructor Create( AOwner: TComponent);  override;
     procedure Init(agent:TAgent);

     procedure SaveALLInDB(agent:TAgent);

       procedure CreatePoint(points: TObjectList<TPoint_>);
       procedure DeletePoint(points: TObjectList<TPoint_>);

      procedure UpdateAgentDB(agent:TAgent);
      procedure DeleteAllPointsDB(id_agent: integer);
      procedure SavePointsDB( id_agent:integer; points: TObjectList<TPoint_>);

      function  SaveIconInComp:String;
      procedure SaveInfoFromForm;

    property Name: string read FName write FName;
    property Type_: string read FType_ write FType_;
    property Priority: integer read FPriority write FPriority;
    property Tel: integer read FTel write FTel;
    property ID: integer read FID write FID;
    var agent_after_change: TAgent;
    var  change,  save_me, change_logo,need_delete, closed, change_points: bool;
    var point: TPoint_;
       points:TObjectList<TPoint_>;
  end;

var
      Form5: TForm5;
      agent_on_change: TAgent;
      ext,to_change :string;
      mc:TMain_class;
      arr : array[0..8] of string;
      i:integer;
implementation

     constructor  TForm5.Create(AOwner: TComponent);
       begin
         inherited;
          change:= false;
          change_points:=false;
          change_logo:=false;
          need_delete:=false;
          closed:=false;
          mc:=TMain_class.Create;
       end;

 procedure TForm5.Init(agent:TAgent);
        begin
             agent_on_change:=agent;
              Edit1.Text:=agent.Name;
              Edit2.Text:=agent.Type_;
              Edit3.Text:=agent.Boss;
              Edit4.Text:=agent.address;
              Edit5.Text:=agent.Tel;
              Edit6.Text:=agent.Email;
              Edit7.Text:=agent.INN;
              Edit8.Text:=agent.KPP ;

                if (agent_on_change.Logo = '') then
                Image1.Picture.LoadFromFile('icn.png')
                else
                Image1.Picture.LoadFromFile(agent_on_change.Logo);

               if (agent_on_change.points.Count>0) then
               begin
                   for var  i:= 0 to agent_on_change.points.Count-1 do
                begin
                        ListBox1.Items.Add( '"'+ agent_on_change.points[i].Name + '" ' + agent_on_change.points[i].City + ' ' + agent_on_change.points[i].Street + ' ' + Inttostr(agent_on_change.points[i].House) + ' ' + Inttostr(agent_on_change.points[i].Flat)   );

                end;
               end;
                 agent_after_change:= TAgent.Create;

               for i := 0 to agent.points.Count-1 do
                begin
                  agent_after_change.points.Add(agent.points[i]);
                end;
        end;

 procedure TForm5.SaveInfoFromForm;
    begin
                 agent_after_change.ID_:=agent_on_change.ID_;
                 agent_after_change.Name:=Edit1.Text;
                 agent_after_change.Type_:=Edit2.Text;
                 agent_after_change.Boss:=Edit3.Text;
                 agent_after_change.Address:=Edit4.Text;
                 agent_after_change.Tel  := (Edit5.Text);
                 agent_after_change.Email :=Edit6.Text;
                 agent_after_change.INN  :=(Edit7.Text);
                 agent_after_change.KPP  := (Edit8.Text);
                 agent_after_change.ID_ := agent_on_change.ID_;
    end;

               /////////////////save
  procedure TForm5.Button1Click(Sender: TObject); //??? ????? ???????? ? ?? ?????? ?? ?????? ??????? ?? ????????
          begin

             save_me:=true;
             SaveInfoFromForm;  //?????? ? ?????
             if  (change_logo) then     //?????? ??????????? ? ?????
             begin
              agent_after_change.Logo:= SaveIconInComp;
             end
             else
             begin
               agent_after_change.Logo:= agent_on_change.Logo;
             end;

             DeleteAllPointsDB(agent_after_change.Id_);
             SaveALLInDB(agent_after_change);

              ShowMessage('?????????');
              Close;
          end;

procedure TForm5.SaveALLInDB(agent:TAgent);
begin
UpdateAgentDB(agent);
SavePointsDB(agent.ID_, agent_after_change.points);
end;

function TForm5.SaveIconInComp;        //????????? ?????? ? ???? ? ?????????? ?? ????
  begin

     if  (Image1.Picture.Graphic = nil ) then
      begin
        // agent_after_change.Logo:='icn.png';
        result:= 'icn.png';

      end
      else
      begin
           ext:=ExtractFileExt(OpenPictureDialog1.FileName);
           var  img_name:=  'img_agent' + ( agent_on_change.ID_ ).ToString+ext;
           var MyFolder:= 'images\';
           var Path,FileName: String;
            Path:=ExtractFilePath(ParamStr(0))+MyFolder;
            if ForceDirectories(Path) then
            begin
            img_name:=Path+img_name;

            end;

           Image1.Picture.SaveToFile(img_name);
           result:=img_name;
      end;

  end;

      procedure TForm5.CreatePoint( points: TObjectList<TPoint_> );
      begin
             change_points:=true;
             var WAP: TForm16;
             WAP:=TForm16.Create(self);
             Wap.ShowModal;
             var point: TPoint_;
             point:=Wap.point;
             points.Add(point);
             ListBox1.Items.Add( '"'+ point.Name + '" ' + point.City + ' ' + point.Street + ' ' + Inttostr(point.House) + ' ' + Inttostr(point.Flat)   );


      end;

        procedure TForm5.SavePointsDB( id_agent:integer;points: TObjectList<TPoint_> );
      begin
              if  (change_points) and (points.Count>0)  then
              begin
                      for var i := 0 to  points.Count-1 do
                  begin
                       arr[0]:=id_agent.ToString;
                       arr[1]:=points[i].City;
                       arr[2]:=points[i].Street;
                       arr[3]:=points[i].Flat.ToString;
                       arr[4]:=points[i].Building.ToString;
                       arr[5]:=points[i].Index_.ToString;
                       arr[6]:=points[i].Tel;
                       arr[7]:=points[i].Name;
                       arr[8]:=points[i].House.ToString;
                       mc.sql_insert('points', arr );

                  end;

              end;
      end;



     procedure TForm5.DeletePoint(points: TObjectList<TPoint_>);
     begin

         if( ListBox1.ItemIndex = (-1)) then exit;

          change_points:=true;
          var index:= ListBox1.ItemIndex;
          var str:= ListBox1.Items[index];

        var s:= copy(str, 2, length(str) - 1);     //??????? ?????? ???????
        var x:=pos( '"' , s);
        s:=copy( s, 1, x-1 ) ;   //s ??? ?????
        for var i := 0 to  points.Count-1 do
        begin
            if  points[i].Name=s then
            begin
               points.Delete(i);
            break;

            end;
        end;
        ListBox1.DeleteSelected;
     end;

     procedure TForm5.DeleteAllPointsDB(id_agent: integer);
     begin

                 mc.sql_delete( 'points' , ' Id_agent '  , id_agent.ToString );
     end;



procedure TForm5.Button3Click(Sender: TObject); //???????? ?????  ? ?????? ? ? ??????
begin
          CreatePoint(agent_after_change.points);
end;

procedure TForm5.Button6Click(Sender: TObject); //???????? ?????
begin
        DeletePoint(agent_after_change.points);
end;


procedure TForm5.Button2Click(Sender: TObject); //delete agent
begin
      need_delete:=true;
      mc.sql_delete( 'agent' , ' ID '  ,  agent_on_change.ID_.ToString );
      ShowMessage('???????');
      Close;

end;


procedure TForm5.Button4Click(Sender: TObject);       //?????? ???????? ????????
 var ext,img_name:string;
begin

   change_logo:=true;
   if OpenPictureDialog1.Execute and
   FileExists(OpenPictureDialog1.FileName) then
   begin
        Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
        ext:= ExtractFileExt(OpenPictureDialog1.FileName);
   end;

end;

procedure TForm5.Button5Click(Sender: TObject);   //???????? ????????
begin
    Image1.Picture:=nil;
    agent_on_change.Logo:='';
    change:=true;

end;

 procedure TForm5.UpdateAgentDB(agent:TAgent);
 begin
          to_change:='';

              if NOT(agent.Name=(Edit1.Text)) then
              begin
                  if (to_change='') then  to_change:= '  Company = '+#39 + Edit1.Text + #39  else  to_change:=to_change+' , Company = '+#39 + Edit1.Text + #39;
                  change:=true;
              end;

              if NOT(agent.Type_= (Edit2.Text)) then
              begin
                   if (to_change='') then  to_change:= ' Type_  = '+#39 + Edit2.Text + #39  else  to_change:=to_change+' , Type_ = '+#39 + Edit2.Text + #39;
                   change:=true;
              end;

              if NOT(agent.Boss=Edit3.Text) then
              begin
                    if (to_change='') then  to_change:= ' Director = '+#39 + Edit3.Text + #39  else  to_change:=to_change+' , Director = '+#39 + Edit3.Text + #39;
                      change:=true;
              end;

              if NOT(agent.Address=(Edit4.Text)) then
              begin
                      if (to_change='') then  to_change:= ' Adress = '+#39 + Edit4.Text + #39  else  to_change:=to_change+' , Adress = '+#39 + Edit4.Text + #39;
                       change:=true;
              end;

              if NOT(agent.Tel= (Edit5.Text)) then
              begin
                      if (to_change='') then  to_change:= ' Tel = '+#39 + Edit5.Text + #39  else  to_change:=to_change+' , Tel = '+#39 + Edit5.Text + #39;
                      change:=true;
              end;

              if NOT(agent.Email= (Edit6.Text)) then
              begin
                       if (to_change='') then  to_change:= ' Email = '+#39 + Edit6.Text + #39  else  to_change:=to_change+' , Email = '+#39 + Edit6.Text + #39;
                       change:=true;
              end;


               if NOT(agent.INN=(Edit7.Text)) then
               begin
                           if (to_change='') then  to_change:= ' INN = '+#39 + Edit7.Text + #39  else  to_change:=to_change+' , INN = '+#39 + Edit7.Text + #39;
                           change:=true;
               end;

                  if NOT(agent.KPP= (Edit8.Text)) then
                begin
                            if (to_change='') then  to_change:= ' KPP = '+#39 + Edit8.Text + #39  else  to_change:=to_change+' , KPP = '+#39 + Edit8.Text + #39;
                             change:=true;
                end;


                 if  (change_logo)  then
                 begin

                        if (to_change='') then  to_change:= ' Logo = '+#39 + agent_after_change.Logo + #39  else  to_change:=to_change+' , Logo = '+#39 + agent.Logo + #39;


                 end;
                 if  change   then
                 mc.sql_update('agent',to_change, ' where Id = ' +   agent.ID_.ToString );
 end;

procedure TForm5.Label5Click(Sender: TObject);
begin
  end;


{$R *.dfm}

end.
