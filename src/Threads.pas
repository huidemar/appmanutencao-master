unit Threads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  System.Threading, Vcl.ExtCtrls;

type
  TfThreads = class(TForm)
    ProgressBar1: TProgressBar;
    btStartThread: TButton;
    edtTempo: TLabeledEdit;
    edtQuantidadeThread: TLabeledEdit;
    procedure btStartThreadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarProgressBar(TempoSleep: Integer);
  end;

var
  fThreads: TfThreads;

implementation

{$R *.dfm}

procedure TfThreads.btStartThreadClick(Sender: TObject);
var
  Tasks: array of ITask;
  QuantidadeThread,
  TempoSleep: Integer;
  i: Integer;
begin
  QuantidadeThread := StrToInt(edtQuantidadeThread.Text);
  TempoSleep := StrToInt(edtTempo.Text);
  SetLength(Tasks, QuantidadeThread);
  for i := 0 to (QuantidadeThread - 1) do
    begin
      //Sleep(TempoSleep);
      Tasks[i] := TTask.Create(procedure ()
      begin
        CarregarProgressBar(TempoSleep);
      end);
      Tasks[i].Start;
    end;
end;

procedure TfThreads.CarregarProgressBar(TempoSleep: Integer);
var
  i: Integer;
begin
  ProgressBar1.Position := 0;
  for i := 0 to 100 do
    begin
      ProgressBar1.Position := i;
      Sleep(TempoSleep);
      Application.ProcessMessages;
    end;
end;

end.
