object Form_Poin: TForm_Poin
  Left = 192
  Top = 125
  Width = 870
  Height = 450
  Caption = 'Form Poin'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 88
    Height = 19
    Caption = 'NAMA POIN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 8
    Top = 40
    Width = 52
    Height = 19
    Caption = 'BOBOT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 8
    Top = 72
    Width = 42
    Height = 19
    Caption = 'JENIS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 8
    Top = 104
    Width = 60
    Height = 19
    Caption = 'STATUS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 184
    Top = 8
    Width = 145
    Height = 21
    Color = clMenu
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 184
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object c1: TComboBox
    Left = 184
    Top = 72
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'PRESTASI'
      'PELANGGARAN')
  end
  object c2: TComboBox
    Left = 184
    Top = 104
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      'TRUE'
      'FALSE')
  end
  object dg1: TDBGrid
    Left = 360
    Top = 8
    Width = 385
    Height = 129
    DataSource = ds1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dg1CellClick
  end
  object b1: TButton
    Left = 8
    Top = 144
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 5
    OnClick = b1Click
  end
  object b2: TButton
    Left = 104
    Top = 144
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 6
    OnClick = b2Click
  end
  object b3: TButton
    Left = 192
    Top = 144
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 7
    OnClick = b3Click
  end
  object b4: TButton
    Left = 288
    Top = 144
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 8
    OnClick = b4Click
  end
  object b5: TButton
    Left = 384
    Top = 144
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 9
    OnClick = b5Click
  end
  object b6: TButton
    Left = 488
    Top = 144
    Width = 75
    Height = 25
    Caption = 'LAPORAN'
    TabOrder = 10
    OnClick = b6Click
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'sekolah'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Program Files (x86)\Borland\Delphi7\Projects\TugasAkhir\libmy' +
      'sql.dll'
    Left = 768
    Top = 8
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 768
    Top = 112
  end
  object zqry1: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from tabel_poin')
    Params = <>
    Left = 768
    Top = 56
  end
  object frxpoin: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45100.703932048600000000
    ReportOptions.LastChange = 45106.472825138890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 808
    Top = 8
    Datasets = <
      item
        DataSet = frxDBpoin
        DataSetName = 'frxDBpoin'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 980.410082000000000000
        object Memo5: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779530000000000000
          Width = 283.464750000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'LAPORAN DATA POIN')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 30.236240000000000000
        Top = 173.858380000000000000
        Width = 980.410082000000000000
        DataSet = frxDBpoin
        DataSetName = 'frxDBpoin'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 173.858380000000000000
          Width = 34.015770000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataSet = frxDBpoin
          DataSetName = 'frxDBpoin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 207.874150000000000000
          Width = 132.283550000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'nama_poin'
          DataSet = frxDBpoin
          DataSetName = 'frxDBpoin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBpoin."nama_poin"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 340.157700000000000000
          Width = 132.283550000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'bobot'
          DataSet = frxDBpoin
          DataSetName = 'frxDBpoin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBpoin."bobot"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 472.441250000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'jenis'
          DataSet = frxDBpoin
          DataSetName = 'frxDBpoin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBpoin."jenis"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 574.488560000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'status'
          DataSet = frxDBpoin
          DataSetName = 'frxDBpoin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBpoin."status"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 34.015770000000000000
        Top = 79.370130000000000000
        Width = 980.410082000000000000
        object Memo1: TfrxMemoView
          Left = 173.858380000000000000
          Top = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'ID')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 207.874150000000000000
          Top = 3.779530000000000000
          Width = 132.283550000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'NAMA POIN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 340.157700000000000000
          Top = 3.779530000000000000
          Width = 132.283550000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'BOBOT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 472.441250000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'JENIS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 574.488560000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'STATUS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frxDBpoin: TfrxDBDataset
    UserName = 'frxDBpoin'
    CloseDataSource = False
    DataSet = zqry1
    BCDToCurrency = False
    Left = 808
    Top = 64
  end
end
