unit My_f;

interface
            uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls;
  function Return_staff(cb:TComboBox):string;
implementation

function Return_staff(cb:TComboBox):string;        //ѕолучение выбранной на форме должности
begin
  if ( cb.ItemIndex=0) then Result:='Manager'
  else Result:='Master';
end;

end.
