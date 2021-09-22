unit TABLE_Products;

interface
uses  System.Generics.Collections;
type
      TProduct = class
      private
        FName_, FTechnology:string;
        FArticle,FCost,FTime_,FMaterials,FIn_stock  :integer;
      protected
      public
        property Article: integer read  FArticle write FArticle;
        property Name_: string read FName_ write FName_;
        property Cost: integer read FCost  write FCost ;
        property Time_: integer read FTime_ write FTime_;
        property Technology: string read FTechnology write FTechnology;
        property Materials: integer read FMaterials write FMaterials;
        property In_stock: integer read FIn_stock write FIn_stock;

      end;


implementation

end.
