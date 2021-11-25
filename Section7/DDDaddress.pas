unit DDDaddress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    doList: TListBox;
    gunList: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    resultStr: TLabel;
    procedure doListClick(Sender: TObject);
    procedure gunListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
type
  TDDDNum=record
    j:String[10]; // ���� �̸�
    p:Integer;
    end;
const
  DDDNum:array [0..8,0..47] of TDDDNum=(
    {����}
   ((j:'����';p:0391),(j:'����';p:0392),(j:'�ٴ�';p:0397),(j:'��ȭ';p:0374),
   (j:'����';p:0395),(j:'����';p:0353),(j:'����';p:0394),(j:'����';p:0391),
   (j:'����';p:0394),(j:'��ô';p:0397),(j:'��';p:0373),(j:'����';p:0392),
   (j:'����';p:0392),(j:'�籸';p:0364),(j:'���';p:0396),(j:'����';p:0373),
   (j:'����';p:0371),(j:'����';p:0365),(j:'����';p:0398),(j:'�ֹ���';p:0391),
   (j:'ö��';p:0353),(j:'�Ἲ';p:0361),(j:'��õ';p:0361),(j:'�¹�';p:0395),
   (j:'��â';p:0374),(j:'ȫõ';p:0366),(j:'ȭ��';p:0395),(j:'ȭõ';p:0363),
   (j:'Ⱦ��';p:0373),(j:'Ⱦ��';p:0372),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0)),

   {���}
   ((j:'����';p:0356),(j:'��ȭ';p:0349),(j:'����';p:0344),(j:'��õ';p:02),
   (j:'����';p:02),(j:'����';p:0347),(j:'����';p:0346),(j:'����';p:0343),
   (j:'����';p:0341),(j:'����';p:0339),(j:'������';p:0346),(j:'����õ';p:0351),
   (j:'����';p:0348),(j:'�̱�';p:0346),(j:'�߾�';p:0339),(j:'��õ';p:032),
   (j:'��ź';p:0333),(j:'����';p:0331),(j:'����';p:0345),(j:'����';p:0342),
   (j:'�Ȼ�';p:0345),(j:'�ȼ�';p:0334),(j:'�Ⱦ�';p:0343),(j:'����';p:0333),
   (j:'����';p:0351),(j:'����';p:0338),(j:'����';p:0337),(j:'��õ';p:0355),
   (j:'����';p:0339),(j:'����';p:032),(j:'�빮';p:0338),(j:'����';p:0335),
   (j:'����';p:0344),(j:'�ǿ�';p:0343),(j:'������';p:0351),(j:'��õ';p:0336),
   (j:'�ϻ�';p:0344),(j:'��ȣ��';p:0336),(j:'����';p:0355),(j:'û��';p:0356),
   (j:'����';p:0341),(j:'����';p:0333),(j:'����';p:0348),(j:'��õ';p:0357),
   (j:'�ϳ�';p:0347),(j:'ȭ��';p:0339),(j:'����';p:02),(j:'��õ';p:032)),

   {�泲}
   ((j:'����';p:0558),(j:'��â';p:0598),(j:'����';p:0556),(j:'����';p:0558),
   (j:'����';p:0525),(j:'����';p:0559),(j:'����';p:0594),(j:'����';p:0551),
   (j:'�о�';p:0527),(j:'��õ';p:0593),(j:'��û';p:0596),(j:'�����';p:0527),
   (j:'��õ��';p:0593),(j:'����';p:0527),(j:'���';p:0523),(j:'�»�';p:0522),
   (j:'���';p:0522),(j:'����';p:0522),(j:'�Ƿ�';p:0555),(j:'��â';p:0551),
   (j:'�����';p:0558),(j:'����';p:0594),(j:'����';p:0591),(j:'����';p:0525),
   (j:'����';p:0591),(j:'����';p:0553),(j:'â��';p:0559),(j:'�湫';p:0557),
   (j:'�뿵';p:0557),(j:'�ϵ�';p:0595),(j:'�Ծ�';p:0552),(j:'�Ծ�';p:0597),
   (j:'��õ';p:0599),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0)),

