unit Frame_material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Material;

type
  TFramematerial = class(TFrame)
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
  private
    { Private declarations }
  public
  materialOnFrame :TMaterial;
    procedure ShowInfo;
  end;

implementation

{$R *.dfm}

{ TFramematerial }

procedure TFramematerial.ShowInfo;
begin

end;

end.
