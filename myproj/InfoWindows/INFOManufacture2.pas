unit INFOManufacture2;

interface

uses
  Winapi.Windows, Data.Win.ADODB,Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Manufacture, Product_Class , Product, Material_Class, Main_Class ,DateUtils,
  Vcl.ExtCtrls;

type
  TForm26 = class(TForm)
    LabelData: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LabelProd: TLabel;
    LabelCount: TLabel;
    Label9: TLabel;
    LabelId: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Init(man:TManufacture);
      procedure InitDone(man:TManufacture);
  end;

var
  Form26: TForm26;
  manufacture :TManufacture;
  tim,i:integer;
  mc:TMain_Class;
implementation

{$R *.dfm}

{ TForm26 }

procedure TForm26.Button1Click(Sender: TObject);
 var
       ADOCon: TADOConnection;
       ADO: TADOQuery;
       lpText,lpCaption : PChar;
       Tip ,res: integer;
  begin
        lpText := 'Подтвердите завершение производства';
        lpCaption := 'Предупреждение';
        Tip := MB_YESNO;

         with Application do
        begin

          res:=  MessageBox(lpText, lpCaption, Tip) ;

         end;

        if (res = 6 )then    //da
        begin
              ADOCon := TADOConnection.Create(nil);
              ADOCon.LoginPrompt := false;
              ADOCon.Provider := 'Microsoft.Jet.OLEDB.4.0';
              ADOCon.ConnectionString :=
              'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Курсовая\1111.mdb;Persist Security Info=False;';
             ADO := TADOQuery.Create(self);
             ADO.Connection := ADOCon;
             ADO.Active := false;
             ADO.SQL.Clear;
             ADO.SQL.Add(' Select * from Manufacture where Id_request_from_agent =  ' + manufacture.Id_request_from_agent.ToString +
             ' and ( Status = 1 or Status = 2 ) ' );
             ADO.Active := true;

             if(ADO.IsEmpty ) then
             begin
             ADO.Active := false;
             ADO.SQL.Clear;
             ADO.SQL.Add(' Update request_from_agent set Status = 5 where Id_request_agent =    ' + manufacture.Id_request_from_agent.ToString );

             ADO.ExecSQL;


             end;



             var s:=   '  Status = '+'3' + ' , Date_Of_End = ' + QuotedStr( FormatDateTime('dd.mm.yyyy hh:nn:ss ', Now)) ;
             mc.sql_update(' manufacture ', s, 'where id_manufacture =  ' + manufacture.ID_Manufacture.ToString );
             manufacture.Status:='Завершена';
             Close;

        end




end;
procedure TForm26.Init(man: TManufacture);
begin
        Timer1.Enabled:=true;
        manufacture:=man;

       tim:=  SecondsBetween( Now,   manufacture.Date_Of_Begin    );  //разница между сейчас и (дата создания+72часа)
      mc:=TMain_class.Create( );

     LabelData.Caption:=DateToStr( man.Date_Of_Create);
     LabelProd.Caption:=man.Name_production;
     LabelCount.Caption:=man.Count.ToString;
     LabelId.Caption:=man.ID_Manufacture.ToString;




end;
procedure TForm26.InitDone(man: TManufacture);
begin

     manufacture:=man;
     LabelData.Caption:=DateToStr( man.Date_Of_Create);
     LabelProd.Caption:=man.Name_production;
     LabelCount.Caption:=man.Count.ToString;
     LabelId.Caption:=man.ID_Manufacture.ToString;
     label3.Visible:=false;
     Button1.Visible:=false;

end;

procedure TForm26.Timer1Timer(Sender: TObject);
var
  H, M, S, D: Integer;
 t:Integer;
begin
       tim := tim + 1; //
  // Тут вывод на экран
  D:=  tim div 86400; //тут целые дни
  var ost:= tim mod 86400 ;
  H:= ost div 3600;   //целые часы
  ost:= ost mod 3600;
  M:=  ost div 60; //целые минуты
  S:=ost mod 60;

  Label4.Caption :=  'Дней:'+ IntToStr (D)+ ' Часов: '+ IntToStr (H ) + ' Минут: ' + IntToStr (M ) + ' Секунд:' + IntToStr (S );


end;

end.
