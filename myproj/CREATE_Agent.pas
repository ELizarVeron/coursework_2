unit CREATE_Agent;

interface

uses
  JPEG,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections ,Vcl.StdCtrls, Vcl.ExtCtrls, Main_Class, Agents, Agent_class,
  Vcl.ExtDlgs , AddPoints, StrUtils;

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
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure SaveInArrayOfAgents;
    procedure SaveInDB;
    procedure SavePointsInDB;
    procedure SaveIcon;

  public
     constructor Create( AOwner: TComponent);  override;
  end;

var
  Form12: TForm12;
  new_agent: TAgent;
  arr: array[0..12] of string;
  img:TJpegImage;
  points:TObjectList<TPoint_>;
  mc:TMain_class;

  img_name: string;
  ext:string;
implementation

{$R *.dfm}
  constructor TForm12.Create(AOwner: TComponent);
  begin

           mc:=TMain_class.Create;
           new_agent:= TAgent.Create;
           points:=TObjectList<TPoint_>.Create;
           inherited;

  end;

  procedure TForm12.Button2Click(Sender: TObject);     //????????? ????? ??????
begin
       var WAP: TForm16;
       WAP:=TForm16.Create(self);
       Wap.ShowModal;
       var point: TPoint_;
       point:=Wap.point;
       points.Add(point);

       ListBox1.Items.Add( '"'+ point.Name + '" ' + point.City + ' ' + point.Street + ' ' + Inttostr(point.House) + ' ' + Inttostr(point.Flat)   );


end;

procedure TForm12.Button3Click(Sender: TObject);   //??????? ?????
begin

        var index:= ListBox1.ItemIndex;
        var str:= ListBox1.Items[index];

        var s:= copy(str, 2, length(str) - 1);     //??????? ?????? ???????
        var x:=pos( '"' , s);
        s:=copy( s, 1, x-1 ) ;   //s ??? ?????
        for var i := 0 to points.Count-1 do
        begin

            if points[i].Name=s then
            points.Delete(i);
            exit;

        end;
        ListBox1.DeleteSelected;



end;

procedure TForm12.Button4Click(Sender: TObject);    //???????? ????????
begin
   if OpenPictureDialog1.Execute and
   FileExists(OpenPictureDialog1.FileName) then
   begin
        Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
   ext:= ExtractFileExt(OpenPictureDialog1.FileName);
   end;

   

end;



procedure TForm12.Button5Click(Sender: TObject);  //??????? ????????
begin
       Image1.Picture:=nil;
end;


procedure TForm12.SavePointsInDB;
var arr2: array[0..8] of string;
begin

        for var i := 0 to new_agent.points.Count-1 do
        begin
             arr2[0]:=new_agent.ID_.ToString;
             arr2[1]:=new_agent.points[i].City;
             arr2[2]:=new_agent.points[i].Street;
             arr2[3]:=new_agent.points[i].Flat.ToString;
             arr2[4]:=new_agent.points[i].Building.ToString;
             arr2[5]:=new_agent.points[i].Index_.ToString;
             arr2[6]:=new_agent.points[i].Tel;
             arr2[7]:=new_agent.points[i].Name;
             arr2[8]:=new_agent.points[i].House.ToString;



              mc.sql_insert('points', arr2 );



        end;






end;





procedure TForm12.SaveInArrayOfAgents;
  begin
         new_agent.ID_:=(TAgent_Class.max_id +1) ;
         new_agent.Name:=Edit1.Text;
         new_agent.Type_:=ComboBox1.Text;
         new_agent.Address:=Edit2.Text;
         new_agent.INN:=Edit9.Text;
         new_agent.KPP:= (Edit4.Text);
         new_agent.Boss:=Edit5.Text;
         new_agent.Tel:=Edit6.Text;
         new_agent.Email:=Edit7.Text;

         new_agent.Logo:= img_name;

         new_agent.Priority:=0;
         new_agent.SUMMA:=0;
         new_agent.Count_s_year:=0;
         new_agent.Discount:=0;


         new_agent.points:=points;
         TAgent_Class.array_of_agents.Add(new_agent);

  end;
    procedure TForm12.SaveInDB;
  begin
          arr[0]:= (TAgent_Class.max_id +1).ToString;
          arr[1]:=new_agent.Name;
           arr[2]:=new_agent.Type_;
            arr[3]:=new_agent.Address;
             arr[4]:=new_agent.INN;
              arr[5]:=new_agent.KPP ;
               arr[6]:=new_agent.Boss;
                arr[7]:=new_agent.Tel;
                 arr[8]:=new_agent.Email;
                  arr[9]:=new_agent.Logo;
                  arr[10]:=new_agent.Priority.ToString;
                  arr[11]:=new_agent.Count_s_year.ToString;
                  arr[12]:=new_agent.Discount.ToString;
            mc.sql_insert('Agent', arr);

  end;


   procedure TForm12.SaveIcon;
  begin
            img_name:=  'img_agent' + (TAgent_Class.max_id +1).ToString+ext;
            var MyFolder:= 'images\';
            var Path,FileName: String;

          Path:=ExtractFilePath(ParamStr(0))+MyFolder;
          if ForceDirectories(Path) then
          begin
          img_name:=Path+img_name;

          end;
   Image1.Picture.SaveToFile(img_name);
     if  (Image1.Picture.Graphic = nil ) then
      begin
         new_agent.Logo:='icn.png';
      end
      else
      begin
          new_agent.Logo:=img_name;
      end;

  end;


procedure TForm12.Button1Click(Sender: TObject);    //??????????
begin
        SaveInArrayOfAgents;
        SaveInDB;
        Inc(TAgent_Class.max_id);
        SavePointsInDB;

        Close;


end;

end.
