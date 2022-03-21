unit Requests_agent;

interface

uses System.Generics.Collections, Product;

type
  TRequest_agent = class
  private
    FStatus, FCompany: string;
    FID_Request, FID_Agent: integer;
    FDate_Of_Create: TDateTime;
    FDate_Of_Confirm: TDateTime;
    FDate_Of_Begin: TDateTime;
    FPremayment, FDone:boolean;
    procedure SetStatus(const Value: string);
  protected
  public
    property ID_Agent: integer read FID_Agent write FID_Agent;
    property ID_Request: integer read FID_Request write FID_Request;
    property Company: string read FCompany write FCompany;

    property Status: string read FStatus write SetStatus;

    property Date_Of_Create: TDateTime read FDate_Of_Create write FDate_Of_Create;
    property Date_Of_Confirm: TDateTime read FDate_Of_Confirm write FDate_Of_Confirm;
    property Date_Of_Begin: TDateTime read FDate_Of_Begin write FDate_Of_Begin;
    property Premayment: boolean read FPremayment write FPremayment;
    property Done: boolean read FDone write FDone;
  var
     Composition: TObjectList<TProduct>;

  end;

implementation

{ TRequest_agent }

procedure TRequest_agent.SetStatus(const Value: string);
begin
  if (Value = '1')or(Value = '�������')  then
      FStatus := '�������'
  else
  if (Value = '2')or(Value = '� �������� ������') then
      FStatus := '� �������� ������'
  else
  if (Value = '3')or(Value ='� ���������') then
      FStatus := '� ���������'
  else
  if (Value = '4')or(Value ='� ������') then
      FStatus := '� ������'
  else
  if (Value = '5')or( Value ='������') then
      FStatus := '������'
  else
  if (Value = '6') or(Value = '� �������� �����������') then
      FStatus := '� �������� �����������'
  else
  if (Value = '7')or(Value ='���������') then
      FStatus := '���������'
  else
       FStatus := '������ � TRequest_Agent'


end;

end.
