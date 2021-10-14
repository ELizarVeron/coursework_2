unit Frame_agents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TFrame3 = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Label8: TLabel;

  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    // property L1: string read Label1.Caption write Label1.Caption;
    { Public declarations }
  end;

implementation

constructor TFrame3.Create(AOwner: TComponent);
begin
  inherited;
end;
{$R *.dfm}

end.
