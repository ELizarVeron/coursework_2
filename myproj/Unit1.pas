unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
    Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, System.hash;

type
    TForm1 = class(TForm)
        ADOConnection1: TADOConnection;
        DataSource1: TDataSource;
        ADOQuery1: TADOQuery;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        ComboBox1: TComboBox;
        Edit1: TEdit;
        Edit2: TEdit;
        Button1: TButton;
        Button2: TButton;
        procedure Button1Click(Sender: TObject);
        procedure Button2Click(Sender: TObject);

    private
        { Private declarations }
    public
        function hash(Data: string): string;
         function  Return_staff(cb: TComboBox): string;
    end;

var
    Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2 , Win_Master, Win_Manager;

function TForm1.hash(Data: string): string;
var
    Key: string;
begin
    Key := 'djifjsivis';
    Result := THashSHA2.GetHMAC(Data, Key, SHA256);
end;

procedure OpenWindow(staff: string);
begin
    if (staff = 'Master') then
    begin
        var
        Form3: TForm3;
        Form3 := TForm3.Create(Application );
        Form3.Show;
    end;
    if (staff = 'Manager') then
    begin
        var
        Form4: TForm4;
        Form4 := TForm4.Create(Application );
        Form4.login:=Form1.Edit1.Text;
        Form4.Show;
    end;



end;

procedure Login();
var
    my_SQL: string;
    log: string;
    pass, stff: string;

begin
    Form1.ADOQuery1.Active := false; // ????????? ??????, ???? ?? ??? ???????
    Form1.ADOQuery1.SQL.Clear; // ???????? ??????????? ?????? ???????
    log := Form1.Edit1.Text;
    my_SQL := 'SELECT * FROM Users WHERE lOGIN = ' + QuotedStr(log) +
      'AND STAFF=' + QuotedStr( Form1.Return_staff(Form1.ComboBox1));
    Form1.ADOQuery1.SQL.Add(my_SQL); // ?????????? ?????? ?????? ???????
    Form1.ADOQuery1.Active := True; // ????????? ???????
    if (Form1.ADOQuery1.IsEmpty) then
        ShowMessage('???????????? ?? ??????')
    else
    begin
        // ShowMessage(Form1.ADOQuery1.Fields[0].AsString);
        pass := Form1.ADOQuery1.Fields[2].AsString;
        stff := Form1.ADOQuery1.Fields[0].AsString;
        if (pass = Form1.hash(Form1.Edit2.Text)) then
            OpenWindow(stff)
        else
            ShowMessage('???????? ??????');
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    Login();
    Hide;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    Form2.Show;
end;


  function TForm1.Return_staff(cb: TComboBox): string;
// ????????? ????????? ?? ????? ?????????
begin
  if (cb.ItemIndex = 0) then
    Result := 'Manager'
  else
    Result := 'Master';
end;

end.
