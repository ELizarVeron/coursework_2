unit Nav_Frame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrame7 = class(TFrame)
    Panel1: TPanel;
    Edit1: TEdit;
    Sortirovka: TComboBox;
    Filtr: TComboBox;
  private
    { Private declarations }
  public
   procedure  create_filter();
    { Public declarations }
  end;

implementation
    procedure  TFrame7.create_filter();  //����� ������ ��������� ��������� ���� � ���������� ������
     begin



     end;
{$R *.dfm}

end.
