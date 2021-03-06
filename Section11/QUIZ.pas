unit QUIZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Memo1: TMemo;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure Chulje;
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  Tmunje=record
    mun:string[50];
    b1:string[30];
    b2:string[30];
    b3:string[30];
    ans:integer;
  end;
const
  total=23; { 총 문제 개수 }
var
  Form1: TForm1;
  munje:array [1..total] of Tmunje;
  nowmun:integer; {현재 선택된 문제}
  NO,NX: integer; {맞춘 개수, 틀린 개수}

implementation

{$R *.dfm}

{난수로 문제를 선택한 후 문제와 보기를 폼에 출력한다}
procedure TForm1.Chulje;
begin
  nowmun:=Random(total)+1;
  Memo1.Text:=munje[nowmun].mun;
  Panel1.Caption:=munje[nowmun].b1;
  Panel2.Caption:=munje[nowmun].b2;
  Panel3.Caption:=munje[nowmun].b3;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  F1:TextFile;
  i:integer;
  st:string;
begin
  AssignFile(F1,'QUIZ.txt'); // 할당
  Reset(F1); //오픈
  {문제를 순서대로 읽어와 배열에 담는다}
  for i:=1 to total do
  begin
    readln(F1,munje[i].mun);
    readln(F1,munje[i].b1);
    readln(F1,munje[i].b2);
    readln(F1,munje[i].b3);
    readln(F1,st);
    munje[i].ans:=StrToInt(st);
  end;
CloseFile(F1);
Randomize;
end;

{ 게임 시작, 문제를 출력하고 변수를 초기화 한다 }
procedure TForm1.N2Click(Sender: TObject);
begin
  Chulje;
  NO:=0;
  NX:=0;
  StatusBar1.SimpleText:='번호를 선택하십시오!';
end;

{ 프로그램 종료 }
procedure TForm1.N3Click(Sender: TObject);
begin
  close;
end;

{ 보기 버튼을 누르면 답을 판정해 낸다. }
procedure TForm1.Button1Click(Sender: TObject);
begin
  { 답과 버튼의 번호를 비교한다. }
  if (Sender as TButton).tag=munje[nowmun].ans then
    NO:=NO+1 { 맞춘 개수 증가}
  else
    NX:=NX+1; { 틀린 개수 증가 }
  StatusBar1.SimpleText:= '총 ' + IntToStr(NO+NX)+ ' 문제 중 ' +
    IntToStr(NO) + ' 문제를 맞췄습니다!';
  Chulje; { 다시 문제 출제 }
end;

end.
