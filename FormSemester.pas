unit FormSemester;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, ComCtrls, StdCtrls, Grids,
  DBGrids;

type
  TForm_Semester = class(TForm)
    lbll1: TLabel;
    lbll2: TLabel;
    lbll3: TLabel;
    lbll4: TLabel;
    lbll5: TLabel;
    lbll6: TLabel;
    lbll8: TLabel;
    lbll9: TLabel;
    lbll7: TLabel;
    edit1: TEdit;
    edit2: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    dg1: TDBGrid;
    b6: TButton;
    c1: TComboBox;
    c2: TComboBox;
    edit3: TEdit;
    c3: TComboBox;
    c4: TComboBox;
    c5: TComboBox;
    dtp1: TDateTimePicker;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    frxDBfrxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    zqry2: TZQuery;
    zqry3: TZQuery;
    zqry4: TZQuery;
    zqry5: TZQuery;
    zqry6: TZQuery;
    procedure editbersih;
    procedure editenable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Semester: TForm_Semester;
  id : string;

implementation

{$R *.dfm}

procedure TForm_Semester.editbersih;
begin
c1.text:= '';
c2.text:= '';
c3.text:= '';
c4.text:= '';
c5.text:= '';
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
end;

procedure TForm_Semester.editenable;
begin
c1.Enabled:= True;
c2.Enabled:= True;
c3.Enabled:= True;
c4.Enabled:= True;
c5.Enabled:= True;
dtp1.Enabled:=True;
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
end;

end.
