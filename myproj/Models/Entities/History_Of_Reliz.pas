unit History_Of_Reliz;

interface

uses DateUtils, Product;

type
  THistory_Of_Reliz = class
  private
    FIDAgent, FCount, FArticleProduct: integer;
    FDate: TDateTime;
    FProduct: TProduct;
  protected
  public
    property IDAgent: integer read FIDAgent write FIDAgent;
    property ArticleProduct: integer read FArticleProduct write FArticleProduct;
    property Product: TProduct read FProduct write FProduct;
    property Date: TDateTime read FDate write FDate;
    property Count: integer read FCount write FCount;
  end;

implementation

end.
