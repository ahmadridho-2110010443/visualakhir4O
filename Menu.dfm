object FormMenu: TFormMenu
  Left = 210
  Top = 130
  Width = 870
  Height = 450
  Caption = 'Main Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 64
    Top = 40
    object PILIHTABEL1: TMenuItem
      Caption = 'PILIH TABEL'
      object FORMSISWA1: TMenuItem
        Caption = 'FORM SISWA'
        OnClick = FORMSISWA1Click
      end
      object FORMKELAS1: TMenuItem
        Caption = 'FORM KELAS'
        OnClick = FORMKELAS1Click
      end
      object FORMWALIKELAS1: TMenuItem
        Caption = 'FORM WALI KELAS'
        OnClick = FORMWALIKELAS1Click
      end
      object FORMSEMESTER1: TMenuItem
        Caption = 'FORM SEMESTER'
        OnClick = FORMSEMESTER1Click
      end
      object FORMORTU1: TMenuItem
        Caption = 'FORM ORTU'
        OnClick = FORMORTU1Click
      end
      object FORMHUBUNGAN1: TMenuItem
        Caption = 'FORM HUBUNGAN'
        OnClick = FORMHUBUNGAN1Click
      end
      object FORMPOIN1: TMenuItem
        Caption = 'FORM POIN'
        OnClick = FORMPOIN1Click
      end
      object FORMUSER1: TMenuItem
        Caption = 'FORM USER'
        OnClick = FORMUSER1Click
      end
    end
  end
end
