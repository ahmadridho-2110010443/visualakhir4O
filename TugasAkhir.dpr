program TugasAkhir;

uses
  Forms,
  Menu in 'Menu.pas' {FormMenu},
  FormSiswa in 'FormSiswa.pas' {Form_siswa},
  FormWaliKelas in 'FormWaliKelas.pas' {Form_walikelas},
  FormUser in 'FormUser.pas' {Form_User},
  FormPoin in 'FormPoin.pas' {Form_Poin},
  FormOrtu in 'FormOrtu.pas' {Form_ortu},
  FormKelas in 'FormKelas.pas' {Form_kelas},
  FormHubungan in 'FormHubungan.pas' {Form_hubungan},
  FormSemester in 'FormSemester.pas' {Form_Semester};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TForm_Semester, Form_Semester);
  Application.CreateForm(TForm_hubungan, Form_hubungan);
  Application.CreateForm(TForm_kelas, Form_kelas);
  Application.CreateForm(TForm_ortu, Form_ortu);
  Application.CreateForm(TForm_Poin, Form_Poin);
  Application.CreateForm(TForm_User, Form_User);
  Application.CreateForm(TForm_walikelas, Form_walikelas);
  Application.CreateForm(TForm_siswa, Form_siswa);
  Application.Run;
end.
