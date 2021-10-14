unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1, My_f;

function Save_Acc(st, lg, psw: string): bool; // ���������� ������� ����
var
  my_SQL: string;
  log: string;
  pass, stff: string;
begin
  Form2.ADOQuery1.Active := false; // ��������� ������, ���� �� ��� �������
  Form2.ADOQuery1.SQL.Clear; // �������� ����������� ������ �������

  my_SQL := 'SELECT * FROM Users WHERE lOGIN = ' + QuotedStr(lg);
  Form2.ADOQuery1.SQL.Add(my_SQL); // ���������� ������ ������ �������
  Form2.ADOQuery1.Active := True;
  if (NOT(Form2.ADOQuery1.IsEmpty)) then
    ShowMessage('����� ��� ������������')
  else
  begin
    Form2.ADOQuery1.Close; // ��������� ������, ���� �� ��� �������
    Form2.ADOQuery1.SQL.Clear; //
    Form2.ADOQuery1.SQL.Add
      ('INSERT INTO Users (Staff, Login, Password_hash) VALUES (:staff,:logi,:passw)');
    Form2.ADOQuery1.Parameters.ParamByName('staff').Value := st;
    Form2.ADOQuery1.Parameters.ParamByName('logi').Value := lg;
    Form2.ADOQuery1.Parameters.ParamByName('passw').Value := Form1.Hash(psw);
    Form2.ADOQuery1.ExecSQL;
    ShowMessage('����������� ���������.');
    Form2.Close;
  end;
  Result := True;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if ((Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '')) then
    ShowMessage('������� ��� ����')
  else
  begin
    if (Edit2.Text <> Edit3.Text) then
      Label6.Visible := True
    else
    begin
      Label6.Visible := false;
      if (Length(Edit2.Text) < 7) then
        ShowMessage('������ ������ ��������� �� ����� 7 ��������')
      else
        Save_Acc(My_f.Return_staff(Form2.ComboBox1), Edit1.Text, Edit2.Text);

    end;
  end;

end;

end.
