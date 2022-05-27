unit Create_material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,  Data.Win.ADODB;

type
  TForm21 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Edit_name: TEdit;
    Edit_Cost: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

{$R *.dfm}



procedure TForm21.Button1Click(Sender: TObject);
var id:integer;
s:String;
begin
ADOquery1.Active:=false;
ADOquery1.SQL.Text:='  Select  max(article) from Material ';
ADOquery1.Active:=true;
id:= ADOquery1.Fields[0].AsInteger;
ADOquery1.Active:=false;
s:='  Insert INTO Material values ( ' + (id+1).ToString + ' , ' + QuotedStr(Edit_name.Text) + ' , '  + '0 , '  + Edit_cost.Text + ' ) ';
ADOquery1.SQL.Text:=  s;
ADOquery1.ExecSQL;
ShowMessage('Сохранено');
end;

end.
