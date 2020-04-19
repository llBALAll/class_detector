unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure ShowHwndAndClassName(CrPos: TPoint);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ShowHwndAndClassName(CrPos: TPoint);
var
  hWnd: THandle;
  aName: array [0..255] of Char;
begin
  hWnd := WindowFromPoint(CrPos);
  if Boolean(GetClassName(hWnd, aName, 256)) then
    Label1.Caption := 'ClassName : ' + string(aName)
  else
    Label1.Caption := 'ClassName : Não Encontrada';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  rPos: TPoint;
begin
  if Boolean(GetCursorPos(rPos)) then ShowHwndAndClassName(rPos);
end;

end.
 