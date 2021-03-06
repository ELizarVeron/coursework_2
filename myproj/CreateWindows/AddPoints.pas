unit AddPoints;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls ;


 type
  TPoint_ = class
  private
    FBuilding, FFlat ,FHouse ,FCity,FStreet,FTel ,FName  : string;
    FID,FAgentID, FIndex_ : integer;
  protected
  public

     class var max_id:integer;
    // property  ID: integer read FID write FID;
    property AgentID: integer read FAgentID write FAgentID;
    property City: string read FCity write FCity;
     property Name: string read FName write FName;
    property Street: string read FStreet write FStreet;
    property Tel: string read FTel write FTel;
    property Flat: string read FFlat write FFlat;
    property Building: string read FBuilding write FBuilding;
    property Index_: integer read FIndex_ write FIndex_;
    property House: string read FHouse write FHouse;
  end;


type
  TForm16 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    ButtonSave: TButton;
    Label6: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    procedure ButtonSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
     function CreatePoint(): TPoint_;
     var point: TPoint_;
  end;



var
  Form16: TForm16;

implementation

{$R *.dfm}


 function TForm16.CreatePoint(): TPoint_;
 begin
      var point:= TPoint_.Create;

      point.Name:=Edit1.Text;
      point.City:=Edit2.Text;
      point.Street:=Edit3.Text;
      point.House:= ( Edit4.Text );
      point.Building:= ( Edit5.Text );
      point.Index_:=strtoint( Edit7.Text );
      point.Flat := ( Edit6.Text );
      point.Tel:=Edit8.Text;
      result:=point;

 end;


procedure TForm16.ButtonSaveClick(Sender: TObject);
begin
    point:= CreatePoint();
    Close;
end;




end.



