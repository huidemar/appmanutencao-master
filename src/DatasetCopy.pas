unit DatasetCopy;

interface

uses
  MidasLib,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfDatasetCopy = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CopiarClientDataSet(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDataset1, FDataset2: TClientDataset;
    FDataSource1, FDataSource2: TDataSource;

    procedure InitDataset;
  public
  end;

var
  fDatasetCopy: TfDatasetCopy;

implementation

{$R *.dfm}

procedure TfDatasetCopy.CopiarClientDataSet(Sender: TObject);
begin
  if (FDataset1.State = dsBrowse) then
    FDataset2.Data := FDataset1.Data;
end;

procedure TfDatasetCopy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDataset1.Free;
  FDataset2.Free;
  FDataSource1.Free;
  FDataSource2.Free;
end;

procedure TfDatasetCopy.FormShow(Sender: TObject);
begin
  inherited;
  FDataset1 := TClientDataset.Create(nil);
  FDataset2 := TClientDataset.Create(nil);
  FDataSource1 := TDataSource.Create(nil);
  FDataSource2 := TDataSource.Create(nil);

  FDataSource1.DataSet := FDataset1;
  FDataSource2.DataSet := FDataset2;

  FDataSource1.OnStateChange := CopiarClientDataSet;

  DBGrid1.DataSource := FDataSource1;
  DBGrid2.DataSource := FDataSource2;

  InitDataset;
end;

procedure TfDatasetCopy.InitDataset;
var
  I: Integer;
begin
  DBNavigator1.DataSource := FDataSource1;
  FDataset1.Close;
  FDataset1.FieldDefs.Add('Field1', ftString, 20);
  FDataset1.FieldDefs.Add('Field2', ftInteger);
  FDataset1.CreateDataSet;

  for I := 1 to 3 do
    begin
      FDataset1.Append;
      FDataset1.FieldByName('Field1').AsString := 'Field1Value'+I.ToString;
      FDataset1.FieldByName('Field2').AsInteger := I;
      FDataset1.Post;
    end;

end;

end.
