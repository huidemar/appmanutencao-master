object fThreads: TfThreads
  Left = 0
  Top = 0
  Caption = 'fThreads'
  ClientHeight = 263
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 36
    Top = 184
    Width = 345
    Height = 25
    TabOrder = 3
  end
  object btStartThread: TButton
    Left = 148
    Top = 137
    Width = 121
    Height = 25
    Caption = 'Start Thread'
    TabOrder = 2
    OnClick = btStartThreadClick
  end
  object edtTempo: TLabeledEdit
    Left = 148
    Top = 96
    Width = 121
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Tempo:'
    NumbersOnly = True
    TabOrder = 1
    Text = '100'
  end
  object edtQuantidadeThread: TLabeledEdit
    Left = 148
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = 'Quantidade Thread:'
    NumbersOnly = True
    TabOrder = 0
    Text = '2'
  end
end
