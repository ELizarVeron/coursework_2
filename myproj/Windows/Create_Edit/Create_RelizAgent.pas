unit Create_RelizAgent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers, Data.Win.ADODB, Main_Class;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Edit3: TEdit;
    DatePicker1: TDatePicker;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Edit1: TEdit;
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
      var mc:TMain_class;
       var ado:TADOQuery;
     var
      arr: array  of string;
      id:integer;
      b:bool;
      tbl:TADOTable;
         var s:array of string;
  end;

var
  Form8: TForm8;

implementation
      constructor TForm8.Create(AOwner: TComponent);
      begin

             inherited;


              mc:= TMain_class.Create;
              ado:=mc.sql_select('article', 'products','','',false);
                while not ado.Eof do
                  begin
                    ComboBox1.Items.Add(ado.FieldByName('article').AsString);
                    ado.Next
                  end;

                b:=false;

      end;
{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);       //save
begin
   var count,str,dt: string;

   count:=  Edit3.Text;
   if not(Edit3.Text ='') then
       begin
           if (count[1]='0' ) then
            begin
               ShowMessage('��������� ������������ �����');
               Edit3.Text:='';


           end;
           SetLength(arr,5);
          arr[0]:= id.ToString;
          arr[1]:= ComboBox1.Text ;
          arr[2]:= Datetostr(DatePicker1.Date) ;
          arr[3]:=Edit3.Text;
          arr[4]:=Edit1.Text;
          mc.sql_insert(' History_of_reliz ' , arr);



        end;

 // ShowMessage('������ ���������');
          tbl.Requery();
   //tbl.Active:=false;

  Close;

end;

procedure TForm8.Button2Click(Sender: TObject);
begin
 Close;
end;

procedure TForm8.ComboBox1Change(Sender: TObject);
begin
            ado:=mc.sql_select('name_',' products ', 'where article =  '  + ComboBox1.Items[ComboBox1.ItemIndex],'',false );
            Edit1.Text:= ado.Fields[0].AsString;
end;

procedure TForm8.Edit3Change(Sender: TObject);
begin
// if  Edit3.Text='0' then     ShowMessage('�������� ����');
end;

end.
