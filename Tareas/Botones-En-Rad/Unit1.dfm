object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 210
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 399
    Height = 137
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Agregar'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 170
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Borrar'
    Enabled = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 251
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Modificar'
    Enabled = False
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 332
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Limpiar'
    Enabled = False
    TabOrder = 5
    OnClick = Button5Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 151
    Width = 75
    Height = 21
    TabOrder = 6
    TextHint = 'ID...'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 89
    Top = 151
    Width = 318
    Height = 21
    TabOrder = 7
    TextHint = 'Descripcion del Producto...'
    OnChange = Edit2Change
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=postgres;' +
      'Data Source=prod;Initial Catalog=productos'
    LoginPrompt = False
    Left = 240
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 304
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 368
    Top = 16
  end
end
