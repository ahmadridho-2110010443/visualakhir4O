unit FormSiswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dbgrd1: TDBGrid;
    Edt1: TEdit;
    btn1: TButton;
    Edt2: TEdit;
    Edt3: TEdit;
    Edt4: TEdit;
    Edt5: TEdit;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    con1: TZConnection;
    ds1: TDataSource;
    zqry1: TZQuery;
    frxlapor: TfrxReport;
    frxDBlaporan: TfrxDBDataset;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    Edt6: TEdit;
    Edt8: TEdit;
    Edt9: TEdit;
    Edt10: TEdit;
    c1: TComboBox;
    lbl11: TLabel;
    Edt7: TEdit;
    btn6: TButton;
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
  Form1: TForm1;
  id : string;

implementation

{$R *.dfm}

procedure TForm1.editbersih;
begin
Edt1.Clear;
Edt2.Clear;
Edt3.Clear;
Edt4.Clear;
Edt5.Clear;
Edt6.Clear;
c1.text:= '';
Edt8.Clear;
Edt9.Clear;
Edt10.Clear;
Edt7.Clear;
end;

procedure TForm1.editenable;
begin
Edt1.Enabled:=True;
Edt2.Enabled:=True;
Edt3.Enabled:=True;
Edt4.Enabled:=True;
Edt5.Enabled:=True;
Edt6.Enabled:=True;
c1.Enabled:=True;
Edt8.Enabled:=True;
Edt9.Enabled:=True;
Edt10.Enabled:=True;
Edt7.Enabled:=True;
end;

procedure TForm1.posisiawal;
begin
editbersih;

Edt1.Enabled:=False;
Edt2.Enabled:=False;
Edt3.Enabled:=False;
Edt4.Enabled:=False;
Edt5.Enabled:=False;
Edt6.Enabled:=False;
c1.Enabled:=False;
Edt8.Enabled:=False;
Edt9.Enabled:=False;
Edt10.Enabled:=False;
Edt7.Enabled:=False;

btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
editbersih;

btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;

editenable;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
if (Edt1.Text= '')or (Edt2.Text ='')or (Edt3.Text= '')or (Edt4.Text ='') or (Edt5.Text= '')or (Edt6.Text ='') or (c1.Text= '')or (Edt8.Text= '') or (Edt9.Text= '') or (Edt10.Text= '') or (Edt7.Text= '')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('nis',Edt1.Text,[])) and (zqry1.Locate('nisn',Edt2.Text,[])) then
begin
ShowMessage('DATA SISWA SUDAH DIGUNAKAN');
posisiawal;
end else

begin
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into table_siswa values (null,"'+Edt1.Text+'","'+Edt2.Text+'","'+Edt3.Text+'","'+Edt4.Text+'","'+Edt5.Text+'","'+Edt6.Text+'","'+c1.Text+'","'+Edt8.Text+'","'+Edt9.Text+'","'+Edt10.Text+'","'+Edt7.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_siswa');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
if (Edt1.Text= '')or (Edt2.Text ='')or (Edt3.Text= '')or (Edt4.Text ='') or (Edt5.Text= '')or (Edt6.Text ='') or (c1.Text= '')or (Edt8.Text= '') or (Edt9.Text= '')or (Edt10.Text= '') or (Edt7.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (Edt1.Text = zqry1.Fields[1].AsString) and (Edt2.Text = zqry1.Fields[2].AsString) and  (Edt3.Text = zqry1.Fields[3].AsString) and (Edt4.Text = zqry1.Fields[4].AsString) and (Edt5.Text = zqry1.Fields[5].AsString) and (Edt6.Text = zqry1.Fields[6].AsString)and (c1.Text = zqry1.Fields[7].AsString) and (Edt8.Text = zqry1.Fields[8].AsString) and (Edt9.Text = zqry1.Fields[9].AsString) and (Edt10.Text = zqry1.Fields[10].AsString) and (Edt7.Text = zqry1.Fields[11].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_siswa').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update table_siswa set nis= "'+Edt1.Text+'",nisn="'+Edt2.Text+'",nama="'+Edt3.Text+'",nik="'+Edt4.Text+'",tempat_lahir="'+Edt5.Text+'",tgl_lahir="'+Edt6.Text+'",jenis_kelamin="'+c1.Text+'",alamat="'+Edt8.Text+'",telp="'+Edt9.Text+'",hp="'+Edt10.Text+'",status="'+Edt7.Text+'" where id_siswa="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_siswa');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_siswa').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from table_siswa where id_siswa="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_siswa');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
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
Edt5.Text:= zqry1.FieldList[5].AsString;
Edt6.Text:= zqry1.FieldList[6].AsString;
c1.Text:= zqry1.FieldList[7].AsString;
Edt8.Text:= zqry1.FieldList[8].AsString;
Edt9.Text:= zqry1.FieldList[9].AsString;
Edt10.Text:= zqry1.FieldList[10].AsString;
Edt7.Text:= zqry1.FieldList[11].AsString;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
frxlapor.ShowReport();
end;

end.
