unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function q(sentence: string): boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  q('SELECT * FROM inventario ORDER BY id_inventario');
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  q('INSERT INTO inventario VALUES('+Edit1.Text+','+QuotedStr(Edit2.Text)+' );');
  q('SELECT * FROM inventario ORDER BY id_inventario');
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  q('DELETE FROM inventario WHERE id_inventario = ('+Edit1.Text+');');
  q('SELECT * FROM inventario ORDER BY id_inventario');
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  q('UPDATE inventario SET de_inventario = ('+QuotedStr(Edit2.Text)+') WHERE id_inventario = ('+Edit1.Text+');');
  q('SELECT * FROM inventario ORDER BY id_inventario');
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  q('SELECT * FROM inventario ORDER BY id_inventario');
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if not (Edit1.Text = '') and (Edit2.Text = '') then begin
    Button2.Enabled := false;
    Button3.Enabled := true;
    Button4.Enabled := false;
    Button5.Enabled := false;
  end
  else if (Edit1.Text = '') or (Edit2.Text = '') then begin
    Button2.Enabled := false;
    Button3.Enabled := false;
    Button4.Enabled := false;
    Button5.Enabled := false;
  end
  else begin
    Button2.Enabled := true;
    Button3.Enabled := true;
    Button4.Enabled := true;
    Button5.Enabled := true;
  end;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if not (Edit1.Text = '') and (Edit2.Text = '') then begin
    Button2.Enabled := false;
    Button3.Enabled := true;
    Button4.Enabled := false;
    Button5.Enabled := false;
  end
  else if (Edit1.Text = '') or (Edit2.Text = '') then begin
    Button2.Enabled := false;
    Button3.Enabled := false;
    Button4.Enabled := false;
    Button5.Enabled := false;
  end
  else begin
    Button2.Enabled := true;
    Button3.Enabled := true;
    Button4.Enabled := true;
    Button5.Enabled := true;
  end;
end;

function TForm1.q(sentence: string): boolean;
begin
  try
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add(sentence);
    if Uppercase(sentence[1]) = 'S' then
      ADOQuery1.Open
    else
      ADOQuery1.ExecSQL;
    q := true;
  except
    q := false;
  end;
end;

end.
