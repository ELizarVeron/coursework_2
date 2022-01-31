unit Navigator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrame10 = class(TFrame)
    Panel2: TPanel;
    LeftLabel: TLabel;
    Label_1: TLabel;
    Label_2: TLabel;
    Label_3: TLabel;
    Label_4: TLabel;
    RightLabel: TLabel;
    no_line: TLabel;
    line: TLabel;
    procedure Label_1MouseEnter(Sender: TObject);
    procedure Label_1MouseLeave(Sender: TObject);
    procedure Label_2MouseEnter(Sender: TObject);
    procedure Label_2MouseLeave(Sender: TObject);
    procedure Label_3MouseEnter(Sender: TObject);
    procedure Label_3MouseLeave(Sender: TObject);
    procedure Label_4MouseEnter(Sender: TObject);
    procedure Label_4MouseLeave(Sender: TObject);
    procedure LeftLabelMouseEnter(Sender: TObject);
    procedure LeftLabelMouseLeave(Sender: TObject);
    procedure RightLabelMouseEnter(Sender: TObject);
    procedure RightLabelMouseLeave(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    owner: integer;

  end;

implementation

{$R *.dfm}



procedure TFrame10.Label_1MouseEnter(Sender: TObject);
begin
             Label_1.Font.Color:= clred;

end;

procedure TFrame10.Label_1MouseLeave(Sender: TObject);
begin
              Label_1.Font.Color:= clblack;
end;

procedure TFrame10.Label_2MouseEnter(Sender: TObject);
begin
              Label_2.Font.Color:= clred;
end;

procedure TFrame10.Label_2MouseLeave(Sender: TObject);
begin
             Label_2.Font.Color:= clblack;
end;

procedure TFrame10.Label_3MouseEnter(Sender: TObject);
begin
             Label_3.Font.Color:= clred;
end;

procedure TFrame10.Label_3MouseLeave(Sender: TObject);
begin
             Label_3.Font.Color:= clblack;
end;

procedure TFrame10.Label_4MouseEnter(Sender: TObject);
begin
              Label_4.Font.Color:= clred;
end;

procedure TFrame10.Label_4MouseLeave(Sender: TObject);
begin
              Label_4.Font.Color:= clblack;
end;

procedure TFrame10.LeftLabelMouseEnter(Sender: TObject);
begin
             LeftLabel.Font.Color:= clred;
end;

procedure TFrame10.LeftLabelMouseLeave(Sender: TObject);
begin
               LeftLabel.Font.Color:= clblack;
end;

procedure TFrame10.RightLabelMouseEnter(Sender: TObject);
begin
                      RightLabel.Font.Color:= clred;
end;

procedure TFrame10.RightLabelMouseLeave(Sender: TObject);
begin
                 RightLabel.Font.Color:= clblack;
end;

end.
