unit Agents;

interface

uses History_Of_Reliz, System.Generics.Collections, AddPoints;

type
  TAgent = class
  private
    FName,FBoss,FAddress,FEmail, FTel, FType_ ,FINN,FKPP,FLogo: string;
    FPriority, FSale, FSUMMA, FCount_s_year, FId, FDiscount: integer;
    Fhave_to_change_priority:boolean;
  protected
  public
    property Discount: integer read FDiscount write FDiscount;
    property ID_: integer read FId write FId;
        property INN: string read FINN write FINN;
            property KPP: string read FKPP write FKPP;
    property Name: string read FName write FName;
        property Boss: string read FBoss write FBoss;
          property Address: string read FAddress write FAddress;
             property Email: string read FEmail write FEmail;
    property Type_: string read FType_ write FType_;
    property Priority: integer read FPriority write FPriority;
    property Sale: integer read FSale write FSale;
    property Tel: string read FTel write FTel;
    property Logo: string read FLogo write FLogo;
    property SUMMA: integer read FSUMMA write FSUMMA;
    // сумма реализации продукции за весь период
    property Count_s_year: integer read FCount_s_year write FCount_s_year;
    function get_checks():boolean;
    property have_to_change_priority: boolean read get_checks  write    Fhave_to_change_priority;


    function get_sale(c: integer): integer;
      constructor Create ;

  var
    history_of_reliz: TObjectList<THistory_Of_Reliz>;
    points:TObjectList<TPoint_>;
    on_change_priority: boolean;
  end;

implementation


 constructor TAgent.Create();
 begin
     points:=TObjectList<TPoint_>.Create;


 end;


function TAgent.get_checks: boolean;
begin

end;

function TAgent.get_sale(c: integer): integer;
begin

  if c >= 50000 then
    result := 25
  else if ((c < 500000) and (c >= 150000)) then
    result := 20
  else if ((c < 150000) and (c >= 50000)) then
    result := 10
  else if ((c < 50000) and (c >= 10000)) then
    result := 5
  else if c < 10000 then
    result := 0;
end;

end.
