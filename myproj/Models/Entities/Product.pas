unit Product;

interface

uses System.Generics.Collections;



type
  TListOfMaterials = class
   private
    FTile: string;
    FArticle, FCount, FIn_stock: integer;
  protected
  public
    property Article: integer read FArticle write FArticle;
    property Title: string read FTile write FTile;
    property Count: integer read FCount write FCount;
    property In_stock: integer read FIn_stock write FIn_stock;
  end;



type
  TProduct = class
  private
    FName_, FTechnology,FStandart,Ftype,FSertificate,FLogo: string;
    FArticle, FCost, FTime_, FMaterials, FIn_stock,FWeigthWith,
    FWeightWithout,FHeight,FLength,FWidth,FCostForAgent: integer;
  protected
  public

       constructor Create ;

    property Article: integer read FArticle write FArticle;
    property Name_: string read FName_ write FName_;
    property Type_: string read Ftype write Ftype;
    property Cost: integer read FCost write FCost;
    property Time_: integer read FTime_ write FTime_;
    property Technology: string read FTechnology write FTechnology;
      property Logo: string read FLogo write FLogo;

    property In_stock: integer read FIn_stock write FIn_stock;
     property WeigthWith: integer read FWeigthWith write FWeigthWith;
      property WeightWithout: integer read FWeightWithout write FWeightWithout;
       property Height: integer read FHeight write FHeight;
        property Length: integer read FLength write FLength;
         property Width: integer read FWidth write FWidth;

          property Standart: string read FStandart write FStandart;
           property Sertificate: string read FSertificate write FSertificate;
            property CostForAgent: integer read FCostForAgent write FCostForAgent;
    var
    list_of_materials:TObjectList<TListOfMaterials>;

  end;

implementation
  constructor TProduct.Create;
  begin
       list_of_materials:= TObjectList<TListOfMaterials>.Create;

  end;

end.
