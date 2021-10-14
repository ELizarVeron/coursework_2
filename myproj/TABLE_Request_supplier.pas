unit TABLE_Request_supplier;

interface

uses System.Generics.Collections, TABLE_Materials;

type
  TRequest_supplier = class
  private
    FStatus: string;
    FID_Request, FID_Sup: integer;

  protected
  public
    Composition: TObjectList<TMaterial>;
    property ID_Sup: integer read FID_Sup write FID_Sup;
    property ID_Request: integer read FID_Request write FID_Request;

  end;

implementation

end.
