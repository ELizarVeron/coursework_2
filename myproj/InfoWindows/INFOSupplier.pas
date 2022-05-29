unit INFOSupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Supplier,Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst;

type
  TForm19 = class(TForm)
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit_name: TEdit;
    Edit_type: TEdit;
    Edit_inn: TEdit;
    Edit_rate: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
              ListBox1.Clear;
               var i:integer;
               var title:string;
               for I := 0 to  sup.materials.Count-1 do
            begin
                title:= sup.materials.Items[i].Title;
                ListBox1.Items.Add(title);

            end;

       end;


     end;


{$R *.dfm}

procedure TForm19.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Destroy;
end;

end.