{���}
   ((j:'����';p:0356),(j:'��ȭ';p:0349),(j:'����';p:0344),(j:'��õ';p:02),
   (j:'����';p:02),(j:'����';p:0347),(j:'����';p:0346),(j:'����';p:0343),
   (j:'����';p:0341),(j:'����';p:0339),(j:'������';p:0346),(j:'����õ';p:0351),
   (j:'����';p:0348),(j:'�̱�';p:0346),(j:'�߾�';p:0339),(j:'��õ';p:032),
   (j:'��ź';p:0333),(j:'����';p:0331),(j:'����';p:0345),(j:'����';p:0342),
   (j:'�Ȼ�';p:0345),(j:'�ȼ�';p:0334),(j:'�Ⱦ�';p:0343),(j:'����';p:0333),
   (j:'����';p:0351),(j:'����';p:0338),(j:'����';p:0337),(j:'��õ';p:0355),
   (j:'����';p:0339),(j:'����';p:032),(j:'�빮';p:0338),(j:'����';p:0335),
   (j:'����';p:0344),(j:'�ǿ�';p:0343),(j:'������';p:0351),(j:'��õ';p:0336),
   (j:'�ϻ�';p:0344),(j:'��ȣ��';p:0336),(j:'����';p:0355),(j:'û��';p:0356),
   (j:'����';p:0341),(j:'����';p:0333),(j:'����';p:0348),(j:'��õ';p:0357),
   (j:'�ϳ�';p:0347),(j:'ȭ��';p:0339),(j:'����';p:02),(j:'��õ';p:032)),

