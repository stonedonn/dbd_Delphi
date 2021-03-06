// 1. 입력, 수정 버튼을 눌렀을 때 취소할 수 있는 기능 추가  >> 해결
// 2. 자료 삭제시 묻지 않고 바로 삭제하는 문제 해결  >> 해결
// 3. WHERE 절을 이용한 SELECT 구문 기능 추가     >> 해결
// 4. 삭제 후 입력하면 sequence 값 넘어가는 문제 해결
unit phone_book;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, StdCtrls, ComCtrls;

type
  TfmMain = class(TForm)
    lName: TLabel;
    lPhoneNumber: TLabel;
    lTelephone: TLabel;
    lZipcode: TLabel;
    lAddress: TLabel;
    eName: TEdit;
    ePhoneNumber: TEdit;
    eTelephone: TEdit;
    eZipcode: TEdit;
    eAddress: TEdit;
    btnInsert: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    btnOK: TButton;
    btnExit: TButton;
    sgdList: TStringGrid;
    DBConn: TADOConnection;
    qry1: TADOQuery;
    cmd1: TADOCommand;
    eSequence: TEdit;
    btnCancel: TButton;
    btnSelect: TButton;
    lSequence: TLabel;
    grbText: TGroupBox;
    cbEmail: TComboBox;
    lEmail: TLabel;
    eEmail: TEdit;
    Label1: TLabel;
    qry2: TADOQuery;
    grbSELECT: TGroupBox;
    procedure FormShow(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure sgdListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    { Private declarations }
    procedure HeaderSetting();
    procedure LoadList();
    procedure DisabledTextField();
    procedure EnabledTextField();
    procedure EnabledButtons(mode : String);
    procedure DisabledButtons(mode : String);
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  current_mode : String;
  FLAG : integer=0;
implementation

uses Unit1;

{$R *.dfm}

procedure TfmMain.DisabledButtons(mode : String);  // 버튼 비활성화
begin
  btnInsert.Enabled := False;
  btnUpdate.Enabled := False;
  btnDelete.Enabled := False;

  btnOK.Enabled := True;
end;

procedure TfmMain.EnabledButtons(mode : string);   // 버튼 활성화
begin
  btnInsert.Enabled := True;
  btnUpdate.Enabled := True;
  btnDelete.Enabled := True;

  btnOK.Enabled := False;

end;

procedure TfmMain.EnabledTextField();    // 에디트필드 활성화
begin
  eName.Enabled := True;
  ePhoneNumber.Enabled := True;
  eTelephone.Enabled := True;
  eZipcode.Enabled := True;
  eAddress.Enabled := True;
  eEmail.Enabled := True;
  cbEmail.Enabled := True;
end;

procedure TfmMain.DisabledTextField();      // 에디트필드 비활성화
begin
  eName.Enabled := False;
  ePhoneNumber.Enabled := False;
  eTelephone.Enabled := False;
  eZipcode.Enabled := False;
  eAddress.Enabled := False;
  eEmail.Enabled := False;
  cbEmail.Enabled := False;
end;

procedure TfmMain.HeaderSetting();  // StringGrid의 필드 정의
begin
  sgdList.ColCount := 8;  //StringGrid에 사용할 컬럼 개수 지정
  sgdList.Cells[1,0] := '번호';
  sgdList.Cells[2,0] := '이름';
  sgdList.Cells[3,0] := '휴대전화';
  sgdList.Cells[4,0] := '전화번호';
  sgdList.Cells[5,0] := '우편번호';
  sgdList.Cells[6,0] := '주소';
  sgdList.Cells[7,0] := '이메일';

end;

procedure TfmMain.LoadList();   // 등록된 자료를 읽어와 StringGrid에 채워주는 함수
var
  i : Integer;
  record_count : Integer;
  sequence, name, phone_number, telephone, zipcode, address : String;
  emailId, email : String;
  emailInt : Integer;
begin
  qry1.Open; // ADOQuery에 저장되어 있는 SELECT 문

  record_count := qry1.RecordCount; // record_count := 5;

  if record_count = 0 then
    sgdList.RowCount := 2  // 저장된 데이터가 없으면 필드까지 행 수 = 2
  else
    sgdList.RowCount := record_count + 1; // 저장된 데이터 행 + 필드

  for i:= 0 to record_count - 1 do // i = 0부터 레코드 수 - 1 까지 루프
  begin
    sequence := qry1.FieldByName('sequence').AsString;
    name := qry1.FieldByName('name').AsString;
    phone_number := qry1.FieldByName('phone_number').AsString;
    telephone := qry1.FieldByName('telephone').AsString;
    zipcode := qry1.FieldByName('zipcode').AsString;
    address := qry1.FieldByName('address').AsString;
    email := qry1.FieldByName('email').AsString;

    sgdList.Cells[1, i + 1] := sequence;      // 각 셀에 데이터 넣어줌
    sgdList.Cells[2, i + 1] := name;
    sgdList.Cells[3, i + 1] := phone_number;
    sgdList.Cells[4, i + 1] := telephone;
    sgdList.Cells[5, i + 1] := zipcode;
    sgdList.Cells[6, i + 1] := address;
    sgdList.Cells[7, i + 1] := email;

    // 처음 자료인 경우 Edit컨트롤에 자료 채움
    if i = 0 then
    begin
      eSequence.Text := sequence;
      eName.Text := name;
      ePhoneNumber.Text := phone_number;
      eTelephone.Text := telephone;
      eZipcode.Text := zipcode;
      eAddress.Text := address;
      emailInt := Pos('@', email);
      emailId := Copy(email, 0, emailInt-1);
      eEmail.Text := emailId;
    end;

    qry1.Next;
  end;

  qry1.Close;

  // 각 텍스트 필드 비활성화
  DisabledTextField();

  current_mode := 'LIST';

  EnabledButtons(current_mode);

  sgdList.Row := 1;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  try
    DBConn.Open;
    ShowMessage('DB서버 접속에 성공하였습니다!');
    //StringGrid 헤더 정의
    HeaderSetting();

    // 등록 자료 가져오기
    LoadList();
   except
    MessageDlg('DB서버에 접속할 수 없습니다.', mtError, [mbOK], 0);
    Application.Terminate;
   end;

end;

procedure TfmMain.btnInsertClick(Sender: TObject);
begin
  FLAG := 0;
  //현재 모드 셋팅
  current_mode := 'INSERT';

  // 버튼 비활성화
  DisabledButtons(current_mode);

  EnabledTextField();

  // Edit control 초기화
  eName.Text := '';
  ePhoneNumber.Text := '';
  eTelephone.Text := '';
  eZipcode.Text := '';
  eAddress.Text := '';
  eEmail.Text := '';

  eName.SetFocus;  // 입력 버튼 클릭시 eName으로 커서 위치 이동

end;

procedure TfmMain.btnOKClick(Sender: TObject);
var
  tempSQL : String;
begin

  if FLAG = 0 then
  begin
    if current_mode = 'INSERT' then // 입력모드
    begin
      tempSQL := 'insert into phone_book (name, phone_number, telephone, zipcode, address, email, reg_datetime) values (';
      tempSQL := tempSQL + '''' + eName.Text + ''',';
      tempSQL := tempSQL + '''' + ePhoneNumber.Text + ''',';
      tempSQL := tempSQL + '''' + eTelephone.Text + ''',';
      tempSQL := tempSQL + '''' + eZipcode.Text + ''',';
      tempSQL := tempSQL + '''' + eAddress.Text + ''',';
      tempSQL := tempSQL + '''' + eEmail.Text + '@' + cbEmail.Text + ''',';
      tempSQL := tempSQL + 'getdate())';

      cmd1.Connection := DBConn;

      cmd1.CommandType := cmdText;

      cmd1.CommandText := tempSQL;

      cmd1.Execute;

      LoadList();
    end
    else if current_mode = 'UPDATE' then // 수정모드
    begin
      tempSQL := 'update phone_book set';
      tempSQL := tempSQL + ' name = ''' + eName.Text + ''',';
      tempSQL := tempSQL + ' phone_number = ''' + ePhoneNumber.Text + ''',';
      tempSQL := tempSQL + ' telephone = ''' + eTelephone.Text + ''',';
      tempSQL := tempSQL + ' zipcode = ''' + eZipcode.Text + ''',';
      tempSQL := tempSQL + ' address = ''' + eAddress.Text + '''';
      tempSQL := tempSQL + '''' + eEmail.Text + '@' + cbEmail.Text + ''',';
      tempSQL := tempSQL + ' where sequence = ' + eSequence.Text;

      cmd1.Connection := DBConn;

      cmd1.CommandType := cmdText;

      cmd1.CommandText := tempSQL;

      cmd1.Execute;

      LoadList();
    end;
  end;
end;

procedure TfmMain.btnUpdateClick(Sender: TObject);
begin
  FLAG := 0;
  current_mode := 'UPDATE';

  // 버튼 비활성화
  DisabledButtons(current_mode);

  // Edit 컨트롤을 활성화 시킨다.
  EnabledTextField();

  eName.SetFocus;

end;

procedure TfmMain.sgdListSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
  var
    emailId : String;
    emailInt : integer;
    emailList: String;
begin
  eSequence.Text := sgdList.Cells[1,ARow];
  eName.Text := sgdList.Cells[2,ARow];
  ePhoneNumber.Text := sgdList.Cells[3,ARow];
  eTelephone.Text := sgdList.Cells[4,ARow];
  eZipcode.Text := sgdList.Cells[5,ARow];
  eAddress.Text := sgdList.Cells[6,ARow];

  emailInt := Pos('@', sgdList.Cells[7,ARow]);
  emailId := Copy(sgdList.Cells[7,ARow], 0, emailInt-1);
  emailList := Copy(sgdList.Cells[7,Arow], emailInt+1, Length(sgdList.Cells[7,ARow])-1);
  eEmail.Text := emailId;
  cbEmail.Text := emailList;


end;

procedure TfmMain.btnDeleteClick(Sender: TObject);
var
  tempSQL : String;
begin

  Form1 := TForm1.Create(Application);

  if Form1.ShowModal = mrOK then
  begin
    tempSQL := 'delete from phone_book';
    tempSQL := tempSQL + ' where sequence = ' + eSequence.Text;
    cmd1.Connection := DBConn;
    cmd1.CommandType := cmdText;
    cmd1.CommandText := tempSQL;
    cmd1.Execute;
    LoadList();
  end
  else
    ShowMessage('취소하셨습니다!');
  //fmDeleteConfirm := TfmDeleteConfirm.Create(Application);

  //if fmDeleteConfirm.ShowModal = mrOK then
  //begin
    //tempSQL := 'delete from phone_book';
    //tempSQL := tempSQL + ' where sequence = ' + eSequence.Text;
    //cmd1.Connection := DBConn;
    //cmd1.CommandType := cmdText;
    //cmd1.CommandText := tempSQL;
    //cmd1.Execute;
    //LoadList();
  //end;
end;

procedure TfmMain.btnExitClick(Sender: TObject);
begin
  DBConn.Close;
  Application.Terminate;
end;

procedure TfmMain.btnCancelClick(Sender: TObject);
begin
  FLAG := 1;
  LoadList();
end;

procedure TfmMain.btnSelectClick(Sender: TObject);
var
  tempSQL : String;
  sequence, name, phone_number, telephone, zipcode, address, email : String;
  i : Integer;
  record_count : Integer;
begin
  With qry2 do
  Begin
    Close;
    SQL.Text := 'SELECT   ' + #13#10 +
                ' sequence, name, phone_number, telephone, zipcode, address, email ' + #13#10 +
                ' FROM phone_book                                        ' + #13#10 +
                ' WHERE sequence = ''' + Trim(eSequence.Text) + ''' ' + #13#10 +
                ' ORDER BY reg_datetime desc ' + #13#10 +
                '';
                open;
  End;
  qry1.Open; // ADOQuery에 저장되어 있는 SELECT 문

  record_count := qry1.RecordCount; // record_count

  if record_count <> 0 then
  begin
    sgdList.RowCount := record_count + 1;
    for i:= 0 to record_count -1 do
    begin
      sgdList.Cells[1, i+1] := ''; // sgdList초기화
      sgdList.Cells[2, i+1] := '';
      sgdList.Cells[3, i+1] := '';
      sgdList.Cells[4, i+1] := '';
      sgdList.Cells[5, i+1] := '';
      sgdList.Cells[6, i+1] := '';
      sgdList.Cells[7, i+1] := '';
    end;
  end;
  sequence := qry2.FieldByName('sequence').AsString;
  name := qry2.FieldByName('name').AsString;
  phone_number := qry2.FieldByName('phone_number').AsString;
  telephone := qry2.FieldByName('telephone').AsString;
  zipcode := qry2.FieldByName('zipcode').AsString;
  address := qry2.FieldByName('address').AsString;
  email := qry2.FieldByName('email').AsString;

  sgdList.Cells[1, 1] := sequence;      // 각 셀에 데이터 넣어줌
  sgdList.Cells[2, 1] := name;
  sgdList.Cells[3, 1] := phone_number;
  sgdList.Cells[4, 1] := telephone;
  sgdList.Cells[5, 1] := zipcode;
  sgdList.Cells[6, 1] := address;
  sgdList.Cells[7, 1] := email;
  qry1.Close;

end;





end.
