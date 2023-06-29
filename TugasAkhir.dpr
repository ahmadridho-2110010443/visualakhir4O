program TugasAkhir;

uses
  Forms,
  Menu in 'Menu.pas' {FormMenu},
  FormSiswa in 'FormSiswa.pas' {Form_siswa},
  FormWaliKelas in 'FormWaliKelas.pas' {Form_walikelas},
  FormUser in 'FormUser.pas' {Form_User},
  FormPoin in 'FormPoin.pas' {Form_Poin},
  FormOrtu in 'FormOrtu.pas' {Form_ortu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_ortu, Form_ortu);
  Application.CreateForm(TForm_Poin, Form_Poin);
  Application.CreateForm(TForm_User, Form_User);
  Application.CreateForm(TForm_walikelas, Form_walikelas);
  Application.CreateForm(TForm_siswa, Form_siswa);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.Run;
end.
