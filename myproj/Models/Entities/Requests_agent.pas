unit Requests_agent;

interface

uses System.Generics.Collections, Product,Vcl.Dialogs;

type
  TComposition_req_agent = class
  private
    FArticul: Integer;
    FProduct: TProduct;
    FCount: integer;
    FCost: integer;
  protected
  public
   
  property Count: integer read FCount write FCount;
  property Articul: integer read FArticul write FArticul;
   property Cost: integer read FCost write FCost;
  property Product: TProduct read FProduct write FProduct;

end;


type
  TRequest_agent = class
  private
    FStatus, FCompany: string;
    FID_Request, FID_Agent, FCost: integer;
    FDate_Of_Create: TDateTime;
    FDate_Of_Confirm: TDateTime;
    FDate_Of_Begin: TDateTime;
    FPremayment, FDone:boolean;
    procedure SetStatus(const Value: string);
    
  protected
  public
    constructor Create;
    procedure GetCost;
    property ID_Agent: integer read FID_Agent write FID_Agent;
    property ID_Request: integer read FID_Request write FID_Request;
    property Company: string read FCompany write FCompany;

    property Status: string read FStatus write SetStatus;

    property Date_Of_Create: TDateTime read FDate_Of_Create write FDate_Of_Create;
    property Date_Of_Confirm: TDateTime read FDate_Of_Confirm write FDate_Of_Confirm;
    property Date_Of_Begin: TDateTime read FDate_Of_Begin write FDate_Of_Begin;
    property Premayment: boolean read FPremayment write FPremayment;
    property Done: boolean read FDone write FDone;

     property Cost: integer read FCost write FCost;

  var
     Composition: TObjectList<TComposition_req_agent>;

  end;

implementation

{ TRequest_agent }

constructor TRequest_agent.Create;
begin
     Composition:= TObjectList<TComposition_req_agent>.Create;
  //  Cost:=GetCost;
end;

procedure TRequest_agent.GetCost  ;
var i,sum:integer;  
begin
       sum:=0;
      try
          for  i:= 0 to Composition.Count-1 do
          begin
              sum:= sum+Composition[i].Cost*Composition[i].Count;
          end;
      except              
             ShowMessage('Composition is empty!!');
      end;

     Cost:=sum;

end;

procedure TRequest_agent.SetStatus(const Value: string);
begin
  if (Value = '1')or(Value = 'Создана')  then
      FStatus := 'Создана'
  else
  if (Value = '2')or(Value = 'В ожидании оплаты') then
      FStatus := 'В ожидании оплаты'
  else
  if (Value = '3')or(Value ='В обработке') then
      FStatus := 'В обработке'
  else
  if (Value = '4')or(Value ='В работе') then
      FStatus := 'В работе'
  else
  if (Value = '5')or( Value ='Готова') then
      FStatus := 'Готова'
  else
  if (Value = '6') or(Value = 'В ожидании отправления') then
      FStatus := 'В ожидании отправления'
  else
  if (Value = '7')or(Value ='Завершена') then
      FStatus := 'Завершена'
  else
       FStatus := 'ошибка в TRequest_Agent'


end;

end.
