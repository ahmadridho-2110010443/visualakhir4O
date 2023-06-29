unit FormWaliKelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm_walikelas = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
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
    Edt6: TEdit;
    Edt7: TEdit;
    c1: TComboBox;
    btn6: TButton;
    con1: TZConnection;
    ds1: TDataSource;
    zqry1: TZQuery;
    frxreport: TfrxReport;
    frxDBreport: TfrxDBDataset;
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
  Form_walikelas: TForm_walikelas;
  id : string;

implementation

{$R *.dfm}

procedure TForm_walikelas.editbersih;
begin
Edt1.Clear;
Edt2.Clear;
c1.text:= '';
Edt3.Clear;
Edt4.Clear;
Edt5.Clear;
Edt6.Clear;
Edt7.Clear;
end;

procedure TForm_walikelas.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
c1.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
edt6.Enabled:= True;
edt7.Enabled:= True;
end;

procedure TForm_walikelas.posisiawal;
begin
editbersih;

edt1.Enabled:= false;
edt2.Enabled:= false;
c1.Enabled:= false;
edt3.Enabled:= false;
edt4.Enabled:= false;
edt5.Enabled:= false;
edt6.Enabled:= false;
edt7.Enabled:= false;

btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
end;

procedure TForm_walikelas.btn1Click(Sender: TObject);
begin
editbersih;

btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;

editenable;
end;

procedure TForm_walikelas.btn2Click(Sender: TObject);
begin
if (Edt1.Text= '')or (Edt2.Text ='')or(c1.Text= '')or (Edt3.Text= '')or (Edt4.Text ='') or (Edt5.Text= '')or (Edt6.Text ='') or (Edt7.Text= '')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('nik',Edt1.Text,[])) and (zqry1.Locate('nama',Edt2.Text,[])) then
begin
ShowMessage('DATA WALI KELAS SUDAH DIGUNAKAN');
posisiawal;
end else

begin
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tabel_wali_kelas values (null,"'+Edt1.Text+'","'+Edt2.Text+'","'+c1.Text+'","'+Edt3.Text+'","'+Edt4.Text+'","'+Edt5.Text+'","'+Edt6.Text+'","'+Edt7.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_wali_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm_walikelas.btn3Click(Sender: TObject);
begin
if (Edt1.Text= '')or (Edt2.Text ='')or(c1.Text= '')or (Edt3.Text= '')or (Edt4.Text ='') or (Edt5.Text= '')or (Edt6.Text ='') or (Edt7.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (Edt1.Text = zqry1.Fields[1].AsString) and (Edt2.Text = zqry1.Fields[2].AsString) and (c1.Text = zqry1.Fields[3].AsString) and (Edt3.Text = zqry1.Fields[4].AsString) and (Edt4.Text = zqry1.Fields[5].AsString) and (Edt5.Text = zqry1.Fields[6].AsString) and (Edt6.Text = zqry1.Fields[7].AsString)and (Edt7.Text = zqry1.Fields[8].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_wali').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_wali_kelas set nik= "'+Edt1.Text+'",nama="'+Edt2.Text+'",jenis_kelamin="'+c1.Text+'",pendidikan="'+Edt3.Text+'",telp="'+Edt4.Text+'",matpel="'+Edt5.Text+'",alamat="'+Edt6.Text+'",status="'+Edt7.Text+'" where id_wali="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_wali_kelas');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm_walikelas.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_wali').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_wali_kelas where id_wali="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_wali_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm_walikelas.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm_walikelas.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm_walikelas.dbgrd1CellClick(Column: TColumn);
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
c1.Text:= zqry1.FieldList[3].AsString;
Edt3.Text:= zqry1.FieldList[4].AsString;
Edt4.Text:= zqry1.FieldList[5].AsString;
Edt5.Text:= zqry1.FieldList[6].AsString;
Edt6.Text:= zqry1.FieldList[7].AsString;
Edt7.Text:= zqry1.FieldList[8].AsString;
end;

procedure TForm_walikelas.btn6Click(Sender: TObject);
begin
frxreport.ShowReport();
end;

end.
