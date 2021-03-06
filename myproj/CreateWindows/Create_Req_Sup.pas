unit Create_Req_Sup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,Generics.Collections, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids,Main_Class, Data.Win.ADODB;

type
  TForm23 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    ButtonCreate: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ButtonCreateClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
   constructor Create( AOwner: TComponent);  override;
   procedure GetMaterials;
   procedure ReloadSups;
  end;

var
  Form23: TForm23;
  mc:TMain_class;
  ado,ado2:TADOQuery;
  id_sup: integer;
  arr: array[0..6] of string;
  id_materials: Tlist<string>;
  cost_materials: Tlist<integer>;
implementation
constructor TForm23.Create(AOwner: TComponent);
begin
  inherited;
  id_materials:=  Tlist<string>.Create;
   cost_materials:= Tlist<integer>.Create;
  mc:=TMain_class.Create;
  GetMaterials;
  ReloadSups;


end;

procedure TForm23.ComboBox1Change(Sender: TObject); //????????? ? ???????? ??????????
begin
      ReloadSups;

end;

procedure TForm23.DBGrid1CellClick(Column: TColumn);
begin
     id_sup:=DBGrid1.DataSource.DataSet.Fields.Fields[0].Value;

end;

procedure TForm23.Edit1Change(Sender: TObject);
begin
   label5.Caption:= ( StrToInt(Edit1.Text)*cost_materials[ ComboBox1.ItemIndex ] ).ToString ;
end;

procedure TForm23.GetMaterials;
begin
   ado:=mc.sql_select('*', 'material' ,'',' order by Title ',false  );
    while not ado.Eof do
    begin
        ComboBox1.Items.Add(ado.Fields[1].AsString);
        id_materials.Add(ado.Fields[0].AsString);
        cost_materials.Add(ado.Fields[3].AsInteger);
        ado.Next;
    end;
    ComboBox1.ItemIndex:=0;
end;

procedure TForm23.ReloadSups;
var s:string;
begin


      s :=ComboBox1.Items[ComboBox1.ItemIndex];

      ADOQuery1.Filtered:=false;
      ADOQuery1.Filter:='  Material.Title=  ' + QuotedStr(s);
      ADOQuery1.Filtered:=true;
      ADOQuery1.Active:=true;
      if not ( DBGrid1.DataSource.DataSet.Fields.Fields[0].Value = null)   then
      id_sup:= DBGrid1.DataSource.DataSet.Fields.Fields[0].Value;
end;

procedure TForm23.ButtonCreateClick(Sender: TObject);
var k:integer;
begin
     if(Edit1.Text='') then exit;

     var next_id:integer;
      ado2:= mc.sql_select('*' , 'Request_for_supplier' , ' ' ,'  order by ID_request_sup desc ', false );
      next_id:=ado2.Fields[0].AsInteger+1;
     arr[0]:=next_id.ToString;
     arr[1]:=id_sup.ToString;
     arr[2]:='1';
     arr[3]:= FormatDateTime('dd.mm.yyyy hh:nn:ss ', Now);
     arr[4]:=  id_materials[ComboBox1.ItemIndex];
     arr[5]:=Edit1.Text;

     arr[6]:= cost_materials[ComboBox1.ItemIndex].ToString;

     mc.sql_insert('Request_for_supplier ' ,arr );
     ShowMessage('?????? ??????? ????????') ;
     Close;



end;

{$R *.dfm}

end.
