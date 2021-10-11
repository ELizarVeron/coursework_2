unit TABLE_Agents;

interface
     uses TABLE_History_Of_Reliz,System.Generics.Collections;
type
      TAgent = class
      private
        FName, FType_:string;
        FPriority, FSale, FTel,FSUMMA,FCount_s_year,FId,FDiscount:integer;
      protected
      public
       property Discount: integer read  FDiscount write FDiscount;
        property ID_: integer read  FId write FId;
        property Name: string read FName write FName;
        property Type_: string read FType_ write FType_;
        property Priority: integer read FPriority write FPriority;
        property Sale: integer read FSale write FSale;
        property Tel: integer read FTel write FTel;
        property SUMMA: integer read FSUMMA write FSUMMA;     //сумма реализации продукции за весь период
        property Count_s_year: integer read FCount_s_year write FCount_s_year;
        function get_sale(c:integer):integer;
        var history_of_reliz :TObjectList<THistory_Of_Reliz>;
      end;

implementation
         function TAgent.get_sale(c:integer):integer;
              begin

                 if  c>=50000 then result:=25
                 else if ((c<500000) and (c>=150000)) then result:=20
                 else if ((c<150000) and (c>=50000)) then result:=10
                  else if ((c<50000) and (c>=10000)) then result:=5
                  else if c<10000 then result:=0;
              end;
end.
