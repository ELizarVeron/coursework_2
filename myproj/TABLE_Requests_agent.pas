unit TABLE_Requests_agent;

interface

uses System.Generics.Collections, TABLE_Products;

type
  TRequest_agent = class
  private
    FStatus, FCompany: string;
    FID_Request, FID_Agent: integer;
    FDate_Of_Create: TDateTime;
  protected
  public

    property ID_Agent: integer read FID_Agent write FID_Agent;
    property ID_Request: integer read FID_Request write FID_Request;
      property Company: string read FCompany write FCompany;
    property Status: string read FStatus write FStatus;
    property Date_Of_Create: TDateTime read FDate_Of_Create write FDate_Of_Create;
  var
     Composition: TObjectList<TProduct>;

  end;

implementation

end.
