unit Frame_sup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,TABLE_Suppliers,
  Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,INFOSupplier, Vcl.Menus;

type
  TFrame5 = class(TFrame)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure Panel1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    procedure  ShowINFO;
    procedure  AddData;
    var FsupplierOnFrame: TSupplier;
  public
   panel:TPanel;
     property supplierOnFrame: TSupplier read FsupplierOnFrame write FsupplierOnFrame;
  end;

implementation

{$R *.dfm}
uses  CREATE_EDIT_Supplier,Supplier_Class;

procedure TFrame5.N1Click(Sender: TObject);  //редактирование
begin
  var   EWin: TForm13;
        EWin := TForm13.Create(self);
        EWin.modeEdit:=true;

        EWin.nothing_to_change:=true;
        EWin.init(supplierOnFrame);
        EWin.ShowModal;
         if (EWin.need_delete=true) then
         begin

                     var i,k:integer;
                        k:=TSupplier_Class.array_of_suppliers.Count-1;
                 for  i:=0 to (k) do
                  begin
                       if (TSupplier_Class.array_of_suppliers[i].ID= sup_on_change.ID ) then
                       begin
                               TSupplier_Class.array_of_suppliers.Delete(i);
                               break;

                       end;

                  end;
          TSupplier_Class.load_frames(panel,0,TSupplier_Class.array_of_suppliers.Count-1);     //перезагрузка панели с фреймами после удаления 1 ого фрейма
          exit;
         end;

                      //если было изменено что то
       if  (EWin.nothing_to_change = false )   then
       begin
       supplierOnFrame:=EWin.sup_after_change;
       AddData;           //просто фрейм перезагрузили
                  var i:integer;
                 for  i:=0 to TSupplier_Class.array_of_suppliers.Count-1 do      //а тут добавили эту инфу в массив агентов
                  begin
                       if (TSupplier_Class.array_of_suppliers[i].ID = supplierOnFrame.ID ) then
                         TSupplier_Class.array_of_suppliers[i]:=EWin.sup_after_change;

                  end;



       end;



end;

procedure TFrame5.Panel1Click(Sender: TObject);
begin
  ShowINFO;
end;

procedure TFrame5.AddData ;     //загрузка данным в элементы фрейма
begin
      //AgentID:= AgentOnFrame.ID_;


     Label2.Caption := supplierOnFrame.Title;
     Label4.Caption := supplierOnFrame.Type_;
     Label6.Caption := supplierOnFrame.INN;
     label11.Caption:= supplierOnFrame.Rate.ToString;


end;

procedure TFrame5.ShowINFO ;
 begin
     var SINFO: TForm19;
     SINFO:=TForm19.Create(self);
     SINFO.Sup:=supplierOnFrame;
     SINFO.Init;
     SINFO.Show;

 end;

end.
