unit API2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Width:= 210;
  Height:= 100;
  Left:= GetSystemMetrics(SM_CXSCREEN) - Width;
  Top:= GetSystemMetrics(Sm_CYSCREEN) - Height;
end;

end.
