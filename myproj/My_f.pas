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
// ��������� ��������� �� ����� ���������
begin
  if (cb.ItemIndex = 0) then
    Result := 'Manager'
  else
    Result := 'Master';
end;

  function Returt_NameOfStatusReq(i:string):integer;
  begin
        if i='�������' then result:=1
        else   if i='� �������� ������' then result:= 2
          else   if i='� ���������' then result:=  3
           else    if i='� ������' then result:=    4
            else    if i='������' then result:=      5
             else    if i='������� �����������' then result:=6
              else    if i='���������' then result:=       7;



  end;
    function Returt_NameOfStatusMan(i:integer):string;
  begin
        if i=1 then result:='�������'
        else   if i= 2 then result:= '� ��������'
          else   if i= 3 then result:=  '���������'



  end;
    function Return_IDOfStatusMan(i:string):integer;
  begin
        if i='�������' then result:=1
        else   if i='� ��������' then result:= 2
          else   if i='���������' then result:=  3




  end;


end.
