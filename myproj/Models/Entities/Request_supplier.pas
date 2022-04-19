unit Request_supplier;

interface

uses  Material;

type
  TRequest_supplier = class
  private
    FCompany,FStatus: string;
    FID_Request, FID_Sup,FArticleMaterial,FCount: integer;
       FDate_Of_Create: TDateTime;
       FDone:boolean;
       FMaterial:TMaterial;
  protected
  public
   constructor create;
    property ID_Sup: integer read FID_Sup write FID_Sup;
    property ID_Request: integer read FID_Request write FID_Request;
     property Status: string read FStatus write FStatus;
      property Date_Of_Create: TDateTime read FDate_Of_Create write FDate_Of_Create;
          property Company: string read FCompany write FCompany;

          property  Material: TMaterial read  FMaterial write  FMaterial;
             property Count: integer read  FCount write  FCount;


  end;

implementation

{ TRequest_supplier }

constructor TRequest_supplier.create;
begin
      FMaterial:=TMaterial.Create;
end;

end.
