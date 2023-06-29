program TugasAkhir;

uses
  Forms,
  Menu in 'Menu.pas' {FormMenu},
  FormSiswa in 'FormSiswa.pas' {Form_siswa},
  FormWaliKelas in 'FormWaliKelas.pas' {Form_walikelas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_walikelas, Form_walikelas);
  Application.CreateForm(TForm_siswa, Form_siswa);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.Run;
end.
