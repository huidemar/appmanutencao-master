unit Streams;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfStreams = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FPath: string;

    function LoadStream: TMemoryStream;
  public
  end;

var
  fStreams: TfStreams;

implementation

{$R *.dfm}

procedure TfStreams.Button1Click(Sender: TObject);
var
  S: TStream;
begin
  S := LoadStream;

  Label1.Caption := 'Size: ' + (S.Size div 1024).ToString + ' MB';
  S.Free;
end;

procedure TfStreams.Button2Click(Sender: TObject);
var
  i, SizeInc: Integer;
  S: TStream;
begin
  ProgressBar1.Position := 0;
  ProgressBar1.Max := 100;
  SizeInc := 0;
  S := LoadStream;
  for i := 1 to 100 do
  begin
    SizeInc := SizeInc + S.Size;
    ProgressBar1.Position := i;
    Application.ProcessMessages;
  end;
  Label2.Caption := (SizeInc div 1024).ToString + ' MB';
  S.Free;
end;

procedure TfStreams.FormCreate(Sender: TObject);
begin
  FPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'pdf.pdf';
end;

function TfStreams.LoadStream: TMemoryStream;
begin
  Result := nil;
  if FileExists(FPath) then
  begin
    Result := TMemoryStream.Create;
    Result.LoadFromFile(FPath);
  end;
end;

end.
