unit BD_class;

interface

uses                       //потом сотри лишнее
 System.Generics.Collections,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Frame_agents, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Fr_ag;


type
   Tdata_from_bd = class (TObject)

  public


  constructor Create();

  protected

      ADOConnection1: TADOConnection;
      ADOQuery1: TADOQuery;
      ADOQuery2: TADOQuery;
        ADOQuery3: TADOQuery;
      procedure Connect(ADOCOnnection1:TADOCOnnection);
      procedure NewDataSet (SQL: String);  virtual; abstract;
  private

    end;

implementation
constructor Tdata_from_bd.Create;    //конструктор
     begin
     ADOQuery1:= TADOQuery.Create(nil);
     ADOQuery2:= TADOQuery.Create(nil);
     ADOQuery3:= TADOQuery.Create(nil);
     ADOConnection1:=TADOConnection.Create(nil);
     Connect(ADOConnection1);
        inherited;
     end;

procedure Tdata_from_bd.Connect(ADOCOnnection1:TADOCOnnection); //подготовка
begin
 ADOCOnnection1.LoginPrompt:=false;
 ADOCOnnection1.Provider:= 'Microsoft.Jet.OLEDB.4.0';
 ADOCOnnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Курсовая\Database2.mdb;Persist Security Info=False;';
 ADOQuery1.Connection:=ADOConnection1;
 ADOQuery1.Active := false; // отключаем запрос, если он был включен
 ADOQuery1.SQL.Clear; // удаление предыдущего текста запроса
 ADOQuery2.Connection:=ADOConnection1;

 ADOQuery3.Connection:=ADOConnection1;
 ADOQuery3.Active := false; // отключаем запрос, если он был включен
 ADOQuery3.SQL.Clear; // удаление предыдущего текста запроса

end;

end.
