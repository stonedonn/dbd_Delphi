unit CheckBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.State = cbChecked then
    Edit1.Ctl3D:=True
  else
    Edit1.Ctl3D:=False
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.State=cbChecked then
    Edit1.Visible:=True
  else
    Edit1.Visible:=False;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.State=cbChecked then
    Edit1.ReadOnly:=True
  else
    Edit1.ReadOnly:=False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CheckBox1.State:=cbChecked;
  CheckBox2.State:=cbChecked;
  CheckBox3.State:=cbChecked;

  RadioButton3.Checked:= True;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  Edit1.CharCase := ecUpperCase;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  Edit1.CharCase:= ecLowerCase;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  Edit1.CharCase:= ecNormal;
end;

end.
