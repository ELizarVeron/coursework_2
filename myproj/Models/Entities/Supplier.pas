unit Supplier;

interface

uses System.Generics.Collections,MAterial;

type
  THistory_of_supply = class
  private
    FDate: TDateTime;
    FIDSupplier, FCount: integer;
  protected
  public
    property IDSupplier: integer read FIDSupplier write FIDSupplier;
    property Date: TDateTime read FDate write FDate;
    property Count: integer read FCount write FCount;


end;

type
  TSupplier = class
  private
    FTitle: string;
    FID: integer;
    FINN: string;
     FRate: integer;
    FType_, FLogo, Ftel,FEmail: string;
  protected
  public
    property Title: string read FTitle write FTitle;
    property ID: integer read FID write FID;
    property Rate: integer read FRate write FRate;
    property INN: string read FINN write FINN;
    property Type_: string read FType_ write FType_;
    property Logo: string read FLogo write FLogo;
    property Tel: string read FTel write FTel;
    property Email: string read FEmail write FEmail;
    var history_of_: TObjectList<THistory_of_supply>;
    var materials: TObjectList<TMaterial>;
  end;


  implementation
 end.


