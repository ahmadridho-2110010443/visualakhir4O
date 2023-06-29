program TugasAkhir;

uses
  Forms,
  Menu in 'Menu.pas' {FormMenu},
  FormSiswa in 'FormSiswa.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
