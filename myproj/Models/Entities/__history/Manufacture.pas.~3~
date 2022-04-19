unit Manufacture;

interface
uses System.Generics.Collections, Product;

type
  TManufacture = class
  private
    FStatus, FLogin_Master: string;
    FID_Manufacture, FID_Agent, FId_production,FId_request_from_agent: integer;
    FDate_Of_Create: TDateTime;
    FDate_Of_Begin: TDateTime;
    FDate_Of_End: TDateTime;

    FPremayment, FDone:boolean;
  //  procedure SetStatus(const Value: string);
  protected
  public
    property Id_production: integer read FId_production write FId_production;
    property Id_request_from_agent: integer read FId_request_from_agent write FId_request_from_agent;
    property ID_Manufacture: integer read FID_Manufacture write FID_Manufacture;
  property Login_Master: string read FLogin_Master write FLogin_Master;

// property Status: string read FStatus write SetStatus;

    property Date_Of_Create: TDateTime read FDate_Of_Create write FDate_Of_Create;
    property Date_Of_Begin: TDateTime read FDate_Of_Begin write FDate_Of_Begin;
    property Date_Of_End: TDateTime read FDate_Of_End write FDate_Of_End;
    property Premayment: boolean read FPremayment write FPremayment;
    property Done: boolean read FDone write FDone;
  var
    // Composition: TObjectList<TProduct>;

  end;

implementation

end.
