unit Material;

interface

type
  TMaterial = class
  private
     FTitle: string;
  FCost,  FArticle, FIn_stock: integer;
  protected
  public
    property Article: integer read FArticle write FArticle;
    property Cost: integer read FCost write FCost;
    property Title: string read FTitle write FTitle;
    property In_stock: integer read FIn_stock write FIn_stock;

  end;

implementation

end.                        ???????????? ?? ???????? ?????? ??? ?????????
