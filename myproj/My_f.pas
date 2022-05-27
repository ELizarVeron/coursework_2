unit My_f;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls;
function Return_staff(cb: TComboBox): string;

 function Returt_NameOfStatusReq(i:string):integer;

     function Return_IDOfStatusMan(i:string):integer;
implementation

function Return_staff(cb: TComboBox): string;
// Получение выбранной на форме должности
begin
  if (cb.ItemIndex = 0) then
    Result := 'Manager'
  else
    Result := 'Master';
end;

  function Returt_NameOfStatusReq(i:string):integer;
  begin
        if i='Создана' then result:=1
        else   if i='В ожидании оплаты' then result:= 2
          else   if i='В обработке' then result:=  3
           else    if i='В работе' then result:=    4
            else    if i='Готова' then result:=      5
             else    if i='Ожидает отправления' then result:=6
              else    if i='Завершена' then result:=       7;



  end;
    function Returt_NameOfStatusMan(i:integer):string;
  begin
        if i=1 then result:='Создано'
        else   if i= 2 then result:= 'В процессе'
          else   if i= 3 then result:=  'Завершено'



  end;
    function Return_IDOfStatusMan(i:string):integer;
  begin
        if i='Создано' then result:=1
        else   if i='В процессе' then result:= 2
          else   if i='Завершено' then result:=  3




  end;


end.
