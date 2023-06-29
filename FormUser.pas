unit FormUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm_User = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dbgrd1: TDBGrid;
    Edt1: TEdit;
    btn1: TButton;
    Edt2: TEdit;
    Edt3: TEdit;
    Edt4: TEdit;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    con1: TZConnection;
    ds1: TDataSource;
    zqry1: TZQuery;
    frxuser: TfrxReport;
    frxDBuser: TfrxDBDataset;
    procedure editbersih;
    procedure editenable;
    procedure posisiawal;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_User: TForm_User;
  id : string;

implementation

{$R *.dfm}

procedure TForm_User.editbersih;
begin
Edt1.Clear;
Edt2.Clear;
Edt3.Clear;
Edt4.Clear;
end;

procedure TForm_User.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
end;

procedure TForm_User.posisiawal;
begin
editbersih;

edt1.Enabled:= false;
edt2.Enabled:= false;
edt3.Enabled:= false;
edt4.Enabled:= false;

btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
end;

procedure TForm_User.btn1Click(Sender: TObject);
begin
editbersih;

btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;

editenable;
end;

procedure TForm_User.btn2Click(Sender: TObject);
begin
if (Edt1.Text= '')or (Edt2.Text ='')or(Edt3.Text= '')or (Edt4.Text ='')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('username',Edt1.Text,[])) and (zqry1.Locate('password',Edt2.Text,[])) then
begin
ShowMessage('DATA USER SUDAH DIGUNAKAN');
posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tabel_user values (null,"'+Edt1.Text+'","'+Edt2.Text+'","'+Edt3.Text+'","'+Edt4.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm_User.btn3Click(Sender: TObject);
begin
if (Edt1.Text= '')or (Edt2.Text ='')or (Edt3.Text= '')or (Edt4.Text ='') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (Edt1.Text = zqry1.Fields[1].AsString) and (Edt2.Text = zqry1.Fields[2].AsString) and (Edt3.Text = zqry1.Fields[3].AsString) and (Edt4.Text = zqry1.Fields[4].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_user').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_user set username= "'+Edt1.Text+'",password="'+Edt2.Text+'",level="'+Edt3.Text+'",status="'+Edt4.Text+'" where id_user="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm_User.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_user').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_user where id_user="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm_User.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm_User.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm_User.dbgrd1CellClick(Column: TColumn);
begin
editenable;
btn1.Enabled:= true;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
Edt1.Text:= zqry1.FieldList[1].AsString;
Edt2.Text:= zqry1.FieldList[2].AsString;
Edt3.Text:= zqry1.FieldList[3].AsString;
Edt4.Text:= zqry1.FieldList[4].AsString;
end;

procedure TForm_User.btn6Click(Sender: TObject);
begin
frxuser.ShowReport();
end;

end.
