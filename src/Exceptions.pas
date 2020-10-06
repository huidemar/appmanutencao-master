unit Exceptions;

interface

uses
  System.Threading,
  System.Diagnostics,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.TimeSpan;

type
  TfExceptions = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Label2: TLabel;
    Button2: TButton;
    Memo3: TMemo;
    Label1: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FPath: string;

    function LoadNumbers(AIgnore: Integer): Boolean;
  public
  end;

var
  fExceptions: TfExceptions;

implementation

{$R *.dfm}

procedure TfExceptions.Button1Click(Sender: TObject);
var
  tempo: TTimeSpan;
  StopWatch: TStopWatch;
begin
  try
    Memo1.Lines.Clear;
    Memo2.Lines.Clear;
    try
      StopWatch := TStopWatch.Create;
      StopWatch.Start;

      LoadNumbers(1);
    finally

      StopWatch.Stop;
      tempo := StopWatch.Elapsed;

      Label1.Caption := 'Tempo de processamento: ' + tempo.Milliseconds.ToString + ' ms';
    end;
  except on E: Exception do
    begin
      Memo1.Lines.Add('Classe Exception: ' + E.ClassName);
      Memo1.Lines.Add('Erro: ' + E.Message);
      raise;
    end;
  end;
end;

procedure TfExceptions.Button2Click(Sender: TObject);
var
  i: Integer;
  tempo: TTimeSpan;
  StopWatch : TStopWatch;
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;

  StopWatch := TStopWatch.Create;
  StopWatch.Start;
  for i := 0 to 7 do
  begin
    LoadNumbers(i);
  end;
  StopWatch.Stop;
  tempo := StopWatch.Elapsed;
  Label1.Caption := 'Tempo de processamento: ' + tempo.Milliseconds.ToString +' ms';
end;

procedure TfExceptions.FormCreate(Sender: TObject);
begin
  FPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'text.txt';
end;

function TfExceptions.LoadNumbers(AIgnore: Integer): Boolean;
var
  Arquivo: TextFile;
  Texto: String;
  letra: String;
  Linhas: TStringBuilder;
begin
  try
    Linhas := TStringBuilder.Create;
    Linhas.AppendLine;
    Application.ProcessMessages;
    try
      AssignFile(Arquivo, FPath);
      Reset(Arquivo);
      while (not eof(Arquivo)) do
        begin
          Readln(Arquivo, Texto);
          for letra in Texto do
            begin
              Linhas.Append(letra);
              Linhas.AppendLine;
            end;
        end;
      Result := True;
    except on E: Exception do
      begin
        Memo1.Lines.Add('Erro: ' + E.Message);
        Memo1.Lines.Add(Format('Erro ao tentar retirar número %d', [AIgnore]));
        raise;
      end;
    end;
  finally
    Memo2.Lines.Text := Linhas.ToString;
    Linhas.Free;
  end;

end;

end.
