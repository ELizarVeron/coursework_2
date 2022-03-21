unit INFOSupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Supplier,Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids;

type
  TForm19 = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit_name: TEdit;
    Edit_type: TEdit;
    Edit_inn: TEdit;
    Edit_rate: TEdit;
    Label12: TLabel;
    DBGrid1: TDBGrid;
    ADOTable2: TADOTable;
    DataSource1: TDataSource;
  private
     FSup:TSupplier;
  public
  property Sup: TSupplier read FSup write FSup;
  procedure Init;
  end;

var
  Form19: TForm19;

implementation
procedure TForm19.Init;
     begin
       if not(sup=nil) then
       begin
              Edit_name.Text:=sup.Title;
              Edit_type.Text:=sup.Type_;
              Edit_inn.Text:=sup.INN;
              Edit_rate.Text:=sup.Rate.ToString;

       end;


     end;


{$R *.dfm}

end.
