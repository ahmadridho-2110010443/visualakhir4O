unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFormMenu = class(TForm)
    mm1: TMainMenu;
    PILIHTABEL1: TMenuItem;
    FORMSISWA1: TMenuItem;
    FORMKELAS1: TMenuItem;
    FORMWALIKELAS1: TMenuItem;
    FORMSEMESTER1: TMenuItem;
    FORMORTU1: TMenuItem;
    FORMHUBUNGAN1: TMenuItem;
    FORMPOIN1: TMenuItem;
    FORMUSER1: TMenuItem;
    procedure FORMSISWA1Click(Sender: TObject);
    procedure FORMKELAS1Click(Sender: TObject);
    procedure FORMWALIKELAS1Click(Sender: TObject);
    procedure FORMSEMESTER1Click(Sender: TObject);
    procedure FORMORTU1Click(Sender: TObject);
    procedure FORMHUBUNGAN1Click(Sender: TObject);
    procedure FORMPOIN1Click(Sender: TObject);
    procedure FORMUSER1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

uses FormSiswa, FormKelas, FormWaliKelas, FormSemester, FormOrtu,
  FormHubungan, FormPoin, FormUser;

{$R *.dfm}

procedure TFormMenu.FORMSISWA1Click(Sender: TObject);
begin
Form_siswa.showmodal();
end;

procedure TFormMenu.FORMKELAS1Click(Sender: TObject);
begin
Form_kelas.ShowModal();
end;

procedure TFormMenu.FORMWALIKELAS1Click(Sender: TObject);
begin
Form_walikelas.showmodal();
end;

procedure TFormMenu.FORMSEMESTER1Click(Sender: TObject);
begin
Form_Semester.showmodal();
end;

procedure TFormMenu.FORMORTU1Click(Sender: TObject);
begin
Form_ortu.showmodal();
end;

procedure TFormMenu.FORMHUBUNGAN1Click(Sender: TObject);
begin
Form_hubungan.showmodal();
end;

procedure TFormMenu.FORMPOIN1Click(Sender: TObject);
begin
Form_Poin.showmodal();
end;

procedure TFormMenu.FORMUSER1Click(Sender: TObject);
begin
Form_User.showmodal();
end;

end.