{����}
   ((j:'����';p:0356),(j:'��ȭ';p:0349),(j:'����';p:0344),(j:'��õ';p:02),
   (j:'����';p:02),(j:'����';p:0347),(j:'����';p:0346),(j:'����';p:0343),
   (j:'����';p:0341),(j:'����';p:0339),(j:'������';p:0346),(j:'����õ';p:0351),
   (j:'����';p:0348),(j:'�̱�';p:0346),(j:'�߾�';p:0339),(j:'��õ';p:032),
   (j:'��ź';p:0333),(j:'����';p:0331),(j:'����';p:0345),(j:'����';p:0342),
   (j:'�Ȼ�';p:0345),(j:'�ȼ�';p:0334),(j:'�Ⱦ�';p:0343),(j:'����';p:0333),
   (j:'����';p:0351),(j:'����';p:0338),(j:'����';p:0337),(j:'��õ';p:0355),
   (j:'����';p:0339),(j:'����';p:032),(j:'�빮';p:0338),(j:'����';p:0335),
   (j:'����';p:0344),(j:'�ǿ�';p:0343),(j:'������';p:0351),(j:'��õ';p:0336),
   (j:'�ϻ�';p:0344),(j:'��ȣ��';p:0336),(j:'����';p:0355),(j:'û��';p:0356),
   (j:'����';p:0341),(j:'����';p:0333),(j:'����';p:0348),(j:'��õ';p:0357),
   (j:'�ϳ�';p:0347),(j:'ȭ��';p:0339),(j:'����';p:02),(j:'��õ';p:032)),
{����}
   ((j:'����';p:0356),(j:'��ȭ';p:0349),(j:'����';p:0344),(j:'��õ';p:02),
   (j:'����';p:02),(j:'����';p:0347),(j:'����';p:0346),(j:'����';p:0343),
   (j:'����';p:0341),(j:'����';p:0339),(j:'������';p:0346),(j:'����õ';p:0351),
   (j:'����';p:0348),(j:'�̱�';p:0346),(j:'�߾�';p:0339),(j:'��õ';p:032),
   (j:'��ź';p:0333),(j:'����';p:0331),(j:'����';p:0345),(j:'����';p:0342),
   (j:'�Ȼ�';p:0345),(j:'�ȼ�';p:0334),(j:'�Ⱦ�';p:0343),(j:'����';p:0333),
   (j:'����';p:0351),(j:'����';p:0338),(j:'����';p:0337),(j:'��õ';p:0355),
   (j:'����';p:0339),(j:'����';p:032),(j:'�빮';p:0338),(j:'����';p:0335),
   (j:'����';p:0344),(j:'�ǿ�';p:0343),(j:'������';p:0351),(j:'��õ';p:0336),
   (j:'�ϻ�';p:0344),(j:'��ȣ��';p:0336),(j:'����';p:0355),(j:'û��';p:0356),
   (j:'����';p:0341),(j:'����';p:0333),(j:'����';p:0348),(j:'��õ';p:0357),
   (j:'�ϳ�';p:0347),(j:'ȭ��';p:0339),(j:'����';p:02),(j:'��õ';p:032)),
{����}
   ((j:'������';p:064),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0),
   (j:'';p:0),(j:'';p:0),(j:'';p:0),(j:'';p:0)),
{�泲}
   ((j:'����';p:0356),(j:'��ȭ';p:0349),(j:'����';p:0344),(j:'��õ';p:02),
   (j:'����';p:02),(j:'����';p:0347),(j:'����';p:0346),(j:'����';p:0343),
   (j:'����';p:0341),(j:'����';p:0339),(j:'������';p:0346),(j:'����õ';p:0351),
   (j:'����';p:0348),(j:'�̱�';p:0346),(j:'�߾�';p:0339),(j:'��õ';p:032),
   (j:'��ź';p:0333),(j:'����';p:0331),(j:'����';p:0345),(j:'����';p:0342),
   (j:'�Ȼ�';p:0345),(j:'�ȼ�';p:0334),(j:'�Ⱦ�';p:0343),(j:'����';p:0333),
   (j:'����';p:0351),(j:'����';p:0338),(j:'����';p:0337),(j:'��õ';p:0355),
   (j:'����';p:0339),(j:'����';p:032),(j:'�빮';p:0338),(j:'����';p:0335),
   (j:'����';p:0344),(j:'�ǿ�';p:0343),(j:'������';p:0351),(j:'��õ';p:0336),
   (j:'�ϻ�';p:0344),(j:'��ȣ��';p:0336),(j:'����';p:0355),(j:'û��';p:0356),
   (j:'����';p:0341),(j:'����';p:0333),(j:'����';p:0348),(j:'��õ';p:0357),
   (j:'�ϳ�';p:0347),(j:'ȭ��';p:0339),(j:'����';p:02),(j:'��õ';p:032)),
{����}
   ((j:'����';p:0356),(j:'��ȭ';p:0349),(j:'����';p:0344),(j:'��õ';p:02),
   (j:'����';p:02),(j:'����';p:0347),(j:'����';p:0346),(j:'����';p:0343),
   (j:'����';p:0341),(j:'����';p:0339),(j:'������';p:0346),(j:'����õ';p:0351),
   (j:'����';p:0348),(j:'�̱�';p:0346),(j:'�߾�';p:0339),(j:'��õ';p:032),
   (j:'��ź';p:0333),(j:'����';p:0331),(j:'����';p:0345),(j:'����';p:0342),
   (j:'�Ȼ�';p:0345),(j:'�ȼ�';p:0334),(j:'�Ⱦ�';p:0343),(j:'����';p:0333),
   (j:'����';p:0351),(j:'����';p:0338),(j:'����';p:0337),(j:'��õ';p:0355),
   (j:'����';p:0339),(j:'����';p:032),(j:'�빮';p:0338),(j:'����';p:0335),
   (j:'����';p:0344),(j:'�ǿ�';p:0343),(j:'������';p:0351),(j:'��õ';p:0336),
   (j:'�ϻ�';p:0344),(j:'��ȣ��';p:0336),(j:'����';p:0355),(j:'û��';p:0356),
   (j:'����';p:0341),(j:'����';p:0333),(j:'����';p:0348),(j:'��õ';p:0357),
   (j:'�ϳ�';p:0347),(j:'ȭ��';p:0339),(j:'����';p:02),(j:'��õ';p:032))
    );
implementation

{$R *.dfm}

procedure TForm1.doListClick(Sender: TObject);
var
  idx,i:Integer;
begin
  idx:=doList.ItemIndex;
  gunList.Items.Clear;

  for i:=0 to 47 do
    if DDDNum[idx,i].j <> '' then
      gunList.Items.Add(DDDNum[idx,i].j);

end;

procedure TForm1.gunListClick(Sender: TObject);
begin
  resultStr.Caption := '0' + IntToStr(DDDNum[doList.ItemIndex, gunList.ItemIndex].p);
end;

end.