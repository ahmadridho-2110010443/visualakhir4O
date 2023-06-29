unit FormOrtu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm_ortu = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lblPENDIDIKAN: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    dg1: TDBGrid;
    Edit1: TEdit;
    b1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    Edit6: TEdit;
    Edit7: TEdit;
    c1: TComboBox;
    b6: TButton;
    con1: TZConnection;
    ds1: TDataSource;
    zqry1: TZQuery;
    frxortu: TfrxReport;
    frxDBortu: TfrxDBDataset;
    Edit8: TEdit;
    procedure editbersih;
    procedure editenable;
    procedure posisiawal;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure b6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ortu: TForm_ortu;
  id : string;

implementation

{$R *.dfm}

procedure TForm_ortu.editbersih;
begin
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
Edit4.Clear;
Edit5.Clear;
Edit6.Clear;
c1.text:= '';
Edit7.Clear;
Edit8.Clear;
end;

procedure TForm_ortu.editenable;
begin
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
edit5.Enabled:= True;
edit6.Enabled:= True;
c1.Enabled:= True;
edit7.Enabled:= True;
edit8.Enabled:= True;
end;

procedure TForm_ortu.posisiawal;
begin
editbersih;

edit1.Enabled:= false;
edit2.Enabled:= false;
edit3.Enabled:= false;
edit4.Enabled:= false;
edit5.Enabled:= false;
edit6.Enabled:= false;
c1.Enabled:= false;
edit7.Enabled:= false;
edit8.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm_ortu.b1Click(Sender: TObject);
begin
editbersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm_ortu.b2Click(Sender: TObject);
begin
if (Edit1.Text= '')or (Edit2.Text ='') or (Edit3.Text= '')or (Edit4.Text ='') or (Edit5.Text= '')or (Edit6.Text ='') or (c1.Text= '') or (Edit7.Text= '') or (Edit8.Text= '')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('nik',Edit1.Text,[])) and (zqry1.Locate('nama',Edit2.Text,[])) then
begin
ShowMessage('DATA ORANG TUA SUDAH DIGUNAKAN');
posisiawal;
end else

begin
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tabel_ortu values (null,"'+Edit1.Text+'","'+Edit2.Text+'","'+Edit3.Text+'","'+Edit4.Text+'","'+Edit5.Text+'","'+Edit6.Text+'","'+c1.Text+'","'+Edit7.Text+'","'+Edit8.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_ortu');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm_ortu.b3Click(Sender: TObject);
begin
if (Edit1.Text= '')or (Edit2.Text ='') or (Edit3.Text= '')or (Edit4.Text ='') or (Edit5.Text= '')or (Edit6.Text ='') or (c1.Text= '')or (Edit7.Text= '')or (Edit8.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (Edit1.Text = zqry1.Fields[1].AsString) and (Edit2.Text = zqry1.Fields[2].AsString) and (Edit3.Text = zqry1.Fields[3].AsString) and (Edit4.Text = zqry1.Fields[4].AsString) and (Edit5.Text = zqry1.Fields[5].AsString) and (Edit6.Text = zqry1.Fields[6].AsString)and (c1.Text = zqry1.Fields[7].AsString) and (Edit7.Text = zqry1.Fields[8].AsString) and (Edit8.Text = zqry1.Fields[9].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_ortu').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_ortu set nik= "'+Edit1.Text+'",nama="'+Edit2.Text+'",pendidikan="'+Edit3.Text+'",pekerjaan="'+Edit4.Text+'",telp="'+Edit5.Text+'",alamat="'+Edit6.Text+'",jenis_kelamin="'+c1.Text+'",agama="'+Edit7.Text+'",status="'+Edit8.Text+'" where id_ortu="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_ortu');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm_ortu.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_ortu').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_ortu where id_ortu="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_ortu');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm_ortu.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm_ortu.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm_ortu.dg1CellClick(Column: TColumn);
begin
editenable;
b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
Edit1.Text:= zqry1.FieldList[1].AsString;
Edit2.Text:= zqry1.FieldList[2].AsString;
Edit3.Text:= zqry1.FieldList[3].AsString;
Edit4.Text:= zqry1.FieldList[4].AsString;
Edit5.Text:= zqry1.FieldList[5].AsString;
Edit6.Text:= zqry1.FieldList[6].AsString;
c1.Text:= zqry1.FieldList[7].AsString;
Edit7.Text:= zqry1.FieldList[8].AsString;
Edit8.Text:= zqry1.FieldList[9].AsString;
end;

procedure TForm_ortu.b6Click(Sender: TObject);
begin
frxortu.ShowReport();
end;

end.
